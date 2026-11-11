# Receiving and withdrawing ETH

These local exercises use native ETH. The **Value** field in Remix attaches ETH to a call. An ERC-20 transfer updates balances in the token contract through its own functions.

| Contract | How it works | What it demonstrates |
| --- | --- | --- |
| [PayableContract.sol](PayableContract.sol) | `sendEther()` is `payable`. Even with an empty function body, a successful call credits the ETH to the contract. | A deposit can succeed while the deposited ETH remains locked because the contract provides no withdrawal function. |
| [PayableContractv2.sol](PayableContractv2.sol) | `sendEther()` accepts ETH. `withdrawEther(amount)` sends ETH from the contract's shared balance to `msg.sender`. | A low-level call sends the requested amount in wei. `require(success, "Transfer failed")` reverts the withdrawal if the call fails. |

In `msg.sender.call{value: amount}("")`, `msg.sender` is the recipient, `value` is the amount in wei and `""` sends empty call data. The call returns a success flag and bytes. The contract keeps the flag and omits the bytes. `withdrawEther` can send ETH while remaining nonpayable because the ETH comes from the contract balance.

**Local exercise only.** Version 2 tracks a single shared balance. Any caller, including an account that never deposited, can withdraw the available ETH. This example isolates the mechanics of transferring ETH. A bank that holds user deposits needs accounting and withdrawal rules for each depositor.

## Try it in Remix

1. Compile both contracts with Solidity **0.8.24**. Select **Remix VM** and deploy with **Value** at zero.
2. Set **Value** to `500000000000000000` **wei** and call `sendEther()` on either instance. Its balance increases by **0.5 ETH**. A plain transfer with empty call data reverts because the instance has neither `receive()` nor `fallback()`.
3. On the funded **version 2** instance, set **Value** to zero. Pass `100000000000000000` as the `amount` argument to `withdrawEther`. The contract sends **0.1 ETH** and its balance becomes **0.4 ETH**. The caller also pays gas.
4. Try withdrawing `500000000000000000` from the remaining balance. The call fails and the withdrawal reverts with `Transfer failed`.
5. Switch to another test account and withdraw `400000000000000000`. The withdrawal succeeds and leaves the contract balance at zero, demonstrating the missing depositor check.

## Comparing native ETH transfer methods

| Method | Result on failure | Gas available to the recipient |
| --- | --- | --- |
| `recipient.send(amount)` | Returns `false`. | 2,300 gas stipend. |
| `recipient.transfer(amount)` | Reverts automatically. | 2,300 gas stipend. |
| `recipient.call{value: amount}("")` | Returns `false` and may include error data. The caller decides how to handle the failure. | Can forward more gas, subject to the EVM's gas rules. |

## How the recipient chooses `receive` or `fallback`

A call from version 2 sends empty data to the recipient. If the recipient is a contract, the following rules explain where the call goes.

| Call data | Entry point |
| --- | --- |
| Empty, with a `receive()` function | Solidity runs `receive() external payable`. |
| Empty, without `receive()` | Solidity tries `fallback()`. |
| A selector that matches a declared function | Solidity dispatches to that function. |
| Nonempty, with no matching selector | Solidity tries `fallback()`. |

If a required fallback is absent, the call reverts. If the call carries ETH, the selected entry point must be `payable`. A receiver can also reject the transfer from inside its own code.

[Solidity documentation on receive and fallback](https://docs.soliditylang.org/en/v0.8.24/contracts.html#receive-ether-function) · [Address members and low-level calls](https://docs.soliditylang.org/en/v0.8.24/types.html#members-of-addresses)
