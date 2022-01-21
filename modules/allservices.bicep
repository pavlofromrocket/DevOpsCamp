param virtualMachines_DevOps_test_vm0_name string = 'DevOps-test-vm0'
param virtualMachines_DevOps_test_vm1_name string = 'DevOps-test-vm1'
param virtualMachines_DevOps_test_vm2_name string = 'DevOps-test-vm2'
param virtualNetworks_DevOps_test_vnet0_name string = 'DevOps-test-vnet0'
param virtualNetworks_DevOps_test_vnet1_name string = 'DevOps-test-vnet1'
param virtualNetworks_DevOps_test_vnet2_name string = 'DevOps-test-vnet2'
param networkInterfaces_DevOps_test_nic0_name string = 'DevOps-test-nic0'
param networkInterfaces_DevOps_test_nic1_name string = 'DevOps-test-nic1'
param networkInterfaces_DevOps_test_nic2_name string = 'DevOps-test-nic2'
param publicIPAddresses_DevOps_test_pip0_name string = 'DevOps-test-pip0'
param publicIPAddresses_DevOps_test_pip1_name string = 'DevOps-test-pip1'
param publicIPAddresses_DevOps_test_pip2_name string = 'DevOps-test-pip2'
param networkSecurityGroups_DevOps_test_nsg0_name string = 'DevOps-test-nsg0'
param networkSecurityGroups_DevOps_test_nsg1_name string = 'DevOps-test-nsg1'
param networkSecurityGroups_DevOps_test_nsg2_name string = 'DevOps-test-nsg2'
param adminUsername string = 'Azureadmin'

@description('Password for the Virtual Machine.')
@minLength(12)
@secure()
param adminPassword string 

resource networkSecurityGroups_DevOps_test_nsg0_name_resource 'Microsoft.Network/networkSecurityGroups@2020-11-01' = {
  name: networkSecurityGroups_DevOps_test_nsg0_name
  location: 'eastus'
  properties: {
    securityRules: [
      {
        name: 'default-allow-rdp'
        properties: {
          protocol: 'Tcp'
          sourcePortRange: '*'
          destinationPortRange: '3389'
          sourceAddressPrefix: '*'
          destinationAddressPrefix: '*'
          access: 'Allow'
          priority: 1000
          direction: 'Inbound'
          sourcePortRanges: []
          destinationPortRanges: []
          sourceAddressPrefixes: []
          destinationAddressPrefixes: []
        }
      }
    ]
  }
}

resource networkSecurityGroups_DevOps_test_nsg1_name_resource 'Microsoft.Network/networkSecurityGroups@2020-11-01' = {
  name: networkSecurityGroups_DevOps_test_nsg1_name
  location: 'eastus'
  properties: {
    securityRules: [
      {
        name: 'default-allow-rdp'
        properties: {
          protocol: 'Tcp'
          sourcePortRange: '*'
          destinationPortRange: '3389'
          sourceAddressPrefix: '*'
          destinationAddressPrefix: '*'
          access: 'Allow'
          priority: 1000
          direction: 'Inbound'
          sourcePortRanges: []
          destinationPortRanges: []
          sourceAddressPrefixes: []
          destinationAddressPrefixes: []
        }
      }
    ]
  }
}

resource networkSecurityGroups_DevOps_test_nsg2_name_resource 'Microsoft.Network/networkSecurityGroups@2020-11-01' = {
  name: networkSecurityGroups_DevOps_test_nsg2_name
  location: 'westus'
  properties: {
    securityRules: [
      {
        name: 'default-allow-rdp'
        properties: {
          protocol: 'Tcp'
          sourcePortRange: '*'
          destinationPortRange: '3389'
          sourceAddressPrefix: '*'
          destinationAddressPrefix: '*'
          access: 'Allow'
          priority: 1000
          direction: 'Inbound'
          sourcePortRanges: []
          destinationPortRanges: []
          sourceAddressPrefixes: []
          destinationAddressPrefixes: []
        }
      }
    ]
  }
}

resource publicIPAddresses_DevOps_test_pip0_name_resource 'Microsoft.Network/publicIPAddresses@2020-11-01' = {
  name: publicIPAddresses_DevOps_test_pip0_name
  location: 'eastus'
  sku: {
    name: 'Basic'
    tier: 'Regional'
  }
  properties: {
    ipAddress: '20.185.81.140'
    publicIPAddressVersion: 'IPv4'
    publicIPAllocationMethod: 'Dynamic'
    idleTimeoutInMinutes: 4
    ipTags: []
  }
}

resource publicIPAddresses_DevOps_test_pip1_name_resource 'Microsoft.Network/publicIPAddresses@2020-11-01' = {
  name: publicIPAddresses_DevOps_test_pip1_name
  location: 'eastus'
  sku: {
    name: 'Basic'
    tier: 'Regional'
  }
  properties: {
    ipAddress: '13.92.92.147'
    publicIPAddressVersion: 'IPv4'
    publicIPAllocationMethod: 'Dynamic'
    idleTimeoutInMinutes: 4
    ipTags: []
  }
}

resource publicIPAddresses_DevOps_test_pip2_name_resource 'Microsoft.Network/publicIPAddresses@2020-11-01' = {
  name: publicIPAddresses_DevOps_test_pip2_name
  location: 'westus'
  sku: {
    name: 'Basic'
    tier: 'Regional'
  }
  properties: {
    ipAddress: '104.42.173.172'
    publicIPAddressVersion: 'IPv4'
    publicIPAllocationMethod: 'Dynamic'
    idleTimeoutInMinutes: 4
    ipTags: []
  }
}

resource virtualMachines_DevOps_test_vm0_name_resource 'Microsoft.Compute/virtualMachines@2021-07-01' = {
  name: virtualMachines_DevOps_test_vm0_name
  location: 'eastus'
  properties: {
    hardwareProfile: {
      vmSize: 'Standard_D2s_v3'
    }
    storageProfile: {
      imageReference: {
        publisher: 'MicrosoftWindowsServer'
        offer: 'WindowsServer'
        sku: '2019-Datacenter'
        version: 'latest'
      }
      osDisk: {
        createOption: 'FromImage'
        managedDisk: {
          storageAccountType: 'StandardSSD_LRS'
        }
      }
      dataDisks: []
    }
    osProfile: {
      computerName: virtualMachines_DevOps_test_vm0_name
      adminUsername: adminUsername
      adminPassword: adminPassword
      windowsConfiguration: {
        provisionVMAgent: true
        enableAutomaticUpdates: true
        patchSettings: {
          patchMode: 'AutomaticByOS'
          assessmentMode: 'ImageDefault'
        }
      }
      secrets: []
      allowExtensionOperations: true
    }
    networkProfile: {
      networkInterfaces: [
        {
          id: networkInterfaces_DevOps_test_nic0_name_resource.id
          properties: {
            primary: true
          }
        }
      ]
    }
  }
}

resource virtualMachines_DevOps_test_vm1_name_resource 'Microsoft.Compute/virtualMachines@2021-07-01' = {
  name: virtualMachines_DevOps_test_vm1_name
  location: 'eastus'
  properties: {
    hardwareProfile: {
      vmSize: 'Standard_D2s_v3'
    }
    storageProfile: {
      imageReference: {
        publisher: 'MicrosoftWindowsServer'
        offer: 'WindowsServer'
        sku: '2019-Datacenter'
        version: 'latest'
      }
      osDisk: {
        createOption: 'FromImage'
      }
      dataDisks: []
    }
    osProfile: {
      computerName: virtualMachines_DevOps_test_vm1_name
      adminUsername: adminUsername
      adminPassword: adminPassword
      windowsConfiguration: {
        provisionVMAgent: true
        enableAutomaticUpdates: true
        patchSettings: {
          patchMode: 'AutomaticByOS'
          assessmentMode: 'ImageDefault'
        }
      }
      secrets: []
      allowExtensionOperations: true
    }
    networkProfile: {
      networkInterfaces: [
        {
          id: networkInterfaces_DevOps_test_nic1_name_resource.id
          properties: {
            primary: true
          }
        }
      ]
    }
  }
}

resource virtualMachines_DevOps_test_vm2_name_resource 'Microsoft.Compute/virtualMachines@2021-07-01' = {
  name: virtualMachines_DevOps_test_vm2_name
  location: 'westus'
  properties: {
    hardwareProfile: {
      vmSize: 'Standard_D2s_v3'
    }
    storageProfile: {
      imageReference: {
        publisher: 'MicrosoftWindowsServer'
        offer: 'WindowsServer'
        sku: '2019-Datacenter'
        version: 'latest'
      }
      osDisk: {
        createOption: 'FromImage'
        managedDisk: {
          storageAccountType: 'StandardSSD_LRS'
        }
      }
      dataDisks: []
    }
    osProfile: {
      computerName: virtualMachines_DevOps_test_vm2_name
      adminUsername: adminUsername
      adminPassword: adminPassword
      windowsConfiguration: {
        provisionVMAgent: true
        enableAutomaticUpdates: true
        patchSettings: {
          patchMode: 'AutomaticByOS'
          assessmentMode: 'ImageDefault'
        }
      }
      secrets: []
      allowExtensionOperations: true
    }
    networkProfile: {
      networkInterfaces: [
        {
          id: networkInterfaces_DevOps_test_nic2_name_resource.id
          properties: {
            primary: true
          }
        }
      ]
    }
  }
}

resource virtualMachines_DevOps_test_vm0_name_AzureNetworkWatcherExtension 'Microsoft.Compute/virtualMachines/extensions@2021-07-01' = {
  parent: virtualMachines_DevOps_test_vm0_name_resource
  name: 'AzureNetworkWatcherExtension'
  location: 'eastus'
  properties: {
    autoUpgradeMinorVersion: true
    publisher: 'Microsoft.Azure.NetworkWatcher'
    type: 'NetworkWatcherAgentWindows'
    typeHandlerVersion: '1.4'
  }
}

resource virtualMachines_DevOps_test_vm0_name_enablevmaccess 'Microsoft.Compute/virtualMachines/extensions@2021-07-01' = {
  parent: virtualMachines_DevOps_test_vm0_name_resource
  name: 'enablevmaccess'
  location: 'eastus'
  properties: {
    autoUpgradeMinorVersion: true
    publisher: 'Microsoft.Compute'
    type: 'VMAccessAgent'
    typeHandlerVersion: '2.0'
    settings: {}
    protectedSettings: {}
  }
}

resource virtualMachines_DevOps_test_vm1_name_enablevmaccess 'Microsoft.Compute/virtualMachines/extensions@2021-07-01' = {
  parent: virtualMachines_DevOps_test_vm1_name_resource
  name: 'enablevmaccess'
  location: 'eastus'
  properties: {
    autoUpgradeMinorVersion: true
    publisher: 'Microsoft.Compute'
    type: 'VMAccessAgent'
    typeHandlerVersion: '2.0'
    settings: {}
    protectedSettings: {}
  }
}

resource networkSecurityGroups_DevOps_test_nsg0_name_default_allow_rdp 'Microsoft.Network/networkSecurityGroups/securityRules@2020-11-01' = {
  parent: networkSecurityGroups_DevOps_test_nsg0_name_resource
  name: 'default-allow-rdp'
  properties: {
    protocol: 'Tcp'
    sourcePortRange: '*'
    destinationPortRange: '3389'
    sourceAddressPrefix: '*'
    destinationAddressPrefix: '*'
    access: 'Allow'
    priority: 1000
    direction: 'Inbound'
    sourcePortRanges: []
    destinationPortRanges: []
    sourceAddressPrefixes: []
    destinationAddressPrefixes: []
  }
}

resource networkSecurityGroups_DevOps_test_nsg1_name_default_allow_rdp 'Microsoft.Network/networkSecurityGroups/securityRules@2020-11-01' = {
  parent: networkSecurityGroups_DevOps_test_nsg1_name_resource
  name: 'default-allow-rdp'
  properties: {
    protocol: 'Tcp'
    sourcePortRange: '*'
    destinationPortRange: '3389'
    sourceAddressPrefix: '*'
    destinationAddressPrefix: '*'
    access: 'Allow'
    priority: 1000
    direction: 'Inbound'
    sourcePortRanges: []
    destinationPortRanges: []
    sourceAddressPrefixes: []
    destinationAddressPrefixes: []
  }
}

resource networkSecurityGroups_DevOps_test_nsg2_name_default_allow_rdp 'Microsoft.Network/networkSecurityGroups/securityRules@2020-11-01' = {
  parent: networkSecurityGroups_DevOps_test_nsg2_name_resource
  name: 'default-allow-rdp'
  properties: {
    protocol: 'Tcp'
    sourcePortRange: '*'
    destinationPortRange: '3389'
    sourceAddressPrefix: '*'
    destinationAddressPrefix: '*'
    access: 'Allow'
    priority: 1000
    direction: 'Inbound'
    sourcePortRanges: []
    destinationPortRanges: []
    sourceAddressPrefixes: []
    destinationAddressPrefixes: []
  }
}

resource virtualNetworks_DevOps_test_vnet0_name_subnet0 'Microsoft.Network/virtualNetworks/subnets@2020-11-01' = {
  name: '${virtualNetworks_DevOps_test_vnet0_name}/subnet0'
  properties: {
    addressPrefix: '10.50.0.0/24'
    delegations: []
    privateEndpointNetworkPolicies: 'Enabled'
    privateLinkServiceNetworkPolicies: 'Enabled'
  }
  dependsOn: [
    virtualNetworks_DevOps_test_vnet0_name_resource
  ]
}

resource virtualNetworks_DevOps_test_vnet1_name_subnet0 'Microsoft.Network/virtualNetworks/subnets@2020-11-01' = {
  name: '${virtualNetworks_DevOps_test_vnet1_name}/subnet0'
  properties: {
    addressPrefix: '10.51.0.0/24'
    delegations: []
    privateEndpointNetworkPolicies: 'Enabled'
    privateLinkServiceNetworkPolicies: 'Enabled'
  }
  dependsOn: [
    virtualNetworks_DevOps_test_vnet1_name_resource
  ]
}

resource virtualNetworks_DevOps_test_vnet2_name_subnet0 'Microsoft.Network/virtualNetworks/subnets@2020-11-01' = {
  name: '${virtualNetworks_DevOps_test_vnet2_name}/subnet0'
  properties: {
    addressPrefix: '10.52.0.0/24'
    delegations: []
    privateEndpointNetworkPolicies: 'Enabled'
    privateLinkServiceNetworkPolicies: 'Enabled'
  }
  dependsOn: [
    virtualNetworks_DevOps_test_vnet2_name_resource
  ]
}

resource virtualNetworks_DevOps_test_vnet0_name_resource 'Microsoft.Network/virtualNetworks@2020-11-01' = {
  name: virtualNetworks_DevOps_test_vnet0_name
  location: 'eastus'
  properties: {
    addressSpace: {
      addressPrefixes: [
        '10.50.0.0/22'
      ]
    }
    subnets: [
      {
        name: 'subnet0'
        properties: {
          addressPrefix: '10.50.0.0/24'
          delegations: []
          privateEndpointNetworkPolicies: 'Enabled'
          privateLinkServiceNetworkPolicies: 'Enabled'
        }
      }
    ]
    virtualNetworkPeerings: [
      {
        name: '${virtualNetworks_DevOps_test_vnet0_name}_to_DevOps-test-vnet1'
        properties: {
          peeringState: 'Connected'
          remoteVirtualNetwork: {
            id: virtualNetworks_DevOps_test_vnet1_name_resource.id
          }
          allowVirtualNetworkAccess: true
          allowForwardedTraffic: false
          allowGatewayTransit: false
          useRemoteGateways: false
          remoteAddressSpace: {
            addressPrefixes: [
              '10.51.0.0/22'
            ]
          }
        }
      }
      {
        name: '${virtualNetworks_DevOps_test_vnet0_name}_to_DevOps-test-vnet2'
        properties: {
          peeringState: 'Connected'
          remoteVirtualNetwork: {
            id: virtualNetworks_DevOps_test_vnet2_name_resource.id
          }
          allowVirtualNetworkAccess: true
          allowForwardedTraffic: false
          allowGatewayTransit: false
          useRemoteGateways: false
          remoteAddressSpace: {
            addressPrefixes: [
              '10.52.0.0/22'
            ]
          }
        }
      }
    ]
    enableDdosProtection: false
  }
}

resource virtualNetworks_DevOps_test_vnet1_name_resource 'Microsoft.Network/virtualNetworks@2020-11-01' = {
  name: virtualNetworks_DevOps_test_vnet1_name
  location: 'eastus'
  properties: {
    addressSpace: {
      addressPrefixes: [
        '10.51.0.0/22'
      ]
    }
    subnets: [
      {
        name: 'subnet0'
        properties: {
          addressPrefix: '10.51.0.0/24'
          delegations: []
          privateEndpointNetworkPolicies: 'Enabled'
          privateLinkServiceNetworkPolicies: 'Enabled'
        }
      }
    ]
    virtualNetworkPeerings: [
      {
        name: '${virtualNetworks_DevOps_test_vnet1_name}_to_DevOps-test-vnet0'
        properties: {
          peeringState: 'Connected'
          allowVirtualNetworkAccess: true
          allowForwardedTraffic: false
          allowGatewayTransit: false
          useRemoteGateways: false
          remoteAddressSpace: {
            addressPrefixes: [
              '10.50.0.0/22'
            ]
          }
        }
      }
      {
        name: '${virtualNetworks_DevOps_test_vnet1_name}_to_DevOps-test-vnet2'
        properties: {
          peeringState: 'Connected'
          remoteVirtualNetwork: {
            id: virtualNetworks_DevOps_test_vnet2_name_resource.id
          }
          allowVirtualNetworkAccess: true
          allowForwardedTraffic: false
          allowGatewayTransit: false
          useRemoteGateways: false
          remoteAddressSpace: {
            addressPrefixes: [
              '10.52.0.0/22'
            ]
          }
        }
      }
    ]
    enableDdosProtection: false
  }
}

resource virtualNetworks_DevOps_test_vnet2_name_resource 'Microsoft.Network/virtualNetworks@2020-11-01' = {
  name: virtualNetworks_DevOps_test_vnet2_name
  location: 'westus'
  properties: {
    addressSpace: {
      addressPrefixes: [
        '10.52.0.0/22'
      ]
    }
    subnets: [
      {
        name: 'subnet0'
        properties: {
          addressPrefix: '10.52.0.0/24'
          delegations: []
          privateEndpointNetworkPolicies: 'Enabled'
          privateLinkServiceNetworkPolicies: 'Enabled'
        }
      }
    ]
    virtualNetworkPeerings: [
      {
        name: '${virtualNetworks_DevOps_test_vnet2_name}_to_DevOps-test-vnet0'
        properties: {
          peeringState: 'Connected'
          allowVirtualNetworkAccess: true
          allowForwardedTraffic: false
          allowGatewayTransit: false
          useRemoteGateways: false
          remoteAddressSpace: {
            addressPrefixes: [
              '10.50.0.0/22'
            ]
          }
        }
      }
      {
        name: '${virtualNetworks_DevOps_test_vnet2_name}_to_DevOps-test-vnet1'
        properties: {
          peeringState: 'Connected'
          allowVirtualNetworkAccess: true
          allowForwardedTraffic: false
          allowGatewayTransit: false
          useRemoteGateways: false
          remoteAddressSpace: {
            addressPrefixes: [
              '10.51.0.0/22'
            ]
          }
        }
      }
    ]
    enableDdosProtection: false
  }
}

resource virtualNetworks_DevOps_test_vnet0_name_virtualNetworks_DevOps_test_vnet0_name_to_DevOps_test_vnet1 'Microsoft.Network/virtualNetworks/virtualNetworkPeerings@2020-11-01' = {
  name: '${virtualNetworks_DevOps_test_vnet0_name}/${virtualNetworks_DevOps_test_vnet0_name}_to_DevOps-test-vnet1'
  properties: {
    peeringState: 'Connected'
    allowVirtualNetworkAccess: true
    allowForwardedTraffic: false
    allowGatewayTransit: false
    useRemoteGateways: false
    remoteVirtualNetwork: {
      id: virtualNetworks_DevOps_test_vnet1_name_resource.id
    }
    remoteAddressSpace: {
      addressPrefixes: [
        '10.51.0.0/22'
      ]
    }
  }
  dependsOn: [
    virtualNetworks_DevOps_test_vnet0_name_resource
  ]
}

resource virtualNetworks_DevOps_test_vnet0_name_virtualNetworks_DevOps_test_vnet0_name_to_DevOps_test_vnet2 'Microsoft.Network/virtualNetworks/virtualNetworkPeerings@2020-11-01' = {
  name: '${virtualNetworks_DevOps_test_vnet0_name}/${virtualNetworks_DevOps_test_vnet0_name}_to_DevOps-test-vnet2'
  properties: {
    peeringState: 'Connected'
    allowVirtualNetworkAccess: true
    allowForwardedTraffic: false
    allowGatewayTransit: false
    useRemoteGateways: false
    remoteVirtualNetwork: {
      id: virtualNetworks_DevOps_test_vnet2_name_resource.id
    }
    remoteAddressSpace: {
      addressPrefixes: [
        '10.52.0.0/22'
      ]
    }
  }
  dependsOn: [
    virtualNetworks_DevOps_test_vnet0_name_resource
  ]
}

resource virtualNetworks_DevOps_test_vnet1_name_virtualNetworks_DevOps_test_vnet1_name_to_DevOps_test_vnet0 'Microsoft.Network/virtualNetworks/virtualNetworkPeerings@2020-11-01' = {
  name: '${virtualNetworks_DevOps_test_vnet1_name}/${virtualNetworks_DevOps_test_vnet1_name}_to_DevOps-test-vnet0'
  properties: {
    peeringState: 'Connected'
    allowVirtualNetworkAccess: true
    allowForwardedTraffic: false
    allowGatewayTransit: false
    useRemoteGateways: false
    remoteVirtualNetwork: {
      id: virtualNetworks_DevOps_test_vnet0_name_resource.id
    }
    remoteAddressSpace: {
      addressPrefixes: [
        '10.50.0.0/22'
      ]
    }
  }
  dependsOn: [
    virtualNetworks_DevOps_test_vnet1_name_resource
  ]
}

resource virtualNetworks_DevOps_test_vnet1_name_virtualNetworks_DevOps_test_vnet1_name_to_DevOps_test_vnet2 'Microsoft.Network/virtualNetworks/virtualNetworkPeerings@2020-11-01' = {
  name: '${virtualNetworks_DevOps_test_vnet1_name}/${virtualNetworks_DevOps_test_vnet1_name}_to_DevOps-test-vnet2'
  properties: {
    peeringState: 'Connected'
    allowVirtualNetworkAccess: true
    allowForwardedTraffic: false
    allowGatewayTransit: false
    useRemoteGateways: false
    remoteVirtualNetwork: {
      id: virtualNetworks_DevOps_test_vnet2_name_resource.id
    }
    remoteAddressSpace: {
      addressPrefixes: [
        '10.52.0.0/22'
      ]
    }
  }
  dependsOn: [
    virtualNetworks_DevOps_test_vnet1_name_resource
  ]
}

resource virtualNetworks_DevOps_test_vnet2_name_virtualNetworks_DevOps_test_vnet2_name_to_DevOps_test_vnet0 'Microsoft.Network/virtualNetworks/virtualNetworkPeerings@2020-11-01' = {
  name: '${virtualNetworks_DevOps_test_vnet2_name}/${virtualNetworks_DevOps_test_vnet2_name}_to_DevOps-test-vnet0'
  properties: {
    peeringState: 'Connected'
    allowVirtualNetworkAccess: true
    allowForwardedTraffic: false
    allowGatewayTransit: false
    useRemoteGateways: false
    remoteVirtualNetwork: {
      id: virtualNetworks_DevOps_test_vnet0_name_resource.id
    }
    remoteAddressSpace: {
      addressPrefixes: [
        '10.50.0.0/22'
      ]
    }
  }
  dependsOn: [
    virtualNetworks_DevOps_test_vnet2_name_resource
  ]
}

resource virtualNetworks_DevOps_test_vnet2_name_virtualNetworks_DevOps_test_vnet2_name_to_DevOps_test_vnet1 'Microsoft.Network/virtualNetworks/virtualNetworkPeerings@2020-11-01' = {
  name: '${virtualNetworks_DevOps_test_vnet2_name}/${virtualNetworks_DevOps_test_vnet2_name}_to_DevOps-test-vnet1'
  properties: {
    peeringState: 'Connected'
    allowVirtualNetworkAccess: true
    allowForwardedTraffic: false
    allowGatewayTransit: false
    useRemoteGateways: false
    remoteVirtualNetwork: {
      id: virtualNetworks_DevOps_test_vnet1_name_resource.id
    }
    remoteAddressSpace: {
      addressPrefixes: [
        '10.51.0.0/22'
      ]
    }
  }
  dependsOn: [
    virtualNetworks_DevOps_test_vnet2_name_resource
  ]
}

resource networkInterfaces_DevOps_test_nic0_name_resource 'Microsoft.Network/networkInterfaces@2020-11-01' = {
  name: networkInterfaces_DevOps_test_nic0_name
  location: 'eastus'
  properties: {
    ipConfigurations: [
      {
        name: 'ipconfig1'
        properties: {
          privateIPAddress: '10.50.0.4'
          privateIPAllocationMethod: 'Dynamic'
          publicIPAddress: {
            id: publicIPAddresses_DevOps_test_pip0_name_resource.id
          }
          subnet: {
            id: virtualNetworks_DevOps_test_vnet0_name_subnet0.id
          }
          primary: true
          privateIPAddressVersion: 'IPv4'
        }
      }
    ]
    dnsSettings: {
      dnsServers: []
    }
    enableAcceleratedNetworking: false
    enableIPForwarding: false
    networkSecurityGroup: {
      id: networkSecurityGroups_DevOps_test_nsg0_name_resource.id
    }
  }
}

resource networkInterfaces_DevOps_test_nic1_name_resource 'Microsoft.Network/networkInterfaces@2020-11-01' = {
  name: networkInterfaces_DevOps_test_nic1_name
  location: 'eastus'
  properties: {
    ipConfigurations: [
      {
        name: 'ipconfig1'
        properties: {
          privateIPAddress: '10.51.0.4'
          privateIPAllocationMethod: 'Dynamic'
          publicIPAddress: {
            id: publicIPAddresses_DevOps_test_pip1_name_resource.id
          }
          subnet: {
            id: virtualNetworks_DevOps_test_vnet1_name_subnet0.id
          }
          primary: true
          privateIPAddressVersion: 'IPv4'
        }
      }
    ]
    dnsSettings: {
      dnsServers: []
    }
    enableAcceleratedNetworking: false
    enableIPForwarding: false
    networkSecurityGroup: {
      id: networkSecurityGroups_DevOps_test_nsg1_name_resource.id
    }
  }
}

resource networkInterfaces_DevOps_test_nic2_name_resource 'Microsoft.Network/networkInterfaces@2020-11-01' = {
  name: networkInterfaces_DevOps_test_nic2_name
  location: 'westus'
  properties: {
    ipConfigurations: [
      {
        name: 'ipconfig1'
        properties: {
          privateIPAddress: '10.52.0.4'
          privateIPAllocationMethod: 'Dynamic'
          publicIPAddress: {
            id: publicIPAddresses_DevOps_test_pip2_name_resource.id
          }
          subnet: {
            id: virtualNetworks_DevOps_test_vnet2_name_subnet0.id
          }
          primary: true
          privateIPAddressVersion: 'IPv4'
        }
      }
    ]
    dnsSettings: {
      dnsServers: []
    }
    enableAcceleratedNetworking: false
    enableIPForwarding: false
    networkSecurityGroup: {
      id: networkSecurityGroups_DevOps_test_nsg2_name_resource.id
    }
  }
}
