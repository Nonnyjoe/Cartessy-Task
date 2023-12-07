// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console2} from "forge-std/Script.sol";
import "../src/erc1155.sol";

contract DressUpScript is Script {
    DressUp _dressUp;
    function setUp() public {}

    function run() public {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployerPrivateKey);
        _dressUp = new DressUp(address(0xA771E1625DD4FAa2Ff0a41FA119Eb9644c9A46C8), 1, 2, 3, 4, 5, 6);
        vm.stopBroadcast();
    }
}
