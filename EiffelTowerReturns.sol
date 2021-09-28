pragma solidity >=0.5.0 <0.9.0;

/*  
  @title Fractional-NFT with Royalty distribution system
  Note: The ERC-165 identifier for this interface is 0xdb453760;
*/
interface WNDR /* is ERC20, ERC165 */{
  
  /**
    @dev 'RoyaltySent' MUST emit when royalty is given.
    The '_sender' argument MUST be the address of the account sending(giving) royalty to token owners.
    The '_value' argument MUST be the value(amount) of ether '_sender' is sending to the token owners.
  **/
  event RoyaltySent(address indexed _sender, uint256 _value);

  /**
    @dev 'RoyaltyWithdrawn' MUST emit when royalties are withdrawn.
    The '_withdrawer' argument MUST be the address of the account withdrawing royalty of his portion.
    The '_value' argument MUST be the value(amount) of ether '_withdrawer' is withdrawing.
  **/
  event RoyaltyWithdrawn(address indexed _withdrawer, uint256 _value);  

  /**
    This function is to get the NFT Token information this FNFT token is pointing to.
    The '_nftToken' return value should return contract address this FNFT is pointing to (representing).
    The '_nftTokenId' return value should return token Id of NFT token this FNFT is pointing to (representing)
  **/
  function targetNFT() external view returns(address _nftToken, uint256 _nftTokenId);
                                
  /**
    This function is for sending royalty to token owners.
  **/
  function sendRoyalty() external payable;
                                
  /**
    This function is for withdrawing the amount of royalty received.
    Only called by the owner of tokens.
    Or addresses that used to own this token.
  **/
  function withdrawRoyalty() external;
}

pragma solidity >=0.7.0 <0.9.0;

import './FNFT.sol';
import './ERC721.sol';

contract CheckFNFT {
  function checkFNFT(address _FNFT) external view returns(bool) {
     address _NFT;
     uint256 _tokenId;                           
     (NFT, tokenId) = FNFT(_FNFT).targetNFT(); // returns address of NFT contract
     
     return
       NFT(_NFT).supportsInterface(0x80ac58cd) &&// check if it is ERC-721
       NFT(_NFT).ownerOf(_tokenId) == _FNFT; // check if the owner of NFT is FNFT contract address
  }                              
}    