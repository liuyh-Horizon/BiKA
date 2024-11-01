`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/11/01 04:04:59
// Design Name: 
// Module Name: Neuron_bin
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


module Neuron_bin
(
    input   wire                            sys_clk,
    input   wire                            sys_rst_n,
    
    input   wire                [7:0]       activ_in,
    input   wire                [7:0]       weight_in,
    
    input   wire                            in_valid,
    
    input   wire                [15:0]      in_length,
    
    input   wire    signed      [31:0]      threshold_in,
    input   wire                            threshold_valid,
    
    output  reg                             quant_ready,
    
    output  reg                 [7:0]       out,
    output  reg                             out_valid
);

reg     signed      [7:0]       xnor_out;
reg                             xnor_out_valid;
always @(posedge sys_clk or negedge sys_rst_n)
    begin
        if (!sys_rst_n)
            begin
                xnor_out        <= 0;
                xnor_out_valid  <= 0;
            end
            else begin
                if (in_valid)
                    begin
                        xnor_out        <= ~((activ_in)^(weight_in));
                        xnor_out_valid  <= 1;
                    end
                    else begin
                        xnor_out        <= 0;
                        xnor_out_valid  <= 0;
                    end
            end 
    end
    
wire    [15:0]      pop_out;
popcount_8bit popcount
(
    .pop_in(xnor_out),  
    .pop_out(pop_out)
);  

reg     signed      [15:0]      product;
reg                             product_valid;
always @(posedge sys_clk or negedge sys_rst_n)
    begin
        if (!sys_rst_n)
            begin
                product         <= 0;
                product_valid   <= 0;
            end
            else begin
                if (xnor_out_valid)
                    begin
                        product         <= pop_out;
                        product_valid   <= 1;
                    end
                    else begin
                        product         <= 0;
                        product_valid   <= 0;
                    end
            end 
    end
reg     signed      [31:0]      sum;
reg     signed      [31:0]      sum_out;
reg                             sum_valid;
reg     [15:0]                  sum_cnt;
always @(posedge sys_clk or negedge sys_rst_n)
    begin
        if (!sys_rst_n)
            begin
                sum         <= 0;
                sum_out     <= 0;
                sum_valid   <= 0;
                sum_cnt     <= 0;
                quant_ready <= 0;
            end
            else begin
                if (product_valid)
                    begin
                        if ((sum_cnt+1)>=in_length)
                            begin
                                sum         <= 0;
                                sum_out     <= sum + product;
                                sum_valid   <= 1;
                                sum_cnt     <= 0;
                                quant_ready <= 1;
                            end
                            else begin
                                sum         <= sum + product;
                                sum_out     <= sum_out;
                                sum_valid   <= 0;
                                sum_cnt     <= sum_cnt + 1;
                                quant_ready <= 0;
                            end
                    end
                    else begin
                        sum         <= sum;
                        sum_out     <= sum_out;
                        sum_valid   <= sum_valid;
                        sum_cnt     <= 0;
                        quant_ready <= 0;
                    end
            end 
    end
    
always @(posedge sys_clk or negedge sys_rst_n)
    begin
        if (!sys_rst_n)
            begin
                out         <= 0;
                out_valid   <= 0;
            end
            else begin
                if (sum_valid & threshold_valid)
                    begin
                        out         <= (sum_out>=0)?1:0;
                        out_valid   <= 1;
                    end
                    else begin
                        out         <= 0;
                        out_valid   <= 0;
                    end
            end 
    end

endmodule