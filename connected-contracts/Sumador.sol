// Licencia
// SPDX-License-Identifier: LGPL-3.0-only

// Version solidity
pragma solidity 0.8.24;

import "./interfaces/IResultado.sol";

// Contrato
contract Sumador {

    // Objeto = Interfaz + address
    address public resultado; // 0xadhjfklh34r
    

    constructor(address resultado_) {
        resultado = resultado_;
    }

    // palabra (function) + nombre + argumentos + visibilidad + modificadores + valor devuelto
    function addition(uint256 num1_, uint256 num2_) external {
        uint256 resultado_ = num1_ + num2_;
        IResultado(resultado).setResultado(resultado_);
    }

    function setFee(uint256 newFee_) external {
        IResultado(resultado).setFee(newFee_);

    }

    
}