.. _source-code:

============
Code samples
============

Format code snippets as standalone literal blocks. There are several ways
to define a code-block within an RST file.

Standard literal block
~~~~~~~~~~~~~~~~~~~~~~

+------------------+---------------------------------------------------------+
| **Directive**    | ``::`` or ``code``                                      |
+------------------+---------------------------------------------------------+
| **Arguments**    | none                                                    |
+------------------+---------------------------------------------------------+
| **Options**      | none                                                    |
+------------------+---------------------------------------------------------+
| **Description**  | * Introduces a standard reST literal block.             |
|                  | * Preserves line breaks and whitespaces.                |
|                  | * Automatically highlights language (Python, by         |
|                  |   default)                                              |
+------------------+---------------------------------------------------------+

Use ``::`` or ``code`` directive if you provide the code snippets written
in one programming language within one file. By default, the code-block
formatted this way is shown in a Python highlighting mode.

To define another highlighting language, use the ``code-block`` directive
as described in the :ref:`non-standard-block` section.

**Input**

.. code-block:: none

   Add logging statements::

     from nova.openstack.common import log as logging
     LOG = logging.getLogger(__name__)

**Output**

Add logging statements::

  from nova.openstack.common import log as logging
  LOG = logging.getLogger(__name__)

.. _non-standard-block:

Non-standard literal block
~~~~~~~~~~~~~~~~~~~~~~~~~~

+------------------+---------------------------------------------------------+
| **Directive**    | ``code-block``                                          |
+------------------+---------------------------------------------------------+
| **Arguments**    | ``python`` (default), ``ruby``, ``c``, ``console``,     |
|                  | ``ini``, and others                                     |
+------------------+---------------------------------------------------------+
| **Options**      | ``linenos``, ``emphasize-lines``                        |
+------------------+---------------------------------------------------------+
| **Description**  | * Specifies the highlighting language directly.         |
|                  | * Preserves line breaks and whitespaces.                |
+------------------+---------------------------------------------------------+

To optimize the output of code for a specific programming language, specify
the corresponding argument with ``code-block``. Use ``ini`` for configuration
files, ``console`` for console inputs and outputs, and so on.

**Input**

.. code-block:: none

   .. code-block:: ini

      # Configuration for nova-rootwrap
      # This file should be owned by (and only-writeable by) the root user

      [DEFAULT]
      # List of directories to load filter definitions from (separated by ',').

**Output**

.. code-block:: ini

   # Configuration for nova-rootwrap
   # This file should be owned by (and only-writeable by) the root user

   [DEFAULT]
   # List of directories to load filter definitions from (separated by ',').

.. note::

   When you write the command example, you should write the input and output
   as it is from the console in one code block, not add an extra blank line,
   not split them into input block and output block.
   You can omit the output where appropriate.

.. _remote-block:

Literal block using a remote file
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

+-----------------+-----------------------------------------------------+
| **Directive**   | ``remote-code-block``                               |
+-----------------+-----------------------------------------------------+
| **Arguments**   | ``python`` (default), ``ruby``, ``c``, ``console``, |
|                 | ``ini``, and others                                 |
+-----------------+-----------------------------------------------------+
| **Options**     | ``linenos``, ``emphasize-lines``                    |
+-----------------+-----------------------------------------------------+
| **Description** | * Specifies the highlighting language directly.     |
|                 | * Preserves line breaks and whitespaces.            |
+-----------------+-----------------------------------------------------+

This directive behaves exactly like the ``code-block`` directive, but gets the
content from a remote URL (``http`` or ``https``).

``remote-code-block`` is a custom directive.

**Input**

.. code-block:: none

   .. remote-code-block:: ini

      http://git.openstack.org/cgit/openstack/nova/tree/etc/nova/api-paste.ini?h=stable/liberty

**Output**

.. code-block:: ini

   ############
   # Metadata #
   ############
   [composite:metadata]
   use = egg:Paste#urlmap
   /: meta

   [pipeline:meta]
   pipeline = cors ec2faultwrap logrequest metaapp
