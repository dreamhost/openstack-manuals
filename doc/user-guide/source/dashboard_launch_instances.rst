==================================================================
How to launch and manage servers with the DreamCompute dashboard
==================================================================

Quick Launch
~~~~~~~~~~~~

The `Quick Launch`_ is a way to easily create a new gp1.semisonic
(1 vCPU / 512MB) server with an 80GB ephemeral boot drive.

#. Log in to the `dashboard`_.

   We have auto-generated a username to be used with DreamCompute. You can
   view your username and reset your password in the `DreamHost Panel`_.

#. Navigate to the Quick Launch section.

#. Give your server a name. This will also be the host name of your server.

#. Choose your preferred operating system.

#. Add your public SSH key (you only have to do this once).

   Each server you launch is accessible by SSH via key-based authentication.
   Once you upload your public key, you'll have the convenience of
   password-less logins with the username *dhc-user*

.. note:: If you don't already have an SSH key, you can find
          out `how to create one`_.

#. Click the *Launch Image* button.


Connect To Your Server
~~~~~~~~~~~~~~~~~~~~~~

Once your new server is created, you can use SSH to log in to it.

.. note::

   The user name is ``dhc-user`` for the images on DreamCompute

#. Use the :command:`ssh` command to make a secure connection to the instance.
   For example:

   .. code-block:: console

      $ ssh -i /path/to/key dhc-user@123.123.123.123

#. You'll see a response similar to this:

  .. code-block:: console

      The authenticity of host '123.123.123.123 (123.123.123.123)' can't be established.
      ECDSA key fingerprint is SHA256:B55lL/sLEfJc09dEVFbQhDXkCqQ4taUoBZgzteirnmA.
      ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDMp8+8id6TRCgznUBMUjwbCUWNz834Cgi5xb1d5xIi
      Are you sure you want to continue connecting (yes/no)?

#. Type ``yes`` and you'll see a response like this:

  .. code-block:: console

      Warning: Permanently added '123.123.123.123' (ECDSA) to the list of known hosts.


Additional Configuration
~~~~~~~~~~~~~~~~~~~~~~~~

By default, your server is open to all traffic from your other DreamCompute
servers and limted traffic from the public network to these ports:

- SSH
- HTTP
- HTTPS
- ICMP (ping)

Additional ports can be configured from the `Security Groups`_ section
of the dashboard.


Manage Your Server
~~~~~~~~~~~~~~~~~~

The dashboard contains several commands in the `Actions` menu to manage
your server. It's important to note that only terminating a server will
stop usage charges from accruing on a server.


.. _Quick Launch: https://iad2.dreamcompute.com/project/quicklaunch/
.. _dashboard: https://iad2.dreamcompute.com/
.. _DreamHost Panel: http://panel.dreamhost.com/index.cgi?tree=cloud.compute
.. _how to create one: /articles/214843617
.. _Security Groups: https://iad2.dreamcompute.com/project/access_and_security/?tab=access_security_tabs__security_groups_tab

.. meta::
   :labels: dreamcompute launch server ssh boot
