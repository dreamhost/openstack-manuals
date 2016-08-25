Networking Option 2: Self-service networks
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Configure the Networking components on a *compute* node.

Configure the Linux bridge agent
--------------------------------

The Linux bridge agent builds layer-2 (bridging and switching) virtual
networking infrastructure for instances and handles security groups.

* Edit the ``/etc/neutron/plugins/ml2/linuxbridge_agent.ini`` file and
  complete the following actions:

  * In the ``[linux_bridge]`` section, map the provider virtual network to the
    provider physical network interface:

    .. code-block:: ini

       [linux_bridge]
       physical_interface_mappings = provider:PROVIDER_INTERFACE_NAME

    Replace ``PROVIDER_INTERFACE_NAME`` with the name of the underlying
    provider physical network interface. See :ref:`environment-networking`
    for more information.

  * In the ``[vxlan]`` section, enable VXLAN overlay networks, configure the
    IP address of the physical network interface that handles overlay
    networks, and enable layer-2 population:

    .. code-block:: ini

       [vxlan]
       enable_vxlan = True
       local_ip = OVERLAY_INTERFACE_IP_ADDRESS
       l2_population = True

    Replace ``OVERLAY_INTERFACE_IP_ADDRESS`` with the IP address of the
    underlying physical network interface that handles overlay networks. The
    example architecture uses the management interface to tunnel traffic to
    the other nodes. Therefore, replace ``OVERLAY_INTERFACE_IP_ADDRESS`` with
    the management IP address of the compute node. See
    :ref:`environment-networking` for more information.

  * In the ``[securitygroup]`` section, enable security groups and
    configure the Linux bridge :term:`iptables` firewall driver:

    .. code-block:: ini

       [securitygroup]
       ...
       enable_security_group = True
       firewall_driver = neutron.agent.linux.iptables_firewall.IptablesFirewallDriver

Return to
:ref:`Networking compute node configuration <neutron-compute-compute>`.
