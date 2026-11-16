# Bank

A `mapping(address => uint256)` keeps one balance per customer. `deposit()` adds `msg.value` to the caller's
line, and `withdraw(n_)` subtracts `n_` only if `hasBalance` confirms the caller can cover it. Both
operations emit an event. The sum of all balances matches the ETH held by the contract.

`withdraw` updates the balance **before** sending the ETH. This ordering means a failed or malicious receiver
cannot reuse the old balance.

## Try it in Remix

1. Compile [Bank.sol](Bank.sol) with **0.8.24**, select **Remix VM** and deploy.
2. Account 2 deposits 3 ETH (**Value** `3` ether) and Account 3 deposits 2 ETH. `balances` shows 3 and 2.
3. Set **Value** to `0`. Account 3 calls `withdraw` with 4 ETH in wei (`4000000000000000000`). It reverts.
4. Account 2 withdraws 1 ETH (`1000000000000000000`). `balances(Account 2)` becomes 2 and the contract holds 4 ETH.

This is a learning exercise and has not been audited. It does not use a reentrancy guard.
