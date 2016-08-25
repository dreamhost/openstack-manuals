========
Overview
========

Each OpenStack project provides a command-line client, which enables
you to access the project API through easy-to-use commands. For
example, the Compute service provides a ``nova`` command-line client.

You can run the commands from the command line, or include the
commands within scripts to automate tasks. If you provide OpenStack
credentials, such as your user name and password, you can run these
commands on any computer.

Internally, each command uses cURL command-line tools, which embed API
requests. OpenStack APIs are RESTful APIs, and use the HTTP
protocol. They include methods, URIs, media types, and response codes.

OpenStack APIs are open-source Python clients, and can run on Linux or
Mac OS X systems. On some client commands, you can specify a debug
parameter to show the underlying API request for the command. This is
a good way to become familiar with the OpenStack API calls.

As a cloud end user, you can use the OpenStack dashboard to provision
your own resources within the limits set by administrators. You can
modify the examples provided in this section to create other types and
sizes of server instances.

The following table lists the command-line client for each OpenStack
service with its package name and description.

.. list-table:: OpenStack services and clients
   :widths: 20 20 20 40
   :header-rows: 1

   * - Service
     - Client
     - Package
     - Description
   * - **Command-line client**
     - **openstack**
     - **python-openstackclient**
     - **Common client for the OpenStack project.**
   * - Application Catalog service
     - murano
     - python-muranoclient
     - Creates and manages applications.
   * - Bare Metal service
     - ironic
     - python-ironicclient
     - manages and provisions physical machines.
   * - Block Storage service
     - cinder
     - python-cinderclient
     - Creates and manages volumes.
   * - Clustering service
     - senlin
     - python-senlinclient
     - Creates and manages clustering services.
   * - Compute service
     - nova
     - python-novaclient
     - Creates and manages images, instances, and flavors.
   * - Container Infrastructure Management service
     - magnum
     - python-magnumclient
     - Creates and manages containers.
   * - Data Processing service
     - sahara
     - python-saharaclient
     - Creates and manages Hadoop clusters on OpenStack.
   * - Database service
     - trove
     - python-troveclient
     - Creates and manages databases.
   * - Deployment service
     - fuel
     - python-fuelclient
     - Plans deployments.
   * - DNS service
     - designate
     - python-designateclient
     - Creates and manages self service authoritative DNS.
   * - Identity service
     - keystone
     - python-keystoneclient
     - Creates and manages users, tenants, roles, endpoints, and credentials.
   * - Image service
     - glance
     - python-glanceclient
     - Creates and manages images.
   * - Key Manager service
     - barbican
     - python-barbicanclient
     - Creates and manages keys.
   * - Monitoring
     - monasca
     - python-monascaclient
     - Monitoring solution.
   * - Networking service
     - neutron
     - python-neutronclient
     - Configures networks for guest servers.
   * - Object Storage service
     - swift
     - python-swiftclient
     - Gathers statistics, lists items, updates metadata, and uploads,
       downloads, and deletes files stored by the Object Storage service.
       Gains access to an Object Storage installation for ad hoc processing.
   * - Orchestration service
     - heat
     - python-heatclient
     - Launches stacks from templates, views details of running stacks
       including events and resources, and updates and deletes stacks.
   * - Rating service
     - cloudkitty
     - python-cloudkittyclient
     - Rating service.
   * - Shared File Systems service
     - manila
     - python-manilaclient
     - Creates and manages shared file systems.
   * - Telemetry service
     - ceilometer
     - python-ceilometerclient
     - Creates and collects measurements across OpenStack.
   * - Telemetry v3
     - gnocchi
     - python-gnocchiclient
     - Creates and collects measurements across OpenStack.
   * - Workflow service
     - mistral
     - python-mistralclient
     - Workflow service for OpenStack cloud.
