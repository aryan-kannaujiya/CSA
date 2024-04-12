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
   reg [3:0] ui_io(A);
   reg [3:0] ui_io(B);
   reg [1:0] ui_io(cin);
   wire [3:0] uo_out(S);
   wire [1:0] uo_out(cout);

  // Replace tt_um_example with your module name:
  tt_um_carry_select user_project (

      // Include power ports for the Gate Level test:
`ifdef GL_TEST
      .VPWR(1'b1),
      .VGND(1'b0),
`endif

     .ui_io(A),    // Dedicated inputs
     .ui_io(B),    // Dedicated inputs
     .ui_io(cin),    // Dedicated inputs
     .uo_out(cout,    // Dedicated outputs
     .uo_out(S),   // Dedicated outputs
      .clk(clk),      // clock
  );

endmodule
