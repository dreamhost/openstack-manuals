.. title:: OpenStack Installation Tutorial

.. Don't remove or change title tag manually, which is used by the build tool.

.. only:: rdo

   =======================================================================
   OpenStack Installation Tutorial for Red Hat Enterprise Linux and CentOS
   =======================================================================

.. only:: obs

   ======================================================================
   OpenStack Installation Tutorial for openSUSE and SUSE Linux Enterprise
   ======================================================================

.. only:: ubuntu

   ==========================================
   OpenStack Installation Tutorial for Ubuntu
   ==========================================

.. only:: debian

   ==========================================
   OpenStack Installation Tutorial for Debian
   ==========================================


Abstract
~~~~~~~~

The OpenStack system consists of several key services that are separately
installed. These services work together depending on your cloud
needs. These services include Compute service, Identity service,
Networking service, Image service, Block Storage service, Object Storage
service, Telemetry service, Orchestration service, and Database service. You
can install any of these projects separately and configure them stand-alone
or as connected entities.

.. only:: rdo

   This guide will show you how to install OpenStack by using packages
   available on Red Hat Enterprise Linux 7 and its derivatives through
   the RDO repository.

.. only:: ubuntu

   This guide will walk through an installation by using packages
   available through Canonical's Ubuntu Cloud archive repository.

.. only:: obs

   This guide will show you how to install OpenStack by using packages
   on openSUSE Leap 42.1 and SUSE Linux Enterprise Server 12 SP1
   through the Open Build Service Cloud repository.

.. only:: debian

   This guide walks through an installation by using packages
   available through Debian 8 (code name: Jessie).

   .. note::

      This guide uses installation with debconf set to non-interactive
      mode. That is, there will be no debconf prompt. To configure a computer
      to use this mode, run the following command:

      .. code-block:: console

         # dpkg-reconfigure debconf

      If you prefer to use debconf, refer to the debconf
      install-guide for Debian.

Explanations of configuration options and sample configuration files
are included.

This guide documents OpenStack Newton release.

.. warning::

   This guide is a work-in-progress and is subject to updates frequently.
   Pre-release packages have been used for testing, and some instructions
   may not work with final versions. Please help us make this guide better
   by reporting any errors you encounter.

Contents
~~~~~~~~

.. toctree::
   :maxdepth: 2

   common/conventions.rst
   overview.rst
   environment.rst
   keystone.rst
   glance.rst
   nova.rst
   neutron.rst
   horizon.rst
   cinder.rst
   additional-services.rst
   launch-instance.rst

.. Pseudo only directive for each distribution used by the build tool.
   This pseudo only directive for toctree only works fine with Tox.
   When you directly build this guide with Sphinx,
   some navigation menu may not work properly.
.. Keep this pseudo only directive not to break translation tool chain
   at the openstack-doc-tools repo until it is changed.
.. only:: obs or rdo or ubuntu
.. only:: debian
.. end of contents

Appendix
~~~~~~~~

.. toctree::
   :maxdepth: 1

   common/app-support.rst

Glossary
~~~~~~~~

.. toctree::
   :maxdepth: 1

   common/glossary.rst

Search in this guide
~~~~~~~~~~~~~~~~~~~~

* :ref:`search`
