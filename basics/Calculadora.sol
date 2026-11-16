// Licencia
// SPDX-License-Identifier: LGPL-3.0-only

// Version solidity
pragma solidity 0.8.24;

// Contrato
contract Calculadora {

    // Variables
    uint256 public resultado = 10; // [ 0 - 2^256 - 1 ]

    // Modifiers
    modifier checkNumber(uint256 num1_) {
        if (num1_ != 10) revert();
        _;
    }

    // Events
    event Addition(uint256 number1, uint256 number2, uint256 resultado);
    event Substraction(uint256 number1, uint256 number2, uint256 resultado);

    // External functions
    // palabra (function) + nombre + argumentos + visibilidad + modificadores + valor devuelto
    function addition(uint256 num1_, uint256 num2_) public returns(uint256 resultado_) {
        resultado_ = num1_ + num2_;

        emit Addition(num1_, num2_, resultado_);
    }

    function substraction(uint256 num1_, uint256 num2_) public returns(uint256 resultado_) {
        resultado_ = subtraction_logic(num1_, num2_);

        emit Substraction(num1_, num2_, resultado_);
    }

    function substraction2(int256 num1_, int256 num2_) public pure returns(int256 resultado_) {
        resultado_ = subtraction_logic2(num1_, num2_);
    }

    function multiplier(uint256 num1_) public {
        resultado = resultado * num1_;
    }

    function multiplier2(uint256 num1_) public checkNumber(num1_) {
        resultado = resultado * num1_;
    }

    // Internal functions
    function subtraction_logic(uint256 num1_, uint256 num2_) internal pure returns(uint256 resultado_) {
        resultado_ = num1_ - num2_;
    }

    function subtraction_logic2(int256 num1_, int256 num2_) internal pure returns(int256 resultado_) {
        resultado_ = num1_ - num2_;
    }
}