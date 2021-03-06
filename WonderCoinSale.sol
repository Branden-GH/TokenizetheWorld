pragma solidity ^0.5.0;

import "./WonderCoin.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/crowdsale/Crowdsale.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/crowdsale/emission/MintedCrowdsale.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/crowdsale/validation/CappedCrowdsale.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/crowdsale/validation/TimedCrowdsale.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/crowdsale/distribution/RefundablePostDeliveryCrowdsale.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/token/ERC721/ERC721Full.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/drafts/Counters.sol";

//Imported WonderCoin contract 
//Contract to Create Wonder Sale Token, which then gets minted in EffielNFT contract.
//constructor places requirements of execution.  IE. Payable to wallet, Initialize WonderCoin, Rate, and the Goal to purchase the EiffelNFT
contract WonderCoinSale is Crowdsale, MintedCrowdsale, CappedCrowdsale  {

    constructor(
        address payable wallet,
        WonderCoin token,
        uint rate,
        uint goal
        
    )
        Crowdsale(rate, wallet, token)
        CappedCrowdsale(goal)
        
        public
    {
        // constructor can stay empty
    }
}


  