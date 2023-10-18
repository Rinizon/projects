targetScope = 'subscription'
param location string = 'Central US'
param vmName string = 'myvm'
param lbName string = 'mylb'
param vnetName string = 'myvnet'
param subnetName string = 'mysubnet'
param adminUsername string = 'azadmin'
param adminPassword string = 'P@ssword123!' securestring

resource vnet 'Microsoft.Network/virtualNetworks@2021-03-01' = {
  name: vnetName
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: ['10.0.0.0/16']
    }
    subnets: [
      {
        name: subnetName
        properties: {
          addressPrefix: '10.0.0.0/24'
        }
      }
    ]
  }
}

resource lb 'Microsoft.Network/loadBalancers@2020-12-01' = {
  name: lbName
  location: location
  properties: {
    frontendIPConfigurations: [
      {
        name: 'LoadBalancerFrontEnd'
        properties: {
          publicIPAddress: {
            id: resourceId('Microsoft.Network/publicIPAddresses', 'myPublicIp')
          }
        }
      }
    ]
    backendAddressPools: [
      {
        name: 'BackendAddressPool'
      }
    ]
    probes: [
      {
        name: 'HttpProbe'
        properties: {
          protocol: 'Http'
          port: 80
        }
      }
    ]
    loadBalancingRules: [
      {
        name: 'HttpRule'
        properties: {
          frontendIPConfiguration: {
            id: frontEndIpConfigurationId(lb, 'LoadBalancerFrontEnd')
          }
          backendAddressPool: {
            id: backendAddressPoolId(lb, 'BackendAddressPool')
          }
          probe: {
            id: probeId(lb, 'HttpProbe')
          }
          protocol: 'Tcp'
          frontendPort: 80
          backendPort: 80
        }
      }
    ]
  }
}

resource vm 'Microsoft.Compute/virtualMachines@2022-03-01' = {
  name: vmName
  location: location
  dependsOn: [
    lb
  ]
  properties: {
    hardwareProfile: {
      vmSize: 'Standard_DS2_v2'
    }
    osProfile: {
      computerName: vmName
      adminUsername: adminUsername
      adminPassword: adminPassword
    }
    storageProfile: {
      imageReference: {
        publisher: 'Canonical',
        offer: 'UbuntuServer',
        sku: '22.04-LTS',
        version: 'latest'
      }
      osDisk: {
        createOption: 'FromImage'
        managedDisk: {
          storageAccountType: 'Premium_LRS'
        }
      }
    }
    networkProfile: {
      networkInterfaces: [
        {
          id: resourceId('Microsoft.Network/networkInterfaces', vmName)
        }
      ]
    }
  }
}
