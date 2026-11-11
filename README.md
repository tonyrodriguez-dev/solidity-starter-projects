# Solidity Starter Projects

A growing collection of introductory Solidity exercises from José Cruz's
Blockchain Accelerator. The projects cover state, modifiers, events,
ERC-20 inheritance, contract interfaces, caller identity, access checks and native ETH transfers.

| Contract | What it demonstrates |
| --- | --- |
| [Calculadora.sol](Calculadora.sol) | Addition and subtraction, events, a persistent accumulator, and a modifier that restricts a function argument. |
| [CryptoReal.sol](CryptoReal.sol) | A token built on OpenZeppelin ERC-20 that mints 1,000 tokens to the deployer in its constructor. |
| [Sender](msg-sender) | Stores the deploy-time caller and distinguishes a saved owner from the current caller. |
| [Connected contracts](connected-contracts) | `Sumador`, `Resultado` and `IResultado`, with cross-contract state updates and a documented `tx.origin` authorization vulnerability. |
| [Access checks](access-checks) | `RequireTest` compares a plain revert, a `require` message and a custom error carrying the caller's address. |
| [Receiving and withdrawing ETH](eth-transfers) | Two versions illustrate `payable` deposits, withdrawals via `call`, failure handling and an unrestricted withdrawal in a local exercise. |

The connected-contract exercise includes a caller-identity comparison, a sequence
diagram, deployment steps and security observations. It deliberately preserves
the course's `tx.origin` check for local study.

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

## Changes for this portfolio

- The calculator's addition and subtraction events log the computed result.
  The contract's function and event names follow the course files.
- The token pins OpenZeppelin Contracts to version 5.0.2 for the Remix exercise.

- The caller identity, access check and ETH transfer exercises preserve the supplied Solidity files. Their guides include local reproduction steps, expected results and security observations.

The Solidity source files declare [LGPL-3.0-only](LICENSE). See [COPYING](COPYING)
for the GNU GPL text referenced by the LGPL.

