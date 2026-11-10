// Licencia
// SPDX-License-Identifier: LGPL-3.0-only

// Version solidity
pragma solidity 0.8.24;

// Contrato
contract Sender {

    address public owner;  // Default: address(0) 0x0000000

    constructor() {
        owner = msg.sender;

    }






}
