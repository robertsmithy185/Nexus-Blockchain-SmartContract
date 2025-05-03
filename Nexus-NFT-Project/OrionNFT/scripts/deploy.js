const { ethers } = require("hardhat");

async function main() {
  const [deployer] = await ethers.getSigners();
  console.log("Deploying contracts with the account:", deployer.address);

  const OrionNFT = await ethers.getContractFactory("MetaFlux");
  const orionNFT = await OrionNFT.deploy(deployer.address); // Teruskan alamat deployer sebagai initialOwner
  await orionNFT.deployed();

  console.log("OrionNFT deployed to:", orionNFT.address);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
