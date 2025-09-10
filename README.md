https://rareskills.io/post/underconstrained-circom
https://blog.zksecurity.xyz/posts/circom-pitfalls-1/#hints-are-unconstrained
https://blog.oxor.io/common-vulnerabilities-in-zk-proof-5ba7620dfa2f#58b8


TODO: Explain how poc-ing works

- Create a gitignore to exclude created files

- Explain the main goal in this README

- Explain in short how to run the exploit on each README

- Create Makefiles in all 3 repositories




___



# How to PoC Under-Constrained vulnerabilities on circom

## Part 1. Generating and verifying an honest circuit

### Step 1. Using Circom to create a wasm file

The following command compiles the circuit to an R1CS file and generates a wasm file.

```bash
circom myfile.circom --r1cs --wasm --sym;
```

The file will be created in a new directory, "myfile_js".

### Step 2. Generating the witness

From the R1CS circuit and an `input.json` file, we can generate a file that will be the witness. We will later provid this witness to the Verifier.

```bash
cd myfile_js
node generate_witness.js myfile.wasm ../input.json ../witness.wtns
cd ..
```

Using snarkjs, we can see the witness that we generated:

```bash
snarkjs wtns export json witness.wtns witness.json
cat witness.json
```

### Step 3. Verify the witness

A Verifier can assert the witness satisfies the circuit:

```bash
snarkjs wtns check myfile.r1cs witness.wtns
```

## Part 2. Generating an attack

## Updating the file to change the constrains

TODO : Verify that we can first add the inside variable to the public variables and modify it