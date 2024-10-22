pragma circom 2.1.6;


template Num2Bits (nBits) {
    signal input in;
    signal output b[nBits];

    var temp_in = in;
    var tempBits[32];

    for (var i = 0; i < nBits; i++){
        tempBits[i] = temp_in % 2;
        temp_in = temp_in \ 2; 
    }
    for (var i = 0; i < nBits; i++) {
        b[i] <-- tempBits[i];
        // Ensure each bit is binary (0 or 1)
        b[i] * (b[i] - 1) === 0;
    }
    var sum = 0;
    var pow2 = 1;
    for (var i = 0; i < nBits; i++) {
        sum += pow2 * b[i];
        pow2 *= 2;
    }
    
   
    sum === in;


    

    

}

component main { public [ in] } = Num2Bits(4);

