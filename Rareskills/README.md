> _Article link: https://rareskills.io/post/underconstrained-circom_

## Original circuit intentions

The circuit should work as described:

- `a * b == 1` (either both are 1, or one is the multiplicative inverse of the other)

- `i == a * b` (so `i == 1`, from the previous statement)

- `out == i * c` (the returned value should be equal to `c` since `i == 1`)

But since the constraints allow an `i` different from 1, we can generate a valid proof with an `out` different from `c`.

## Writing the exploit

In [`exploit.circom`](/Rareskills/exploit.circom), `i` is added as an input, and calculations are commented out.

In [`input_exploit.json`](/Rareskills/input_exploit.json), `i` is set to produce an `out` 100 times higher than `c`. The exploit witness generated passes verification successfully.

Running `make exploit` generates a valid proof where `out` is 100 times higher than `c` (`out = 500` in the default configuration, feel free to fiddle with the variables to see it change).