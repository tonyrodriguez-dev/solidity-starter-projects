# Caller identity with `msg.sender`

An introductory exercise from José Cruz's Blockchain Accelerator. `Sender` stores
the caller of its constructor in `owner` when the contract is deployed.

```solidity
constructor() {
    owner = msg.sender;
}
```

## Try it in Remix

1. Compile [Sender.sol](Sender.sol) with Solidity **0.8.24**.
2. Choose **Remix VM** and deploy directly from Account 1 with Value set to 0.
3. Read `owner()`. It should return Account 1's address.
4. Switch to Account 2 and read `owner()` on that same deployed instance.
   The stored owner remains Account 1.
5. Deploy a second instance from Account 2. Its `owner()` should return Account 2.

`owner` is a stored value. `msg.sender` describes the current call. Changing the
selected account does not change a value that was stored during construction.
If a factory contract deploys `Sender`, the constructor's `msg.sender` is the
factory contract. This exercise deploys directly from an account.

The name `owner` alone grants no permissions. This contract stores an address
and exposes its getter. See the [connected-contract exercise](../connected-contracts)
for a comparison of caller checks across external calls.

The Solidity file is the uploaded course exercise, preserved as supplied.
