=======================================================
How to access a DreamCompute instance through a console
=======================================================

VNC or SPICE is used to view the console output of an instance, regardless of
whether or not the console log has output. This allows relaying keyboard and
mouse activity to and from an instance.

DreamCompute supports novnc for remote access of an instance through a console:

novnc
  An in-browser VNC client implemented using HTML5 Canvas and
  WebSockets

Example:

To access an instance through a remote console, run the following
command:

.. code-block:: console

   $ nova get-vnc-console INSTANCE_NAME novnc

The command returns a URL from which you can access your instance:

.. code-block:: console

   +--------+------------------------------------------------------------------------------+
   | Type   | Url                                                                          |
   +--------+------------------------------------------------------------------------------+
   | novnc  | http://192.168.5.96:6081/console?token=c83ae3a3-15c4-4890-8d45-aefb494a8d6c  |
   +--------+------------------------------------------------------------------------------+
