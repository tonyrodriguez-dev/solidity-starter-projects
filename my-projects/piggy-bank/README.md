# Piggy bank

Anyone can `deposit()` ETH, because the function is `payable`. Only the admin can `withdraw()`, and it sends
the whole contract balance with `call`. `withdraw` is not `payable`: it sends ETH out and does not receive it.

## Try it in Remix

1. Compile [PiggyBank.sol](PiggyBank.sol) with **0.8.24**. Deploy from Account 1, passing its address as `admin_`.
2. As Account 2, set **Value** to `2` ether and call `deposit()`. The contract balance is 2 ETH.
3. Set **Value** back to `0`. As Account 2, call `withdraw()`. It reverts: `onlyAdmin` rejects the caller.
4. As Account 1, with **Value** at `0`, call `withdraw()`. The contract balance goes to 0 and the admin receives the ETH.

Leaving **Value** above zero when calling `withdraw()` makes it revert, because the function is not `payable`.
