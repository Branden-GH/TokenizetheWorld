pragma solidity ^0.5.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/token/ERC721/ERC721Full.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/ownership/Ownable.sol";
import "./WonderCoinSale.sol";

// Use case for ERC721 is examples like real estate or collectibles, where some items are valued more than others, due to their usefulness, rarity, etc. ERC721 is a standard for representing ownership of non-fungible tokens, that is, where each token is unique.

contract EiffelNFTMint is ERC721Full, Ownable {
// Minted NFT
    constructor() ERC721Full("EiffelNFT", "WNDR") public {}
// Created constructor for name and symbol
    using Counters for Counters.Counter;

    Counters.Counter token_ids;

    address payable foundation_address = msg.sender;
    address public token_sale_address;
    address public token_address;
    string name;
    string symbol;
    address payable wallet;
    uint goal;
    mapping(uint => WonderCoinSale) public Sale;

    modifier landRegistered(uint token_id) {
        require(_exists(token_id), "Land not registered!");
        _;
    }

    function registerLand(string memory uri, string memory name, string memory symbol, address payable wallet, uint goal) public payable onlyOwner {
        token_ids.increment();
        uint token_id = token_ids.current();
        _mint(foundation_address, token_id);  
        _setTokenURI(token_id, uri); 
        createSale(token_id, name, symbol, wallet, goal); 
    }

    function createSale(uint token_id, string memory name, string memory symbol, address payable wallet, uint goal) public onlyOwner {
        
        WonderCoin token = new WonderCoin(name, symbol, 0);
        token_address = address(token);
        WonderCoinSale token_sale = new WonderCoinSale(wallet, token, 1, goal);
        token_sale_address = address(token_sale);
        token.addMinter(token_sale_address);
        token.renounceMinter();
//        Sale[token_id] = new WonderCoinSale(foundation_address);
    }
}   
    
// Assign ownership of NFT to owner.  NFT contract match to front 



  
