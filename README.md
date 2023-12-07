# Dress Up (an ERC-1155 Token Contract)

## Overview

Dress Up is a gamified ERC-1155 token contract that allows users to mint various accessories for their characters. The contract supports six different tokens: Character, Shirt, Short, Shoe, Hat, and Verified Champion. Users can mint each accessory up to three times, and once they have a complete set (Character, Shirt, Short, Shoe, and Hat), they can mint the final token, the Verified Champion.

### Token Details

- **Character Token (ID: 1):** Required for all transactions. SoulBound, cannot be transferred.
- **Shirt Token (ID: 2):** Mintable up to 3 times.
- **Short Token (ID: 3):** Mintable up to 3 times.
- **Shoe Token (ID: 4):** Mintable up to 3 times.
- **Hat Token (ID: 5):** Mintable up to 3 times.
- **Verified Champion Token (ID: 6):** SoulBound, cannot be transferred.

### Contract Address
You can access and interact with a deployed version of DressUp contract here: 
- DressUp contract: [0x2178dDa8024e5db67b3Ff483A82066c8A5788352](https://goerli.etherscan.io/address/0x2178dda8024e5db67b3ff483a82066c8a5788352)
Please Note that this contract is deployed on Goerli and you'll need to switch your network and also have Goerli test tokens to interact with it.

## Functionality

### Minting

- To participate, users need to mint a Character Token first. This is a one-time action and is required for all subsequent transactions.
- After obtaining the Character Token, users can mint Shirt, Short, Shoe, or Hat tokens up to three times.

### Dressing Up

- Users can use multiple wallets to collect different accessory tokens.
- Accessories (Shirt, Short, Shoe, Hat) can be transferred between wallets that own the character token.

### Verified Champion

- Once a user has a complete set of Character, Shirt, Short, Shoe, and Hat tokens, they can mint the Verified Champion Token.
- The Verified Champion Token is the final token and indicates the user has a complete dress.

### Restrictions

- Character and Verified Champion tokens are SoulBound and cannot be transferred.
- Each wallet can mint a maximum of 3 times.

## Usage

1. Mint the Character Token:
   - This is a one-time action and is required for all transactions.
   - It's SoulBound and cannot be transferred.

2. Mint Accessories (Shirt, Short, Shoe, Hat):
   - After obtaining Character Token then 2 other tokens from; Shirt, Short, Shoe, or Hat tokens.
   - Accessories can be transferred between wallets.

3. Mint the Verified Champion Token:
   - Once you have a complete set of Character, Shirt, Short, Shoe, and Hat tokens, mint the Verified Champion Token.
   - It's SoulBound and cannot be transferred.

## Deployment

1. clone the repo by running the command ```git clone https://github.com/Nonnyjoe/Cartessy-Task.git```
2. CD into the folder ```Cartessy-Task``` 
3. On your terminal run the command ```forge install``` to install the required openzeppelin package.
4. Deploy the contract to a Network of your choice then interact with it.

