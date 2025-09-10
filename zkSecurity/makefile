
# compile the circuit to an r1cs (first command)
honest:
	circom IsZero.circom --r1cs --wasm --sym;
# Then, generate a witness with the wasm file it created, using input.json as the input:
	cd IsZero_js/ && \
	node generate_witness.js IsZero.wasm ../input.json ../witness.wtns && \
	cd ..
# We can see the witness snarkjs computed for us with the following command
	snarkjs wtns export json witness.wtns witness.json && \
	cat witness.json;
# Verify the witness is correct
	snarkjs wtns check IsZero.r1cs witness.wtns;
	
exploit:
	circom exploit.circom --r1cs --wasm --sym && \
	cd exploit_js/ && \
	node generate_witness.js exploit.wasm ../input_exploit.json ../exploit_witness.wtns && \
	cd .. && \
	snarkjs wtns export json exploit_witness.wtns exploit_witness.json && \
	cat exploit_witness.json && \
	snarkjs wtns check IsZero.r1cs witness.wtns;

