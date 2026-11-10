// Licencia
// SPDX-License-Identifier: LGPL-3.0-only

// Version solidity
pragma solidity 0.8.24;


// Contrato
contract Resultado {

    uint256 public resultado;
    address public admin;
    uint256 public fee;

    constructor(address admin_) {
        admin = admin_;
        fee = 5;
    }

    // palabra (function) + nombre + argumentos + visibilidad + modificadores + valor devuelto
    function setResultado(uint256 num_) external {
        resultado = num_;
    }

    function setFee(uint256 newFee_) external {
        if (tx.origin != admin) revert();
        fee = newFee_;
    }

}