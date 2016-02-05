=============================================
How to stop and start a DreamCompute instance
=============================================

Use one of the following methods to stop and start an instance.

Pause and unpause an instance
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

To pause an instance, run the following command:

.. code-block:: console

   $ nova pause INSTANCE_NAME

This command stores the state of the VM in RAM. A paused instance
continues to run in a frozen state.

To unpause an instance, run the following command:

.. code-block:: console

   $ nova unpause INSTANCE_NAME

Suspend and resume an instance
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

To initiate a hypervisor-level suspend operation, run the following
command:

.. code-block:: console

   $ nova suspend INSTANCE_NAME

To resume a suspended instance, run the following command:

.. code-block:: console

   $ nova resume INSTANCE_NAME
