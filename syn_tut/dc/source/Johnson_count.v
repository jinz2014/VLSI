module Johnson_count(clk, r, out);
parameter size=7;
input clk;
input r;
output [0:size]out;
reg [0:size]out;

always @ (posedge clk or posedge r)
	begin
		if (r) 
			out= 8'b0000_0000;
		else
			out={~out[size],out[0:size-1]};   
	end

endmodule




/*//############################
module test;
parameter size=7;
reg clk;
reg r;
wire [0:size]out;

Johnson_count xJohnson_count(clk,r,out);

//initial xJohnson_count.size=size;
initial begin 
		clk=1;
		r=0;
		#5 r=1;
		#5 r=0;
		#20 $finish;	
	end
//initial $monitor($time,,"[%b]\t%b\tq=%b",clk,r,q);
always #2 clk=~clk;


endmodule*/
