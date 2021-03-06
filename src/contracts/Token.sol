// SPDX-License-Identifier: MIT
pragma solidity >=0.6.0 <0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract Token is ERC20 {
  address public minter;

  event MinterChanged(address indexed from, address to);

  constructor() public payable ERC20("Decentralized Bank", "Bank") {
    minter = msg.sender;
  }

  function passMinterRole(address dBank) public returns (bool) {
    require(msg.sender == minter, "Error!, Only Minter can pass minter's role");
    minter = dbank;
    emit MinterChanged(msg.sender, dbank);
    return true;
  }
  
  function mint(address account, uint256 amount) public {
    require(msg.sender == minter, "Error!, Only Minter can mint tokens")
		_mint(account, amount);
	}
}