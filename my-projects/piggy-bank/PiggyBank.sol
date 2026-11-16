// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

contract PiggyBank {

    address public admin;

    constructor(address admin_) {
        admin = admin_;
    }

    modifier onlyAdmin() {
        if (msg.sender != admin) revert();
        _;
    }

    function deposit() public payable {}                         // payable: accepts ETH

    function withdraw() public onlyAdmin() {                     // only the admin can empty it
        (bool ok, ) = admin.call{value: address(this).balance}("");
        require(ok, "Transfer failed");
    }
}
