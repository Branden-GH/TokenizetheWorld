pragma solidity ^0.5.0;

import "./EiffelTower.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/crowdsale/Crowdsale.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/crowdsale/emission/MintedCrowdsale.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/crowdsale/validation/CappedCrowdsale.sol";


// @TODO: Inherit the crowdsale contracts
contract WonderCoin is Crowdsale, MintedCrowdsale, CappedCrowdsale  {

    constructor(
        address payable wallet,
        WonderCoin token,
        uint goal,
        uint rate,
        uint cap
        
    )
        // @TODO: Pass the constructor parameters to the crowdsale contracts.
        Crowdsale(rate, wallet, token)
        CappedCrowdsale(cap)
        
        public
    {
        // constructor can stay empty
    }
}

//        token.addMinter(token_sale_address);
//        token.renounceMinter();