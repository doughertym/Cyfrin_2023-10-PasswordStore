// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

import "openzeppelin-contracts/contracts/access/Ownable.sol";

/*
 * @author not-so-secure-dev
 * @title PasswordStore
 * @notice This contract allows you to store a private password that others won't be able to see. 
 * You can update your password at any time.
 */
contract PasswordStore is Ownable {
    error PasswordStore__NotOwner();

    address private s_owner;
    string private s_password;

    event SetNetPassword();

    /*
     * @notice This function allows only the owner to set a new password.
     * @param newPassword The new password to set.
     */
    function setPassword(string memory newPassword) external onlyOwner {
        s_password = newPassword;
        emit SetNetPassword();
    }

    /*
     * @notice This allows only the owner to retrieve the password.
     * @param newPassword The new password to set.
     */
    function getPassword() external view onlyOwner returns (string memory)  {
        return s_password;
    }
}
