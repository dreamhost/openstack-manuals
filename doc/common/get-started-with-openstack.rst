==========================
Get started with OpenStack
==========================

.. toctree::
   :maxdepth: 2

   get-started-conceptual-architecture.rst
   get-started-logical-architecture.rst
   get-started-openstack-services.rst
   get-started-feedback.rst

The OpenStack project is an open source cloud computing platform for all
types of clouds, which aims to be simple to implement, massively
scalable, and feature rich. Developers and cloud computing technologists
from around the world create the OpenStack project.

OpenStack provides an Infrastructure-as-a-Service (:term:`IaaS`) solution
through a set of interrelated services. Each service offers an
:term:`application programming interface (API)` that facilitates this
integration. Depending on your needs, you can install some or all
services.

The following table describes the OpenStack services that make up the
OpenStack architecture:

.. list-table:: OpenStack Services
   :header-rows: 1
   :widths: 10 10 40

   * - Service
     - Project name
     - Description
   * - `Dashboard <http://www.openstack.org/software/releases/mitaka/components/horizon>`__
     - `Horizon <http://docs.openstack.org/developer/horizon/>`__
     - Provides a web-based self-service portal to interact with underlying
       OpenStack services, such as launching an instance, assigning IP
       addresses and configuring access controls.
   * - `Compute <http://www.openstack.org/software/releases/mitaka/components/nova>`__
     - `Nova <http://docs.openstack.org/developer/nova/>`__
     - Manages the lifecycle of compute instances in an OpenStack environment.
       Responsibilities include spawning, scheduling and decommissioning of
       virtual machines on demand.
   * - `Networking <http://www.openstack.org/software/releases/mitaka/components/neutron>`__
     - `Neutron <http://docs.openstack.org/developer/neutron/>`__
     - Enables Network-Connectivity-as-a-Service for other OpenStack services,
       such as OpenStack Compute. Provides an API for users to define networks
       and the attachments into them. Has a pluggable architecture that
       supports many popular networking vendors and technologies.
   * - `Object Storage <http://www.openstack.org/software/releases/mitaka/components/swift>`__
     - `Swift <http://docs.openstack.org/developer/swift/>`__
     - Stores and retrieves arbitrary unstructured data objects via a RESTful,
       HTTP based API. It is highly fault tolerant with its data replication
       and scale-out architecture. Its implementation is not like a file server
       with mountable directories. In this case, it writes objects and files to
       multiple drives, ensuring the data is replicated across a server
       cluster.
   * - `Block Storage <http://www.openstack.org/software/releases/mitaka/components/cinder>`__
     - `Cinder <http://docs.openstack.org/developer/cinder/>`__
     - Provides persistent block storage to running instances. Its pluggable
       driver architecture facilitates the creation and management of block
       storage devices.
   * - `Identity service <http://www.openstack.org/software/releases/mitaka/components/keystone>`__
     - `Keystone <http://docs.openstack.org/developer/keystone/>`__
     - Provides an authentication and authorization service for other
       OpenStack services. Provides a catalog of endpoints for all
       OpenStack services.
   * - `Image service <http://www.openstack.org/software/releases/mitaka/components/glance>`__
     - `Glance <http://docs.openstack.org/developer/glance/>`__
     - Stores and retrieves virtual machine disk images. OpenStack Compute
       makes use of this during instance provisioning.
   * - `Telemetry <http://www.openstack.org/software/releases/mitaka/components/ceilometer>`__
     - `Ceilometer <http://docs.openstack.org/developer/ceilometer/>`__
     - Monitors and meters the OpenStack cloud for billing, benchmarking,
       scalability, and statistical purposes.
   * - `Orchestration <http://www.openstack.org/software/releases/mitaka/components/heat>`__
     - `Heat <http://docs.openstack.org/developer/heat/>`__
     - Orchestrates multiple composite cloud applications by using either the
       native HOT template format or the AWS CloudFormation template format,
       through both an OpenStack-native REST API and a
       CloudFormation-compatible Query API.
   * - `Database service <http://www.openstack.org/software/releases/mitaka/components/trove>`__
     - `Trove <http://docs.openstack.org/developer/trove/>`__
     - Provides scalable and reliable Cloud Database-as-a-Service functionality
       for both relational and non-relational database engines.
   * - `Data processing service <http://www.openstack.org/software/releases/mitaka/components/sahara>`__
     - `Sahara <http://docs.openstack.org/developer/sahara/>`__
     - Provides capabilities to provision and scale Hadoop clusters in OpenStack
       by specifying parameters like Hadoop version, cluster topology and nodes
       hardware details.

