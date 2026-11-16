# Vault

Only the admin set in the constructor can call `store(n_)`, and the running total can never
pass 50. `maxFifty` checks `coins + n_`, not just `n_`, so repeated small deposits cannot exceed the limit.

## Try it in Remix

1. Compile [Vault.sol](Vault.sol) with **0.8.24**. Deploy from Account 1, passing Account 1's address as `admin_`.
2. As Account 1, `store(30)` then `store(15)` pass. `coins()` returns 45.
3. `store(10)` reverts (45 + 10 > 50). `store(5)` passes and `coins()` returns 50.
4. Switch to Account 2 and call `store(1)`. It reverts: `onlyAdmin` rejects the caller.
