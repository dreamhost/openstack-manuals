.. _get_capabilities:


================
Get capabilities
================

When an administrator configures ``volume type`` and ``extra specs`` of storage
on the back end, the administrator has to read the right documentation that
corresponds to the version of the storage back end. Deep knowledge of
storage is also required.

OpenStack Block Storage enables administrators to configure ``volume type``
and ``extra specs`` without specific knowledge of the storage back end.

.. note::

   * ``Volume Type``: A group of volume policies.
   * ``Extra Specs``: The definition of a volume type. This is a group of
     policies. For example, provision type, QOS that will be used to
     define a volume at creation time.
   * ``Capabilities``: What the current deployed back end in Cinder is able
     to do. These correspond to extra specs.

Usage of cinder client
~~~~~~~~~~~~~~~~~~~~~~

When an administrator wants to define new volume types for their
OpenStack cloud, the administrator would fetch a list of ``capabilities``
for a particular back end using the cinder client.

First, get a list of the services:

.. code-block:: console

   $ cinder service-list
   +------------------+-------------------+------+---------+-------+------+
   |      Binary      |        Host       | Zone |  Status | State | ...  |
   +------------------+-------------------+------+---------+-------+------+
   | cinder-scheduler | controller        | nova | enabled |   up  | ...  |
   | cinder-volume    | block1@ABC-driver | nova | enabled |   up  | ...  |
   +------------------+-------------------+------+---------+-------+------+

With one of the listed hosts, pass that to ``get-capabilities``, then
the administrator can obtain volume stats and also back end ``capabilities``
as listed below.

.. code-block:: console

   $ cinder get-capabilities block1@ABC-driver
   +---------------------+----------------------------------------------+
   |     Volume stats    |                    Value                     |
   +---------------------+----------------------------------------------+
   |     description     |                     None                     |
   |     display_name    |   Capabilities of Cinder Vendor ABC driver   |
   |    driver_version   |                    2.0.0                     |
   |      namespace      | OS::Storage::Capabilities::block1@ABC-driver |
   |      pool_name      |                     None                     |
   |   storage_protocol  |                    iSCSI                     |
   |     vendor_name     |                  Vendor ABC                  |
   |      visibility     |                     pool                     |
   | volume_backend_name |                  ABC-driver                  |
   +---------------------+----------------------------------------------+
   +----------------------+-----------------------------------------------------+
   |  Backend properties  |                     Value                           |
   +----------------------+-----------------------------------------------------+
   |      compression     | {u'type':u'boolean', u'title':u'Compression',  ...} |
   | ABC:compression_type | {u'enum':u'['lossy', 'lossless', 'special']',  ...} |
   |         qos          | {u'type':u'boolean', u'title':u'QoS',          ...} |
   |     replication      | {u'type':u'boolean', u'title':u'Replication',  ...} |
   |  thin_provisioning   | {u'type':u'boolean', u'title':u'Thin Provisioning'} |
   |     ABC:minIOPS      | {u'type':u'integer', u'title':u'Minimum IOPS QoS',} |
   |     ABC:maxIOPS      | {u'type':u'integer', u'title':u'Maximum IOPS QoS',} |
   |    ABC:burstIOPS     | {u'type':u'integer', u'title':u'Burst IOPS QoS',..} |
   +----------------------+-----------------------------------------------------+

Usage of REST API
~~~~~~~~~~~~~~~~~

New endpoint to ``get capabilities`` list for specific storage back end
is also available. For more details, refer to the Block Storage API reference.

API request:

.. code-block:: console

   GET /v2/{tenant_id}/capabilities/{hostname}

Example of return value:

.. code-block:: json

   {
     "namespace": "OS::Storage::Capabilities::block1@ABC-driver",
     "volume_backend_name": "ABC-driver",
     "pool_name": "pool",
     "driver_version": "2.0.0",
     "storage_protocol": "iSCSI",
     "display_name": "Capabilities of Cinder Vendor ABC driver",
     "description": "None",
     "visibility": "public",
     "properties": {
      "thin_provisioning": {
         "title": "Thin Provisioning",
         "description": "Sets thin provisioning.",
         "type": "boolean"
       },
       "compression": {
         "title": "Compression",
         "description": "Enables compression.",
         "type": "boolean"
       },
       "ABC:compression_type": {
         "title": "Compression type",
         "description": "Specifies compression type.",
         "type": "string",
         "enum": [
           "lossy", "lossless", "special"
         ]
       },
       "replication": {
         "title": "Replication",
         "description": "Enables replication.",
         "type": "boolean"
       },
       "qos": {
         "title": "QoS",
         "description": "Enables QoS.",
         "type": "boolean"
       },
       "ABC:minIOPS": {
         "title": "Minimum IOPS QoS",
         "description": "Sets minimum IOPS if QoS is enabled.",
         "type": "integer"
       },
       "ABC:maxIOPS": {
         "title": "Maximum IOPS QoS",
         "description": "Sets maximum IOPS if QoS is enabled.",
         "type": "integer"
       },
       "ABC:burstIOPS": {
         "title": "Burst IOPS QoS",
         "description": "Sets burst IOPS if QoS is enabled.",
         "type": "integer"
       },
     }
   }

Usage of volume type access extension
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Some volume types should be restricted only. For example, test volume types
where you are testing a new technology or ultra high performance volumes
(for special cases) where you do not want most users to be able to select
these volumes. An administrator/operator can then define private volume types
using cinder client.
Volume type access extension adds the ability to manage volume type access.
Volume types are public by default. Private volume types can be created by
setting the ``is_public`` Boolean field to ``False`` at creation time. Access to a
private volume type can be controlled by adding or removing a project from it.
Private volume types without projects are only visible by users with the
admin role/context.

Create a public volume type by setting ``is_public`` field to ``True``:

.. code-block:: console

   $ cinder type-create --description test1 --is-public True vol_Type1
   +--------------------------------------+-----------+-------------+-----------+
   |                  ID                  |    Name   | Description | Is_Public |
   +--------------------------------------+-----------+-------------+-----------+
   | 0a948c84-bad5-4fba-88a2-c062006e4f6b | vol_Type1 |    test1    |    True   |
   +--------------------------------------+-----------+-------------+-----------+

Create a private volume type by setting ``is_public`` field to ``False``:

.. code-block:: console

   $ cinder type-create --description test2 --is-public False vol_Type2
   +--------------------------------------+-----------+-------------+-----------+
   |                  ID                  |    Name   | Description | Is_Public |
   +--------------------------------------+-----------+-------------+-----------+
   | fd508846-213f-4a07-aaf2-40518fb9a23f | vol_Type2 |    test2    |    False  |
   +--------------------------------------+-----------+-------------+-----------+

Get a list of the volume types:

.. code-block:: console

   $ cinder type-list
   +--------------------------------------+-------------+-------------+-----------+
   |                  ID                  |     Name    | Description | Is_Public |
   +--------------------------------------+-------------+-------------+-----------+
   | 0a948c84-bad5-4fba-88a2-c062006e4f6b | vol_Type1   |    test1    |    True   |
   | 87e5be6f-9491-4ea5-9906-9ac56494bb91 | lvmdriver-1 |      -      |    True   |
   | fd508846-213f-4a07-aaf2-40518fb9a23f | vol_Type2   |    test2    |   False   |
   +--------------------------------------+-------------+-------------+-----------+

Get a list of the projects:

.. code-block:: console

   $ openstack project list
   +----------------------------------+--------------------+
   | ID                               | Name               |
   +----------------------------------+--------------------+
   | 4105ead90a854100ab6b121266707f2b | alt_demo           |
   | 4a22a545cedd4fcfa9836eb75e558277 | admin              |
   | 71f9cdb1a3ab4b8e8d07d347a2e146bb | service            |
   | c4860af62ffe465e99ed1bc08ef6082e | demo               |
   | e4b648ba5108415cb9e75bff65fa8068 | invisible_to_admin |
   +----------------------------------+--------------------+

Add volume type access for the given demo project, using its project-id:

.. code-block:: console

   $ cinder type-access-add --volume-type vol_Type2 --project-id \
     c4860af62ffe465e99ed1bc08ef6082e

List the access information about the given volume type:

.. code-block:: console

   $ cinder type-access-list --volume-type vol_Type2
   +--------------------------------------+----------------------------------+
   |            Volume_type_ID            |            Project_ID            |
   +--------------------------------------+----------------------------------+
   | fd508846-213f-4a07-aaf2-40518fb9a23f | c4860af62ffe465e99ed1bc08ef6082e |
   +--------------------------------------+----------------------------------+

Remove volume type access for the given project:

.. code-block:: console

   $ cinder type-access-remove --volume-type vol_Type2 --project-id \
     c4860af62ffe465e99ed1bc08ef6082e
   $ cinder type-access-list --volume-type vol_Type2
   +----------------+------------+
   | Volume_type_ID | Project_ID |
   +----------------+------------+
   +----------------+------------+
