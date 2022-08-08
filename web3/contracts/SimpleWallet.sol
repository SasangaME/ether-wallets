//SPDX-License-Identifier: MIT

pragma solidity =0.8.9;

contract SimpleWallet {
    address payable public owner;
    mapping(address => uint256) public balances;

    function deposit() external payable {
        balances[msg.sender] += msg.value;
    }

    function withdraw(uint256 _amount) external payable {
        require(
            balances[msg.sender] <= msg.value,
            "amount is larger than deposited"
        );
        balances[msg.sender] -= _amount;
        payable(msg.sender).transfer(_amount);
    }

    function getTotalContractBalance() external view returns (uint256 balance) {
        balance = address(this).balance;
    }

    function checkDeposittedAmount() external view returns (uint256 balance) {
        balance = balances[msg.sender];
    }
}
