`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/11/01 04:47:03
// Design Name: 
// Module Name: popcount_8bit
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module popcount_8bit
(
    input       wire    [7:0]       pop_in,
    output      wire    [15:0]      pop_out
);

wire    [3:0]    pop_tab    [255:0];

assign pop_tab[0] = 4'b1000;
assign pop_tab[1] = 4'b1010;
assign pop_tab[2] = 4'b1010;
assign pop_tab[3] = 4'b1100;
assign pop_tab[4] = 4'b1010;
assign pop_tab[5] = 4'b1100;
assign pop_tab[6] = 4'b1100;
assign pop_tab[7] = 4'b1110;
assign pop_tab[8] = 4'b1010;
assign pop_tab[9] = 4'b1100;
assign pop_tab[10] = 4'b1100;
assign pop_tab[11] = 4'b1110;
assign pop_tab[12] = 4'b1100;
assign pop_tab[13] = 4'b1110;
assign pop_tab[14] = 4'b1110;
assign pop_tab[15] = 4'b0000;
assign pop_tab[16] = 4'b1010;
assign pop_tab[17] = 4'b1100;
assign pop_tab[18] = 4'b1100;
assign pop_tab[19] = 4'b1110;
assign pop_tab[20] = 4'b1100;
assign pop_tab[21] = 4'b1110;
assign pop_tab[22] = 4'b1110;
assign pop_tab[23] = 4'b0000;
assign pop_tab[24] = 4'b1100;
assign pop_tab[25] = 4'b1110;
assign pop_tab[26] = 4'b1110;
assign pop_tab[27] = 4'b0000;
assign pop_tab[28] = 4'b1110;
assign pop_tab[29] = 4'b0000;
assign pop_tab[30] = 4'b0000;
assign pop_tab[31] = 4'b0010;
assign pop_tab[32] = 4'b1010;
assign pop_tab[33] = 4'b1100;
assign pop_tab[34] = 4'b1100;
assign pop_tab[35] = 4'b1110;
assign pop_tab[36] = 4'b1100;
assign pop_tab[37] = 4'b1110;
assign pop_tab[38] = 4'b1110;
assign pop_tab[39] = 4'b0000;
assign pop_tab[40] = 4'b1100;
assign pop_tab[41] = 4'b1110;
assign pop_tab[42] = 4'b1110;
assign pop_tab[43] = 4'b0000;
assign pop_tab[44] = 4'b1110;
assign pop_tab[45] = 4'b0000;
assign pop_tab[46] = 4'b0000;
assign pop_tab[47] = 4'b0010;
assign pop_tab[48] = 4'b1100;
assign pop_tab[49] = 4'b1110;
assign pop_tab[50] = 4'b1110;
assign pop_tab[51] = 4'b0000;
assign pop_tab[52] = 4'b1110;
assign pop_tab[53] = 4'b0000;
assign pop_tab[54] = 4'b0000;
assign pop_tab[55] = 4'b0010;
assign pop_tab[56] = 4'b1110;
assign pop_tab[57] = 4'b0000;
assign pop_tab[58] = 4'b0000;
assign pop_tab[59] = 4'b0010;
assign pop_tab[60] = 4'b0000;
assign pop_tab[61] = 4'b0010;
assign pop_tab[62] = 4'b0010;
assign pop_tab[63] = 4'b0100;
assign pop_tab[64] = 4'b1010;
assign pop_tab[65] = 4'b1100;
assign pop_tab[66] = 4'b1100;
assign pop_tab[67] = 4'b1110;
assign pop_tab[68] = 4'b1100;
assign pop_tab[69] = 4'b1110;
assign pop_tab[70] = 4'b1110;
assign pop_tab[71] = 4'b0000;
assign pop_tab[72] = 4'b1100;
assign pop_tab[73] = 4'b1110;
assign pop_tab[74] = 4'b1110;
assign pop_tab[75] = 4'b0000;
assign pop_tab[76] = 4'b1110;
assign pop_tab[77] = 4'b0000;
assign pop_tab[78] = 4'b0000;
assign pop_tab[79] = 4'b0010;
assign pop_tab[80] = 4'b1100;
assign pop_tab[81] = 4'b1110;
assign pop_tab[82] = 4'b1110;
assign pop_tab[83] = 4'b0000;
assign pop_tab[84] = 4'b1110;
assign pop_tab[85] = 4'b0000;
assign pop_tab[86] = 4'b0000;
assign pop_tab[87] = 4'b0010;
assign pop_tab[88] = 4'b1110;
assign pop_tab[89] = 4'b0000;
assign pop_tab[90] = 4'b0000;
assign pop_tab[91] = 4'b0010;
assign pop_tab[92] = 4'b0000;
assign pop_tab[93] = 4'b0010;
assign pop_tab[94] = 4'b0010;
assign pop_tab[95] = 4'b0100;
assign pop_tab[96] = 4'b1100;
assign pop_tab[97] = 4'b1110;
assign pop_tab[98] = 4'b1110;
assign pop_tab[99] = 4'b0000;
assign pop_tab[100] = 4'b1110;
assign pop_tab[101] = 4'b0000;
assign pop_tab[102] = 4'b0000;
assign pop_tab[103] = 4'b0010;
assign pop_tab[104] = 4'b1110;
assign pop_tab[105] = 4'b0000;
assign pop_tab[106] = 4'b0000;
assign pop_tab[107] = 4'b0010;
assign pop_tab[108] = 4'b0000;
assign pop_tab[109] = 4'b0010;
assign pop_tab[110] = 4'b0010;
assign pop_tab[111] = 4'b0100;
assign pop_tab[112] = 4'b1110;
assign pop_tab[113] = 4'b0000;
assign pop_tab[114] = 4'b0000;
assign pop_tab[115] = 4'b0010;
assign pop_tab[116] = 4'b0000;
assign pop_tab[117] = 4'b0010;
assign pop_tab[118] = 4'b0010;
assign pop_tab[119] = 4'b0100;
assign pop_tab[120] = 4'b0000;
assign pop_tab[121] = 4'b0010;
assign pop_tab[122] = 4'b0010;
assign pop_tab[123] = 4'b0100;
assign pop_tab[124] = 4'b0010;
assign pop_tab[125] = 4'b0100;
assign pop_tab[126] = 4'b0100;
assign pop_tab[127] = 4'b0110;
assign pop_tab[128] = 4'b1010;
assign pop_tab[129] = 4'b1100;
assign pop_tab[130] = 4'b1100;
assign pop_tab[131] = 4'b1110;
assign pop_tab[132] = 4'b1100;
assign pop_tab[133] = 4'b1110;
assign pop_tab[134] = 4'b1110;
assign pop_tab[135] = 4'b0000;
assign pop_tab[136] = 4'b1100;
assign pop_tab[137] = 4'b1110;
assign pop_tab[138] = 4'b1110;
assign pop_tab[139] = 4'b0000;
assign pop_tab[140] = 4'b1110;
assign pop_tab[141] = 4'b0000;
assign pop_tab[142] = 4'b0000;
assign pop_tab[143] = 4'b0010;
assign pop_tab[144] = 4'b1100;
assign pop_tab[145] = 4'b1110;
assign pop_tab[146] = 4'b1110;
assign pop_tab[147] = 4'b0000;
assign pop_tab[148] = 4'b1110;
assign pop_tab[149] = 4'b0000;
assign pop_tab[150] = 4'b0000;
assign pop_tab[151] = 4'b0010;
assign pop_tab[152] = 4'b1110;
assign pop_tab[153] = 4'b0000;
assign pop_tab[154] = 4'b0000;
assign pop_tab[155] = 4'b0010;
assign pop_tab[156] = 4'b0000;
assign pop_tab[157] = 4'b0010;
assign pop_tab[158] = 4'b0010;
assign pop_tab[159] = 4'b0100;
assign pop_tab[160] = 4'b1100;
assign pop_tab[161] = 4'b1110;
assign pop_tab[162] = 4'b1110;
assign pop_tab[163] = 4'b0000;
assign pop_tab[164] = 4'b1110;
assign pop_tab[165] = 4'b0000;
assign pop_tab[166] = 4'b0000;
assign pop_tab[167] = 4'b0010;
assign pop_tab[168] = 4'b1110;
assign pop_tab[169] = 4'b0000;
assign pop_tab[170] = 4'b0000;
assign pop_tab[171] = 4'b0010;
assign pop_tab[172] = 4'b0000;
assign pop_tab[173] = 4'b0010;
assign pop_tab[174] = 4'b0010;
assign pop_tab[175] = 4'b0100;
assign pop_tab[176] = 4'b1110;
assign pop_tab[177] = 4'b0000;
assign pop_tab[178] = 4'b0000;
assign pop_tab[179] = 4'b0010;
assign pop_tab[180] = 4'b0000;
assign pop_tab[181] = 4'b0010;
assign pop_tab[182] = 4'b0010;
assign pop_tab[183] = 4'b0100;
assign pop_tab[184] = 4'b0000;
assign pop_tab[185] = 4'b0010;
assign pop_tab[186] = 4'b0010;
assign pop_tab[187] = 4'b0100;
assign pop_tab[188] = 4'b0010;
assign pop_tab[189] = 4'b0100;
assign pop_tab[190] = 4'b0100;
assign pop_tab[191] = 4'b0110;
assign pop_tab[192] = 4'b1100;
assign pop_tab[193] = 4'b1110;
assign pop_tab[194] = 4'b1110;
assign pop_tab[195] = 4'b0000;
assign pop_tab[196] = 4'b1110;
assign pop_tab[197] = 4'b0000;
assign pop_tab[198] = 4'b0000;
assign pop_tab[199] = 4'b0010;
assign pop_tab[200] = 4'b1110;
assign pop_tab[201] = 4'b0000;
assign pop_tab[202] = 4'b0000;
assign pop_tab[203] = 4'b0010;
assign pop_tab[204] = 4'b0000;
assign pop_tab[205] = 4'b0010;
assign pop_tab[206] = 4'b0010;
assign pop_tab[207] = 4'b0100;
assign pop_tab[208] = 4'b1110;
assign pop_tab[209] = 4'b0000;
assign pop_tab[210] = 4'b0000;
assign pop_tab[211] = 4'b0010;
assign pop_tab[212] = 4'b0000;
assign pop_tab[213] = 4'b0010;
assign pop_tab[214] = 4'b0010;
assign pop_tab[215] = 4'b0100;
assign pop_tab[216] = 4'b0000;
assign pop_tab[217] = 4'b0010;
assign pop_tab[218] = 4'b0010;
assign pop_tab[219] = 4'b0100;
assign pop_tab[220] = 4'b0010;
assign pop_tab[221] = 4'b0100;
assign pop_tab[222] = 4'b0100;
assign pop_tab[223] = 4'b0110;
assign pop_tab[224] = 4'b1110;
assign pop_tab[225] = 4'b0000;
assign pop_tab[226] = 4'b0000;
assign pop_tab[227] = 4'b0010;
assign pop_tab[228] = 4'b0000;
assign pop_tab[229] = 4'b0010;
assign pop_tab[230] = 4'b0010;
assign pop_tab[231] = 4'b0100;
assign pop_tab[232] = 4'b0000;
assign pop_tab[233] = 4'b0010;
assign pop_tab[234] = 4'b0010;
assign pop_tab[235] = 4'b0100;
assign pop_tab[236] = 4'b0010;
assign pop_tab[237] = 4'b0100;
assign pop_tab[238] = 4'b0100;
assign pop_tab[239] = 4'b0110;
assign pop_tab[240] = 4'b0000;
assign pop_tab[241] = 4'b0010;
assign pop_tab[242] = 4'b0010;
assign pop_tab[243] = 4'b0100;
assign pop_tab[244] = 4'b0010;
assign pop_tab[245] = 4'b0100;
assign pop_tab[246] = 4'b0100;
assign pop_tab[247] = 4'b0110;
assign pop_tab[248] = 4'b0010;
assign pop_tab[249] = 4'b0100;
assign pop_tab[250] = 4'b0100;
assign pop_tab[251] = 4'b0110;
assign pop_tab[252] = 4'b0100;
assign pop_tab[253] = 4'b0110;
assign pop_tab[254] = 4'b0110;
assign pop_tab[255] = 4'b1000;

assign pop_out = {{12{pop_tab[pop_in][3]}}, pop_tab[pop_in]};

endmodule
