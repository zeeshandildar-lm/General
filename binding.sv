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
 
module SVA_dummy (input [7:0] out, in,
                  input x,
                  input wr, rd, clk, rst_n);
  
  ASSERTION1_NAME:
  `assert_async_rst(!rst_n |-> ...
                    
  ASSERTION2_NAME:
  `assert_clk (x > 1 |-> out);
  ...
 
endmodule : SVA_dummy
                    
module TB();
  logic [7:0] out;
  logic x;
  logic wr, rd, clk, rst;
  logic [7:0] in;
  
  //Instantiation
  
  DUT_dummy DUT_U1 (.*);
  
  //Binding with SVA using implicit port connection
  bind DUT_dummy : DUT_U1 SVA_dummy sva (.*); // bind <name of module>: hierarchical path to the instance <name of other module> inst_name(.second_module_signal(first_module_signa));
  ...
  ...
endmodule : TB
