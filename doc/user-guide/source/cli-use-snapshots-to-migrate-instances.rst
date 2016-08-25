==============================================================================================
How to use snapshots to migrate instances between DreamCompute zones or other OpenStack clouds
==============================================================================================

To use snapshots to migrate instances between DreamCompute regions or from
other OpenStack providers to DreamCompute, complete these steps.

In the source project:

#. :ref:`Create_a_snapshot_of_the_instance`

#. :ref:`Download_the_snapshot_as_an_image`

In the destination project:

#. :ref:`Import_the_snapshot_to_the_new_environment`

#. :ref:`Boot_a_new_instance_from_the_snapshot`

.. note::

   Some cloud providers allow only administrators to perform this task.

.. _Create_a_snapshot_of_the_instance:

Create a snapshot of the instance
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#. Shut down the source VM before you take the snapshot to ensure that all
   data is flushed to disk. If necessary, list the instances to view the
   instance name:

   .. code-block:: console

      $ nova list
      +--------------------------------------+------------+--------+------------------------------+
      | ID                                   | Name       | Status | Networks                     |
      +--------------------------------------+------------+--------+------------------------------+
      | c41f3074-c82a-4837-8673-fa7e9fea7e11 | myInstance | ACTIVE | private=10.0.0.3             |
      +--------------------------------------+------------+--------+------------------------------+

#. Use the :command:`nova stop` command to shut down the instance:

   .. code-block:: console

      $ nova stop myInstance

#. Use the :command:`nova list` command to confirm that the instance shows a
   ``SHUTOFF`` status:

   .. code-block:: console

      $ nova list
      +--------------------------------------+------------+---------+------------------+
      | ID                                   | Name       | Status  | Networks         |
      +--------------------------------------+------------+---------+------------------+
      | c41f3074-c82a-4837-8673-fa7e9fea7e11 | myInstance | SHUTOFF | private=10.0.0.3 |
      +--------------------------------------+------------+---------+------------------+

#. Use the :command:`nova image-create` command to take a snapshot:

   .. code-block:: console

      $ nova image-create --poll myInstance myInstanceSnapshot
      Instance snapshotting... 50% complete

#. Use the :command:`nova image-list` command to check the status
   until the status is ``ACTIVE``:

   .. code-block:: console

      $ nova image-list
      +--------------------------------------+---------------------------------+--------+--------+
      | ID                                   | Name                            | Status | Server |
      +--------------------------------------+---------------------------------+--------+--------+
      | 657ebb01-6fae-47dc-986a-e49c4dd8c433 | cirros-0.3.2-x86_64-uec         | ACTIVE |        |
      | 72074c6d-bf52-4a56-a61c-02a17bf3819b | cirros-0.3.2-x86_64-uec-kernel  | ACTIVE |        |
      | 3c5e5f06-637b-413e-90f6-ca7ed015ec9e | cirros-0.3.2-x86_64-uec-ramdisk | ACTIVE |        |
      | f30b204e-1ce6-40e7-b8d9-b353d4d84e7d | myInstanceSnapshot              | ACTIVE |        |
      +--------------------------------------+---------------------------------+--------+--------+

.. _Download_the_snapshot_as_an_image:

Download the snapshot as an image
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#. Get the image ID:

   .. code-block:: console

      $ nova image-list
      +-------------------+-------------------+--------+--------------------------------------+
      | ID               | Name              | Status | Server                                |
      +-------------------+-------------------+--------+--------------------------------------+
      | f30b204e-1ce6... | myInstanceSnapshot| ACTIVE | c41f3074-c82a-4837-8673-fa7e9fea7e11  |
      +------------------+-------------------+--------+---------------------------------------+

#. Download the snapshot by using the image ID that was returned in the
   previous step:

   .. code-block:: console

      $ glance image-download --file snapshot.raw f30b204e-1ce6-40e7-b8d9-b353d4d84e7d

   .. note::

      The :command:`glance image-download` command requires the image ID and
      cannot use the image name.
      Check there is sufficient space on the destination file system for
      the image file.

#. Make the image available to the new environment, either through HTTP or
   direct upload to a machine (``scp``).

.. _Import_the_snapshot_to_the_new_environment:

Import the snapshot to the new environment
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

In the new project or cloud environment, import the snapshot:

.. code-block:: console

   $ glance --os-image-api-version 1 image-create \
     --container-format bare --disk-format qcow2 --copy-from IMAGE_URL

.. _Boot_a_new_instance_from_the_snapshot:

Boot a new instance from the snapshot
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

In the new project or cloud environment, use the snapshot to create the
new instance:

.. code-block:: console

   $ nova boot --flavor m1.tiny --image myInstanceSnapshot myNewInstance
