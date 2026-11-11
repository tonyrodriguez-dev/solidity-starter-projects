// Licencia
// SPDX-License-Identifier: LGPL-3.0-only

// Version solidity
pragma solidity 0.8.24;

// Contrato
contract PayableContractv2 {


    function sendEther() public payable {}

    function withdrawEther(uint256 amount) public {

        // Recipient + call + valor ether + datos
        (bool success,) = msg.sender.call{value: amount}("");
        require(success, "Transfer failed");
    }
}