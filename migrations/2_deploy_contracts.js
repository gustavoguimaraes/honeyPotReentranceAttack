var HoneyPot = artifacts.require("./HoneyPot.sol");
var HoneyPotCollect = artifacts.require("./HoneyPotCollect.sol");

module.exports = function(deployer, networks, accounts) {
  deployer.deploy(HoneyPot).then(() => {
      deployer.deploy(HoneyPotCollect, HoneyPot.address)
  });
};
