// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

contract LivesCounter {

    uint256 public lives = 100;                                  // state: starts at 100

    event LivesLost(uint256 lost, uint256 remaining);            // event template

    modifier notMoreThan(uint256 n_) {                           // reverts if n_ is above 20
        if (n_ > 20) revert();
        _;
    }

    function subtract(uint256 n_) public notMoreThan(n_) {
        lives = lives - n_;                                      // reverts on underflow (Solidity 0.8)
        emit LivesLost(n_, lives);                               // emitted after the state update
    }

    function doubleLives() public view returns (uint256) {            // reads state, does not change it
        return lives * 2;
    }
}
