targetScope = 'subscription'

resource rg 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: 'DevOps-test-rg'
  location: 'eastus'
}

module allservices 'modules/allservices.bicep'  = {
  scope: rg
  name: 'allservicesdeploy'
  params: {
    adminPassword: 'Azureadmin1234'
  }
}
