pragma circom 2.1.6;

template isEqual () {
    signal input in[2];
    signal output out;

    signal checker;
    checker <-- (in[0] - in[1]) == 0 ? 1 : 0;
    out <== checker;
}

component main = isEqual();