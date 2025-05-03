const { ethers } = require("hardhat");

async function main() {
  const [deployer] = await ethers.getSigners();
  console.log("Deploying contracts with the account:", deployer.address);

  const OrionToken = await ethers.getContractFactory("HyperNova");
  const orion = await OrionToken.deploy(); // Tidak perlu `.deployed()`

  console.log("OrionToken deployed to:", await orion.getAddress()); // Gunakan getAddress() untuk Ethers v6
}

main().catch((error) => {
  console.error("Error during deployment:", error);
  process.exit(1);
});
