==============
Manage flavors
==============

In OpenStack, flavors define the compute, memory, and
storage capacity of nova computing instances. To put it
simply, a flavor is an available hardware configuration for a
server. It defines the ``size`` of a virtual server
that can be launched.

.. note::

   Flavors can also determine on which compute host a flavor
   can be used to launch an instance. For information
   about customizing flavors, refer to :ref:`compute-flavors`.

A flavor consists of the following parameters:

Flavor ID
  Unique ID (integer or UUID) for the new flavor. If
  specifying 'auto', a UUID will be automatically generated.

Name
  Name for the new flavor.

VCPUs
  Number of virtual CPUs to use.

Memory MB
  Amount of RAM to use (in megabytes).

Root Disk GB
  Amount of disk space (in gigabytes) to use for
  the root (/) partition.

Ephemeral Disk GB
  Amount of disk space (in gigabytes) to use for
  the ephemeral partition. If unspecified, the value
  is ``0`` by default.
  Ephemeral disks offer machine local disk storage
  linked to the lifecycle of a VM instance. When a
  VM is terminated, all data on the ephemeral disk
  is lost. Ephemeral disks are not included in any
  snapshots.

Swap
  Amount of swap space (in megabytes) to use. If
  unspecified, the value is ``0`` by default.

RXTX Factor
  Optional property that allows servers with a different bandwidth be
  created with the RXTX Factor. The default value is ``1.0``. That is,
  the new bandwidth is the same as that of the attached network. The
  RXTX Factor is available only for Xen or NSX based systems.

Is Public
  Boolean value defines whether the flavor is available to all users.
  Defaults to ``True``.

Extra Specs
  Key and value pairs that define on which compute nodes a
  flavor can run. These pairs must match corresponding pairs on
  the compute nodes. It can be used to implement special resources, such
  as flavors that run on only compute nodes with GPU hardware.

The default flavors are:

============  =========  ===============  ===============
 Flavor         VCPUs      Disk (in GB)     RAM (in MB)
============  =========  ===============  ===============
 m1.tiny        1          1                512
 m1.small       1          20               2048
 m1.medium      2          40               4096
 m1.large       4          80               8192
 m1.xlarge      8          160              16384
============  =========  ===============  ===============

You can create and manage flavors with the
:command:`nova flavor-*` commands provided by the ``python-novaclient``
package.

Create a flavor
~~~~~~~~~~~~~~~

#. List flavors to show the ID and name, the amount
   of memory, the amount of disk space for the root
   partition and for the ephemeral partition, the
   swap, and the number of virtual CPUs for each
   flavor:

   .. code-block:: console

      $ openstack flavor list

#. To create a flavor, specify a name, ID, RAM
   size, disk size, and the number of VCPUs for the
   flavor, as follows:

   .. code-block:: console

      $ openstack flavor create FLAVOR_NAME FLAVOR_ID RAM_IN_MB ROOT_DISK_IN_GB NUMBER_OF_VCPUS

   .. note::

      Unique ID (integer or UUID) for the new flavor. If
      specifying 'auto', a UUID will be automatically generated.

   Here is an example with additional optional
   parameters filled in that creates a public ``extra
   tiny`` flavor that automatically gets an ID
   assigned, with 256 MB memory, no disk space, and
   one VCPU. The rxtx-factor indicates the slice of
   bandwidth that the instances with this flavor can
   use (through the Virtual Interface (vif) creation
   in the hypervisor):

   .. code-block:: console

      $ openstack flavor create --is-public true m1.extra_tiny auto 256 0 1 --rxtx-factor .1

#. If an individual user or group of users needs a custom
   flavor that you do not want other tenants to have access to,
   you can change the flavor's access to make it a private flavor.
   See
   `Private Flavors in the OpenStack Operations Guide <http://docs.openstack.org/ops-guide/ops-user-facing-operations.html#private-flavors>`_.

   For a list of optional parameters, run this command:

   .. code-block:: console

      $ openstack help flavor create

#. After you create a flavor, assign it to a
   project by specifying the flavor name or ID and
   the tenant ID:

   .. code-block:: console

      $ nova flavor-access-add FLAVOR TENANT_ID

#. In addition, you can set or unset ``extra_spec`` for the existing flavor.
   The ``extra_spec`` metadata keys can influence the instance directly when
   it is launched. If a flavor sets the
   ``extra_spec key/value quota:vif_outbound_peak=65536``, the instance's
   outbound peak bandwidth I/O should be LTE 512 Mbps. There are several
   aspects that can work for an instance including ``CPU limits``,
   ``Disk tuning``, ``Bandwidth I/O``, ``Watchdog behavior``, and
   ``Random-number generator``.
   For information about supporting metadata keys, see
   `Flavors
   <http://docs.openstack.org/admin-guide/compute-flavors.html>`__.

   For a list of optional parameters, run this command:

   .. code-block:: console

      $ nova help flavor-key

Delete a flavor
~~~~~~~~~~~~~~~

Delete a specified flavor, as follows:

.. code-block:: console

   $ openstack flavor delete FLAVOR_ID
