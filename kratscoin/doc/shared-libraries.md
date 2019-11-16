Shared Libraries
================

## kratscoinconsensus

The purpose of this library is to make the verification functionality that is critical to Kratscoin's consensus available to other applications, e.g. to language bindings.

### API

The interface is defined in the C header `kratscoinconsensus.h` located in  `src/script/kratscoinconsensus.h`.

#### Version

`kratscoinconsensus_version` returns an `unsigned int` with the API version *(currently at an experimental `0`)*.

#### Script Validation

`kratscoinconsensus_verify_script` returns an `int` with the status of the verification. It will be `1` if the input script correctly spends the previous output `scriptPubKey`.

##### Parameters
- `const unsigned char *scriptPubKey` - The previous output script that encumbers spending.
- `unsigned int scriptPubKeyLen` - The number of bytes for the `scriptPubKey`.
- `const unsigned char *txTo` - The transaction with the input that is spending the previous output.
- `unsigned int txToLen` - The number of bytes for the `txTo`.
- `unsigned int nIn` - The index of the input in `txTo` that spends the `scriptPubKey`.
- `unsigned int flags` - The script validation flags *(see below)*.
- `kratscoinconsensus_error* err` - Will have the error/success code for the operation *(see below)*.

##### Script Flags
- `kratscoinconsensus_SCRIPT_FLAGS_VERIFY_NONE`
- `kratscoinconsensus_SCRIPT_FLAGS_VERIFY_P2SH` - Evaluate P2SH ([BIP16](https://github.com/kratscoin/bips/blob/master/bip-0016.mediawiki)) subscripts
- `kratscoinconsensus_SCRIPT_FLAGS_VERIFY_DERSIG` - Enforce strict DER ([BIP66](https://github.com/kratscoin/bips/blob/master/bip-0066.mediawiki)) compliance
- `kratscoinconsensus_SCRIPT_FLAGS_VERIFY_NULLDUMMY` - Enforce NULLDUMMY ([BIP147](https://github.com/kratscoin/bips/blob/master/bip-0147.mediawiki))
- `kratscoinconsensus_SCRIPT_FLAGS_VERIFY_CHECKLOCKTIMEVERIFY` - Enable CHECKLOCKTIMEVERIFY ([BIP65](https://github.com/kratscoin/bips/blob/master/bip-0065.mediawiki))
- `kratscoinconsensus_SCRIPT_FLAGS_VERIFY_CHECKSEQUENCEVERIFY` - Enable CHECKSEQUENCEVERIFY ([BIP112](https://github.com/kratscoin/bips/blob/master/bip-0112.mediawiki))
- `kratscoinconsensus_SCRIPT_FLAGS_VERIFY_WITNESS` - Enable WITNESS ([BIP141](https://github.com/kratscoin/bips/blob/master/bip-0141.mediawiki))

##### Errors
- `kratscoinconsensus_ERR_OK` - No errors with input parameters *(see the return value of `kratscoinconsensus_verify_script` for the verification status)*
- `kratscoinconsensus_ERR_TX_INDEX` - An invalid index for `txTo`
- `kratscoinconsensus_ERR_TX_SIZE_MISMATCH` - `txToLen` did not match with the size of `txTo`
- `kratscoinconsensus_ERR_DESERIALIZE` - An error deserializing `txTo`
- `kratscoinconsensus_ERR_AMOUNT_REQUIRED` - Input amount is required if WITNESS is used

### Example Implementations
- [NKratscoin](https://github.com/NicolasDorier/NKratscoin/blob/master/NKratscoin/Script.cs#L814) (.NET Bindings)
- [node-libkratscoinconsensus](https://github.com/bitpay/node-libkratscoinconsensus) (Node.js Bindings)
- [java-libkratscoinconsensus](https://github.com/dexX7/java-libkratscoinconsensus) (Java Bindings)
- [kratscoinconsensus-php](https://github.com/Bit-Wasp/kratscoinconsensus-php) (PHP Bindings)
