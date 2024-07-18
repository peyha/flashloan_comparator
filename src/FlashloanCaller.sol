// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "./IMorpho.sol";
import "./IBalancer.sol";
import "./IAave.sol";
import "./IERC20.sol";

contract FlashloanCaller {
    address public immutable MORPHO_BLUE_ADDRESS =
        0xBBBBBbbBBb9cC5e90e3b3Af64bdAF62C37EEFFCb;
    address public immutable BALANCER_VAULT_ADDRESS =
        0xBA12222222228d8Ba445958a75a0704d566BF2C8;
    address public immutable AAVE_V3_POOL_ADDRESS =
        0x87870Bca3F3fD6335C3F4ce8392D69350B4fA4E2;

    function approveContract(address token, address targetAddress) public {
        IERC20(token).approve(targetAddress, type(uint256).max);
    }
    function flashloanBlue(address asset, uint256 amount) public {
        IMorpho morpho = IMorpho(MORPHO_BLUE_ADDRESS);

        morpho.flashLoan(asset, amount, hex"");
    }

    function onMorphoFlashLoan(uint256 amount, bytes memory data) public {}

    function flashloanBalancer(address asset, uint256 amount) public {
        IBalancer balancer = IBalancer(BALANCER_VAULT_ADDRESS);

        address[] memory tokens = new address[](1);
        uint256[] memory amounts = new uint256[](1);
        bytes memory userData = hex"";

        tokens[0] = asset;
        amounts[0] = amount;

        balancer.flashLoan(address(this), tokens, amounts, userData);
    }

    function receiveFlashLoan(
        address[] memory tokens,
        uint256[] memory amounts,
        uint256[] memory feeAmounts,
        bytes memory userData
    ) public {
        IERC20(tokens[0]).transfer(msg.sender, amounts[0]);
    }

    function flashloanAave(address asset, uint256 amount) public {
        IAave aave = IAave(AAVE_V3_POOL_ADDRESS);

        aave.flashLoanSimple(address(this), asset, amount, hex"", 0);
    }

    function executeOperation(
        address asset,
        uint256 amount,
        uint256 premium,
        address initiator,
        bytes calldata params
    ) external returns (bool) {}
}
