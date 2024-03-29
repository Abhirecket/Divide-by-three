`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:  COLLEGE OF VLSI
// Engineer: ABHISHEK KUMAR KUSHWAHA
// 
// Create Date: 13.12.2023 10:17:31
// Design Name: 
// Module Name: div_by_3
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


module div_by_3(
    input clk,
    input rst_n,
    input x_i,
    output reg div_o

    );
    
 parameter REM_0 = 2'b00, REM_1 = 2'b01, REM_2 = 2'b10;   
 
 reg [1:0] pr_state, nxt_state;
 
 
 //sequential block
 always@(posedge clk or negedge rst_n) begin 
    if (!rst_n) begin 
        pr_state  <= 2'b00;
        //nxt_state <= 2'b00; // Unsupported: Blocked and non-blocking assignments to same variable: 'div_by_three.nxt_state'

    end

    else begin
        pr_state  <= nxt_state;
    end
 end
 
 //combo block
 
 always@(pr_state or x_i) begin  
 
 case(pr_state) 
    
    REM_0 : begin
               if(x_i==0) begin
                  nxt_state = REM_0;
                  div_o = 1'b1;
                end

                else begin
                  nxt_state = REM_1;
                  div_o = 1'b0;
                end

            

            end 
            
    REM_1 : begin
               if(x_i==0) begin
                  nxt_state = REM_2;
                  div_o = 1'b0;
                end

                else begin
                  nxt_state = REM_0;
                  div_o = 1'b1;
                end

            

            end              
     REM_2 : begin
               if(x_i==0) begin
                  nxt_state = REM_1;
                  div_o = 1'b0;
                end

                else begin
                  nxt_state = REM_2;
                  div_o = 1'b0;
                end

            

            end
 
     default : begin
                 // nxt_state = REM_0;
                  div_o = 1'b0;
                end
 
 endcase

 end 
       
endmodule
