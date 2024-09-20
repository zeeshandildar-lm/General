// To bind other modules e.g coverage/SVA system verilog binding can be used as follows
module DUT_dummy (output logic [7:0] out,
                  output logic x,
                  input logic wr, rd, clk, rst,
                  input logic [7:0] in);
  
  //DUT Logic
  ...
  ...
  ...
  
endmodule : DUT_dummy
 
module coverage_mod (input [7:0] out, in,
                  input x,
                  input wr, rd, clk, rst_n);
  
  ASSERTION1_NAME:
  `assert_async_rst(!rst_n |-> ...
                    
  ASSERTION2_NAME:
  `assert_clk (x > 1 |-> out);
  ...
 
endmodule : coverage_mod
                    
module TB();
  logic [7:0] out;
  logic x;
  logic wr, rd, clk, rst;
  logic [7:0] in;
  
  //Instantiation
  
  DUT_dummy DUT_U1 (.*);
  
  //Binding with coverage module using implicit port connection
                                    
  bind <name_of_module_to_bind_with> <coverage_module_name> <instanace_name> (.<coverage_module_ports(dut_module_ports));
endmodule : TB
