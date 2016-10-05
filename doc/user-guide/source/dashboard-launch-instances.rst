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

Launch an instance
~~~~~~~~~~~~~~~~~~

#. Log in to the dashboard.

#. Select the appropriate project from the drop down menu at the top left.

#. On the :guilabel:`Project` tab, open the :guilabel:`Compute` tab and
   click :guilabel:`Instances` category.

   The dashboard shows the instances with its name, its private and
   floating IP addresses, size, status, task, power state, and so on.

#. Click :guilabel:`Launch Instance`.

#. In the :guilabel:`Launch Instance` dialog box, specify the following values:

   :guilabel:`Details` tab

   Availability Zone
      By default, this value is set to the availability zone given by the
      cloud provider (for example, ``us-west`` or ``apac-south``). For some
      cases, it could be ``nova``.

   Instance Name
      Assign a name to the virtual machine.

      .. note::

         The name you assign here becomes the initial host name of the server.
         If the name is longer than 63 characters, the Compute service
         truncates it automatically to ensure dnsmasq works correctly.

         After the server is built, if you change the server name in the API
         or change the host name directly, the names are not updated in the
         dashboard.

         Server names are not guaranteed to be unique when created so you
         could have two instances with the same host name.

   Flavor
      Specify the size of the instance to launch.

      .. note::

         The flavor is selected based on the size of the image selected
         for launching an instance. For example, while creating an image, if
         you have entered the value in the :guilabel:`Minimum RAM (MB)` field
         as 2048, then on selecting the image, the default flavor is
         ``m1.small``.

   Instance Count
      To launch multiple instances, enter a value greater than ``1``. The
      default is ``1``.

   Instance Boot Source
      Your options are:

      Boot from image
          If you choose this option, a new field for :guilabel:`Image Name`
          displays. You can select the image from the list.

      Boot from snapshot
          If you choose this option, a new field for :guilabel:`Instance
          Snapshot` displays. You can select the snapshot from the list.

      Boot from volume
          If you choose this option, a new field for :guilabel:`Volume`
          displays. You can select the volume from the list.

      Boot from image (creates a new volume)
          With this option, you can boot from an image and create a volume
          by entering the :guilabel:`Device Size` and :guilabel:`Device
          Name` for your volume. Click the :guilabel:`Delete Volume on
          Instance Delete` option to delete the volume on deleting the
          instance.

      Boot from volume snapshot (creates a new volume)
          Using this option, you can boot from a volume snapshot and create
          a new volume by choosing :guilabel:`Volume Snapshot` from a list
          and adding a :guilabel:`Device Name` for your volume. Click the
          :guilabel:`Delete Volume on Instance Delete` option to delete the
          volume on deleting the instance.

   Image Name
      This field changes based on your previous selection. If you have
      chosen to launch an instance using an image, the :guilabel:`Image Name`
      field displays. Select the image name from the dropdown list.

   Instance Snapshot
      This field changes based on your previous selection. If you have
      chosen to launch an instance using a snapshot, the
      :guilabel:`Instance Snapshot` field displays.
      Select the snapshot name from the dropdown list.

   Volume
      This field changes based on your previous selection. If you have
      chosen to launch an instance using a volume, the :guilabel:`Volume`
      field displays. Select the volume name from the dropdown list.
      If you want to delete the volume on instance delete,
      check the :guilabel:`Delete Volume on Instance Delete` option.

#. Give your server a name. This will also be the host name of your server.

#. Choose your preferred operating system.

#. Add your public SSH key (you only have to do this once).

   Each server you launch is accessible by SSH via key-based authentication.
   Once you upload your public key, you'll have the convenience of
   password-less logins with the default user for your image,
   `Read the article about how to find the default user of your image
   <228377408-How-to-find-the-default-user-of-an-image>`__

    .. note::

        If you don't already have an SSH key, you can find
        out `how to create one`_.

#. Click the *Launch Image* button.


Connect To Your Server
~~~~~~~~~~~~~~~~~~~~~~

Once your new server is created, you can use SSH to log in to it.

.. note::

   `Read the article about how to find the default user of your image
   <228377408-How-to-find-the-default-user-of-an-image>`__

   :guilabel:`Network Ports` tab

   Ports
      Activate the ports that you want to assign to the instance.

   :guilabel:`Post-Creation` tab

   Customization Script Source
      Specify a customization script that runs after your instance
      launches.

   :guilabel:`Advanced Options` tab

   Disk Partition
      Select the type of disk partition from the dropdown list:

      Automatic
          Entire disk is single partition and automatically resizes.

      Manual
          Faster build times but requires manual partitioning.

#. Click :guilabel:`Launch`.

   The instance starts on a compute node in the cloud.

.. note::

   If you did not provide a key pair, security groups, or rules, users
   can access the instance only from inside the cloud through VNC. Even
   pinging the instance is not possible without an ICMP rule configured.

You can also launch an instance from the :guilabel:`Images` or
:guilabel:`Volumes` category when you launch an instance from
an image or a volume respectively.

When you launch an instance from an image, OpenStack creates a local
copy of the image on the compute node where the instance starts.

When you launch an instance from a volume, note the following steps:

* To select the volume from which to launch, launch an instance from
  an arbitrary image on the volume. The arbitrary image that you select
  does not boot. Instead, it is replaced by the image on the volume that
  you choose in the next steps.

  To boot a Xen image from a volume, the image you launch in must be
  the same type, fully virtualized or paravirtualized, as the one on
  the volume.

* Select the volume or volume snapshot from which to boot. Enter a
  device name. Enter ``vda`` for DreamCompute images.

Connect to your instance by using SSH
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

To use SSH to connect to your instance, use the downloaded keypair
file.


.. note::

   `Read the article about how to find the default user of your image
   <228377408-How-to-find-the-default-user-of-an-image>`__

#. Copy the IP address for your instance.

#. Use the :command:`ssh` command to make a secure connection to the instance.
   For example:

   .. code-block:: console

      $ ssh -i /path/to/key USER@IP

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
.. _how to create one: 214843617
.. _Security Groups: https://iad2.dreamcompute.com/project/access_and_security/?tab=access_security_tabs__security_groups_tab

.. meta::
   :labels: dreamcompute launch server ssh boot
