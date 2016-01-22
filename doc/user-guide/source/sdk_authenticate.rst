.. _sdk_authenticate:

==========================================
Overview of authentication in DreamCompute
==========================================

When using the SDK, you must authenticate against DreamCompute's endpoint
before you can use DreamCompute services. Each project uses a slightly
different syntax for authentication.

You must typically authenticate against a specific version of a service.
For example, a client might need to authenticate against Identity v2.0.

Python scripts that use the OpenStack SDK must have access to the
credentials contained in the DreamCompute RC file. Because credentials are
sensitive information, do not include them in your scripts. This guide
assumes that users source the PROJECT-openrc.sh file and access the
credentials by using the environment variables in the Python scripts.

.. toctree::
   :maxdepth: 2

   sdk_authenticate_against_identity_endpoint.rst
   sdk_authenticate_against_image_service_endpoint.rst
   sdk_authenticate_against_compute_endpoint.rst
   sdk_authenticate_against_networking_endpoint.rst

