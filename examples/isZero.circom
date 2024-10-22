pragma circom 2.1.6;


template isZero() {
    signal input in;
    signal output out;

    signal inv;
    signal checker;

    inv <-- in != 0 ? 1/in : 0;
    checker <== in * inv;

    // ensure that the checker is either 1 or 0;
    checker * (1 - checker) === 0;

    // out becomes the opposite of check
    out <== 1 - checker;
    

}

component main { public [ in ] } = isZero();

