// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "lib/openzeppelin-contracts/contracts/token/ERC1155/ERC1155.sol";
import "lib/openzeppelin-contracts/contracts/access/Ownable.sol";

contract DressUp is ERC1155, Ownable {
    uint256 characterToken;
    uint256 shirtToken;
    uint256 shortToken;
    uint256 hatToken;
    uint256 shoeToken;
    uint256 verifiedChampion;
    mapping(address user => uint256 noOfClaims) totalMints;


    modifier TransferRight(uint256 tokenId, address receiver) {
        require(characterToken != tokenId, "Character Token is SoulBound");
        require(verifiedChampion != tokenId, "verifiedChampion Token is SoulBound");
        require(tokenId == shirtToken || tokenId == shoeToken || tokenId == hatToken || tokenId == shortToken, "INVALID TOKEN ID");
        require(balanceOf(receiver, characterToken) == 1, "RECEIVER NOT A CHARACTER TOKEN HOLDER");
        _;
    }

    modifier Mintable(uint256 tokenId, address receiver) {
        if (tokenId == characterToken) {
            require(balanceOf(receiver, characterToken) < 1, "ONE CHARACTER TOKEN PER USER" );
        } else  {
            require(balanceOf(receiver, characterToken) == 1, "RECEIVER NOT A CHARACTER TOKEN HOLDER" );
            require(tokenId != verifiedChampion, "CANNOT MINT VERIFIED CHAMPION TOKEN");
        }
        _;
    }

    constructor(
    address initialOwner,
    uint256 _characterToken,
    uint256 _shirtToken,
    uint256 _shortToken,
    uint256 _hatToken,
    uint256 _shoeToken,
    uint256 _verifiedChampion
    ) ERC1155("") Ownable(initialOwner) {
        characterToken = _characterToken;
        shirtToken = _shirtToken;
        shortToken = _shortToken;
        hatToken = _hatToken;
        shoeToken = _shoeToken;
        verifiedChampion = _verifiedChampion;
    }

    function setURI(string memory newuri) public onlyOwner {
        _setURI(newuri);
    }

    function safeBatchTransferFrom(
        address from,
        address to,
        uint256[] memory ids,
        uint256[] memory values,
        bytes memory data
    ) public override { }

    function safeTransferFrom(address from, address to, uint256 id, uint256 value, bytes memory data) public override TransferRight(id, to) {
        address sender = _msgSender();
        if (from != sender && !isApprovedForAll(from, sender)) {
            revert ERC1155MissingApprovalForAll(sender, from);
        }
        _safeTransferFrom(from, to, id, value, data);
    }


    function mint(address account, uint256 id, bytes memory data)
        public
        Mintable(id, account)
    {
        require(totalMints[account] < 3, "YOU CAN ONLY MINT 3 TIMES!");
        totalMints[account] += 1;
        _mint(account, id, 1, data);
    }


    function isFullyDressed(address account) public view returns (bool) {
    uint256 characterTokenBalance = balanceOf(account, characterToken);
    uint256 shirtTokenBalance = balanceOf(account, shirtToken);
    uint256 shortTokenBalance = balanceOf(account, shortToken);
    uint256 hatTokenBalance = balanceOf(account, hatToken);
    uint256 shoeTokenBalance = balanceOf(account, shoeToken);

    if (characterTokenBalance > 0 &&
        shirtTokenBalance > 0 &&
        shortTokenBalance > 0 &&
        hatTokenBalance > 0 &&
        shoeTokenBalance > 0) {
            return true;
        } else return false;
    }

    function getFullyDresedReward(address account) public {
        if (isFullyDressed(account)) {
            _mint(account, verifiedChampion, 1, '0x01');
        } else {
            revert ("USER NOT FULLY DRESSED");
        }
    }

}
