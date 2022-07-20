// scripts/prepare_upgrade.js
async function main() {
  const proxyAddress = '0x69cBfe7D5156F4017403942c5B2D86DCD628fA68';

  // const BoxV2 = await ethers.getContractFactory("BoxV2");
  // console.log("Preparing upgrade...");
  // const boxV2Address = await upgrades.prepareUpgrade(proxyAddress, BoxV2);
  // console.log("BoxV2 at:", boxV2Address);

  // const BoxV3 = await ethers.getContractFactory("BoxV3");
  // console.log("Preparing upgrade...");
  // const boxV3Address = await upgrades.prepareUpgrade(proxyAddress, BoxV3);
  // console.log("BoxV3 at:", boxV3Address);

  const BoxV4 = await ethers.getContractFactory("BoxV4");
  console.log("Preparing upgrade...");
  const boxV4Address = await upgrades.prepareUpgrade(proxyAddress, BoxV4);
  console.log("BoxV4 at:", boxV4Address);

}

main()
  .then(() => process.exit(0))
  .catch(error => {
    console.error(error);
    process.exit(1);
  });



