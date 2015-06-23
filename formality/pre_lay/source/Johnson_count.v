`timescale 1ns/1ps
module Johnson_count(SCANINPORT,SCANOUTPORT,SE,clk, r, out);
parameter size=7;
input clk,SCANINPORT,SE;
input r;
output SCANOUTPORT;
output [0:size]out;
reg [0:size]out;

always @ (posedge clk or posedge r)
	begin
		if (r) 
			out= 8'b0000_0000;
		else
			out={~out[size],out[0:size-1]};   
	end

assign SCANOUTPORT = out[size];

endmodule





/*module test;
parameter size=7;
reg clk;
reg r;
wire [0:size]out;

Johnson_count xJohnson_count(clk,r,out);


initial begin 
		clk=1;
		r=0;
		#5 r=1;
		#5 r=0;
		#20 $finish;	
	end
always #2 clk=~clk;


endmodule*/
