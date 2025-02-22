const hre = require("hardhat");

async function main() {
  const MyContract = await hre.ethers.getContractFactory("MyContract");
  const myContract = await MyContract.deploy("Hello Nexus!");

  await myContract.waitForDeployment(); // Menggantikan .deployed()

  console.log(`Contract deployed at: ${await myContract.getAddress()}`); // Gunakan getAddress()
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
