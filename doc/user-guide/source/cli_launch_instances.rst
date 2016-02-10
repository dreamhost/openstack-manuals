==============================================
How to launch a virtual server on DreamCompute
==============================================

Virtual machines that run inside the cloud are called instances.

Before you can launch an instance, gather the following parameters:

- The **instance source** can be an image, snapshot, or block storage
  volume that contains an image or snapshot.

- A **name** for your instance.

- The **flavor** for your instance, which defines the compute, memory,
  and storage capacity of nova computing instances. A flavor is an
  available hardware configuration for a server. It defines the size of
  a virtual server that can be launched.

- Any **user data** files. A user data file is a special key in the
  metadata service that holds a file that cloud-aware applications in
  the guest instance can access. For example, one application that uses
  user data is the
  `cloud-init <https://help.ubuntu.com/community/CloudInit>`__ system,
  which is an open-source package from Ubuntu that is available on
  various Linux distributions and that handles early initialization of
  a cloud instance.

- Access and security credentials, which include one or both of the
  following credentials:

- A **key pair** for your instance, which are SSH credentials that
  are injected into images when they are launched. For the key pair
  to be successfully injected, the image must contain the
  ``cloud-init`` package. Create at least one key pair for each
  project. If you already have generated a key pair with an external
  tool, you can import it into OpenStack. You can use the key pair
  for multiple instances that belong to that project.

- A **security group** that defines which incoming network traffic
  is forwarded to instances. Security groups hold a set of firewall
  policies, known as *security group rules*.

- If needed, you can assign a **floating (public) IP address** to a
  running instance.

- You can also attach a block storage device, or **volume**, for
  persistent storage.

After you gather the parameters that you need to launch an instance,
you can launch it from an image_ or a volume. You can launch an
instance directly from one of the available OpenStack images or from
an image that you have copied to a persistent volume. The OpenStack
Image service provides a pool of images that are accessible to members
of different projects.

Gather parameters to launch an instance
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Before you begin, source the OpenStack RC file.

#. List the available flavors.

   .. code-block:: console

      $ nova flavor-list

   Note the ID of the flavor that you want to use for your instance::

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


#. List the available images.

   .. code-block:: console

      $ nova image-list

   Note the ID of the image from which you want to boot your instance::

    +--------------------------------------+--------------+--------+--------------------------------------+
    | ID                                   | Name         | Status | Server                               |
    +--------------------------------------+--------------+--------+--------------------------------------+
    | 10ff94ea-18dc-4790-8ac8-84e6ac9f3132 | CentOS-6     | ACTIVE |                                      |
    | c1e8c5b5-bea6-45e9-8202-b8e769b661a4 | CentOS-7     | ACTIVE |                                      |
    | dd759c80-74c8-4598-8d9b-3dac32a386f2 | Debian-7.0   | ACTIVE |                                      |
    | 00a5fa60-6fdb-4d30-ad88-64fbc32be85a | Debian-7.9   | ACTIVE |                                      |
    | dfc066b8-4f5a-4ea5-84be-35924594bc43 | Ubuntu-12.04 | ACTIVE |                                      |
    | 03f89ff2-d66e-49f5-ae61-656a006bbbe9 | Ubuntu-14.04 | ACTIVE |                                      |
    | 873e4bab-ed23-4096-83fb-ee8b0dd2f5a3 | Ubuntu-15.10 | ACTIVE |                                      |
    +--------------------------------------+--------------+--------+--------------------------------------+

   You can also filter the image list by using :command:`grep` to find a specific
   image, as follows:

   .. code-block:: console

      $ nova image-list | grep 'Ubuntu-14.04'

         | 03f89ff2-d66e-49f5-ae61-656a006bbbe9 | Ubuntu-14.04 | ACTIVE |                                      |

#. List the available security groups.

   .. code-block:: console

      $ nova secgroup-list --all-tenants

   .. note::

      If you are an admin user, specify the `--all-tenants` parameter to
      list groups for all tenants.



   Note the ID of the security group that you want to use for your
   instance::

    +--------------------------------------+---------+------------------------+
    | Id                                   | Name    | Description            |
    +--------------------------------------+---------+------------------------+
    | a79caa69-e011-498b-9149-ee6f130b1977 | default | Default security group |
    +--------------------------------------+---------+------------------------+

   If you have not created any security groups, you can assign the instance
   to only the default security group.

   You can view rules for a specified security group:

   .. code-block:: console

      $ nova secgroup-list-rules default

#. List the available key pairs, and note the key pair name that you use for
   SSH access.

   .. code-block:: console

      $ nova keypair-list

.. _image:

Launch an instance from an image
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#. After you gather required parameters, run the following command to
   launch an instance. Specify the server name, flavor ID, and image ID.

   .. code-block:: console

      $ nova boot --flavor FLAVOR_ID --image IMAGE_ID --key-name KEY_NAME \
        --user-data USER_DATA_FILE --security-groups SEC_GROUP_NAME --meta KEY=VALUE \
        INSTANCE_NAME

   Optionally, you can provide a key name for access control and a security
   group for security. You can also include metadata key and value pairs.
   For example, you can add a description for your server by providing the
   ``--meta description="My Server"`` parameter.

   You can pass user data in a local file at instance launch by using the
   ``--user-data USER-DATA-FILE`` parameter.

   .. important::

      If you boot an instance with an INSTANCE_NAME greater than 63 characters,
      Compute truncates it automatically when turning it into a host name to
      ensure the correct work of dnsmasq. The corresponding warning is written
      into the ``nova-network.log`` file.

   The following command launches the ``MyUbuntuServer`` instance with the
   ``gp1.subsonic`` flavor (ID of ``100``), ``Ubuntu-14.04`` image (ID
   of ``03f89ff2-d66e-49f5-ae61-656a006bbbe9``), ``default`` security
   group, ``KeyPair01`` key, and a user data file called
   ``cloudinit.file``:

   .. code-block:: console

      $ nova boot --flavor 1 --image 397e713c-b95b-4186-ad46-6126863ea0a9 \
        --security-groups default --key-name KeyPair01 --user-data cloudinit.file \
        MyUbuntuServer

   Depending on the parameters that you provide, the command returns a list
   of server properties.

   .. code-block:: console

      +-------------------------------------+-------------------------------------+
      | Property                            | Value                               |
      +-------------------------------------+-------------------------------------+
      | OS-EXT-STS:task_state               | scheduling                          |
      | image                               | Ubuntu-14.04                        |
      | OS-EXT-STS:vm_state                 | building                            |
      | OS-EXT-SRV-ATTR:instance_name       | instance-00000002                   |
      | flavor                              | gp1.subsonic                        |
      | id                                  | b3cdc6c0-85a7-4904-ae85-71918f734048|
      | security_groups                     | [{u'name': u'default'}]             |
      | user_id                             | 376744b5910b4b4da7d8e6cb483b06a8    |
      | OS-DCF:diskConfig                   | MANUAL                              |
      | accessIPv4                          |                                     |
      | accessIPv6                          |                                     |
      | progress                            | 0                                   |
      | OS-EXT-STS:power_state              | 0                                   |
      | OS-EXT-AZ:availability_zone         | nova                                |
      | config_drive                        |                                     |
      | status                              | BUILD                               |
      | updated                             | 2013-07-16T16:25:34Z                |
      | hostId                              |                                     |
      | OS-EXT-SRV-ATTR:host                | None                                |
      | key_name                            | KeyPair01                           |
      | OS-EXT-SRV-ATTR:hypervisor_hostname | None                                |
      | name                                | MyUbuntuServer                      |
      | adminPass                           | tVs5pL8HcPGw                        |
      | tenant_id                           | 66265572db174a7aa66eba661f58eb9e    |
      | created                             | 2013-07-16T16:25:34Z                |
      | metadata                            | {u'KEY': u'VALUE'}                  |
      +-------------------------------------+-------------------------------------+

   A status of ``BUILD`` indicates that the instance has started, but is
   not yet online.

   A status of ``ACTIVE`` indicates that the instance is active.

#. Copy the server ID value from the ``id`` field in the output. Use the
   ID to get server details or to delete your server.

#. Copy the administrative password value from the ``adminPass`` field. Use the
   password to log in to your server.

   .. note::

      You can also place arbitrary local files into the instance file
      system at creation time by using the ``--file <dst-path=src-path>``
      option. You can store up to five files. For example, if you have a
      special authorized keys file named ``special_authorized_keysfile`` that
      you want to put on the instance rather than using the regular SSH key
      injection, you can use the `--file` option as shown in the following
      example.

   .. code-block:: console

      $ nova boot --image Ubuntu-14.04 --flavor 100 vm-name \
        --file /root/.ssh/authorized_keys=special_authorized_keysfile

4. Check if the instance is online.

   .. code-block:: console

      $ nova list

   The list shows the ID, name, status, and private (and if assigned,
   public) IP addresses for all instances in the project to which you
   belong:

   .. code-block:: console

      +-------------+----------------------+--------+------------+-------------+------------------+
      | ID          | Name                 | Status | Task State | Power State | Networks         |
      +-------------+----------------------+--------+------------+-------------+------------------+
      | 84c6e57d... | MyUbuntuServer       | ACTIVE | None       | Running     | private=10.0.0.3 |
      | 8a99547e... | myInstanceFromVolume | ACTIVE | None       | Running     | private=10.0.0.4 |
      +-------------+----------------------+--------+------------+-------------+------------------+

   If the status for the instance is ACTIVE, the instance is online.

#. To view the available options for the :command:`nova list` command, run the
   following command:

   .. code-block:: console

      $ nova help list

   .. note::

      If you did not provide a key pair, security groups, or rules, you
      can access the instance only from inside the cloud through VNC. Even
      pinging the instance is not possible.

