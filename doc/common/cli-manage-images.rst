=============
Manage images
=============

The cloud operator assigns roles to users. Roles determine who can
upload and manage images. The operator might restrict image upload and
management to only cloud administrators or operators.

You can upload images through the ``glance`` client or the Image service
API. You can use the ``nova`` client for the image management.
The latter provides mechanisms to list and delete images, set and delete
image metadata, and create images of a running instance or snapshot and
backup types.

After you upload an image, you cannot change it.

For details about image creation, see the `Virtual Machine Image
Guide <http://docs.openstack.org/image-guide/>`__.

List or get details for images (glance)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

To get a list of images and to get further details about a single
image, use :command:`openstack image list` and :command:`openstack image show`
commands.

.. code-block:: console

   $ openstack image list
   +--------------------------------------+---------------------------------+--------+
   | ID                                   | Name                            | Status |
   +--------------------------------------+---------------------------------+--------+
   | dfc1dfb0-d7bf-4fff-8994-319dd6f703d7 | cirros-0.3.2-x86_64-uec         | active |
   | a3867e29-c7a1-44b0-9e7f-10db587cad20 | cirros-0.3.2-x86_64-uec-kernel  | active |
   | 4b916fba-6775-4092-92df-f41df7246a6b | cirros-0.3.2-x86_64-uec-ramdisk | active |
   | d07831df-edc3-4817-9881-89141f9134c3 | myCirrosImage                   | active |
   +--------------------------------------+---------------------------------+--------+
.. code-block:: console

   $ openstack image show myCirrosImage
   +------------------+------------------------------------------------------+
   | Field            | Value                                                |
   +------------------+------------------------------------------------------+
   | checksum         | ee1eca47dc88f4879d8a229cc70a07c6                     |
   | container_format | ami                                                  |
   | created_at       | 2016-08-11T15:07:26Z                                 |
   | disk_format      | ami                                                  |
   | file             | /v2/images/dfc1dfb0-d7bf-4fff-8994-319dd6f703d7/file |
   | id               | dfc1dfb0-d7bf-4fff-8994-319dd6f703d7                 |
   | min_disk         | 0                                                    |
   | min_ram          | 0                                                    |
   | name             | myCirrosImage                                        |
   | owner            | d88310717a8e4ebcae84ed075f82c51e                     |
   | protected        | False                                                |
   | schema           | /v2/schemas/image                                    |
   | size             | 13287936                                             |
   | status           | active                                               |
   | tags             |                                                      |
   | updated_at       | 2016-08-11T15:20:02Z                                 |
   | virtual_size     | None                                                 |
   | visibility       | private                                              |
   +------------------+------------------------------------------------------+

When viewing a list of images, you can also use ``grep`` to filter the
list, as follows:

.. code-block:: console

   $ openstack image list | grep 'cirros'
   | dfc1dfb0-d7bf-4fff-8994-319dd6f703d7 | cirros-0.3.2-x86_64-uec         | active |
   | a3867e29-c7a1-44b0-9e7f-10db587cad20 | cirros-0.3.2-x86_64-uec-kernel  | active |
   | 4b916fba-6775-4092-92df-f41df7246a6b | cirros-0.3.2-x86_64-uec-ramdisk | active |

.. note::

   To store location metadata for images, which enables direct file access for a client,
   update the ``/etc/glance/glance-api.conf`` file with the following statements:

   * ``show_multiple_locations = True``

   * ``filesystem_store_metadata_file = filePath``

     where filePath points to a JSON file that defines the mount point for OpenStack
     images on your system and a unique ID. For example:

   .. code-block:: json

      [{
          "id": "2d9bb53f-70ea-4066-a68b-67960eaae673",
          "mountpoint": "/var/lib/glance/images/"
      }]

   After you restart the Image service, you can use the following syntax to view
   the image's location information:

   .. code-block:: console

      $ openstack --os-image-api-version 2 image show imageID

   For example, using the image ID shown above, you would issue the command as follows:

   .. code-block:: console

      $ openstack --os-image-api-version 2 image show 2d9bb53f-70ea-4066-a68b-67960eaae673

Create or update an image (glance)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

To create an image, use :command:`openstack image create`:

.. code-block:: console

   $ openstack image create imageName

To update an image by name or ID, use :command:`openstack image set`:

.. code-block:: console

   $ openstack image set imageName

The following list explains the optional arguments that you can use with
the ``create`` and ``set`` commands to modify image properties. For
more information, refer to Image service chapter in the `OpenStack
Command-Line Interface
Reference <http://docs.openstack.org/cli-reference/index.html>`__.

``--name NAME``
  The name of the image.

``--disk-format DISK_FORMAT``
  The disk format of the image. Acceptable formats are ami, ari, aki,
  vhd, vmdk, raw, qcow2, vdi, and iso.

``--container-format CONTAINER_FORMAT``
  The container format of the image. Acceptable formats are ami, ari,
  aki, bare, docker, and ovf.

``--owner TENANT_ID --size SIZE``
  The tenant who should own the image. The size of image data, in
  bytes.

``--min-disk DISK_GB``
  The minimum size of the disk needed to boot the image, in
  gigabytes.

``--min-ram DISK_RAM``
  The minimum amount of RAM needed to boot the image, in megabytes.

``--location IMAGE_URL``
  The URL where the data for this image resides. This option is only
  available in V1 API. When using it, you also need to set
  ``--os-image-api-version``. For example, if the image data is
  stored in swift, you could specify
  ``--os-image-api-version 1
  --location swift://account:key@example.com/container/obj``.

``--file FILE``
  Local file that contains the disk image to be uploaded during the
  update. Alternatively, you can pass images to the client through
  stdin.

``--checksum CHECKSUM``
  Hash of image data to use for verification.

``--copy-from IMAGE_URL``
  Similar to `--location` in usage, but indicates that the image
  server should immediately copy the data and store it in its
  configured image store.

``--is-public [True|False]``
  Makes an image accessible for all the tenants (admin-only by
  default).

``--is-protected [True|False]``
  Prevents an image from being deleted.

``--property KEY=VALUE``
  Arbitrary property to associate with image. This option can be used
  multiple times.

``--purge-props``
  Deletes all image properties that are not explicitly set in the
  update request. Otherwise, those properties not referenced are
  preserved.

``--human-readable``
  Prints the image size in a human-friendly format.


The following example shows the command that you would use to upload a
CentOS 6.3 image in qcow2 format and configure it for public access:

.. code-block:: console

   $ openstack image create --disk-format qcow2 --container-format bare \
     --public --file ./centos63.qcow2 centos63-image

The following example shows how to update an existing image with a
properties that describe the disk bus, the CD-ROM bus, and the VIF
model:

.. note::

   When you use OpenStack with VMware vCenter Server, you need to specify
   the ``vmware_disktype`` and ``vmware_adaptertype`` properties with
   :command:`glance image-create`.
   Also, we recommend that you set the ``hypervisor_type="vmware"`` property.
   For more information, see `Images with VMware vSphere
   <http://docs.openstack.org/mitaka/config-reference/compute/hypervisor-vmware.html#images-with-vmware-vsphere>`_
   in the OpenStack Configuration Reference.

.. code-block:: console

   $ openstack image set \
       --property hw_disk_bus=scsi \
       --property hw_cdrom_bus=ide \
       --property hw_vif_model=e1000 \
       f16-x86_64-openstack-sda

Currently the libvirt virtualization tool determines the disk, CD-ROM,
and VIF device models based on the configured hypervisor type
(``libvirt_type`` in ``/etc/nova/nova.conf`` file). For the sake of optimal
performance, libvirt defaults to using virtio for both disk and VIF
(NIC) models. The disadvantage of this approach is that it is not
possible to run operating systems that lack virtio drivers, for example,
BSD, Solaris, and older versions of Linux and Windows.

If you specify a disk or CD-ROM bus model that is not supported, see
the Disk_and_CD-ROM_bus_model_values_table_.
If you specify a VIF model that is not supported, the instance fails to
launch. See the VIF_model_values_table_.

The valid model values depend on the ``libvirt_type`` setting, as shown
in the following tables.

.. _Disk_and_CD-ROM_bus_model_values_table:

**Disk and CD-ROM bus model values**

+-------------------------+--------------------------+
| libvirt\_type setting   | Supported model values   |
+=========================+==========================+
| qemu or kvm             | *  ide                   |
|                         |                          |
|                         | *  scsi                  |
|                         |                          |
|                         | *  virtio                |
+-------------------------+--------------------------+
| xen                     | *  ide                   |
|                         |                          |
|                         | *  xen                   |
+-------------------------+--------------------------+


.. _VIF_model_values_table:

**VIF model values**

+-------------------------+--------------------------+
| libvirt\_type setting   | Supported model values   |
+=========================+==========================+
| qemu or kvm             | *  e1000                 |
|                         |                          |
|                         | *  ne2k\_pci             |
|                         |                          |
|                         | *  pcnet                 |
|                         |                          |
|                         | *  rtl8139               |
|                         |                          |
|                         | *  virtio                |
+-------------------------+--------------------------+
| xen                     | *  e1000                 |
|                         |                          |
|                         | *  netfront              |
|                         |                          |
|                         | *  ne2k\_pci             |
|                         |                          |
|                         | *  pcnet                 |
|                         |                          |
|                         | *  rtl8139               |
+-------------------------+--------------------------+
| vmware                  | *  VirtualE1000          |
|                         |                          |
|                         | *  VirtualPCNet32        |
|                         |                          |
|                         | *  VirtualVmxnet         |
+-------------------------+--------------------------+

.. note::

   By default, hardware properties are retrieved from the image
   properties. However, if this information is not available, the
   ``libosinfo`` database provides an alternative source for these
   values.

   If the guest operating system is not in the database, or if the use
   of ``libosinfo`` is disabled, the default system values are used.

   Users can set the operating system ID or a ``short-id`` in image
   properties. For example:

   .. code-block:: console

      $ openstack image set --property short-id=fedora23 \
        name-of-my-fedora-image

   Alternatively, users can set ``id`` to a URL:

   .. code-block:: console

      $ glance image set \
        --property id=http://fedoraproject.org/fedora/23 \
        ID-of-my-fedora-image

Create an image from ISO image
------------------------------

You can upload ISO images to the Image service (glance).
You can subsequently boot an ISO image using Compute.

In the Image service, run the following command:

.. code-block:: console

   $ openstack image create ISO_IMAGE --file IMAGE.iso \
     --disk-format iso --container-format bare

Optionally, to confirm the upload in Image service, run:

.. code-block:: console

   $ openstack image list

Troubleshoot image creation
~~~~~~~~~~~~~~~~~~~~~~~~~~~

If you encounter problems in creating an image in the Image service or
Compute, the following information may help you troubleshoot the
creation process.

*  Ensure that the version of qemu you are using is version 0.14 or
   later. Earlier versions of qemu result in an ``unknown option -s``
   error message in the ``/var/log/nova/nova-compute.log`` file.

*  Examine the ``/var/log/nova/nova-api.log`` and
   ``/var/log/nova/nova-compute.log`` log files for error messages.
