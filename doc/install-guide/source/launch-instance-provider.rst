.. _launch-instance-provider:

Launch an instance on the provider network
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Determine instance options
--------------------------

To launch an instance, you must at least specify the flavor, image
name, network, security group, key, and instance name.

#. On the controller node, source the ``demo`` credentials to gain access to
   user-only CLI commands:

   .. code-block:: console

      $ . demo-openrc

#. A flavor specifies a virtual resource allocation profile which
   includes processor, memory, and storage.

   List available flavors:

   .. code-block:: console

      $ openstack flavor list
      +----+-----------+-------+------+-----------+-------+-----------+
      | ID | Name      |   RAM | Disk | Ephemeral | VCPUs | Is Public |
      +----+-----------+-------+------+-----------+-------+-----------+
      | 1  | m1.tiny   |   512 |    1 |         0 |     1 | True      |
      | 2  | m1.small  |  2048 |   20 |         0 |     1 | True      |
      | 3  | m1.medium |  4096 |   40 |         0 |     2 | True      |
      | 4  | m1.large  |  8192 |   80 |         0 |     4 | True      |
      | 5  | m1.xlarge | 16384 |  160 |         0 |     8 | True      |
      +----+-----------+-------+------+-----------+-------+-----------+

   This instance uses the ``m1.tiny`` flavor. If you created the optional
   ``m1.nano`` flavor, use it instead of the ``m1.tiny`` flavor.

   .. note::

      You can also reference a flavor by ID.

#. List available images:

   .. code-block:: console

      $ openstack image list
      +--------------------------------------+--------+--------+
      | ID                                   | Name   | Status |
      +--------------------------------------+--------+--------+
      | 390eb5f7-8d49-41ec-95b7-68c0d5d54b34 | cirros | active |
      +--------------------------------------+--------+--------+

   This instance uses the ``cirros`` image.

#. List available networks:

   .. code-block:: console

      $ openstack network list
      +--------------------------------------+--------------+--------------------------------------+
      | ID                                   | Name         | Subnets                              |
      +--------------------------------------+--------------+--------------------------------------+
      | 4716ddfe-6e60-40e7-b2a8-42e57bf3c31c | selfservice  | 2112d5eb-f9d6-45fd-906e-7cabd38b7c7c |
      | b5b6993c-ddf9-40e7-91d0-86806a42edb8 | provider     | 310911f6-acf0-4a47-824e-3032916582ff |
      +--------------------------------------+--------------+--------------------------------------+

   This instance uses the ``provider`` provider network. However, you must
   reference this network using the ID instead of the name.

   .. note::

      If you chose option 2, the output should also contain the
      ``selfservice`` self-service network.

#. List available security groups:

   .. code-block:: console

      $ openstack security group list
      +--------------------------------------+---------+------------------------+
      | ID                                   | Name    | Description            |
      +--------------------------------------+---------+------------------------+
      | dd2b614c-3dad-48ed-958b-b155a3b38515 | default | Default security group |
      +--------------------------------------+---------+------------------------+

   This instance uses the ``default`` security group.

Launch the instance
-------------------

#. Launch the instance:

   Replace ``PROVIDER_NET_ID`` with the ID of the ``provider`` provider
   network.

   .. note::

      If you chose option 1 and your environment contains only one network,
      you can omit the ``--nic`` option because OpenStack automatically
      chooses the only network available.

   .. code-block:: console

      $ openstack server create --flavor m1.tiny --image cirros \
        --nic net-id=PROVIDER_NET_ID --security-group default \
        --key-name mykey provider-instance

      +--------------------------------------+-----------------------------------------------+
      | Property                             | Value                                         |
      +--------------------------------------+-----------------------------------------------+
      | OS-DCF:diskConfig                    | MANUAL                                        |
      | OS-EXT-AZ:availability_zone          | nova                                          |
      | OS-EXT-STS:power_state               | 0                                             |
      | OS-EXT-STS:task_state                | scheduling                                    |
      | OS-EXT-STS:vm_state                  | building                                      |
      | OS-SRV-USG:launched_at               | -                                             |
      | OS-SRV-USG:terminated_at             | -                                             |
      | accessIPv4                           |                                               |
      | accessIPv6                           |                                               |
      | adminPass                            | hdF4LMQqC5PB                                  |
      | config_drive                         |                                               |
      | created                              | 2015-09-17T21:58:18Z                          |
      | flavor                               | m1.tiny (1)                                   |
      | hostId                               |                                               |
      | id                                   | 181c52ba-aebc-4c32-a97d-2e8e82e4eaaf          |
      | image                                | cirros (38047887-61a7-41ea-9b49-27987d5e8bb9) |
      | key_name                             | mykey                                         |
      | metadata                             | {}                                            |
      | name                                 | provider-instance                             |
      | os-extended-volumes:volumes_attached | []                                            |
      | progress                             | 0                                             |
      | security_groups                      | default                                       |
      | status                               | BUILD                                         |
      | tenant_id                            | f5b2ccaa75ac413591f12fcaa096aa5c              |
      | updated                              | 2015-09-17T21:58:18Z                          |
      | user_id                              | 684286a9079845359882afc3aa5011fb              |
      +--------------------------------------+-----------------------------------------------+

#. Check the status of your instance:

   .. code-block:: console

      $ openstack server list
      +--------------------------------------+-------------------+--------+---------------------------------+
      | ID                                   | Name              | Status | Networks                        |
      +--------------------------------------+-------------------+--------+---------------------------------+
      | 181c52ba-aebc-4c32-a97d-2e8e82e4eaaf | provider-instance | ACTIVE | provider=203.0.113.103          |
      +--------------------------------------+-------------------+--------+---------------------------------+

   The status changes from ``BUILD`` to ``ACTIVE`` when the build process
   successfully completes.

Access the instance using the virtual console
---------------------------------------------

#. Obtain a :term:`Virtual Network Computing (VNC)`
   session URL for your instance and access it from a web browser:

   .. code-block:: console

      $ openstack console url show provider-instance
      +-------+---------------------------------------------------------------------------------+
      | Field | Value                                                                           |
      +-------+---------------------------------------------------------------------------------+
      | type  | novnc                                                                           |
      | url   | http://controller:6080/vnc_auto.html?token=5eeccb47-525c-4918-ac2a-3ad1e9f1f493 |
      +-------+---------------------------------------------------------------------------------+

   .. note::

      If your web browser runs on a host that cannot resolve the
      ``controller`` host name, you can replace ``controller`` with the
      IP address of the management interface on your controller node.

   The CirrOS image includes conventional user name/password
   authentication and provides these credentials at the login prompt.
   After logging into CirrOS, we recommend that you verify network
   connectivity using ``ping``.

#. Verify access to the provider physical network gateway:

   .. code-block:: console

      $ ping -c 4 203.0.113.1
      PING 203.0.113.1 (203.0.113.1) 56(84) bytes of data.
      64 bytes from 203.0.113.1: icmp_req=1 ttl=64 time=0.357 ms
      64 bytes from 203.0.113.1: icmp_req=2 ttl=64 time=0.473 ms
      64 bytes from 203.0.113.1: icmp_req=3 ttl=64 time=0.504 ms
      64 bytes from 203.0.113.1: icmp_req=4 ttl=64 time=0.470 ms

      --- 203.0.113.1 ping statistics ---
      4 packets transmitted, 4 received, 0% packet loss, time 2998ms
      rtt min/avg/max/mdev = 0.357/0.451/0.504/0.055 ms

#. Verify access to the internet:

   .. code-block:: console

      $ ping -c 4 openstack.org
      PING openstack.org (174.143.194.225) 56(84) bytes of data.
      64 bytes from 174.143.194.225: icmp_req=1 ttl=53 time=17.4 ms
      64 bytes from 174.143.194.225: icmp_req=2 ttl=53 time=17.5 ms
      64 bytes from 174.143.194.225: icmp_req=3 ttl=53 time=17.7 ms
      64 bytes from 174.143.194.225: icmp_req=4 ttl=53 time=17.5 ms

      --- openstack.org ping statistics ---
      4 packets transmitted, 4 received, 0% packet loss, time 3003ms
      rtt min/avg/max/mdev = 17.431/17.575/17.734/0.143 ms

Access the instance remotely
----------------------------

#. Verify connectivity to the instance from the controller node or any host
   on the provider physical network:

   .. code-block:: console

      $ ping -c 4 203.0.113.103
      PING 203.0.113.103 (203.0.113.103) 56(84) bytes of data.
      64 bytes from 203.0.113.103: icmp_req=1 ttl=63 time=3.18 ms
      64 bytes from 203.0.113.103: icmp_req=2 ttl=63 time=0.981 ms
      64 bytes from 203.0.113.103: icmp_req=3 ttl=63 time=1.06 ms
      64 bytes from 203.0.113.103: icmp_req=4 ttl=63 time=0.929 ms

      --- 203.0.113.103 ping statistics ---
      4 packets transmitted, 4 received, 0% packet loss, time 3002ms
      rtt min/avg/max/mdev = 0.929/1.539/3.183/0.951 ms

#. Access your instance using SSH from the controller node or any
   host on the provider physical network:

   .. code-block:: console

      $ ssh cirros@203.0.113.103
      The authenticity of host '203.0.113.102 (203.0.113.102)' can't be established.
      RSA key fingerprint is ed:05:e9:e7:52:a0:ff:83:68:94:c7:d1:f2:f8:e2:e9.
      Are you sure you want to continue connecting (yes/no)? yes
      Warning: Permanently added '203.0.113.102' (RSA) to the list of known hosts.
      $

If your instance does not launch or seem to work as you expect, see the
`Instance Boot Failures
<http://docs.openstack.org/ops-guide/ops-maintenance-compute.html#instances>`__
section in OpenStack Operations Guide for more information or use one of
the :doc:`many other options <common/app-support>`
to seek assistance. We want your first installation to work!

Return to :ref:`Launch an instance <launch-instance-complete>`.
