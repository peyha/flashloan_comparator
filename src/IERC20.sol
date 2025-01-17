// SPDX-License-Identifier: GPL-2.0-or-later
pragma solidity >=0.5.0;

/// @title IERC20
/// @author Morpho Labs
/// @custom:contact security@morpho.org
/// @dev Empty because we only call library functions. It prevents calling transfer (transferFrom) instead of
/// safeTransfer (safeTransferFrom).
interface IERC20 {
    function approve(address spender, uint256 amount) external;

    function transfer(address recipient, uint256 amount) external;

    function decimals() external returns (uint256);
}
