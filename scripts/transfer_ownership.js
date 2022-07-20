// scripts/transfer_ownership.js
async function main() {
    const gnosisSafe = '0x7a96195cE3b927dA324ef7AD21d8AC09B6B0D15F';
   
    console.log("Transferring ownership of ProxyAdmin...");
    // The owner of the ProxyAdmin can upgrade our contracts
    await upgrades.admin.transferProxyAdminOwnership(gnosisSafe);
    console.log("Transferred ownership of ProxyAdmin to:", gnosisSafe);
  }
   
  main()
    .then(() => process.exit(0))
    .catch(error => {
      console.error(error);
      process.exit(1);
    });