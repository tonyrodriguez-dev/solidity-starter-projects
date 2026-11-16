// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

contract Bank {

    mapping(address => uint256) public balances;                 // one line per customer

    event Deposit(address customer, uint256 amount);
    event Withdrawal(address customer, uint256 amount);

    modifier hasBalance(uint256 n_) {                            // can the caller cover this amount?
        if (balances[msg.sender] < n_) revert();
        _;
    }

    function deposit() public payable {
        balances[msg.sender] = balances[msg.sender] + msg.value;
        emit Deposit(msg.sender, msg.value);                     // ETH arrives with the call
    }

    function withdraw(uint256 n_) public hasBalance(n_) {
        balances[msg.sender] = balances[msg.sender] - n_;        // update first...
        emit Withdrawal(msg.sender, n_);                         // amount requested by the caller
        (bool ok, ) = msg.sender.call{value: n_}("");            // ...then send the ETH
        require(ok, "Transfer failed");
    }
}
