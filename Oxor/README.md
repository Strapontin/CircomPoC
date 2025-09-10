> _Article link: https://blog.oxor.io/common-vulnerabilities-in-zk-proof-5ba7620dfa2f#58b8

## Original circuit intentions

The circuit should work as describes:

- `a * b == 1` (either both 1, or one is the multiplicative inverse of the other)

- `i == a * b` (so i == 1, from previous statement)

- `out == i * c` (the returned value should be equal to c since i == 1)

But since the constrains allow an `i` different than 1, we can manage to generate a valid proof with an `out` different than `c`.

## Writing the exploit

In the [`exploit.circom`](/Rareskills/exploit.circom) file, `i` is added as an input, and calculations are commented out.

In the [`/input_exploit.json`](/Rareskills/input_exploit.json) file, `i` is set to give an `out` 100 times higher than `c`. The witness_exploit generated passes the verification successfully.

Running `make exploit` generates a valid proof where `out` is 100 times higher than `c` (`out = 500` in the default configuration, feel free to fiddle with the variables to see it change).