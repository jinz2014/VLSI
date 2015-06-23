
module Johnson_count ( SCANINPORT, SCANOUTPORT, SE, clk, r, out );
  output [0:7] out;
  input SCANINPORT, SE, clk, r;
  output SCANOUTPORT;
  wire   n15, n17, n34, n35, n36, n37, n38, n39, n40;

  INVX0 U10 ( .INP(r), .ZN(n15) );
  SDFFARX1 \out_reg[7]  ( .D(out[6]), .SI(n34), .SE(SE), .CLK(clk), .RSTB(n15), 
        .Q(out[7]), .QN(n17) );
  SDFFARX1 \out_reg[0]  ( .D(n17), .SI(SCANINPORT), .SE(SE), .CLK(clk), .RSTB(
        n15), .Q(out[0]), .QN(n40) );
  SDFFARX1 \out_reg[6]  ( .D(out[5]), .SI(n35), .SE(SE), .CLK(clk), .RSTB(n15), 
        .Q(out[6]), .QN(n34) );
  SDFFARX1 \out_reg[5]  ( .D(out[4]), .SI(n36), .SE(SE), .CLK(clk), .RSTB(n15), 
        .Q(out[5]), .QN(n35) );
  SDFFARX1 \out_reg[4]  ( .D(out[3]), .SI(n37), .SE(SE), .CLK(clk), .RSTB(n15), 
        .Q(out[4]), .QN(n36) );
  SDFFARX1 \out_reg[3]  ( .D(out[2]), .SI(n38), .SE(SE), .CLK(clk), .RSTB(n15), 
        .Q(out[3]), .QN(n37) );
  SDFFARX1 \out_reg[2]  ( .D(out[1]), .SI(n39), .SE(SE), .CLK(clk), .RSTB(n15), 
        .Q(out[2]), .QN(n38) );
  SDFFARX1 \out_reg[1]  ( .D(out[0]), .SI(n40), .SE(SE), .CLK(clk), .RSTB(n15), 
        .Q(out[1]), .QN(n39) );
  NBUFFX2 U12 ( .INP(out[7]), .Z(SCANOUTPORT) );
endmodule

