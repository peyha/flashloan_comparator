// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {FlashloanCaller} from "../src/FlashloanCaller.sol";
import {IERC20} from "../src/IERC20.sol";

contract FlashloanCallerTest is Test {
    FlashloanCaller public flashloanCaller;
    address public token;
    uint256 public amount;

    function setUp() public {
        flashloanCaller = new FlashloanCaller();

        token = 0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2;
        amount = 1 * 10 ** IERC20(token).decimals();

        flashloanCaller.approveContract(
            token,
            flashloanCaller.MORPHO_BLUE_ADDRESS()
        );
    }

    function test_blue() public {
        flashloanCaller.flashloanBlue(token, amount);
    }

    function test_balancer() public {
        flashloanCaller.flashloanBalancer(token, amount);
    }

    function test_aave() public {
        flashloanCaller.flashloanAave(token, amount);
    }
}
