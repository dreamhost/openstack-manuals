Install and configure controller node
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Prerequisites
-------------

Before you configure the OpenStack Networking (neutron) service, you
must create a database, service credentials, and API endpoints.

#. To create the database, complete these steps:

   * Use the database access client to connect to the database server as the
     ``root`` user:

     .. code-block:: console

        $ mysql -u root -p

   * Create the ``neutron`` database:

     .. code-block:: console

        CREATE DATABASE neutron;

   * Grant proper access to the ``neutron`` database, replacing
     ``NEUTRON_DBPASS`` with a suitable password:

     .. code-block:: console

        GRANT ALL PRIVILEGES ON neutron.* TO 'neutron'@'localhost' \
          IDENTIFIED BY 'NEUTRON_DBPASS';
        GRANT ALL PRIVILEGES ON neutron.* TO 'neutron'@'%' \
          IDENTIFIED BY 'NEUTRON_DBPASS';

   * Exit the database access client.

#. Source the ``admin`` credentials to gain access to admin-only CLI
   commands:

   .. code-block:: console

      $ . admin-openrc

#. To create the service credentials, complete these steps:

   * Create the ``neutron`` user:

     .. code-block:: console

        $ openstack user create --domain default --password-prompt neutron
        User Password:
        Repeat User Password:
        +-----------+----------------------------------+
        | Field     | Value                            |
        +-----------+----------------------------------+
        | domain_id | e0353a670a9e496da891347c589539e9 |
        | enabled   | True                             |
        | id        | b20a6692f77b4258926881bf831eb683 |
        | name      | neutron                          |
        +-----------+----------------------------------+


   * Add the ``admin`` role to the ``neutron`` user:

     .. code-block:: console

        $ openstack role add --project service --user neutron admin

     .. note::

        This command provides no output.

   * Create the ``neutron`` service entity:

     .. code-block:: console

        $ openstack service create --name neutron \
          --description "OpenStack Networking" network
        +-------------+----------------------------------+
        | Field       | Value                            |
        +-------------+----------------------------------+
        | description | OpenStack Networking             |
        | enabled     | True                             |
        | id          | f71529314dab4a4d8eca427e701d209e |
        | name        | neutron                          |
        | type        | network                          |
        +-------------+----------------------------------+

#. Create the Networking service API endpoints:

   .. code-block:: console

      $ openstack endpoint create --region RegionOne \
        network public http://controller:9696
      +--------------+----------------------------------+
      | Field        | Value                            |
      +--------------+----------------------------------+
      | enabled      | True                             |
      | id           | 85d80a6d02fc4b7683f611d7fc1493a3 |
      | interface    | public                           |
      | region       | RegionOne                        |
      | region_id    | RegionOne                        |
      | service_id   | f71529314dab4a4d8eca427e701d209e |
      | service_name | neutron                          |
      | service_type | network                          |
      | url          | http://controller:9696           |
      +--------------+----------------------------------+

      $ openstack endpoint create --region RegionOne \
        network internal http://controller:9696
      +--------------+----------------------------------+
      | Field        | Value                            |
      +--------------+----------------------------------+
      | enabled      | True                             |
      | id           | 09753b537ac74422a68d2d791cf3714f |
      | interface    | internal                         |
      | region       | RegionOne                        |
      | region_id    | RegionOne                        |
      | service_id   | f71529314dab4a4d8eca427e701d209e |
      | service_name | neutron                          |
      | service_type | network                          |
      | url          | http://controller:9696           |
      +--------------+----------------------------------+

      $ openstack endpoint create --region RegionOne \
        network admin http://controller:9696
      +--------------+----------------------------------+
      | Field        | Value                            |
      +--------------+----------------------------------+
      | enabled      | True                             |
      | id           | 1ee14289c9374dffb5db92a5c112fc4e |
      | interface    | admin                            |
      | region       | RegionOne                        |
      | region_id    | RegionOne                        |
      | service_id   | f71529314dab4a4d8eca427e701d209e |
      | service_name | neutron                          |
      | service_type | network                          |
      | url          | http://controller:9696           |
      +--------------+----------------------------------+

Configure networking options
----------------------------

You can deploy the Networking service using one of two architectures
represented by options 1 and 2.

Option 1 deploys the simplest possible architecture that only supports
attaching instances to provider (external) networks. No self-service (private)
networks, routers, or floating IP addresses. Only the ``admin`` or other
privileged user can manage provider networks.

Option 2 augments option 1 with layer-3 services that support attaching
instances to self-service networks. The ``demo`` or other unprivileged
user can manage self-service networks including routers that provide
connectivity between self-service and provider networks. Additionally,
floating IP addresses provide connectivity to instances using self-service
networks from external networks such as the Internet.

Self-service networks typically use overlay networks. Overlay network
protocols such as VXLAN include additional headers that increase overhead
and decrease space available for the payload or user data. Without knowledge
of the virtual network infrastructure, instances attempt to send packets
using the default Ethernet :term:`maximum transmission unit (MTU)` of 1500
bytes. The Networking service automatically provides the correct MTU value
to instances via DHCP. However, some cloud images do not use DHCP or ignore
the DHCP MTU option and require configuration using metadata or a script.

.. note::

   Option 2 also supports attaching instances to provider networks.

Choose one of the following networking options to configure services
specific to it. Afterwards, return here and proceed to
:ref:`neutron-controller-metadata-agent`.

.. toctree::
   :maxdepth: 1

   neutron-controller-install-option1.rst
   neutron-controller-install-option2.rst

.. _neutron-controller-metadata-agent:

Configure the metadata agent
----------------------------

The :term:`metadata agent <Metadata agent>` provides configuration information
such as credentials to instances.

* Edit the ``/etc/neutron/metadata_agent.ini`` file and complete the following
  actions:

  * In the ``[DEFAULT]`` section, configure the metadata host and shared
    secret:

    .. code-block:: ini

       [DEFAULT]
       ...
       nova_metadata_ip = controller
       metadata_proxy_shared_secret = METADATA_SECRET

    Replace ``METADATA_SECRET`` with a suitable secret for the metadata proxy.

Configure Compute to use Networking
-----------------------------------

* Edit the ``/etc/nova/nova.conf`` file and perform the following actions:

  * In the ``[neutron]`` section, configure access parameters, enable the
    metadata proxy, and configure the secret:

    .. code-block:: ini

       [neutron]
       ...
       url = http://controller:9696
       auth_url = http://controller:35357
       auth_type = password
       project_domain_name = default
       user_domain_name = default
       region_name = RegionOne
       project_name = service
       username = neutron
       password = NEUTRON_PASS

       service_metadata_proxy = True
       metadata_proxy_shared_secret = METADATA_SECRET

    Replace ``NEUTRON_PASS`` with the password you chose for the ``neutron``
    user in the Identity service.

    Replace ``METADATA_SECRET`` with the secret you chose for the metadata
    proxy.

Finalize installation
---------------------

.. only:: rdo

   #. The Networking service initialization scripts expect a symbolic link
      ``/etc/neutron/plugin.ini`` pointing to the ML2 plug-in configuration
      file, ``/etc/neutron/plugins/ml2/ml2_conf.ini``. If this symbolic
      link does not exist, create it using the following command:

      .. code-block:: console

         # ln -s /etc/neutron/plugins/ml2/ml2_conf.ini /etc/neutron/plugin.ini

   #. Populate the database:

      .. code-block:: console

         # su -s /bin/sh -c "neutron-db-manage --config-file /etc/neutron/neutron.conf \
           --config-file /etc/neutron/plugins/ml2/ml2_conf.ini upgrade head" neutron

      .. note::

         Database population occurs later for Networking because the script
         requires complete server and plug-in configuration files.

   #. Restart the Compute API service:

      .. code-block:: console

         # systemctl restart openstack-nova-api.service

   #. Start the Networking services and configure them to start when the system
      boots.

      For both networking options:

      .. code-block:: console

         # systemctl enable neutron-server.service \
           neutron-linuxbridge-agent.service neutron-dhcp-agent.service \
           neutron-metadata-agent.service
         # systemctl start neutron-server.service \
           neutron-linuxbridge-agent.service neutron-dhcp-agent.service \
           neutron-metadata-agent.service

      For networking option 2, also enable and start the layer-3 service:

      .. code-block:: console

         # systemctl enable neutron-l3-agent.service
         # systemctl start neutron-l3-agent.service

.. only:: obs

   #. Restart the Compute API service:

      .. code-block:: console

         # systemctl restart openstack-nova-api.service

   #. Start the Networking services and configure them to start when the system
      boots.

      For both networking options:

      .. code-block:: console

         # systemctl enable openstack-neutron.service \
           openstack-neutron-linuxbridge-agent.service \
           openstack-neutron-dhcp-agent.service \
           openstack-neutron-metadata-agent.service
         # systemctl start openstack-neutron.service \
           openstack-neutron-linuxbridge-agent.service \
           openstack-neutron-dhcp-agent.service \
           openstack-neutron-metadata-agent.service

      For networking option 2, also enable and start the layer-3 service:

      .. code-block:: console

         # systemctl enable openstack-neutron-l3-agent.service
         # systemctl start openstack-neutron-l3-agent.service

.. only:: ubuntu or debian

   #. Populate the database:

      .. code-block:: console

         # su -s /bin/sh -c "neutron-db-manage --config-file /etc/neutron/neutron.conf \
           --config-file /etc/neutron/plugins/ml2/ml2_conf.ini upgrade head" neutron

      .. note::

         Database population occurs later for Networking because the script
         requires complete server and plug-in configuration files.

   #. Restart the Compute API service:

      .. code-block:: console

         # service nova-api restart

   #. Restart the Networking services.

      For both networking options:

      .. code-block:: console

         # service neutron-server restart
         # service neutron-linuxbridge-agent restart
         # service neutron-dhcp-agent restart
         # service neutron-metadata-agent restart

      For networking option 2, also restart the layer-3 service:

      .. code-block:: console

         # service neutron-l3-agent restart
