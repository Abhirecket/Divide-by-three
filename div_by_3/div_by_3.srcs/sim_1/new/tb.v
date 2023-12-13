`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: aBHISHEK KUMAR KUSHWAHA 
// 
// Create Date: 13.12.2023 10:17:45
// Design Name: 
// Module Name: tb
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


module tb();
reg clk;      
reg rst_n;    
reg x_i;      
wire div_o;


// Parameters
parameter CLK_PERIOD = 10; // Clock period in ns 
  
div_by_3 dut(
    clk,
    rst_n,
    x_i,
    div_o

    );


// Clock generation
always #((CLK_PERIOD / 2)) clk = ~clk; 


 initial begin
       rst_n = 1'b0;     
       x_i = 1'b0;
       clk = 1'b0;
       @(posedge clk);
       rst_n = 1'b1;

       repeat(20) begin
        @(posedge clk);
        x_i = $random;
       end
       
       $finish;
    end      


endmodule
