// hardhat.config.js
const { alchemyApiKey, mnemonic, ETHERSCAN_API_KEY } = require('./secrets.json');
require("@nomiclabs/hardhat-ethers");
require('@openzeppelin/hardhat-upgrades');
require("@nomiclabs/hardhat-etherscan");

/**
 * @type import('hardhat/config').HardhatUserConfig
 */
module.exports = {
  solidity: "0.8.15",
  networks: {
    rinkeby: {
      url: `https://eth-rinkeby.alchemyapi.io/v2/${alchemyApiKey}`,
      accounts: { mnemonic: mnemonic },
      gas: 2100000,
      gasPrice: 8000000000
    }
  }, etherscan: {
    apiKey: ETHERSCAN_API_KEY,
  },
};

