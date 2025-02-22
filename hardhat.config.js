require("@nomicfoundation/hardhat-toolbox");
require("dotenv").config();

module.exports = {
  solidity: "0.8.28",
  networks: {
    nexus: {
      url: "https://rpc.nexus.xyz/http",
      chainId: 392,
      accounts: process.env.PRIVATE_KEY ? [process.env.PRIVATE_KEY] : [],
    },
  },
  sourcify: {
    enabled: true, // Mengaktifkan verifikasi otomatis Sourcify
  },
  etherscan: {
    apiKey: { nexus: "empty" }, // Ganti dengan API Key jika tersedia
    customChains: [
      {
        network: "nexus",
        chainId: 392,
        urls: {
          apiURL: "https://explorer.nexus.xyz/api",
          browserURL: "https://explorer.nexus.xyz",
        },
      },
    ],
  },
};
