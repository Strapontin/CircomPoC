pragma circom 2.1.8;

template IsZero() {
  signal input in;
  signal output out;
  signal inv;

  inv <-- in!=0 ? 1 / in : 0;
  out <-- -in * inv + 1;
  out === -in * inv + 1;
}

component main{public [in]} = IsZero();