// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.30;

interface IInputBox {
    /// @notice Adds an input to the application's box.
    /// @param appContract The application contract address
    /// @param payload The input payload
    /// @return inputHash The input hash
    function addInput(address appContract, bytes calldata payload)
        external
        returns (bytes32 inputHash);
}

contract SpamBox {
    /// @notice Adds `n` empty inputs onto the application's contract input box.
    /// @param inputBox The input box contract
    /// @param appContract The application contract address
    /// @param n The number of empty inputs to be sent
    function addEmptyInputs(IInputBox inputBox, address appContract, uint256 n)
        external
    {
        for (uint256 i; i < n; ++i) {
            inputBox.addInput(appContract, "");
        }
    }
}
