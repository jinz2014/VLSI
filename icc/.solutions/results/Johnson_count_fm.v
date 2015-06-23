//
// Milkyway Hierarchical Verilog Dump:
// Generated on 09/07/2010 at 16:03:50
// Design Generated by Consolidated Verilog Reader
// File produced by Consolidated Verilog Writer
// Library Name :COUNT
// Cell Name    :Johnson_count
// Hierarchy delimiter:'/'
//


module Johnson_count (out , SCANOUTPORT , r , clk , SE , SCANINPORT );
output [0:7] out ;
output SCANOUTPORT ;
input  r ;
input  clk ;
input  SE ;
input  SCANINPORT ;



NBUFFX2 U12 (.INP ( n40 ) , .Z ( n16 ) ) ;
DELLN1X2 U11 (.Z ( n14 ) , .INP ( SE ) ) ;
NBUFFX2 U9 (.INP ( n39 ) , .Z ( n13 ) ) ;
NBUFFX2 U8 (.INP ( n38 ) , .Z ( n12 ) ) ;
NBUFFX2 U7 (.INP ( n37 ) , .Z ( n11 ) ) ;
NBUFFX2 U6 (.INP ( n36 ) , .Z ( n10 ) ) ;
NBUFFX2 U5 (.INP ( n35 ) , .Z ( n9 ) ) ;
NBUFFX2 U4 (.Z ( n8 ) , .INP ( SCANINPORT ) ) ;
NBUFFX2 U3 (.INP ( n17 ) , .Z ( n7 ) ) ;
NBUFFX2 U2 (.INP ( n34 ) , .Z ( n6 ) ) ;
INVX16 INVX32_BC_1 (.INP ( clk_BC ) , .ZN ( clk_BC_1 ) ) ;
INVX32 INVX32_BC (.INP ( clk ) , .ZN ( clk_BC ) ) ;
NBUFFX2 U1 (.INP ( out[7] ) , .Z ( SCANOUTPORT ) ) ;
INVX0 U10 (.ZN ( n15 ) , .INP ( r ) ) ;
SDFFARX1 \out_reg[7] (.QN ( n17 ) , .Q ( out[7] ) , .CLK ( clk_BC_1 ) 
    , .RSTB ( n15 ) , .SE ( n14 ) , .SI ( n6 ) , .D ( out[6] ) ) ;
SDFFARX1 \out_reg[0] (.QN ( n40 ) , .Q ( out[0] ) , .CLK ( clk_BC_1 ) 
    , .RSTB ( n15 ) , .SE ( n14 ) , .SI ( n8 ) , .D ( n7 ) ) ;
SDFFARX1 \out_reg[6] (.QN ( n34 ) , .Q ( out[6] ) , .CLK ( clk_BC_1 ) 
    , .RSTB ( n15 ) , .SE ( n14 ) , .SI ( n9 ) , .D ( out[5] ) ) ;
SDFFARX1 \out_reg[5] (.QN ( n35 ) , .Q ( out[5] ) , .CLK ( clk_BC_1 ) 
    , .RSTB ( n15 ) , .SE ( n14 ) , .SI ( n10 ) , .D ( out[4] ) ) ;
SDFFARX1 \out_reg[4] (.QN ( n36 ) , .Q ( out[4] ) , .CLK ( clk_BC_1 ) 
    , .RSTB ( n15 ) , .SE ( n14 ) , .SI ( n11 ) , .D ( out[3] ) ) ;
SDFFARX1 \out_reg[3] (.QN ( n37 ) , .Q ( out[3] ) , .CLK ( clk_BC_1 ) 
    , .RSTB ( n15 ) , .SE ( n14 ) , .SI ( n12 ) , .D ( out[2] ) ) ;
SDFFARX1 \out_reg[2] (.QN ( n38 ) , .Q ( out[2] ) , .CLK ( clk_BC_1 ) 
    , .RSTB ( n15 ) , .SE ( n14 ) , .SI ( n13 ) , .D ( out[1] ) ) ;
SDFFARX1 \out_reg[1] (.QN ( n39 ) , .Q ( out[1] ) , .CLK ( clk_BC_1 ) 
    , .RSTB ( n15 ) , .SE ( n14 ) , .SI ( n16 ) , .D ( out[0] ) ) ;
endmodule


