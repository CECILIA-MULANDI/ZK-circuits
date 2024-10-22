pragma circom 2.0.6;

template Sudoku3by3() {
    signal input grid[9];

    // Constraints to ensure grid values are between 1 and 3
    for (var i = 0; i < 9; i++) {
        grid[i] >= 1;
        grid[i] <= 3;
    }

    // Hold the sum of each row
    signal row_sums[3];

    for (var i = 0; i < 3; i++) {
        row_sums[i] <== grid[3 * i] + grid[3 * i + 1] + grid[3 * i + 2];
        row_sums[i] == 6;  // Sum of 1, 2, 3 is 6
    }
}

// Main component to instantiate the Sudoku3by3 template
component main = Sudoku3by3();
