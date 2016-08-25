.. ##  WARNING  #####################################
.. This file is tool-generated. Do not edit manually.
.. ##################################################

=================================
Image service command-line client
=================================

The glance client is the command-line interface (CLI) for
the Image service API and its extensions.

This chapter documents :command:`glance` version ``2.5.0``.

For help on a specific :command:`glance` command, enter:

.. code-block:: console

   $ glance help COMMAND

.. _glance_command_usage:

glance usage
~~~~~~~~~~~~

.. code-block:: console

   usage: glance [--version] [-d] [-v] [--get-schema] [--no-ssl-compression] [-f]
                 [--os-image-url OS_IMAGE_URL]
                 [--os-image-api-version OS_IMAGE_API_VERSION]
                 [--profile HMAC_KEY] [--insecure] [--os-cacert <ca-certificate>]
                 [--os-cert <certificate>] [--os-key <key>] [--timeout <seconds>]
                 [--os-auth-url OS_AUTH_URL] [--os-domain-id OS_DOMAIN_ID]
                 [--os-domain-name OS_DOMAIN_NAME]
                 [--os-project-id OS_PROJECT_ID]
                 [--os-project-name OS_PROJECT_NAME]
                 [--os-project-domain-id OS_PROJECT_DOMAIN_ID]
                 [--os-project-domain-name OS_PROJECT_DOMAIN_NAME]
                 [--os-trust-id OS_TRUST_ID] [--os-user-id OS_USER_ID]
                 [--os-username OS_USERNAME]
                 [--os-user-domain-id OS_USER_DOMAIN_ID]
                 [--os-user-domain-name OS_USER_DOMAIN_NAME]
                 [--os-password OS_PASSWORD] [--key-file OS_KEY]
                 [--ca-file OS_CACERT] [--cert-file OS_CERT]
                 [--os-tenant-id OS_TENANT_ID] [--os-tenant-name OS_TENANT_NAME]
                 [--os-region-name OS_REGION_NAME]
                 [--os-auth-token OS_AUTH_TOKEN]
                 [--os-service-type OS_SERVICE_TYPE]
                 [--os-endpoint-type OS_ENDPOINT_TYPE]
                 <subcommand> ...

.. _glance_command_options:

glance optional arguments
~~~~~~~~~~~~~~~~~~~~~~~~~

``--version``
  show program's version number and exit

``-d, --debug``
  Defaults to ``env[GLANCECLIENT_DEBUG]``.

``-v, --verbose``
  Print more verbose output.

``--get-schema``
  Ignores cached copy and forces retrieval of schema
  that generates portions of the help text. Ignored with
  API version 1.

``--no-ssl-compression``
  **DEPRECATED!** This option is deprecated and not used
  anymore. SSL compression should be disabled by default
  by the system SSL library.

``-f, --force``
  Prevent select actions from requesting user
  confirmation.

``--os-image-url OS_IMAGE_URL``
  Defaults to ``env[OS_IMAGE_URL]``. If the provided image
  url contains a version number and \`:option:`--os-image-api-`
  version\` is omitted the version of the URL will be
  picked as the image api version to use.

``--os-image-api-version OS_IMAGE_API_VERSION``
  Defaults to ``env[OS_IMAGE_API_VERSION]`` or 2.

``--profile HMAC_KEY``
  HMAC key to use for encrypting context data for
  performance profiling of operation. This key should be
  the value of HMAC key configured in osprofiler
  middleware in glance, it is specified in paste
  configuration file at /etc/glance/api-paste.ini and
  /etc/glance/registry-paste.ini. Without key the
  profiling will not be triggered even if osprofiler is
  enabled on server side.

``--insecure``
  Explicitly allow client to perform "insecure" TLS
  (https) requests. The server's certificate will not be
  verified against any certificate authorities. This
  option should be used with caution.

``--os-cacert <ca-certificate>``
  Specify a CA bundle file to use in verifying a TLS
  (https) server certificate. Defaults to
  ``env[OS_CACERT]``.

``--os-cert <certificate>``
  Defaults to ``env[OS_CERT]``.

``--os-key <key>``
  Defaults to ``env[OS_KEY]``.

``--timeout <seconds>``
  Set request timeout (in seconds).

``--os-auth-url OS_AUTH_URL``
  Authentication URL

``--os-domain-id OS_DOMAIN_ID``
  Domain ID to scope to

``--os-domain-name OS_DOMAIN_NAME``
  Domain name to scope to

``--os-project-id OS_PROJECT_ID``
  Project ID to scope to

``--os-project-name OS_PROJECT_NAME``
  Project name to scope to

``--os-project-domain-id OS_PROJECT_DOMAIN_ID``
  Domain ID containing project

``--os-project-domain-name OS_PROJECT_DOMAIN_NAME``
  Domain name containing project

``--os-trust-id OS_TRUST_ID``
  Trust ID

``--os-user-id OS_USER_ID``
  User ID

``--os-username OS_USERNAME, --os-user_name OS_USERNAME``
  Username

``--os-user-domain-id OS_USER_DOMAIN_ID``
  User's domain id

``--os-user-domain-name OS_USER_DOMAIN_NAME``
  User's domain name

``--os-password OS_PASSWORD``
  User's password

``--key-file OS_KEY``
  **DEPRECATED!** Use :option:`--os-key`.

``--ca-file OS_CACERT``
  **DEPRECATED!** Use :option:`--os-cacert`.

``--cert-file OS_CERT``
  **DEPRECATED!** Use :option:`--os-cert`.

``--os-tenant-id OS_TENANT_ID``
  Defaults to ``env[OS_TENANT_ID]``.

``--os-tenant-name OS_TENANT_NAME``
  Defaults to ``env[OS_TENANT_NAME]``.

``--os-region-name OS_REGION_NAME``
  Defaults to ``env[OS_REGION_NAME]``.

``--os-auth-token OS_AUTH_TOKEN``
  Defaults to ``env[OS_AUTH_TOKEN]``.

``--os-service-type OS_SERVICE_TYPE``
  Defaults to ``env[OS_SERVICE_TYPE]``.

``--os-endpoint-type OS_ENDPOINT_TYPE``
  Defaults to ``env[OS_ENDPOINT_TYPE]``.

Image service API v2 commands
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. _glance_explain:

glance explain
--------------

.. code-block:: console

   usage: glance explain <MODEL>

Describe a specific model.

**Positional arguments:**

``<MODEL>``
  Name of model to describe.

.. _glance_image-create:

glance image-create
-------------------

.. code-block:: console

   usage: glance image-create [--architecture <ARCHITECTURE>]
                              [--protected [True|False]] [--name <NAME>]
                              [--instance-uuid <INSTANCE_UUID>]
                              [--min-disk <MIN_DISK>] [--visibility <VISIBILITY>]
                              [--kernel-id <KERNEL_ID>]
                              [--tags <TAGS> [<TAGS> ...]]
                              [--os-version <OS_VERSION>]
                              [--disk-format <DISK_FORMAT>]
                              [--os-distro <OS_DISTRO>] [--id <ID>]
                              [--owner <OWNER>] [--ramdisk-id <RAMDISK_ID>]
                              [--min-ram <MIN_RAM>]
                              [--container-format <CONTAINER_FORMAT>]
                              [--property <key=value>] [--file <FILE>]
                              [--progress]

Create a new image.

**Optional arguments:**

``--architecture <ARCHITECTURE>``
  Operating system architecture as specified in
  http://docs.openstack.org/user-guide/common/cli-manage-images.html

``--protected [True|False]``
  If true, image will not be deletable.

``--name <NAME>``
  Descriptive name for the image

``--instance-uuid <INSTANCE_UUID>``
  Metadata which can be used to record which instance
  this image is associated with. (Informational only,
  does not create an instance snapshot.)

``--min-disk <MIN_DISK>``
  Amount of disk space (in GB) required to boot image.

``--visibility <VISIBILITY>``
  Scope of image accessibility Valid values: public,
  private

``--kernel-id <KERNEL_ID>``
  ID of image stored in Glance that should be used as
  the kernel when booting an AMI-style image.

``--tags <TAGS> [<TAGS> ...]``
  List of strings related to the image

``--os-version <OS_VERSION>``
  Operating system version as specified by the
  distributor

``--disk-format <DISK_FORMAT>``
  Format of the disk Valid values: None, ami, ari, aki,
  vhd, vmdk, raw, qcow2, vdi, iso

``--os-distro <OS_DISTRO>``
  Common name of operating system distribution as
  specified
  in
  http://docs.openstack.org/user-guide/common/cli-manage-images.html

``--id <ID>``
  An identifier for the image

``--owner <OWNER>``
  Owner of the image

``--ramdisk-id <RAMDISK_ID>``
  ID of image stored in Glance that should be used as
  the ramdisk when booting an AMI-style image.

``--min-ram <MIN_RAM>``
  Amount of ram (in MB) required to boot image.

``--container-format <CONTAINER_FORMAT>``
  Format of the container Valid values: None, ami, ari,
  aki, bare, ovf, ova, docker

``--property <key=value>``
  Arbitrary property to associate with image. May be
  used multiple times.

``--file <FILE>``
  Local file that contains disk image to be uploaded
  during creation. Alternatively, the image data can be
  passed to the client via stdin.

``--progress``
  Show upload progress bar.

.. _glance_image-deactivate:

glance image-deactivate
-----------------------

.. code-block:: console

   usage: glance image-deactivate <IMAGE_ID>

Deactivate specified image.

**Positional arguments:**

``<IMAGE_ID>``
  ID of image to deactivate.

.. _glance_image-delete:

glance image-delete
-------------------

.. code-block:: console

   usage: glance image-delete <IMAGE_ID> [<IMAGE_ID> ...]

Delete specified image.

**Positional arguments:**

``<IMAGE_ID>``
  ID of image(s) to delete.

.. _glance_image-download:

glance image-download
---------------------

.. code-block:: console

   usage: glance image-download [--file <FILE>] [--progress] <IMAGE_ID>

Download a specific image.

**Positional arguments:**

``<IMAGE_ID>``
  ID of image to download.

**Optional arguments:**

``--file <FILE>``
  Local file to save downloaded image data to. If this is not
  specified and there is no redirection the image data will not
  be saved.

``--progress``
  Show download progress bar.

.. _glance_image-list:

glance image-list
-----------------

.. code-block:: console

   usage: glance image-list [--limit <LIMIT>] [--page-size <SIZE>]
                            [--visibility <VISIBILITY>]
                            [--member-status <MEMBER_STATUS>] [--owner <OWNER>]
                            [--property-filter <KEY=VALUE>]
                            [--checksum <CHECKSUM>] [--tag <TAG>]
                            [--sort-key {name,status,container_format,disk_format,size,id,created_at,updated_at}]
                            [--sort-dir {asc,desc}] [--sort <key>[:<direction>]]

List images you can access.

**Optional arguments:**

``--limit <LIMIT>``
  Maximum number of images to get.

``--page-size <SIZE>``
  Number of images to request in each paginated request.

``--visibility <VISIBILITY>``
  The visibility of the images to display.

``--member-status <MEMBER_STATUS>``
  The status of images to display.

``--owner <OWNER>``
  Display images owned by <OWNER>.

``--property-filter <KEY=VALUE>``
  Filter images by a user-defined image property.

``--checksum <CHECKSUM>``
  Displays images that match the checksum.

``--tag <TAG>``
  Filter images by a user-defined tag.

``--sort-key {name,status,container_format,disk_format,size,id,created_at,updated_at}``
  Sort image list by specified fields. May be used
  multiple times.

``--sort-dir {asc,desc}``
  Sort image list in specified directions.

``--sort <key>[:<direction>]``
  Comma-separated list of sort keys and directions in
  the form of <key>[:<asc|desc>]. Valid keys: name,
  status, container_format, disk_format, size, id,
  created_at, updated_at. OPTIONAL.

.. _glance_image-reactivate:

glance image-reactivate
-----------------------

.. code-block:: console

   usage: glance image-reactivate <IMAGE_ID>

Reactivate specified image.

**Positional arguments:**

``<IMAGE_ID>``
  ID of image to reactivate.

.. _glance_image-show:

glance image-show
-----------------

.. code-block:: console

   usage: glance image-show [--human-readable] [--max-column-width <integer>]
                            <IMAGE_ID>

Describe a specific image.

**Positional arguments:**

``<IMAGE_ID>``
  ID of image to describe.

**Optional arguments:**

``--human-readable``
  Print image size in a human-friendly format.

``--max-column-width <integer>``
  The max column width of the printed table.

.. _glance_image-tag-delete:

glance image-tag-delete
-----------------------

.. code-block:: console

   usage: glance image-tag-delete <IMAGE_ID> <TAG_VALUE>

Delete the tag associated with the given image.

**Positional arguments:**

``<IMAGE_ID>``
  ID of the image from which to delete tag.

``<TAG_VALUE>``
  Value of the tag.

.. _glance_image-tag-update:

glance image-tag-update
-----------------------

.. code-block:: console

   usage: glance image-tag-update <IMAGE_ID> <TAG_VALUE>

Update an image with the given tag.

**Positional arguments:**

``<IMAGE_ID>``
  Image to be updated with the given tag.

``<TAG_VALUE>``
  Value of the tag.

.. _glance_image-update:

glance image-update
-------------------

.. code-block:: console

   usage: glance image-update [--architecture <ARCHITECTURE>]
                              [--protected [True|False]] [--name <NAME>]
                              [--instance-uuid <INSTANCE_UUID>]
                              [--min-disk <MIN_DISK>] [--visibility <VISIBILITY>]
                              [--kernel-id <KERNEL_ID>]
                              [--os-version <OS_VERSION>]
                              [--disk-format <DISK_FORMAT>]
                              [--os-distro <OS_DISTRO>] [--owner <OWNER>]
                              [--ramdisk-id <RAMDISK_ID>] [--min-ram <MIN_RAM>]
                              [--container-format <CONTAINER_FORMAT>]
                              [--property <key=value>] [--remove-property key]
                              <IMAGE_ID>

Update an existing image.

**Positional arguments:**

``<IMAGE_ID>``
  ID of image to update.

**Optional arguments:**

``--architecture <ARCHITECTURE>``
  Operating system architecture as specified in
  http://docs.openstack.org/user-guide/common/cli-manage-images.html

``--protected [True|False]``
  If true, image will not be deletable.

``--name <NAME>``
  Descriptive name for the image

``--instance-uuid <INSTANCE_UUID>``
  Metadata which can be used to record which instance
  this image is associated with. (Informational only,
  does not create an instance snapshot.)

``--min-disk <MIN_DISK>``
  Amount of disk space (in GB) required to boot image.

``--visibility <VISIBILITY>``
  Scope of image accessibility Valid values: public,
  private

``--kernel-id <KERNEL_ID>``
  ID of image stored in Glance that should be used as
  the kernel when booting an AMI-style image.

``--os-version <OS_VERSION>``
  Operating system version as specified by the
  distributor

``--disk-format <DISK_FORMAT>``
  Format of the disk Valid values: None, ami, ari, aki,
  vhd, vmdk, raw, qcow2, vdi, iso

``--os-distro <OS_DISTRO>``
  Common name of operating system distribution as
  specified
  in
  http://docs.openstack.org/user-guide/common/cli-manage-images.html

``--owner <OWNER>``
  Owner of the image

``--ramdisk-id <RAMDISK_ID>``
  ID of image stored in Glance that should be used as
  the ramdisk when booting an AMI-style image.

``--min-ram <MIN_RAM>``
  Amount of ram (in MB) required to boot image.

``--container-format <CONTAINER_FORMAT>``
  Format of the container Valid values: None, ami, ari,
  aki, bare, ovf, ova, docker

``--property <key=value>``
  Arbitrary property to associate with image. May be
  used multiple times.

``--remove-property``
  key
  Name of arbitrary property to remove from the image.

.. _glance_image-upload:

glance image-upload
-------------------

.. code-block:: console

   usage: glance image-upload [--file <FILE>] [--size <IMAGE_SIZE>] [--progress]
                              <IMAGE_ID>

Upload data for a specific image.

**Positional arguments:**

``<IMAGE_ID>``
  ID of image to upload data to.

**Optional arguments:**

``--file <FILE>``
  Local file that contains disk image to be uploaded.
  Alternatively, images can be passed to the client via
  stdin.

``--size <IMAGE_SIZE>``
  Size in bytes of image to be uploaded. Default is to
  get size from provided data object but this is
  supported in case where size cannot be inferred.

``--progress``
  Show upload progress bar.

.. _glance_location-add:

glance location-add
-------------------

.. code-block:: console

   usage: glance location-add --url <URL> [--metadata <STRING>] <IMAGE_ID>

Add a location (and related metadata) to an image.

**Positional arguments:**

``<IMAGE_ID>``
  ID of image to which the location is to be added.

**Optional arguments:**

``--url <URL>``
  URL of location to add.

``--metadata <STRING>``
  Metadata associated with the location. Must be a valid
  JSON object (default: {})

.. _glance_location-delete:

glance location-delete
----------------------

.. code-block:: console

   usage: glance location-delete --url <URL> <IMAGE_ID>

Remove locations (and related metadata) from an image.

**Positional arguments:**

``<IMAGE_ID>``
  ID of image whose locations are to be removed.

**Optional arguments:**

``--url <URL>``
  URL of location to remove. May be used multiple times.

.. _glance_location-update:

glance location-update
----------------------

.. code-block:: console

   usage: glance location-update --url <URL> [--metadata <STRING>] <IMAGE_ID>

Update metadata of an image's location.

**Positional arguments:**

``<IMAGE_ID>``
  ID of image whose location is to be updated.

**Optional arguments:**

``--url <URL>``
  URL of location to update.

``--metadata <STRING>``
  Metadata associated with the location. Must be a valid
  JSON object (default: {})

.. _glance_md-namespace-create:

glance md-namespace-create
--------------------------

.. code-block:: console

   usage: glance md-namespace-create [--schema <SCHEMA>]
                                     [--created-at <CREATED_AT>]
                                     [--resource-type-associations <RESOURCE_TYPE_ASSOCIATIONS> [<RESOURCE_TYPE_ASSOCIATIONS> ...]]
                                     [--protected [True|False]] [--self <SELF>]
                                     [--display-name <DISPLAY_NAME>]
                                     [--owner <OWNER>]
                                     [--visibility <VISIBILITY>]
                                     [--updated-at <UPDATED_AT>]
                                     [--description <DESCRIPTION>]
                                     <NAMESPACE>

Create a new metadata definitions namespace.

**Positional arguments:**

``<NAMESPACE>``
  Name of the namespace.

**Optional arguments:**

``--schema <SCHEMA>``

``--created-at <CREATED_AT>``
  Date and time of namespace creation.

``--resource-type-associations <RESOURCE_TYPE_ASSOCIATIONS> [...]``

``--protected [True|False]``
  If true, namespace will not be deletable.

``--self <SELF>``

``--display-name <DISPLAY_NAME>``
  The user friendly name for the namespace. Used by UI
  if available.

``--owner <OWNER>``
  Owner of the namespace.

``--visibility <VISIBILITY>``
  Scope of namespace accessibility. Valid values:
  public, private

``--updated-at <UPDATED_AT>``
  Date and time of the last namespace modification.

``--description <DESCRIPTION>``
  Provides a user friendly description of the namespace.

.. _glance_md-namespace-delete:

glance md-namespace-delete
--------------------------

.. code-block:: console

   usage: glance md-namespace-delete <NAMESPACE>

Delete specified metadata definitions namespace with its contents.

**Positional arguments:**

``<NAMESPACE>``
  Name of namespace to delete.

.. _glance_md-namespace-import:

glance md-namespace-import
--------------------------

.. code-block:: console

   usage: glance md-namespace-import [--file <FILEPATH>]

Import a metadata definitions namespace from file or standard input.

**Optional arguments:**

``--file <FILEPATH>``
  Path to file with namespace schema to import.
  Alternatively, namespaces schema can be passed to the
  client via stdin.

.. _glance_md-namespace-list:

glance md-namespace-list
------------------------

.. code-block:: console

   usage: glance md-namespace-list [--resource-types <RESOURCE_TYPES>]
                                   [--visibility <VISIBILITY>]
                                   [--page-size <SIZE>]

List metadata definitions namespaces.

**Optional arguments:**

``--resource-types <RESOURCE_TYPES>``
  Resource type to filter namespaces.

``--visibility <VISIBILITY>``
  Visibility parameter to filter namespaces.

``--page-size <SIZE>``
  Number of namespaces to request in each paginated
  request.

.. _glance_md-namespace-objects-delete:

glance md-namespace-objects-delete
----------------------------------

.. code-block:: console

   usage: glance md-namespace-objects-delete <NAMESPACE>

Delete all metadata definitions objects inside a specific namespace.

**Positional arguments:**

``<NAMESPACE>``
  Name of namespace.

.. _glance_md-namespace-properties-delete:

glance md-namespace-properties-delete
-------------------------------------

.. code-block:: console

   usage: glance md-namespace-properties-delete <NAMESPACE>

Delete all metadata definitions property inside a specific namespace.

**Positional arguments:**

``<NAMESPACE>``
  Name of namespace.

.. _glance_md-namespace-resource-type-list:

glance md-namespace-resource-type-list
--------------------------------------

.. code-block:: console

   usage: glance md-namespace-resource-type-list <NAMESPACE>

List resource types associated to specific namespace.

**Positional arguments:**

``<NAMESPACE>``
  Name of namespace.

.. _glance_md-namespace-show:

glance md-namespace-show
------------------------

.. code-block:: console

   usage: glance md-namespace-show [--resource-type <RESOURCE_TYPE>]
                                   [--max-column-width <integer>]
                                   <NAMESPACE>

Describe a specific metadata definitions namespace. Lists also the namespace
properties, objects and resource type associations.

**Positional arguments:**

``<NAMESPACE>``
  Name of namespace to describe.

**Optional arguments:**

``--resource-type <RESOURCE_TYPE>``
  Applies prefix of given resource type associated to a
  namespace to all properties of a namespace.

``--max-column-width <integer>``
  The max column width of the printed table.

.. _glance_md-namespace-tags-delete:

glance md-namespace-tags-delete
-------------------------------

.. code-block:: console

   usage: glance md-namespace-tags-delete <NAMESPACE>

Delete all metadata definitions tags inside a specific namespace.

**Positional arguments:**

``<NAMESPACE>``
  Name of namespace.

.. _glance_md-namespace-update:

glance md-namespace-update
--------------------------

.. code-block:: console

   usage: glance md-namespace-update [--created-at <CREATED_AT>]
                                     [--protected [True|False]]
                                     [--namespace <NAMESPACE>] [--self <SELF>]
                                     [--display-name <DISPLAY_NAME>]
                                     [--owner <OWNER>]
                                     [--visibility <VISIBILITY>]
                                     [--updated-at <UPDATED_AT>]
                                     [--description <DESCRIPTION>]
                                     <NAMESPACE>

Update an existing metadata definitions namespace.

**Positional arguments:**

``<NAMESPACE>``
  Name of namespace to update.

**Optional arguments:**

``--created-at <CREATED_AT>``
  Date and time of namespace creation.

``--protected [True|False]``
  If true, namespace will not be deletable.

``--namespace <NAMESPACE>``
  The unique namespace text.

``--self <SELF>``

``--display-name <DISPLAY_NAME>``
  The user friendly name for the namespace. Used by UI
  if available.

``--owner <OWNER>``
  Owner of the namespace.

``--visibility <VISIBILITY>``
  Scope of namespace accessibility. Valid values:
  public, private

``--updated-at <UPDATED_AT>``
  Date and time of the last namespace modification.

``--description <DESCRIPTION>``
  Provides a user friendly description of the namespace.

.. _glance_md-object-create:

glance md-object-create
-----------------------

.. code-block:: console

   usage: glance md-object-create --name <NAME> --schema <SCHEMA> <NAMESPACE>

Create a new metadata definitions object inside a namespace.

**Positional arguments:**

``<NAMESPACE>``
  Name of namespace the object will belong.

**Optional arguments:**

``--name <NAME>``
  Internal name of an object.

``--schema <SCHEMA>``
  Valid JSON schema of an object.

.. _glance_md-object-delete:

glance md-object-delete
-----------------------

.. code-block:: console

   usage: glance md-object-delete <NAMESPACE> <OBJECT>

Delete a specific metadata definitions object inside a namespace.

**Positional arguments:**

``<NAMESPACE>``
  Name of namespace the object belongs.

``<OBJECT>``
  Name of an object.

.. _glance_md-object-list:

glance md-object-list
---------------------

.. code-block:: console

   usage: glance md-object-list <NAMESPACE>

List metadata definitions objects inside a specific namespace.

**Positional arguments:**

``<NAMESPACE>``
  Name of namespace.

.. _glance_md-object-property-show:

glance md-object-property-show
------------------------------

.. code-block:: console

   usage: glance md-object-property-show [--max-column-width <integer>]
                                         <NAMESPACE> <OBJECT> <PROPERTY>

Describe a specific metadata definitions property inside an object.

**Positional arguments:**

``<NAMESPACE>``
  Name of namespace the object belongs.

``<OBJECT>``
  Name of an object.

``<PROPERTY>``
  Name of a property.

**Optional arguments:**

``--max-column-width <integer>``
  The max column width of the printed table.

.. _glance_md-object-show:

glance md-object-show
---------------------

.. code-block:: console

   usage: glance md-object-show [--max-column-width <integer>]
                                <NAMESPACE> <OBJECT>

Describe a specific metadata definitions object inside a namespace.

**Positional arguments:**

``<NAMESPACE>``
  Name of namespace the object belongs.

``<OBJECT>``
  Name of an object.

**Optional arguments:**

``--max-column-width <integer>``
  The max column width of the printed table.

.. _glance_md-object-update:

glance md-object-update
-----------------------

.. code-block:: console

   usage: glance md-object-update [--name <NAME>] [--schema <SCHEMA>]
                                  <NAMESPACE> <OBJECT>

Update metadata definitions object inside a namespace.

**Positional arguments:**

``<NAMESPACE>``
  Name of namespace the object belongs.

``<OBJECT>``
  Name of an object.

**Optional arguments:**

``--name <NAME>``
  New name of an object.

``--schema <SCHEMA>``
  Valid JSON schema of an object.

.. _glance_md-property-create:

glance md-property-create
-------------------------

.. code-block:: console

   usage: glance md-property-create --name <NAME> --title <TITLE> --schema
                                    <SCHEMA>
                                    <NAMESPACE>

Create a new metadata definitions property inside a namespace.

**Positional arguments:**

``<NAMESPACE>``
  Name of namespace the property will belong.

**Optional arguments:**

``--name <NAME>``
  Internal name of a property.

``--title <TITLE>``
  Property name displayed to the user.

``--schema <SCHEMA>``
  Valid JSON schema of a property.

.. _glance_md-property-delete:

glance md-property-delete
-------------------------

.. code-block:: console

   usage: glance md-property-delete <NAMESPACE> <PROPERTY>

Delete a specific metadata definitions property inside a namespace.

**Positional arguments:**

``<NAMESPACE>``
  Name of namespace the property belongs.

``<PROPERTY>``
  Name of a property.

.. _glance_md-property-list:

glance md-property-list
-----------------------

.. code-block:: console

   usage: glance md-property-list <NAMESPACE>

List metadata definitions properties inside a specific namespace.

**Positional arguments:**

``<NAMESPACE>``
  Name of namespace.

.. _glance_md-property-show:

glance md-property-show
-----------------------

.. code-block:: console

   usage: glance md-property-show [--max-column-width <integer>]
                                  <NAMESPACE> <PROPERTY>

Describe a specific metadata definitions property inside a namespace.

**Positional arguments:**

``<NAMESPACE>``
  Name of namespace the property belongs.

``<PROPERTY>``
  Name of a property.

**Optional arguments:**

``--max-column-width <integer>``
  The max column width of the printed table.

.. _glance_md-property-update:

glance md-property-update
-------------------------

.. code-block:: console

   usage: glance md-property-update [--name <NAME>] [--title <TITLE>]
                                    [--schema <SCHEMA>]
                                    <NAMESPACE> <PROPERTY>

Update metadata definitions property inside a namespace.

**Positional arguments:**

``<NAMESPACE>``
  Name of namespace the property belongs.

``<PROPERTY>``
  Name of a property.

**Optional arguments:**

``--name <NAME>``
  New name of a property.

``--title <TITLE>``
  Property name displayed to the user.

``--schema <SCHEMA>``
  Valid JSON schema of a property.

.. _glance_md-resource-type-associate:

glance md-resource-type-associate
---------------------------------

.. code-block:: console

   usage: glance md-resource-type-associate [--updated-at <UPDATED_AT>]
                                            [--name <NAME>]
                                            [--properties-target <PROPERTIES_TARGET>]
                                            [--prefix <PREFIX>]
                                            [--created-at <CREATED_AT>]
                                            <NAMESPACE>

Associate resource type with a metadata definitions namespace.

**Positional arguments:**

``<NAMESPACE>``
  Name of namespace.

**Optional arguments:**

``--updated-at <UPDATED_AT>``
  Date and time of the last resource type association
  modification.

``--name <NAME>``
  Resource type names should be aligned with Heat
  resource types whenever possible: http://docs.openstac
  k.org/developer/heat/template_guide/openstack.html

``--properties-target <PROPERTIES_TARGET>``
  Some resource types allow more than one key / value
  pair per instance. For example, Cinder allows user and
  image metadata on volumes. Only the image properties
  metadata is evaluated by Nova (scheduling or drivers).
  This property allows a namespace target to remove the
  ambiguity.

``--prefix <PREFIX>``
  Specifies the prefix to use for the given resource
  type. Any properties in the namespace should be
  prefixed with this prefix when being applied to the
  specified resource type. Must include prefix separator
  (e.g. a colon :).

``--created-at <CREATED_AT>``
  Date and time of resource type association.

.. _glance_md-resource-type-deassociate:

glance md-resource-type-deassociate
-----------------------------------

.. code-block:: console

   usage: glance md-resource-type-deassociate <NAMESPACE> <RESOURCE_TYPE>

Deassociate resource type with a metadata definitions namespace.

**Positional arguments:**

``<NAMESPACE>``
  Name of namespace.

``<RESOURCE_TYPE>``
  Name of resource type.

.. _glance_md-resource-type-list:

glance md-resource-type-list
----------------------------

.. code-block:: console

   usage: glance md-resource-type-list

List available resource type names.

.. _glance_md-tag-create:

glance md-tag-create
--------------------

.. code-block:: console

   usage: glance md-tag-create --name <NAME> <NAMESPACE>

Add a new metadata definitions tag inside a namespace.

**Positional arguments:**

``<NAMESPACE>``
  Name of the namespace the tag will belong to.

**Optional arguments:**

``--name <NAME>``
  The name of the new tag to add.

.. _glance_md-tag-create-multiple:

glance md-tag-create-multiple
-----------------------------

.. code-block:: console

   usage: glance md-tag-create-multiple --names <NAMES> [--delim <DELIM>]
                                        <NAMESPACE>

Create new metadata definitions tags inside a namespace.

**Positional arguments:**

``<NAMESPACE>``
  Name of the namespace the tags will belong to.

**Optional arguments:**

``--names <NAMES>``
  A comma separated list of tag names.

``--delim <DELIM>``
  The delimiter used to separate the names (if none is
  provided then the default is a comma).

.. _glance_md-tag-delete:

glance md-tag-delete
--------------------

.. code-block:: console

   usage: glance md-tag-delete <NAMESPACE> <TAG>

Delete a specific metadata definitions tag inside a namespace.

**Positional arguments:**

``<NAMESPACE>``
  Name of the namespace to which the tag belongs.

``<TAG>``
  Name of the tag.

.. _glance_md-tag-list:

glance md-tag-list
------------------

.. code-block:: console

   usage: glance md-tag-list <NAMESPACE>

List metadata definitions tags inside a specific namespace.

**Positional arguments:**

``<NAMESPACE>``
  Name of namespace.

.. _glance_md-tag-show:

glance md-tag-show
------------------

.. code-block:: console

   usage: glance md-tag-show <NAMESPACE> <TAG>

Describe a specific metadata definitions tag inside a namespace.

**Positional arguments:**

``<NAMESPACE>``
  Name of the namespace to which the tag belongs.

``<TAG>``
  Name of the tag.

.. _glance_md-tag-update:

glance md-tag-update
--------------------

.. code-block:: console

   usage: glance md-tag-update --name <NAME> <NAMESPACE> <TAG>

Rename a metadata definitions tag inside a namespace.

**Positional arguments:**

``<NAMESPACE>``
  Name of the namespace to which the tag belongs.

``<TAG>``
  Name of the old tag.

**Optional arguments:**

``--name <NAME>``
  New name of the new tag.

.. _glance_member-create:

glance member-create
--------------------

.. code-block:: console

   usage: glance member-create <IMAGE_ID> <MEMBER_ID>

Create member for a given image.

**Positional arguments:**

``<IMAGE_ID>``
  Image with which to create member.

``<MEMBER_ID>``
  Tenant to add as member.

.. _glance_member-delete:

glance member-delete
--------------------

.. code-block:: console

   usage: glance member-delete <IMAGE_ID> <MEMBER_ID>

Delete image member.

**Positional arguments:**

``<IMAGE_ID>``
  Image from which to remove member.

``<MEMBER_ID>``
  Tenant to remove as member.

.. _glance_member-list:

glance member-list
------------------

.. code-block:: console

   usage: glance member-list --image-id <IMAGE_ID>

Describe sharing permissions by image.

**Optional arguments:**

``--image-id <IMAGE_ID>``
  Image to display members of.

.. _glance_member-update:

glance member-update
--------------------

.. code-block:: console

   usage: glance member-update <IMAGE_ID> <MEMBER_ID> <MEMBER_STATUS>

Update the status of a member for a given image.

**Positional arguments:**

``<IMAGE_ID>``
  Image from which to update member.

``<MEMBER_ID>``
  Tenant to update.

``<MEMBER_STATUS>``
  Updated status of member. Valid Values: accepted, rejected,
  pending

.. _glance_task-create:

glance task-create
------------------

.. code-block:: console

   usage: glance task-create [--type <TYPE>] [--input <STRING>]

Create a new task.

**Optional arguments:**

``--type <TYPE>``
  Type of Task. Please refer to Glance schema or
  documentation to see which tasks are supported.

``--input <STRING>``
  Parameters of the task to be launched

.. _glance_task-list:

glance task-list
----------------

.. code-block:: console

   usage: glance task-list [--sort-key {id,type,status}] [--sort-dir {asc,desc}]
                           [--page-size <SIZE>] [--type <TYPE>]
                           [--status <STATUS>]

List tasks you can access.

**Optional arguments:**

``--sort-key {id,type,status}``
  Sort task list by specified field.

``--sort-dir {asc,desc}``
  Sort task list in specified direction.

``--page-size <SIZE>``
  Number of tasks to request in each paginated request.

``--type <TYPE>``
  Filter tasks to those that have this type.

``--status <STATUS>``
  Filter tasks to those that have this status.

.. _glance_task-show:

glance task-show
----------------

.. code-block:: console

   usage: glance task-show <TASK_ID>

Describe a specific task.

**Positional arguments:**

``<TASK_ID>``
  ID of task to describe.


Image service API v1 commands
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

As of this version, the default API version is 2.
You can select an API version to use by adding the
:option:`--os-image-api-version` parameter or by
setting the corresponding environment variable:

.. code-block:: console

   export OS_IMAGE_API_VERSION=1

.. _glance_image-create_v1:

glance image-create (v1)
------------------------

.. code-block:: console

   usage: glance --os-image-api-version 1 image-create [--id <IMAGE_ID>] [--name <NAME>] [--store <STORE>]
                              [--disk-format <DISK_FORMAT>]
                              [--container-format <CONTAINER_FORMAT>]
                              [--owner <TENANT_ID>] [--size <SIZE>]
                              [--min-disk <DISK_GB>] [--min-ram <DISK_RAM>]
                              [--location <IMAGE_URL>] [--file <FILE>]
                              [--checksum <CHECKSUM>] [--copy-from <IMAGE_URL>]
                              [--is-public {True,False}]
                              [--is-protected {True,False}]
                              [--property <key=value>] [--human-readable]
                              [--progress]

Create a new image.

**Optional arguments:**

``--id <IMAGE_ID>``
  ID of image to reserve.

``--name <NAME>``
  Name of image.

``--store <STORE>``
  Store to upload image to.

``--disk-format <DISK_FORMAT>``
  Disk format of image. Acceptable formats: ami, ari,
  aki, vhd, vmdk, raw, qcow2, vdi, and iso.

``--container-format <CONTAINER_FORMAT>``
  Container format of image. Acceptable formats: ami,
  ari, aki, bare, and ovf.

``--owner <TENANT_ID>``
  Tenant who should own image.

``--size <SIZE>``
  Size of image data (in bytes). Only used with ':option:`--`
  location' and ':option:`--copy_from`'.

``--min-disk <DISK_GB>``
  Minimum size of disk needed to boot image (in
  gigabytes).

``--min-ram <DISK_RAM>``
  Minimum amount of ram needed to boot image (in
  megabytes).

``--location <IMAGE_URL>``
  URL where the data for this image already resides. For
  example, if the image data is stored in swift, you
  could specify 'swift+http://tenant%3Aaccount:key@auth_
  url/v2.0/container/obj'. (Note: '%3A' is ':' URL
  encoded.)

``--file <FILE>``
  Local file that contains disk image to be uploaded
  during creation. Alternatively, images can be passed
  to the client via stdin.

``--checksum <CHECKSUM>``
  Hash of image data used Glance can use for
  verification. Provide a md5 checksum here.

``--copy-from <IMAGE_URL>``
  Similar to ':option:`--location`' in usage, but this indicates
  that the Glance server should immediately copy the
  data and store it in its configured image store.

``--is-public {True,False}``
  Make image accessible to the public.

``--is-protected {True,False}``
  Prevent image from being deleted.

``--property <key=value>``
  Arbitrary property to associate with image. May be
  used multiple times.

``--human-readable``
  Print image size in a human-friendly format.

``--progress``
  Show upload progress bar.

.. _glance_image-delete_v1:

glance image-delete (v1)
------------------------

.. code-block:: console

   usage: glance --os-image-api-version 1 image-delete <IMAGE> [<IMAGE> ...]

Delete specified image(s).

**Positional arguments:**

``<IMAGE>``
  Name or ID of image(s) to delete.

.. _glance_image-download_v1:

glance image-download (v1)
--------------------------

.. code-block:: console

   usage: glance --os-image-api-version 1 image-download [--file <FILE>] [--progress] <IMAGE>

Download a specific image.

**Positional arguments:**

``<IMAGE>``
  Name or ID of image to download.

**Optional arguments:**

``--file <FILE>``
  Local file to save downloaded image data to. If this is not
  specified and there is no redirection the image data will not
  be saved.

``--progress``
  Show download progress bar.

.. _glance_image-list_v1:

glance image-list (v1)
----------------------

.. code-block:: console

   usage: glance --os-image-api-version 1 image-list [--name <NAME>] [--status <STATUS>]
                            [--changes-since <CHANGES_SINCE>]
                            [--container-format <CONTAINER_FORMAT>]
                            [--disk-format <DISK_FORMAT>] [--size-min <SIZE>]
                            [--size-max <SIZE>] [--property-filter <KEY=VALUE>]
                            [--page-size <SIZE>] [--human-readable]
                            [--sort-key {name,status,container_format,disk_format,size,id,created_at,updated_at}]
                            [--sort-dir {asc,desc}] [--is-public {True,False}]
                            [--owner <TENANT_ID>] [--all-tenants]

List images you can access.

**Optional arguments:**

``--name <NAME>``
  Filter images to those that have this name.

``--status <STATUS>``
  Filter images to those that have this status.

``--changes-since <CHANGES_SINCE>``
  Filter images to those that changed since the given
  time, which will include the deleted images.

``--container-format <CONTAINER_FORMAT>``
  Filter images to those that have this container
  format. Acceptable formats: ami, ari, aki, bare, and
  ovf.

``--disk-format <DISK_FORMAT>``
  Filter images to those that have this disk format.
  Acceptable formats: ami, ari, aki, vhd, vmdk, raw,
  qcow2, vdi, and iso.

``--size-min <SIZE>``
  Filter images to those with a size greater than this.

``--size-max <SIZE>``
  Filter images to those with a size less than this.

``--property-filter <KEY=VALUE>``
  Filter images by a user-defined image property.

``--page-size <SIZE>``
  Number of images to request in each paginated request.

``--human-readable``
  Print image size in a human-friendly format.

``--sort-key {name,status,container_format,disk_format,size,id,created_at,updated_at}``
  Sort image list by specified field.

``--sort-dir {asc,desc}``
  Sort image list in specified direction.

``--is-public {True,False}``
  Allows the user to select a listing of public or non
  public images.

``--owner <TENANT_ID>``
  Display only images owned by this tenant id. Filtering
  occurs on the client side so may be inefficient. This
  option is mainly intended for admin use. Use an empty
  string ('') to list images with no owner. Note: This
  option overrides the :option:`--is-public` argument if present.
  Note: the v2 API supports more efficient server-side
  owner based filtering.

``--all-tenants``
  Allows the admin user to list all images irrespective
  of the image's owner or is_public value.

.. _glance_image-show_v1:

glance image-show (v1)
----------------------

.. code-block:: console

   usage: glance --os-image-api-version 1 image-show [--human-readable] [--max-column-width <integer>]
                            <IMAGE>

Describe a specific image.

**Positional arguments:**

``<IMAGE>``
  Name or ID of image to describe.

**Optional arguments:**

``--human-readable``
  Print image size in a human-friendly format.

``--max-column-width <integer>``
  The max column width of the printed table.

.. _glance_image-update_v1:

glance image-update (v1)
------------------------

.. code-block:: console

   usage: glance --os-image-api-version 1 image-update [--name <NAME>] [--disk-format <DISK_FORMAT>]
                              [--container-format <CONTAINER_FORMAT>]
                              [--owner <TENANT_ID>] [--size <SIZE>]
                              [--min-disk <DISK_GB>] [--min-ram <DISK_RAM>]
                              [--location <IMAGE_URL>] [--file <FILE>]
                              [--checksum <CHECKSUM>] [--copy-from <IMAGE_URL>]
                              [--is-public {True,False}]
                              [--is-protected {True,False}]
                              [--property <key=value>] [--purge-props]
                              [--human-readable] [--progress]
                              <IMAGE>

Update a specific image.

**Positional arguments:**

``<IMAGE>``
  Name or ID of image to modify.

**Optional arguments:**

``--name <NAME>``
  Name of image.

``--disk-format <DISK_FORMAT>``
  Disk format of image. Acceptable formats: ami, ari,
  aki, vhd, vmdk, raw, qcow2, vdi, and iso.

``--container-format <CONTAINER_FORMAT>``
  Container format of image. Acceptable formats: ami,
  ari, aki, bare, and ovf.

``--owner <TENANT_ID>``
  Tenant who should own image.

``--size <SIZE>``
  Size of image data (in bytes).

``--min-disk <DISK_GB>``
  Minimum size of disk needed to boot image (in
  gigabytes).

``--min-ram <DISK_RAM>``
  Minimum amount of ram needed to boot image (in
  megabytes).

``--location <IMAGE_URL>``
  URL where the data for this image already resides. For
  example, if the image data is stored in swift, you
  could specify 'swift+http://tenant%3Aaccount:key@auth_
  url/v2.0/container/obj'. (Note: '%3A' is ':' URL
  encoded.) This option only works for images in
  'queued' status.

``--file <FILE>``
  Local file that contains disk image to be uploaded
  during update. Alternatively, images can be passed to
  the client via stdin.

``--checksum <CHECKSUM>``
  Hash of image data used Glance can use for
  verification.

``--copy-from <IMAGE_URL>``
  Similar to ':option:`--location`' in usage, but this indicates
  that the Glance server should immediately copy the
  data and store it in its configured image store. This
  option only works for images in 'queued' status.

``--is-public {True,False}``
  Make image accessible to the public.

``--is-protected {True,False}``
  Prevent image from being deleted.

``--property <key=value>``
  Arbitrary property to associate with image. May be
  used multiple times.

``--purge-props``
  If this flag is present, delete all image properties
  not explicitly set in the update request. Otherwise,
  those properties not referenced are preserved.

``--human-readable``
  Print image size in a human-friendly format.

``--progress``
  Show upload progress bar.

.. _glance_member-create_v1:

glance member-create (v1)
-------------------------

.. code-block:: console

   usage: glance --os-image-api-version 1 member-create [--can-share] <IMAGE> <TENANT_ID>

Share a specific image with a tenant.

**Positional arguments:**

``<IMAGE>``
  Image to add member to.

``<TENANT_ID>``
  Tenant to add as member.

**Optional arguments:**

``--can-share``
  Allow the specified tenant to share this image.

.. _glance_member-delete_v1:

glance member-delete (v1)
-------------------------

.. code-block:: console

   usage: glance --os-image-api-version 1 member-delete <IMAGE> <TENANT_ID>

Remove a shared image from a tenant.

**Positional arguments:**

``<IMAGE>``
  Image from which to remove member.

``<TENANT_ID>``
  Tenant to remove as member.

.. _glance_member-list_v1:

glance member-list (v1)
-----------------------

.. code-block:: console

   usage: glance --os-image-api-version 1 member-list [--image-id <IMAGE_ID>] [--tenant-id <TENANT_ID>]

Describe sharing permissions by image or tenant.

**Optional arguments:**

``--image-id <IMAGE_ID>``
  Filter results by an image ID.

``--tenant-id <TENANT_ID>``
  Filter results by a tenant ID.

