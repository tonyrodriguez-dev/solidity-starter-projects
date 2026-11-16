// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

contract Vault {

    uint256 public coins = 0;
    address public admin;

    constructor(address admin_) {                                // runs once, at deployment
        admin = admin_;
    }

    event CoinsStored(uint256 stored, uint256 total);

    modifier onlyAdmin() {                                       // who is calling?
        if (msg.sender != admin) revert();
        _;
    }

    modifier maxFifty(uint256 n_) {                              // checks the total, not just the input
        if (coins + n_ > 50) revert();
        _;
    }

    function store(uint256 n_) public onlyAdmin() maxFifty(n_) {
        coins = coins + n_;
        emit CoinsStored(n_, coins);
    }
}
