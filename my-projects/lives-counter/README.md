# Lives counter

`lives` starts at 100. `subtract(n_)` lowers it and emits `LivesLost(lost, remaining)` after the
state update. The `notMoreThan` modifier rejects any `n_` above 20. `doubleLives()` is `view`: it reads
`lives` and returns twice its value without changing it.

## Try it in Remix

1. Compile [LivesCounter.sol](LivesCounter.sol) with **0.8.24**, select **Remix VM** and deploy.
2. Call `subtract(30)`. It reverts, because the modifier only allows up to 20.
3. Call `subtract(20)` twice. `lives()` returns 60 and the log shows `(20, 80)` then `(20, 60)`.
4. Call `subtract(25)`. It reverts and `lives` stays at 60.

Solidity 0.8 also reverts any subtraction that would go below zero, with no extra check.
