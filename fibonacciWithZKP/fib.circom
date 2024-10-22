pragma circom  2.0.6;
function fibtest(fib1,fib2,n){
    // hold non-signal data and are mutable
    var a = fib1;
    var b = fib2;
    var c;
    var v1[3] = [31,18,24];

    // compute fibonacci
    for (var i = 0; i < n; i++){
        c = a + b;
        a = b;
        b = c;
    } 
    return c;
}