# Solidity Starter Projects

A growing collection of introductory Solidity exercises from José Cruz's
Blockchain Accelerator, plus [my own projects](my-projects) built on top of them. The projects cover state, modifiers, events,
ERC-20 inheritance, contract interfaces, caller identity, access checks and native ETH transfers.

| Contract | What it demonstrates |
| --- | --- |
| [Calculadora.sol](basics/Calculadora.sol) | Addition and subtraction, events, a persistent accumulator, and a modifier that restricts a function argument. |
| [CryptoReal.sol](tokens/CryptoReal.sol) | A token built on OpenZeppelin ERC-20 that mints 1,000 tokens to the deployer in its constructor. |
| [Sender](msg-sender) | Stores the deploy-time caller and distinguishes a saved owner from the current caller. |
| [Connected contracts](connected-contracts) | `Sumador`, `Resultado` and `IResultado`, with cross-contract state updates and a documented `tx.origin` authorization vulnerability. |
| [Access checks](access-checks) | `RequireTest` compares a plain revert, a `require` message and a custom error carrying the caller's address. |
| [Receiving and withdrawing ETH](eth-transfers) | Two versions illustrate `payable` deposits, withdrawals via `call`, failure handling and an unrestricted withdrawal in a local exercise. |

The connected-contract exercise includes a caller-identity comparison, a sequence
diagram, deployment steps and security observations. It deliberately preserves
the course's `tx.origin` check for local study.

## Repository layout

| Path | What you'll find |
| --- | --- |
| [basics/](basics) and [tokens/](tokens) | Standalone contracts ready to open in Remix: `Calculadora` and `CryptoReal`. |
| [my-projects/](my-projects) | Contracts I wrote myself: lives counter, vault, piggy bank and a per-customer bank. |
| [msg-sender/](msg-sender) and [connected-contracts/](connected-contracts) | Caller identity and cross-contract calls, with source and walkthroughs. |
| [access-checks/](access-checks) | An administrator check implemented three ways, with expected failure details. |
| [eth-transfers/](eth-transfers) | Two ETH transfer exercises, including a two-account withdrawal case. |

## How the contracts work

**Calculadora** starts with a stored accumulator of 10. `addition` and `substraction` calculate and emit a result. `multiplier` updates the accumulator. `multiplier2` applies the same update after a modifier checks that the argument is 10.

**CryptoReal** passes the token name and symbol to OpenZeppelin's ERC-20 constructor. It then mints `1000 * 1e18` base units to the deploying address.

| Entry point | Inputs | Observable result |
| --- | --- | --- |
| `Calculadora.multiplier2` | A multiplier of 10 | The stored accumulator is multiplied by 10. |
| `CryptoReal.constructor` | Token name and symbol | The deployer receives 1,000 CRT using 18 decimals. |

## Try them in Remix

For **Calculadora** and **CryptoReal**, follow the steps below. For the other exercises, see the guides for [Sender](msg-sender#try-it-in-remix), [connected contracts](connected-contracts#reproduce-in-remix), [access checks](access-checks#try-it-in-remix) and [ETH transfers](eth-transfers#try-it-in-remix).

1. Open [Remix](https://remix.ethereum.org/) and add the two Solidity files.
2. Select compiler **0.8.24**. Compile the contract you want to try.
3. In **Deploy & Run Transactions**, select **Remix VM** and leave **Value** at 0.
4. Deploy `Calculadora` without arguments, or deploy `CryptoReal` with
   `Crypto Real` as the name and `CRT` as the symbol.

| Try this | Expected result |
| --- | --- |
| `Calculadora.addition(5, 2)` | The transaction log contains an `Addition` event with result 7. The accumulator starts at 10. |
| `Calculadora.substraction2(5, 10)` | Returns −5 using signed integers. |
| `Calculadora.multiplier2(11)` | Reverts. The modifier accepts only 10. |
| `CryptoReal.balanceOf(deployer)` | Returns 1,000 CRT expressed in base units: `1000000000000000000000`. |

## Manual test cases

| Exercise | What to reproduce | Expected result |
| --- | --- | --- |
| [Caller identity](msg-sender#try-it-in-remix) | Deploy from account A and query the owner from account B. | The stored owner remains A. |
| [Connected contracts](connected-contracts#reproduce-in-remix) | Call `Sumador.addition(5, 5)` and read the value from `Resultado`. | The receiving contract stores 10. |
| [Access checks](access-checks#try-it-in-remix) | Run the same check as the administrator and as another account. | The administrator passes. The other account sees a revert. |
| [ETH transfers](eth-transfers#try-it-in-remix) | Deposit into version 2 and withdraw from a second test account. | The withdrawal succeeds, demonstrating unrestricted access to the shared balance. |

## Security observations

- The connected-contract example shows how an authorization check based on `tx.origin` can accept a call forwarded by another contract when the administrator initiated the transaction.
- The second ETH transfer example checks whether the transfer succeeded. Any caller can still withdraw from the shared balance because the contract stores no balances per depositor. [`my-projects/bank`](my-projects/bank) is my per-customer version.

## Implementation notes

- The calculator's addition and subtraction events log the computed result.
  The contract's function and event names follow the course files.
- The token pins OpenZeppelin Contracts to version 5.0.2 for the Remix exercise.
- The caller identity, access check and ETH transfer exercises preserve the supplied Solidity files. Their guides include local reproduction steps, expected results and security observations.

## License

The course Solidity files declare [LGPL-3.0-only](LICENSE). My own files in [my-projects](my-projects) are MIT. See [COPYING](COPYING)
for the GNU GPL text referenced by the LGPL.

