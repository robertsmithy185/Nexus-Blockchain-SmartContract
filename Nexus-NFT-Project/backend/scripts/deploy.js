require("dotenv").config();
const hre = require("hardhat");

async function main() {
  console.log("Deploying OrionNFT...");

  // Pastikan kita menggunakan provider yang sesuai
  const [deployer] = await hre.ethers.getSigners();
  console.log("Deploying contract with the account:", deployer.address);

  const OrionNFT = await hre.ethers.getContractFactory("OrionNFT");
  const orionNFT = await OrionNFT.deploy();

  await orionNFT.deployed();
  console.log("OrionNFT deployed to:", orionNFT.address);

  // Tunggu hingga transaksi benar-benar masuk ke blockchain
  await orionNFT.deployTransaction.wait(1);
  console.log("Deployment confirmed on the blockchain!");
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error("Deployment failed:", error);
    process.exit(1);
  });
