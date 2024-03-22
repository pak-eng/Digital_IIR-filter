// Project name: Filter
// Author: P. P. Kolbenkov
// File description: Coefficients for FIR and IIR parts of filter

`timescale 1ns/1ns

module coeffs(
    output signed [14:0] a_c [0:5],
    output signed [11:0] b_c [0:3]
);

    assign a_c[0] = 15'sb110010110101011;
    assign a_c[1] = 15'sb101010001011010;
    assign a_c[2] = 15'sb101010010110000;
    assign a_c[3] = 15'sb110010100101010;
    assign a_c[4] = 15'sb111011001000001;
    assign a_c[5] = 15'sb111111001100000;

    assign b_c[0] = 12'sb000000001001;
    assign b_c[1] = 12'sb111111101010;
    assign b_c[2] = 12'sb000000100110;
    assign b_c[3] = 12'sb111111010100;
endmodule