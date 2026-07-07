// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract CheckIn {

    struct UserInfo {
        uint256 lastCheckInDay;
        uint256 totalCheckIns;
    }

    mapping(address => UserInfo) public users;

    event CheckInSuccess(address indexed user, uint256 timestamp, uint256 total);

    /// @notice 打卡函数（MetaMask 直接调用）
    function checkIn() external {
        uint256 today = getDay(block.timestamp);

        UserInfo storage user = users[msg.sender];

        require(user.lastCheckInDay != today, "You have already checked in today");

        user.lastCheckInDay = today;
        user.totalCheckIns += 1;

        emit CheckInSuccess(msg.sender, block.timestamp, user.totalCheckIns);
    }

    /// @notice 获取用户打卡次数
    function getCheckInCount(address userAddr) external view returns (uint256) {
        return users[userAddr].totalCheckIns;
    }

    /// @notice 获取今天是否已打卡
    function hasCheckedInToday(address userAddr) external view returns (bool) {
        return users[userAddr].lastCheckInDay == getDay(block.timestamp);
    }

    /// @dev 将时间戳转换为“天数”（UTC）
    function getDay(uint256 timestamp) internal pure returns (uint256) {
        return timestamp / 1 days;
    }
}
/// @title Web3 CheckIn Contract
/// @notice Users can check in once per day
contract CheckIn {

}
