> _Article link: https://blog.zksecurity.xyz/posts/circom-pitfalls-1/#hints-are-unconstrained

## Original circuit intentions

The circuit should work as described:

- Set `inv` as the multiplicative inverse of `in` (`0` if `in == 0`)

- Set `out` and constrain it as `-in * inv + 1` (`1` if `in == 0`, `0` otherwise)

But since the constraints allow an `inv` different from what's computed, we can lure the template into returning a false value.

## Writing the exploit

In [`exploit.circom`](/zkSecurity/exploit.circom), `inv` is added as an input, and calculations are commented out.

In [`input_exploit.json`](/zkSecurity/input_exploit.json), `in` is set to `42` and `inv` to `0`.

Running `make exploit` generates a valid proof where `out` is true, tricking the template into thinking `42 == 0`.