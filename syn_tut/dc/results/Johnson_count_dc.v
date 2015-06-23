
module Johnson_count_1 ( clk, r, out );
  output [0:7] out;
  input clk, r;
  wire   n1, n3;

  DFFARX1 \out_reg[7]  ( .D(out[6]), .CLK(clk), .RSTB(n1), .Q(out[7]), .QN(n3)
         );
  DFFARX1 \out_reg[0]  ( .D(n3), .CLK(clk), .RSTB(n1), .Q(out[0]) );
  DFFARX1 \out_reg[1]  ( .D(out[0]), .CLK(clk), .RSTB(n1), .Q(out[1]) );
  DFFARX1 \out_reg[2]  ( .D(out[1]), .CLK(clk), .RSTB(n1), .Q(out[2]) );
  DFFARX1 \out_reg[3]  ( .D(out[2]), .CLK(clk), .RSTB(n1), .Q(out[3]) );
  DFFARX1 \out_reg[4]  ( .D(out[3]), .CLK(clk), .RSTB(n1), .Q(out[4]) );
  DFFARX1 \out_reg[5]  ( .D(out[4]), .CLK(clk), .RSTB(n1), .Q(out[5]) );
  DFFARX1 \out_reg[6]  ( .D(out[5]), .CLK(clk), .RSTB(n1), .Q(out[6]) );
  INVX0 U3 ( .INP(r), .ZN(n1) );
endmodule

