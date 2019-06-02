var SimpleStorage = artifacts.require("./SimpleBank.sol");

module.exports = function(deployer) {
  deployer.deploy(SimpleBank);
};
