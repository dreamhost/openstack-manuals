.. ##  WARNING  #####################################
.. This file is tool-generated. Do not edit manually.
.. ##################################################

=====================================================================
A time series storage and resources index service command-line client
=====================================================================

The gnocchi client is the command-line interface (CLI) for
the A time series storage and resources index service API and its extensions.

This chapter documents :command:`gnocchi` version ``2.5.0``.

For help on a specific :command:`gnocchi` command, enter:

.. code-block:: console

   $ gnocchi help COMMAND

.. _gnocchi_command_usage:

gnocchi usage
~~~~~~~~~~~~~

.. code-block:: console

   usage: gnocchi [--version] [-v | -q] [--log-file LOG_FILE] [-h] [--debug]
                  [--os-region-name <auth-region-name>]
                  [--os-interface <interface>]
                  [--gnocchi-api-version GNOCCHI_API_VERSION] [--insecure]
                  [--os-cacert <ca-certificate>] [--os-cert <certificate>]
                  [--os-key <key>] [--timeout <seconds>] [--os-auth-type <name>]
                  [--os-auth-url OS_AUTH_URL] [--os-domain-id OS_DOMAIN_ID]
                  [--os-domain-name OS_DOMAIN_NAME]
                  [--os-project-id OS_PROJECT_ID]
                  [--os-project-name OS_PROJECT_NAME]
                  [--os-project-domain-id OS_PROJECT_DOMAIN_ID]
                  [--os-project-domain-name OS_PROJECT_DOMAIN_NAME]
                  [--os-trust-id OS_TRUST_ID]
                  [--os-default-domain-id OS_DEFAULT_DOMAIN_ID]
                  [--os-default-domain-name OS_DEFAULT_DOMAIN_NAME]
                  [--os-user-id OS_USER_ID] [--os-username OS_USERNAME]
                  [--os-user-domain-id OS_USER_DOMAIN_ID]
                  [--os-user-domain-name OS_USER_DOMAIN_NAME]
                  [--os-password OS_PASSWORD] [--endpoint ENDPOINT]

.. _gnocchi_command_options:

gnocchi optional arguments
~~~~~~~~~~~~~~~~~~~~~~~~~~

``--version``
  show program's version number and exit

``-v, --verbose``
  Increase verbosity of output. Can be repeated.

``-q, --quiet``
  Suppress output except warnings and errors.

``--log-file LOG_FILE``
  Specify a file to log output. Disabled by default.

``-h, --help``
  Show help message and exit.

``--debug``
  Show tracebacks on errors.

``--os-region-name <auth-region-name>``
  Authentication region name (Env: OS_REGION_NAME)

``--os-interface <interface>``
  Select an interface type. Valid interface types:
  [admin, public, internal]. (Env: OS_INTERFACE)

``--gnocchi-api-version GNOCCHI_API_VERSION``
  Defaults to ``env[GNOCCHI_API_VERSION]`` or 1.

``--os-auth-type <name>, --os-auth-plugin <name>``
  Authentication type to use

``--endpoint ENDPOINT``
  Gnocchi endpoint (Env: GNOCCHI_ENDPOINT)

.. _gnocchi_archive-policy_create:

gnocchi archive-policy create
-----------------------------

.. code-block:: console

   usage: gnocchi archive-policy create [-h]
                                        [-f {html,json,shell,table,value,yaml}]
                                        [-c COLUMN] [--max-width <integer>]
                                        [--noindent] [--prefix PREFIX] -d
                                        <DEFINITION> [-b BACK_WINDOW]
                                        [-m AGGREGATION_METHODS]
                                        name

Create an archive policy

**Positional arguments:**

``name``
  name of the archive policy

**Optional arguments:**

``-h, --help``
  show this help message and exit

``-d <DEFINITION>, --definition <DEFINITION>``
  two attributes (separated by ',') of an archive policy
  definition with its name and value separated with a
  ':'

``-b BACK_WINDOW, --back-window BACK_WINDOW``
  back window of the archive policy

``-m AGGREGATION_METHODS, --aggregation-method AGGREGATION_METHODS``
  aggregation method of the archive policy

.. _gnocchi_archive-policy_delete:

gnocchi archive-policy delete
-----------------------------

.. code-block:: console

   usage: gnocchi archive-policy delete [-h] name

Delete an archive policy

**Positional arguments:**

``name``
  Name of the archive policy

**Optional arguments:**

``-h, --help``
  show this help message and exit

.. _gnocchi_archive-policy_list:

gnocchi archive-policy list
---------------------------

.. code-block:: console

   usage: gnocchi archive-policy list [-h] [-f {csv,html,json,table,value,yaml}]
                                      [-c COLUMN] [--max-width <integer>]
                                      [--noindent]
                                      [--quote {all,minimal,none,nonnumeric}]

List archive policies

**Optional arguments:**

``-h, --help``
  show this help message and exit

.. _gnocchi_archive-policy_show:

gnocchi archive-policy show
---------------------------

.. code-block:: console

   usage: gnocchi archive-policy show [-h]
                                      [-f {html,json,shell,table,value,yaml}]
                                      [-c COLUMN] [--max-width <integer>]
                                      [--noindent] [--prefix PREFIX]
                                      name

Show an archive policy

**Positional arguments:**

``name``
  Name of the archive policy

**Optional arguments:**

``-h, --help``
  show this help message and exit

.. _gnocchi_archive-policy_update:

gnocchi archive-policy update
-----------------------------

.. code-block:: console

   usage: gnocchi archive-policy update [-h]
                                        [-f {html,json,shell,table,value,yaml}]
                                        [-c COLUMN] [--max-width <integer>]
                                        [--noindent] [--prefix PREFIX] -d
                                        <DEFINITION>
                                        name

Update an archive policy

**Positional arguments:**

``name``
  name of the archive policy

**Optional arguments:**

``-h, --help``
  show this help message and exit

``-d <DEFINITION>, --definition <DEFINITION>``
  two attributes (separated by ',') of an archive policy
  definition with its name and value separated with a
  ':'

.. _gnocchi_archive-policy-rule_create:

gnocchi archive-policy-rule create
----------------------------------

.. code-block:: console

   usage: gnocchi archive-policy-rule create [-h]
                                             [-f {html,json,shell,table,value,yaml}]
                                             [-c COLUMN] [--max-width <integer>]
                                             [--noindent] [--prefix PREFIX] -a
                                             ARCHIVE_POLICY_NAME -m
                                             METRIC_PATTERN
                                             name

Create an archive policy rule

**Positional arguments:**

``name``
  Rule name

**Optional arguments:**

``-h, --help``
  show this help message and exit

``-a ARCHIVE_POLICY_NAME, --archive-policy-name ARCHIVE_POLICY_NAME``
  Archive policy name

``-m METRIC_PATTERN, --metric-pattern METRIC_PATTERN``
  Wildcard of metric name to match

.. _gnocchi_archive-policy-rule_delete:

gnocchi archive-policy-rule delete
----------------------------------

.. code-block:: console

   usage: gnocchi archive-policy-rule delete [-h] name

Delete an archive policy rule

**Positional arguments:**

``name``
  Name of the archive policy rule

**Optional arguments:**

``-h, --help``
  show this help message and exit

.. _gnocchi_archive-policy-rule_list:

gnocchi archive-policy-rule list
--------------------------------

.. code-block:: console

   usage: gnocchi archive-policy-rule list [-h]
                                           [-f {csv,html,json,table,value,yaml}]
                                           [-c COLUMN] [--max-width <integer>]
                                           [--noindent]
                                           [--quote {all,minimal,none,nonnumeric}]

List archive policy rules

**Optional arguments:**

``-h, --help``
  show this help message and exit

.. _gnocchi_archive-policy-rule_show:

gnocchi archive-policy-rule show
--------------------------------

.. code-block:: console

   usage: gnocchi archive-policy-rule show [-h]
                                           [-f {html,json,shell,table,value,yaml}]
                                           [-c COLUMN] [--max-width <integer>]
                                           [--noindent] [--prefix PREFIX]
                                           name

Show an archive policy rule

**Positional arguments:**

``name``
  Name of the archive policy rule

**Optional arguments:**

``-h, --help``
  show this help message and exit

.. _gnocchi_benchmark_measures_add:

gnocchi benchmark measures add
------------------------------

.. code-block:: console

   usage: gnocchi benchmark measures add [-h] [--resource-id RESOURCE_ID]
                                         [-f {html,json,shell,table,value,yaml}]
                                         [-c COLUMN] [--max-width <integer>]
                                         [--noindent] [--prefix PREFIX]
                                         [--workers WORKERS] --count COUNT
                                         [--batch BATCH]
                                         [--timestamp-start TIMESTAMP_START]
                                         [--timestamp-end TIMESTAMP_END] [--wait]
                                         metric

Do benchmark testing of adding measurements

**Positional arguments:**

``metric``
  ID or name of the metric

**Optional arguments:**

``-h, --help``
  show this help message and exit

``--resource-id RESOURCE_ID, -r RESOURCE_ID``
  ID of the resource

``--workers WORKERS, -w WORKERS``
  Number of workers to use

``--count COUNT, -n COUNT``
  Number of total measures to send

``--batch BATCH, -b BATCH``
  Number of measures to send in each batch

``--timestamp-start TIMESTAMP_START, -s TIMESTAMP_START``
  First timestamp to use

``--timestamp-end TIMESTAMP_END, -e TIMESTAMP_END``
  Last timestamp to use

``--wait``
  Wait for all measures to be processed

.. _gnocchi_benchmark_measures_show:

gnocchi benchmark measures show
-------------------------------

.. code-block:: console

   usage: gnocchi benchmark measures show [-h]
                                          [-f {html,json,shell,table,value,yaml}]
                                          [-c COLUMN] [--max-width <integer>]
                                          [--noindent] [--prefix PREFIX]
                                          [--resource-id RESOURCE_ID]
                                          [--aggregation AGGREGATION]
                                          [--start START] [--stop STOP]
                                          [--granularity GRANULARITY]
                                          [--workers WORKERS] --count COUNT
                                          metric

Do benchmark testing of measurements show

**Positional arguments:**

``metric``
  ID or name of the metric

**Optional arguments:**

``-h, --help``
  show this help message and exit

``--resource-id RESOURCE_ID, -r RESOURCE_ID``
  ID of the resource

``--aggregation AGGREGATION``
  aggregation to retrieve

``--start START``
  beginning of the period

``--stop STOP``
  end of the period

``--granularity GRANULARITY``
  granularity to retrieve (in seconds)

``--workers WORKERS, -w WORKERS``
  Number of workers to use

``--count COUNT, -n COUNT``
  Number of total measures to send

.. _gnocchi_benchmark_metric_create:

gnocchi benchmark metric create
-------------------------------

.. code-block:: console

   usage: gnocchi benchmark metric create [-h] [--resource-id RESOURCE_ID]
                                          [-f {html,json,shell,table,value,yaml}]
                                          [-c COLUMN] [--max-width <integer>]
                                          [--noindent] [--prefix PREFIX]
                                          [--archive-policy-name ARCHIVE_POLICY_NAME]
                                          [--workers WORKERS] --count COUNT
                                          [--keep]

Do benchmark testing of metric creation

**Optional arguments:**

``-h, --help``
  show this help message and exit

``--resource-id RESOURCE_ID, -r RESOURCE_ID``
  ID of the resource

``--archive-policy-name ARCHIVE_POLICY_NAME, -a ARCHIVE_POLICY_NAME``
  name of the archive policy

``--workers WORKERS, -w WORKERS``
  Number of workers to use

``--count COUNT, -n COUNT``
  Number of metrics to create

``--keep, -k``
  Keep created metrics

.. _gnocchi_benchmark_metric_show:

gnocchi benchmark metric show
-----------------------------

.. code-block:: console

   usage: gnocchi benchmark metric show [-h] [--resource-id RESOURCE_ID]
                                        [-f {html,json,shell,table,value,yaml}]
                                        [-c COLUMN] [--max-width <integer>]
                                        [--noindent] [--prefix PREFIX]
                                        [--workers WORKERS] --count COUNT
                                        metric [metric ...]

Do benchmark testing of metric show

**Positional arguments:**

``metric``
  ID or name of the metrics

**Optional arguments:**

``-h, --help``
  show this help message and exit

``--resource-id RESOURCE_ID, -r RESOURCE_ID``
  ID of the resource

``--workers WORKERS, -w WORKERS``
  Number of workers to use

``--count COUNT, -n COUNT``
  Number of metrics to get

.. _gnocchi_capabilities_list:

gnocchi capabilities list
-------------------------

.. code-block:: console

   usage: gnocchi capabilities list [-h] [-f {html,json,shell,table,value,yaml}]
                                    [-c COLUMN] [--max-width <integer>]
                                    [--noindent] [--prefix PREFIX]

List capabilities

**Optional arguments:**

``-h, --help``
  show this help message and exit

.. _gnocchi_measures_add:

gnocchi measures add
--------------------

.. code-block:: console

   usage: gnocchi measures add [-h] [--resource-id RESOURCE_ID] -m MEASURE metric

Add measurements to a metric

**Positional arguments:**

``metric``
  ID or name of the metric

**Optional arguments:**

``-h, --help``
  show this help message and exit

``--resource-id RESOURCE_ID, -r RESOURCE_ID``
  ID of the resource

``-m MEASURE, --measure MEASURE``
  timestamp and value of a measure separated with a '@'

.. _gnocchi_measures_batch-metrics:

gnocchi measures batch-metrics
------------------------------

.. code-block:: console

   usage: gnocchi measures batch-metrics [-h] file


**Positional arguments:**

``file``
  File containing measurements to batch or - for stdin (see
  Gnocchi REST API docs for the format

**Optional arguments:**

``-h, --help``
  show this help message and exit

.. _gnocchi_measures_batch-resources-metrics:

gnocchi measures batch-resources-metrics
----------------------------------------

.. code-block:: console

   usage: gnocchi measures batch-resources-metrics [-h] file


**Positional arguments:**

``file``
  File containing measurements to batch or - for stdin (see
  Gnocchi REST API docs for the format

**Optional arguments:**

``-h, --help``
  show this help message and exit

.. _gnocchi_measures_show:

gnocchi measures show
---------------------

.. code-block:: console

   usage: gnocchi measures show [-h] [-f {csv,html,json,table,value,yaml}]
                                [-c COLUMN] [--max-width <integer>] [--noindent]
                                [--quote {all,minimal,none,nonnumeric}]
                                [--resource-id RESOURCE_ID]
                                [--aggregation AGGREGATION] [--start START]
                                [--stop STOP] [--granularity GRANULARITY]
                                metric

Get measurements of a metric

**Positional arguments:**

``metric``
  ID or name of the metric

**Optional arguments:**

``-h, --help``
  show this help message and exit

``--resource-id RESOURCE_ID, -r RESOURCE_ID``
  ID of the resource

``--aggregation AGGREGATION``
  aggregation to retrieve

``--start START``
  beginning of the period

``--stop STOP``
  end of the period

``--granularity GRANULARITY``
  granularity to retrieve (in seconds)

.. _gnocchi_metric_create:

gnocchi metric create
---------------------

.. code-block:: console

   usage: gnocchi metric create [-h] [--resource-id RESOURCE_ID]
                                [-f {html,json,shell,table,value,yaml}]
                                [-c COLUMN] [--max-width <integer>] [--noindent]
                                [--prefix PREFIX]
                                [--archive-policy-name ARCHIVE_POLICY_NAME]
                                [--unit UNIT]
                                [METRIC_NAME]

Create a metric

**Positional arguments:**

``METRIC_NAME``
  Name of the metric

**Optional arguments:**

``-h, --help``
  show this help message and exit

``--resource-id RESOURCE_ID, -r RESOURCE_ID``
  ID of the resource

``--archive-policy-name ARCHIVE_POLICY_NAME, -a ARCHIVE_POLICY_NAME``
  name of the archive policy

``--unit UNIT, -u UNIT``
  unit of the metric

.. _gnocchi_metric_delete:

gnocchi metric delete
---------------------

.. code-block:: console

   usage: gnocchi metric delete [-h] [--resource-id RESOURCE_ID]
                                metric [metric ...]

Delete a metric

**Positional arguments:**

``metric``
  IDs or names of the metric

**Optional arguments:**

``-h, --help``
  show this help message and exit

``--resource-id RESOURCE_ID, -r RESOURCE_ID``
  ID of the resource

.. _gnocchi_metric_list:

gnocchi metric list
-------------------

.. code-block:: console

   usage: gnocchi metric list [-h] [-f {csv,html,json,table,value,yaml}]
                              [-c COLUMN] [--max-width <integer>] [--noindent]
                              [--quote {all,minimal,none,nonnumeric}]

List metrics

**Optional arguments:**

``-h, --help``
  show this help message and exit

.. _gnocchi_metric_show:

gnocchi metric show
-------------------

.. code-block:: console

   usage: gnocchi metric show [-h] [-f {html,json,shell,table,value,yaml}]
                              [-c COLUMN] [--max-width <integer>] [--noindent]
                              [--prefix PREFIX] [--resource-id RESOURCE_ID]
                              metric

Show a metric

**Positional arguments:**

``metric``
  ID or name of the metric

**Optional arguments:**

``-h, --help``
  show this help message and exit

``--resource-id RESOURCE_ID, -r RESOURCE_ID``
  ID of the resource

.. _gnocchi_resource_create:

gnocchi resource create
-----------------------

.. code-block:: console

   usage: gnocchi resource create [-h] [-f {html,json,shell,table,value,yaml}]
                                  [-c COLUMN] [--max-width <integer>]
                                  [--noindent] [--prefix PREFIX]
                                  [--type RESOURCE_TYPE] [-a ATTRIBUTE]
                                  [-m ADD_METRIC] [-n CREATE_METRIC]
                                  resource_id

Create a resource

**Positional arguments:**

``resource_id``
  ID of the resource

**Optional arguments:**

``-h, --help``
  show this help message and exit

``--type RESOURCE_TYPE, -t RESOURCE_TYPE``
  Type of resource

``-a ATTRIBUTE, --attribute ATTRIBUTE``
  name and value of an attribute separated with a ':'

``-m ADD_METRIC, --add-metric ADD_METRIC``
  name:id of a metric to add

``-n CREATE_METRIC, --create-metric CREATE_METRIC``
  name:archive_policy_name of a metric to create

.. _gnocchi_resource_delete:

gnocchi resource delete
-----------------------

.. code-block:: console

   usage: gnocchi resource delete [-h] resource_id

Delete a resource

**Positional arguments:**

``resource_id``
  ID of the resource

**Optional arguments:**

``-h, --help``
  show this help message and exit

.. _gnocchi_resource_history:

gnocchi resource history
------------------------

.. code-block:: console

   usage: gnocchi resource history [-h] [-f {csv,html,json,table,value,yaml}]
                                   [-c COLUMN] [--max-width <integer>]
                                   [--noindent]
                                   [--quote {all,minimal,none,nonnumeric}]
                                   [--details] [--limit <LIMIT>]
                                   [--marker <MARKER>] [--sort <SORT>]
                                   [--type RESOURCE_TYPE]
                                   resource_id

Show the history of a resource

**Positional arguments:**

``resource_id``
  ID of a resource

**Optional arguments:**

``-h, --help``
  show this help message and exit

``--details``
  Show all attributes of generic resources

``--limit <LIMIT>``
  Number of resources to return (Default is server
  default)

``--marker <MARKER>``
  Last item of the previous listing. Return the next
  results after this value

``--sort <SORT>``
  Sort of resource attribute (example: user_id:desc-nullslast

``--type RESOURCE_TYPE, -t RESOURCE_TYPE``
  Type of resource

.. _gnocchi_resource_list:

gnocchi resource list
---------------------

.. code-block:: console

   usage: gnocchi resource list [-h] [-f {csv,html,json,table,value,yaml}]
                                [-c COLUMN] [--max-width <integer>] [--noindent]
                                [--quote {all,minimal,none,nonnumeric}]
                                [--details] [--history] [--limit <LIMIT>]
                                [--marker <MARKER>] [--sort <SORT>]
                                [--type RESOURCE_TYPE]

List resources

**Optional arguments:**

``-h, --help``
  show this help message and exit

``--details``
  Show all attributes of generic resources

``--history``
  Show history of the resources

``--limit <LIMIT>``
  Number of resources to return (Default is server
  default)

``--marker <MARKER>``
  Last item of the previous listing. Return the next
  results after this value

``--sort <SORT>``
  Sort of resource attribute (example: user_id:desc-nullslast

``--type RESOURCE_TYPE, -t RESOURCE_TYPE``
  Type of resource

.. _gnocchi_resource_show:

gnocchi resource show
---------------------

.. code-block:: console

   usage: gnocchi resource show [-h] [-f {html,json,shell,table,value,yaml}]
                                [-c COLUMN] [--max-width <integer>] [--noindent]
                                [--prefix PREFIX] [--type RESOURCE_TYPE]
                                resource_id

Show a resource

**Positional arguments:**

``resource_id``
  ID of a resource

**Optional arguments:**

``-h, --help``
  show this help message and exit

``--type RESOURCE_TYPE, -t RESOURCE_TYPE``
  Type of resource

.. _gnocchi_resource_update:

gnocchi resource update
-----------------------

.. code-block:: console

   usage: gnocchi resource update [-h] [-f {html,json,shell,table,value,yaml}]
                                  [-c COLUMN] [--max-width <integer>]
                                  [--noindent] [--prefix PREFIX]
                                  [--type RESOURCE_TYPE] [-a ATTRIBUTE]
                                  [-m ADD_METRIC] [-n CREATE_METRIC]
                                  [-d DELETE_METRIC]
                                  resource_id

Update a resource

**Positional arguments:**

``resource_id``
  ID of the resource

**Optional arguments:**

``-h, --help``
  show this help message and exit

``--type RESOURCE_TYPE, -t RESOURCE_TYPE``
  Type of resource

``-a ATTRIBUTE, --attribute ATTRIBUTE``
  name and value of an attribute separated with a ':'

``-m ADD_METRIC, --add-metric ADD_METRIC``
  name:id of a metric to add

``-n CREATE_METRIC, --create-metric CREATE_METRIC``
  name:archive_policy_name of a metric to create

``-d DELETE_METRIC, --delete-metric DELETE_METRIC``
  Name of a metric to delete

.. _gnocchi_resource-type_create:

gnocchi resource-type create
----------------------------

.. code-block:: console

   usage: gnocchi resource-type create [-h]
                                       [-f {html,json,shell,table,value,yaml}]
                                       [-c COLUMN] [--max-width <integer>]
                                       [--noindent] [--prefix PREFIX]
                                       [-a ATTRIBUTE]
                                       name

Create a resource type

**Positional arguments:**

``name``
  name of the resource type

**Optional arguments:**

``-h, --help``
  show this help message and exit

``-a ATTRIBUTE, --attribute ATTRIBUTE``
  attribute definition, attribute_name:attribute_type:at
  tribute_is_required:attribute_type_option_name=attribu
  te_type_option_value:… For example:
  display_name:string:true:max_length=255

.. _gnocchi_resource-type_delete:

gnocchi resource-type delete
----------------------------

.. code-block:: console

   usage: gnocchi resource-type delete [-h] name

Delete a resource type

**Positional arguments:**

``name``
  name of the resource type

**Optional arguments:**

``-h, --help``
  show this help message and exit

.. _gnocchi_resource-type_list:

gnocchi resource-type list
--------------------------

.. code-block:: console

   usage: gnocchi resource-type list [-h] [-f {csv,html,json,table,value,yaml}]
                                     [-c COLUMN] [--max-width <integer>]
                                     [--noindent]
                                     [--quote {all,minimal,none,nonnumeric}]

List resource types

**Optional arguments:**

``-h, --help``
  show this help message and exit

.. _gnocchi_resource-type_show:

gnocchi resource-type show
--------------------------

.. code-block:: console

   usage: gnocchi resource-type show [-h] [-f {html,json,shell,table,value,yaml}]
                                     [-c COLUMN] [--max-width <integer>]
                                     [--noindent] [--prefix PREFIX]
                                     name

Show a resource type

**Positional arguments:**

``name``
  name of the resource type

**Optional arguments:**

``-h, --help``
  show this help message and exit

.. _gnocchi_status:

gnocchi status
--------------

.. code-block:: console

   usage: gnocchi status [-h] [-f {html,json,shell,table,value,yaml}] [-c COLUMN]
                         [--max-width <integer>] [--noindent] [--prefix PREFIX]

Show the status of measurements processing

**Optional arguments:**

``-h, --help``
  show this help message and exit

