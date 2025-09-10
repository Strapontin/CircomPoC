> _Article link: https://blog.zksecurity.xyz/posts/circom-pitfalls-1/#hints-are-unconstrained

## Original circuit intentions

The circuit should work as describes:

- Set `inv` as the multiplicative inverse of `in` (`0` if `in == 0`)

- set `out` and constrain it as `-in * inv + 1` (`1` if `in == 0`, `0` else)

But since the constrains allow an `inv` different than what's computed, we can manage to lure the template into return a false value.

## Writing the exploit

In the [`exploit.circom`](/zkSecurity/exploit.circom) file, `inv` is added as an input, and calculations are commented out.

In the [`/input_exploit.json`](/zkSecurity/input_exploit.json) file, `in` is set to `42`, and `inv` to `0`.

Running `make exploit` generates a valid proof where `out` is true, luring the template into thinking `42 == 0`.