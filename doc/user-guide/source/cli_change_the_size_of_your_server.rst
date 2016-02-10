==================================================
How to change the size of your DreamCompute server
==================================================

Change the size of a server by changing its flavor.

#. Show information about your server, including its size, which is shown
   as the value of the flavor property:

   .. code-block:: console

      $ nova show myCirrosServer
      +--------------------------------------+----------------------------------------------------------+
      | Property                             | Value                                                    |
      +--------------------------------------+----------------------------------------------------------+
      | OS-DCF:diskConfig                    | MANUAL                                                   |
      | OS-EXT-AZ:availability_zone          | iad-2                                                    |
      | OS-EXT-STS:power_state               | 1                                                        |
      | OS-EXT-STS:task_state                | -                                                        |
      | OS-EXT-STS:vm_state                  | active                                                   |
      | OS-SRV-USG:launched_at               | 2016-02-09T23:25:12.000000                               |
      | OS-SRV-USG:terminated_at             | -                                                        |
      | accessIPv4                           |                                                          |
      | accessIPv6                           |                                                          |
      | config_drive                         | True                                                     |
      | created                              | 2016-02-09T23:25:05Z                                     |
      | flavor                               | gp1.subsonic (100)                                       |
      | hostId                               | c4606a0b4db316c7827f2d5925d6056936d4f27ac40f5ffff0d8cf73 |
      | id                                   | 84c6e57d-a6b1-44b6-81eb-fcb36afd31b5                     |
      | image                                | Ubuntu-14.04 (03f89ff2-d66e-49f5-ae61-656a006bbbe9)      |
      | key_name                             | -                                                        |
      | metadata                             | {}                                                       |
      | name                                 | myCirrosServer                                           |
      | os-extended-volumes:volumes_attached | []                                                       |
      | private-network network              | 10.10.10.3                                               |
      | progress                             | 0                                                        |
      | security_groups                      | default                                                  |
      | status                               | ACTIVE                                                   |
      | tenant_id                            | d659dfde1cff47fb99b20395ae04dde1                         |
      | updated                              | 2016-02-09T23:25:12Z                                     |
      | user_id                              | a02e9c8e3d514f658cc67046465c66c2                         |
      +--------------------------------------+----------------------------------------------------------+


   The size (flavor) of the server is ``gp1.subsonic (100)``.

#. List the available flavors with the following command:

   .. code-block:: console

      $ nova flavor-list
      +-----+----------------+-----------+------+-----------+------+-------+-------------+-----------+
      | ID  | Name           | Memory_MB | Disk | Ephemeral | Swap | VCPUs | RXTX_Factor | Is_Public |
      +-----+----------------+-----------+------+-----------+------+-------+-------------+-----------+
      | 100 | gp1.subsonic   | 1024      | 80   | 0         |      | 1     | 1.0         | True      |
      | 200 | gp1.supersonic | 2048      | 80   | 0         |      | 1     | 1.0         | True      |
      | 300 | gp1.lightspeed | 4096      | 80   | 0         |      | 2     | 1.0         | True      |
      | 400 | gp1.warpspeed  | 8192      | 80   | 0         |      | 4     | 1.0         | True      |
      | 50  | gp1.semisonic  | 512       | 80   | 0         |      | 1     | 1.0         | True      |
      | 500 | gp1.hyperspeed | 16384     | 80   | 0         |      | 8     | 1.0         | True      |
      +-----+----------------+-----------+------+-----------+------+-------+-------------+-----------+


#. To resize the server, use the :command:`nova resize` command and add
   the server ID or name and the new flavor. Include the `--poll`
   parameter to display the resize progress. For example:

   .. code-block:: console

      $ nova resize myCirrosServer 200 --poll

    Instance resizing... 100% complete
    Finished

   .. note::

      By default, the :command:`nova resize` command gives the guest operating
      system a chance to perform a controlled shutdown before the instance
      is powered off and the instance is resized.
      The shutdown behavior is configured by the
      ``shutdown_timeout`` parameter that can be set in the
      ``nova.conf`` file. Its value stands for the overall
      period (in seconds) a guest operation system is allowed
      to complete the shutdown. The default timeout is 60 seconds.
      See `Description of Compute configuration options
      <http://docs.openstack.org/liberty/config-reference/content/list-of-compute-config-options.html>`_
      for details.

      The timeout value can be overridden on a per image basis
      by means of ``os_shutdown_timeout`` that is an image metadata
      setting allowing different types of operating systems to specify
      how much time they need to shut down cleanly.

#. Show the status for your server.

   .. code-block:: console

      $ nova list
      +----------------------+----------------+--------+-----------------------------------------+
      | ID                   | Name           | Status | Networks                                |
      +----------------------+----------------+--------+-----------------------------------------+
      | 84c6e57d-a6b1-44b... | myCirrosServer | RESIZE | private=172.16.101.6, public=10.4.113.6 |
      +----------------------+----------------+--------+-----------------------------------------+

   When the resize completes, the status becomes VERIFY\_RESIZE.

#. Confirm the resize,for example:

   .. code-block:: console

      $ nova resize-confirm 84c6e57d-a6b1-44b6-81eb-fcb36afd31b5

   The server status becomes ACTIVE.

#. If the resize fails or does not work as expected, you can revert the
   resize. For example:

   .. code-block:: console

      $ nova resize-revert 84c6e57d-a6b1-44b6-81eb-fcb36afd31b5

   The server status becomes ACTIVE.
