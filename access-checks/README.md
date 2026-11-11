# Access checks in Solidity

[RequireTest.sol](RequireTest.sol) implements the same administrator check three ways. The constructor saves the address passed as `admin_`. During each check, `msg.sender` is the account or contract making that call. The three functions are `view` because they read `admin` without changing it.

| Function | Condition | What a non-admin sees |
| --- | --- | --- |
| `checkAdmin()` | Reverts when the caller differs from `admin`. | A revert with empty error data. |
| `checkAdminRequire()` | Requires the caller to equal `admin`. | `Msg.sender is not admin`. |
| `checkAdminCustomError()` | Reverts when the caller differs from `admin`. | `SenderNotAdmin(address)` with the caller's address. |

The administrator passes all three checks. A successful call returns no value. These functions demonstrate validation in isolation. A state-changing function would need to apply its own check before performing the restricted action.

## Try it in Remix

1. Open [Remix](https://remix.ethereum.org/), compile with Solidity **0.8.24** and select **Remix VM**.
2. Copy the first test account's address and pass it to the constructor. Deploy with **Value** set to zero and read `admin()` to confirm the stored address.
3. Call all three checks from the administrator account. Each call completes successfully.
4. Switch to a second account and repeat. Compare the revert details in the Remix console.

[Solidity documentation on custom errors](https://docs.soliditylang.org/en/v0.8.24/contracts.html#errors-and-the-revert-statement)
