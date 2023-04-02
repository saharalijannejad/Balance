
const Balance = artifacts.require("Balance");

contract("Balance", accounts => {
  let balanceInstance;

  beforeEach(async () => {
    balanceInstance = await Balance.deployed();
  });

  it("should return contract balance", async () => {
    const address = balanceInstance.address;

    const web3 = new Web3(web3.currentProvider);
    const balance = await web3.eth.getBalance(address);

    assert.equal(await balanceInstance.getContractBalance.call(address), balance);
  });

  it("should return current contract balance", async () => {
    const currentBalance = await balanceInstance.currentContractBalance.call();

    const web3 = new Web3(web3.currentProvider);
    const balance = await web3.eth.getBalance(balanceInstance.address);

    assert.equal(currentBalance, balance);
  });
});
