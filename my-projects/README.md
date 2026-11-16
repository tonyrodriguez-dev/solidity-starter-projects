# My own projects

Contracts I wrote myself while studying Solidity, built piece by piece after the guided
exercises in the rest of this repository. Each one is small on purpose and has its own
README with the idea, a Remix walkthrough and the expected results.

| Project | What it practises |
| --- | --- |
| [lives-counter](lives-counter) | State, events, a modifier on an argument, and a `view` function. |
| [vault](vault) | A constructor-set admin, two modifiers on one function (who calls, and the running total). |
| [piggy-bank](piggy-bank) | `payable` deposits and an admin-only withdrawal with `call`. |
| [bank](bank) | A `mapping` with one balance per customer, deposit and withdraw events, and updating state before sending ETH. |

`bank` is the per-customer version of the unrestricted `withdrawEther` exercise in
[eth-transfers](../eth-transfers).

These files are licensed under MIT, unlike the course files, which keep their LGPL headers.
All contracts target Solidity **0.8.24** and are meant to be tried in Remix VM.
