param location string = 'East US'
param vmName string = 'myvm'
param lbName string = 'mylb'
param adminUsername string = 'adminuser'
param adminPassword string

resource vnet 'Microsoft.Network/virtualNetworks@2021-05-01' = {
  name: '${vmName}-vnet'
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: ['10.0.0.0/16']
    }
    subnets: [
      {
        name: 'subnet1'
        properties: {
          addressPrefix: '10.0.0.0/24'
        }
      }
    ]
  }
}

resource publicIP 'Microsoft.Network/publicIPAddresses@2021-05-01' = {
  name: '${vmName}-pip'
  location: location
  properties: {
    publicIPAllocationMethod: 'Dynamic'
  }
}

resource lb 'Microsoft.Network/loadBalancers@2021-05-01' = {
  name: lbName
  location: location
  properties: {
    frontendIPConfigurations: [
      {
        name: 'LoadBalancerFrontEnd'
        properties: {
          publicIPAddress: publicIP
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
          protocol: 'Tcp'
          port: 80
        }
      }
    ]
    loadBalancingRules: [
      {
        name: 'HttpRule1'
        properties: {
          frontendIPConfiguration: {
            id: lb.properties.frontendIPConfigurations[0].id
          }
          backendAddressPool: {
            id: lb.properties.backendAddressPools[0].id
          }
          probe: {
            id: lb.properties.probes[0].id
          }
          protocol: 'Tcp'
          frontendPort: 80
          backendPort: 80
        }
      }
      {
        name: 'HttpRule2'
        properties: {
          frontendIPConfiguration: {
            id: lb.properties.frontendIPConfigurations[0].id
          }
          backendAddressPool: {
            id: lb.properties.backendAddressPools[0].id
          }
          probe: {
            id: lb.properties.probes[0].id
          }
          protocol: 'Tcp'
          frontendPort: 81
          backendPort: 80
        }
      }
    ]
  }
}

resource vm 'Microsoft.Compute/virtualMachines@2022-03-01' = {
  name: vmName
  location: location
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
        publisher: 'Canonical'
        offer: 'UbuntuServer'
        sku: '20.04-LTS'
        version: 'latest'
      }
      osDisk: {
        createOption: 'FromImage'
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
