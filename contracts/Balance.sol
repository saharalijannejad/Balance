// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;


contract Balance {
    function getContractBalance(address contractAddress) public view returns(uint){
        return contractAddress.balance;
    }

   // New Function -> currentContractBalance
    function currentContractBalance() public view returns (uint) {
        return address(this).balance; // returns the balance of the contract itself using the `balance` and `this` keywords.
    }

    receive() external payable {}
}