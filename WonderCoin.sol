pragma solidity ^0.5.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/token/ERC20/ERC20.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/token/ERC20/ERC20Detailed.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/token/ERC20/ERC20Mintable.sol";

//Contract to create the most epic token ever called WonderCoin to simulate the purchase of Wonders of the World as if it was investable.
//This contract will be used to import into the Sale of WonderCoinSale
//"ERC-20" introduces a standard for Fungible Tokens, in other words, they have a property that makes each Token be exactly the same (in type and value) of another Token
//"ERC20Mintable — A mintable token is a token with a non-fixed total supply, allowing the token issuer to “mint” more tokens whenever they want.
//"ERC20 Detailed" refers to a scripting standard used within the Ethereum blockchain. This technical standard dictates a number of rules and actions that an Ethereum token or smart contract must follow and steps to be able to implement it.
contract WonderCoin is ERC20, ERC20Detailed, ERC20Mintable {
    constructor(
        string memory name,
        string memory symbol,
        uint initial_supply
    )
//Set standards for WonderCoin
        ERC20Detailed(name, symbol, 18)
        public
    {
        // constructor can stay empty
    }
}