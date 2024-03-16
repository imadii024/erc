// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract DegenToken is ERC20, Ownable {

   constructor(address initialOwner) ERC20("token", "t") Ownable(initialOwner) {}

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    function decimals() public pure override returns (uint8) {
        return 18;
    }

    function getBalance() external view returns (uint256) {
        return this.balanceOf(msg.sender);
    }

    function transferTokens(address _rec, uint256 _value) external {
        require(balanceOf(msg.sender) >= _value, "You dont have enough tokens");
        approve(msg.sender, _value);
        transferFrom(msg.sender, _rec, _value);
    }

    function burnTokens(uint _value) external {
        require(
            balanceOf(msg.sender) >= _value,
            "You dont have enough tokens to burn"
        );
        _burn(msg.sender, _value);
    }
}
