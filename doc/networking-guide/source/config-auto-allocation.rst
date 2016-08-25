.. _config-auto-allocation:

==========================================
Automatic allocation of network topologies
==========================================

The auto-allocation feature introduced in Mitaka simplifies the procedure of
setting up an external connectivity for end-users, and is also known as **Get
Me A Network**.

The operator must create a default external network and default subnetpools
(one for IPv4, or one for IPv6, or one of each). Once these are in place, users
can get their auto-allocated topologies with a single command.

Enabling the deployment for auto-allocation
-------------------------------------------

To use this feature, the neutron service must have the following extensions
enabled:

* ``auto-allocated-topology``
* ``subnet_allocation``
* ``external-net``
* ``router``

Before the end-user can use the auto-allocation feature, the operator must
create the resources that will be used for the auto-allocated network
topology creation. To perform this task, proceed with the following steps:

#. Set up a default external network

   Setting up an external network is described in
   `OpenStack Administrator Guide
   <http://docs.openstack.org/admin-guide/networking-adv-features.html>`_.
   Assuming the external network to be used for the auto-allocation feature
   is named ``public``, make it the default external network
   with the following command:

   .. code-block:: console

      $ neutron net-update public --is-default=True

#. Create default subnetpools

   The auto-allocation feature requires at least one default
   subnetpool. One for IPv4, or one for IPv6, or one of each.

   .. code-block:: console

      $ neutron subnetpool-create --shared --is-default True\
        --pool-prefix 10.0.0.0/24 --default-prefixlen 26 shared-default

      Created a new subnetpool:
      +-------------------+--------------------------------------+
      | Field             | Value                                |
      +-------------------+--------------------------------------+
      | address_scope_id  |                                      |
      | default_prefixlen | 26                                   |
      | default_quota     |                                      |
      | id                | 7923bc31-4ca4-4c95-9ec2-d69b21775ee2 |
      | ip_version        | 4                                    |
      | is_default        | True                                 |
      | max_prefixlen     | 32                                   |
      | min_prefixlen     | 8                                    |
      | name              | shared-default                       |
      | prefixes          | 10.0.0.0/24                          |
      | shared            | True                                 |
      | tenant_id         | 375e91c9dc854aaa8c8fd93f4b24e87c     |
      +-------------------+--------------------------------------+

      $ neutron subnetpool-create --shared --is-default True\
        --pool-prefix 2001:db8:8000::/48 --default-prefixlen 64 default-v6

      Created a new subnetpool:
      +-------------------+--------------------------------------+
      | Field             | Value                                |
      +-------------------+--------------------------------------+
      | address_scope_id  |                                      |
      | default_prefixlen | 64                                   |
      | default_quota     |                                      |
      | id                | 953b28ab-5afa-42ea-8f44-44bf111672b1 |
      | ip_version        | 6                                    |
      | is_default        | True                                 |
      | max_prefixlen     | 128                                  |
      | min_prefixlen     | 64                                   |
      | name              | default-v6                           |
      | prefixes          | 2001:db8:8000::/48                   |
      | shared            | True                                 |
      | tenant_id         | 375e91c9dc854aaa8c8fd93f4b24e87c     |
      +-------------------+--------------------------------------+


Get Me A Network
----------------

In a deployment where the operator has set up the resources as described above,
users can get their auto-allocated network topology as follows:

.. code-block:: console

   $ neutron auto-allocated-topology-show
   +-----------+--------------------------------------+
   | Field     | Value                                |
   +-----------+--------------------------------------+
   | id        | 8b835bfb-cae2-4acc-b53f-c16bb5f9a7d0 |
   | tenant_id | 3a4e311bcb3545b9b7ad326f93194f8c     |
   +-----------+--------------------------------------+

Operators (and users with admin role) can get the auto-allocated
topology for a tenant by specifying the tenant ID:

.. code-block:: console

   $ neutron auto-allocated-topology-show 3a4e311bcb3545b9b7ad326f93194f8c
   +-----------+--------------------------------------+
   | Field     | Value                                |
   +-----------+--------------------------------------+
   | id        | 8b835bfb-cae2-4acc-b53f-c16bb5f9a7d0 |
   | tenant_id | 3a4e311bcb3545b9b7ad326f93194f8c     |
   +-----------+--------------------------------------+

The ID returned by this command is a network which can be used for booting
a VM.

.. code-block:: console

   $ nova boot --flavor m1.small --image cirros-0.3.4-x86_64-uec\
     --nic net-id=8b835bfb-cae2-4acc-b53f-c16bb5f9a7d0 vm1

The auto-allocated topology for a user never changes.

Validating the requirements for auto-allocation
-----------------------------------------------

To validate that the required resources are correctly set up for
auto-allocation, use the ``--dry-run`` option:

.. code-block:: console

   $ neutron auto-allocated-topology-show --dry-run
   Deployment error: No default router:external network.

   $ neutron net-update public --is-default=True

   $ neutron auto-allocated-topology-show --dry-run
   Deployment error: No default subnetpools defined.

   $ neutron subnetpool-update shared-default --is-default=True

   $ neutron auto-allocated-topology-show --dry-run
   +---------+-------+
   | Field   | Value |
   +---------+-------+
   | dry-run | pass  |
   +---------+-------+

The validation option behaves identically for all users. However, it
is considered primarily an admin utility since it is the operator who
must set up the requirements.

Project resources created by auto-allocation
--------------------------------------------

The auto-allocation feature creates one network topology in every project
where it is used. The auto-allocated network topology for a project contains
the following resources:

+--------------------+------------------------------+
|Resource            |Name                          |
+====================+==============================+
|network             |``auto_allocated_network``    |
+--------------------+------------------------------+
|subnet (IPv4)       |``auto_allocated_subnet_v4``  |
+--------------------+------------------------------+
|subnet (IPv6)       |``auto_allocated_subnet_v6``  |
+--------------------+------------------------------+
|router              |``auto_allocated_router``     |
+--------------------+------------------------------+

