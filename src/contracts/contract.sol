// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts@4.6.0/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts@4.6.0/token/ERC721/extensions/ERC721URIStorage.sol";

contract EVENTPASS is ERC721, ERC721URIStorage {
    uint256 max_supply = 10;
    uint256 rate_of_pass = 10;
    address owner;
    uint256 ticketId = 1;
    string uri = "";
    uint256 normal_passes=0;
    uint256 special_passes=0;
    constructor() ERC721("EVENTPASS", "EPASS") {
        owner = msg.sender;
    }
    // Issue tickets to users
    function getPass(address to) external payable  {
         require(msg.value >= rate_of_pass, "Sorry Not enough money");
         require(ticketId <= max_supply, "Sorry Tickets sold out");
         payable(owner).transfer(address(this).balance);
         _safeMint(to, ticketId);
         _setTokenURI(ticketId, uri);
         ticketId= ticketId+1;
         normal_passes = normal_passes+1;
    }
    function getSpecialPass(address to) public {
        require(ticketId <= max_supply, "Sorry Tickets sold out");
        _safeMint(to, ticketId);
        _setTokenURI(ticketId, uri);
        ticketId= ticketId+1;
        special_passes=special_passes+1;
    }

    function setMaxSupply(uint256 limit) public {
        require(msg.sender == owner, "Sorry only the Organizer can set Max supply");
        max_supply = limit;
    }
    function setRateOfPass(uint256 rate) public {
        require(msg.sender == owner, "Sorry only the Organizer can set Rate");
        rate_of_pass = rate;
    }
    function setTokenURI(string calldata tok_uri) public {
        require(msg.sender == owner, "Sorry only the Organizer can set URI");
        uri = tok_uri;
    }
    function getRateOfPass() public view returns (uint256){
        return rate_of_pass;
    }
    function getPassLeft() public view returns (uint256){
        return (max_supply + 1 ) - ticketId;
    }
    function getPassIssued() public view returns (uint256){
        return ticketId - 1;
    }
    function getMaxSupply() public view returns (uint256){
        return max_supply;
    }
        function _burn(uint256 tokenId) internal override(ERC721, ERC721URIStorage) {
        super._burn(tokenId);
    }

    function tokenURI(uint256 tokenId)
        public
        view
        override(ERC721, ERC721URIStorage)
        returns (string memory)
    {
        return super.tokenURI(tokenId);
    }
}
