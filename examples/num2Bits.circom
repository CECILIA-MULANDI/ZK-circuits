pragma circom  2.1.6;


template Num2Bits(nBits) {

    // Declaration of signals.
    signal input in;
    signal input b[nBits];
   
    var accum = 0;
    for (var i = 0; i < nBits; i++){
        accum += (2**i) * b[i];
    }
    // constraints
    // in === 8 * b[3] + 4 * b[2] + 2 * b[1] + b[0];
    in === accum;
    for (var i = 0; i < nBits; i++){
        0 === b[i] * (b[i] - 1);
    }
    
   

}


component main  {public [in]}=Num2Bits(4);