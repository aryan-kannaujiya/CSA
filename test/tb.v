`default_nettype none `timescale 1ns / 1ps

/* This testbench just instantiates the module and makes some convenient wires
   that can be driven / tested by the cocotb test.py.
*/
module tb ();

  // Dump the signals to a VCD file. You can view it with gtkwave.
  initial begin
    $dumpfile("tb.vcd");
    $dumpvars(0, tb);
    #1;
  end

  // Wire up the inputs and outputs:
  reg clk;
   reg [3:0] A;
   reg [3:0] B;
   reg [1:0] cin;
   wire [3:0] S;
   wire [1:0] cout;

  // Replace tt_um_example with your module name:
  tt_um_carry_select user_project (

      // Include power ports for the Gate Level test:
`ifdef GL_TEST
      .VPWR(1'b1),
      .VGND(1'b0),
`endif

     .A,    // Dedicated inputs
     .B,    // Dedicated inputs
     .cin,    // Dedicated inputs
     .cout,    // Dedicated inputs
     .S,   // Dedicated outputs
      .clk    (clk),      // clock
  );

endmodule
