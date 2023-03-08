// SPDX-License-Identifier: MIT
pragma solidity 0.8.0;
interface IERC20 {
    function balanceOf(address account) external view returns (uint256);
    function transfer(address recipient, uint256 amount) external returns (bool);
}
contract wallet {
    mapping (address => uint256) private balances;

    function balance() external view returns (uint256) {
        return address(this).balance;
    }

    function depositar() external payable {
        balances[msg.sender] += msg.value;
    }

  function retirar(address payable _withdrawal) public {
    uint256 amount = address(this).balance;
    (bool success,) = _withdrawal.call{gas: 8000000, value: amount}("");
    require(success, "error al retirar");
}
    
    function Retirar_Tokens(address Retirar_Tokens1, address send_to_wallet, uint256 number_of_tokens) public returns(bool _sent) {
        uint256 randomBalance = IERC20(Retirar_Tokens1).balanceOf(address(this));
        if (number_of_tokens > randomBalance){number_of_tokens = randomBalance;}
        _sent = IERC20(Retirar_Tokens1).transfer(send_to_wallet, number_of_tokens);
    }
}