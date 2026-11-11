// Licencia
// SPDX-License-Identifier: LGPL-3.0-only

// Version solidity
pragma solidity 0.8.24;

// Contrato
contract PayableContract {

    // 1 Ether = 1*10^18 wei
    // palabra (function) + nombre + argumentos + visibilidad + payable? +  modificadores + valor devuelto
    function sendEther() public payable{}
}