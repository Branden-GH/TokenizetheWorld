pragma solidity ^0.5.0;

import "***.token contract***"
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/token/ERC721/ERC721Full.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/drafts/Counters.sol";

contract wonder_investment is ERC721Full {
    
    constructor() ERC721Full("wonder_investment", "WUNDR") public { }
    
    using Counters for Counters.Counter;
    
    Counters.Counter token_ids;
    
    struct Wonder {
        string name;
        string location;
        uint price;
        string _type;
        
        
     
    }
    mapping(uint => Wonder ) public Wonders;
    
    }
    modifier propertyRegistered(uint token_id) {
        require(_exists(token_id), "property not registered!");
        _;
    }

    function registerProperty(string memory uri) public payable onlyOwner {
        token_ids.increment();
        uint token_id = token_ids.current();
        _mint(foundation_address, token_id);//address of owner of property
        _setTokenURI(token_id, uri);
        createCoin(token_id); //calls token for sale of wonder(name of contract, coin name, symbol etc...)
    }