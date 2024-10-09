// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import {DonateCrypto} from "../src/DonateCrypto.sol";

contract DonateCryptoScript is Script {
    DonateCrypto public donateCrypto;

    function setUp() public {}

    function run() public {
        vm.startBroadcast();

        donateCrypto = new DonateCrypto();

        vm.stopBroadcast();
    }
}
