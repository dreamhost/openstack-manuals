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

   $ openstack console url show INSTANCE_NAME --novnc

The command returns a URL from which you can access your instance:

.. code-block:: console

   +--------+-------------------------------------------------------------------------------------------------+
   | Type   | Url                                                                                             |
   +--------+-------------------------------------------------------------------------------------------------+
   | novnc  | https://vncproxy.dreamcompute.com:6080/vnc_auto.html?token=c83ae3a3-15c4-4890-8d45-aefb494a8d6c |
   +--------+-------------------------------------------------------------------------------------------------+
