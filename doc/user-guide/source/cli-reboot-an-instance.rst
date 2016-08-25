=====================================
How to reboot a DreamCompute instance
=====================================

You can soft or hard reboot a running instance. A soft reboot attempts a
graceful shut down and restart of the instance. A hard reboot power
cycles the instance.

By default, when you reboot an instance, it is a soft reboot.

.. code-block:: console

   $ nova reboot SERVER

To perform a hard reboot, pass the `--hard` parameter, as follows:

.. code-block:: console

   $ nova reboot --hard SERVER
