> _Article link: https://blog.oxor.io/common-vulnerabilities-in-zk-proof-5ba7620dfa2f#58b8

## Original circuit intentions

The circuit should work as described:

- `inv` is calculated as the multiplicative inverse of `in`

- `out` is calculated and constrained as `-in * inv + 1`

- The last constraint ensures `in == 0 || out == 0`

## Writing the exploit

I don't actually believe this code can be exploited.

The last constraint, `in * out === 0`, ensures at least one of these variables is equal to 0. Since we're in a finite field with `p` as a prime number, it is not possible to satisfy `-in * inv + 1 == 1` (simplified to `-in * inv == 0 (mod p)`), because it would mean that `-in * inv` results in a multiple of the prime number, which is impossible.

In short, we have either `in = 0` and `out` will be calculated as `1` by the first constraint, or `in > 0` and `out` must be `1` by the second constraint, so no exploit is possible here.

Feel free to experiment with the [`input_exploit.json`](./input_exploit.json) file to wrap your head around this :)