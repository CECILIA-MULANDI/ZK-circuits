pragma circom 2.1.6;

include "circomlib/poseidon.circom";
// include "https://github.com/0xPARC/circom-secp256k1/blob/master/circuits/bigint.circom";

template SecretToPublic() {
    signal input sk;
    signal output pk;
    
    component poseidon=Poseidon(1);
    poseidon.inputs[0] <== sk;
    pk <== poseidon.out;
}

template Sign(){
    signal input m;
    signal input sk;
    signal output pk;

    component checker = SecretToPublic();
    checker.sk <== sk;
    pk <== checker.pk;

    signal mSquared;
    mSquared <== m*m;
}

component main { public [ m ] } = Sign();

/* INPUT = {
    "m": "10",
    "sk": "5"
} */