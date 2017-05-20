var HoneyPot = artifacts.require("./HoneyPot.sol");
var HoneyPotCollect = artifacts.require("./HoneyPotCollect.sol");

module.exports = function(deployer) {
  deployer.deploy(HoneyPotCollect, HoneyPot.address)
};
