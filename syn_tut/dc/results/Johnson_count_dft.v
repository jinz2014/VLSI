
module Johnson_count ( SCANINPORT, SCANOUTPORT, SE, clk, r, out );
  output [0:7] out;
  input SCANINPORT, SE, clk, r;
  output SCANOUTPORT;
  wire   n8, n10, n20, n21, n22, n23, n24, n25, n26, n28;

  INVX0 U10 ( .INP(r), .ZN(n8) );
  SDFFARX1 \out_reg[7]  ( .D(out[6]), .SI(n20), .SE(SE), .CLK(clk), .RSTB(n8), 
        .Q(out[7]), .QN(n10) );
  SDFFARX1 \out_reg[0]  ( .D(n10), .SI(SCANINPORT), .SE(SE), .CLK(clk), .RSTB(
        n8), .Q(out[0]), .QN(n26) );
  SDFFARX1 \out_reg[6]  ( .D(out[5]), .SI(n21), .SE(SE), .CLK(clk), .RSTB(n8), 
        .Q(out[6]), .QN(n20) );
  SDFFARX1 \out_reg[5]  ( .D(out[4]), .SI(n22), .SE(SE), .CLK(clk), .RSTB(n8), 
        .Q(out[5]), .QN(n21) );
  SDFFARX1 \out_reg[4]  ( .D(out[3]), .SI(n23), .SE(SE), .CLK(clk), .RSTB(n8), 
        .Q(out[4]), .QN(n22) );
  SDFFARX1 \out_reg[3]  ( .D(out[2]), .SI(n24), .SE(SE), .CLK(clk), .RSTB(n8), 
        .Q(out[3]), .QN(n23) );
  SDFFARX1 \out_reg[2]  ( .D(out[1]), .SI(n25), .SE(SE), .CLK(clk), .RSTB(n8), 
        .Q(out[2]), .QN(n24) );
  SDFFARX1 \out_reg[1]  ( .D(out[0]), .SI(n26), .SE(SE), .CLK(clk), .RSTB(n8), 
        .Q(out[1]), .QN(n25) );
  INVX0 U12 ( .INP(n28), .ZN(SCANOUTPORT) );
  INVX2 U13 ( .INP(out[7]), .ZN(n28) );
endmodule

