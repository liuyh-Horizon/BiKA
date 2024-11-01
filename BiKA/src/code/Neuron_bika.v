`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/11/01 04:04:59
// Design Name: 
// Module Name: Neuron_bika
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


module Neuron_bika
(
    input   wire                            sys_clk,
    input   wire                            sys_rst_n,
    
    input   wire    signed      [7:0]       activ_in,
    input   wire    signed      [7:0]       threshold_in,
    
    input   wire                            in_valid,
    
    input   wire                [15:0]      in_length,
    
    output  reg     signed      [15:0]      out,
    output  reg                             out_valid
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
                if (in_valid)
                    begin
                        product         <= (activ_in>=threshold_in) ? 1 : -1;
                        product_valid   <= 1;
                    end
                    else begin
                        product         <= 0;
                        product_valid   <= 0;
                    end
            end 
    end
    
reg     signed      [31:0]      sum;
reg     [15:0]                  sum_cnt;
always @(posedge sys_clk or negedge sys_rst_n)
    begin
        if (!sys_rst_n)
            begin
                sum         <= 0;
                out         <= 0;
                out_valid   <= 0;
                sum_cnt     <= 0;
            end
            else begin
                if (product_valid)
                    begin
                        if ((sum_cnt+1)>=in_length)
                            begin
                                sum         <= 0;
                                out         <= sum + product;
                                out_valid   <= 1;
                                sum_cnt     <= 0;
                            end
                            else begin
                                sum         <= sum + product;
                                out         <= out;
                                out_valid   <= 0;
                                sum_cnt     <= sum_cnt + 1;
                            end
                    end
                    else begin
                        sum         <= sum;
                        out         <= out;
                        out_valid   <= 0;
                        sum_cnt     <= 0;
                    end
            end 
    end

endmodule
