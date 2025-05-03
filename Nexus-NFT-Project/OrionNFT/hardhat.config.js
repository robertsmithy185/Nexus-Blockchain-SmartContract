require("@nomiclabs/hardhat-ethers");
require("@nomicfoundation/hardhat-verify");
require("dotenv").config();

module.exports = {
  solidity: "0.8.28", // Gunakan versi terbaru
  networks: {
    nexus: {
      url: "https://nexus-new.rpc.caldera.xyz/http",
      accounts: process.env.PRIVATE_KEY ? [process.env.PRIVATE_KEY] : [],
    },
  },
  etherscan: {
    apiKey: {
      nexus: "empty",
    },
    customChains: [
      {
        network: "nexus",
        chainId: 393,
        urls: {
          apiURL: "https://nexus-new.explorer.caldera.xyz/api",
          browserURL: "https://nexus-new.explorer.caldera.xyz",
        },
      },
    ],
  },
};
