module FPAddStage1(
  input         clock,
  input         reset,
  input  [31:0] io_a,
  input  [31:0] io_b,
  output        io_b_larger,
  output [7:0]  io_mant_shift,
  output [7:0]  io_exp,
  output [8:0]  io_manta,
  output [8:0]  io_mantb,
  output        io_sign,
  output        io_sub
);
  wire  _T; // @[FloatWrapper.scala 11:24]
  wire [7:0] _T_2; // @[FloatWrapper.scala 12:24]
  wire  _T_4; // @[FloatWrapper.scala 15:41]
  wire  _T_5; // @[FloatWrapper.scala 15:28]
  wire [22:0] _T_6; // @[FloatWrapper.scala 17:28]
  wire  _T_10; // @[FloatWrapper.scala 11:24]
  wire [7:0] _T_12; // @[FloatWrapper.scala 12:24]
  wire  _T_14; // @[FloatWrapper.scala 15:41]
  wire  _T_15; // @[FloatWrapper.scala 15:28]
  wire [22:0] _T_16; // @[FloatWrapper.scala 17:28]
  wire [8:0] ext_exp_a; // @[Cat.scala 29:58]
  wire [8:0] ext_exp_b; // @[Cat.scala 29:58]
  wire [8:0] exp_diff; // @[FPAdd.scala 43:30]
  reg  reg_b_larger; // @[FPAdd.scala 45:27]
  reg [31:0] _RAND_0;
  reg [7:0] reg_mant_shift; // @[FPAdd.scala 46:33]
  reg [31:0] _RAND_1;
  reg [7:0] reg_exp; // @[FPAdd.scala 47:26]
  reg [31:0] _RAND_2;
  reg [23:0] reg_manta; // @[FPAdd.scala 48:28]
  reg [31:0] _RAND_3;
  reg [23:0] reg_mantb; // @[FPAdd.scala 49:28]
  reg [31:0] _RAND_4;
  reg  reg_sign; // @[FPAdd.scala 50:23]
  reg [31:0] _RAND_5;
  reg  reg_sub; // @[FPAdd.scala 51:26]
  reg [31:0] _RAND_6;
  wire  _T_22; // @[FPAdd.scala 58:19]
  wire [7:0] _T_24; // @[FPAdd.scala 60:36]
  wire [7:0] _T_26; // @[FPAdd.scala 60:27]
  assign _T = io_a[31]; // @[FloatWrapper.scala 11:24]
  assign _T_2 = io_a[30:23]; // @[FloatWrapper.scala 12:24]
  assign _T_4 = _T_2 == 8'h0; // @[FloatWrapper.scala 15:41]
  assign _T_5 = _T_4 ? 1'h0 : 1'h1; // @[FloatWrapper.scala 15:28]
  assign _T_6 = io_a[22:0]; // @[FloatWrapper.scala 17:28]
  assign _T_10 = io_b[31]; // @[FloatWrapper.scala 11:24]
  assign _T_12 = io_b[30:23]; // @[FloatWrapper.scala 12:24]
  assign _T_14 = _T_12 == 8'h0; // @[FloatWrapper.scala 15:41]
  assign _T_15 = _T_14 ? 1'h0 : 1'h1; // @[FloatWrapper.scala 15:28]
  assign _T_16 = io_b[22:0]; // @[FloatWrapper.scala 17:28]
  assign ext_exp_a = {1'h0,_T_2}; // @[Cat.scala 29:58]
  assign ext_exp_b = {1'h0,_T_12}; // @[Cat.scala 29:58]
  assign exp_diff = ext_exp_a - ext_exp_b; // @[FPAdd.scala 43:30]
  assign _T_22 = exp_diff[8]; // @[FPAdd.scala 58:19]
  assign _T_24 = exp_diff[7:0]; // @[FPAdd.scala 60:36]
  assign _T_26 = 8'h0 - _T_24; // @[FPAdd.scala 60:27]
  assign io_b_larger = reg_b_larger; // @[FPAdd.scala 73:17]
  assign io_mant_shift = reg_mant_shift; // @[FPAdd.scala 72:19]
  assign io_exp = reg_exp; // @[FPAdd.scala 74:12]
  assign io_manta = reg_manta[8:0]; // @[FPAdd.scala 75:14]
  assign io_mantb = reg_mantb[8:0]; // @[FPAdd.scala 76:14]
  assign io_sign = reg_sign; // @[FPAdd.scala 77:13]
  assign io_sub = reg_sub; // @[FPAdd.scala 78:12]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  reg_b_larger = _RAND_0[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  reg_mant_shift = _RAND_1[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  reg_exp = _RAND_2[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  reg_manta = _RAND_3[23:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{`RANDOM}};
  reg_mantb = _RAND_4[23:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{`RANDOM}};
  reg_sign = _RAND_5[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_6 = {1{`RANDOM}};
  reg_sub = _RAND_6[0:0];
  `endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`endif // SYNTHESIS
  always @(posedge clock) begin
    reg_b_larger <= exp_diff[8];
    if (reset) begin
      reg_mant_shift <= 8'h0;
    end else if (_T_22) begin
      reg_mant_shift <= _T_26;
    end else begin
      reg_mant_shift <= _T_24;
    end
    if (reset) begin
      reg_exp <= 8'h0;
    end else if (_T_22) begin
      reg_exp <= _T_12;
    end else begin
      reg_exp <= _T_2;
    end
    reg_manta <= {_T_5,_T_6};
    reg_mantb <= {_T_15,_T_16};
    if (_T_22) begin
      reg_sign <= _T_10;
    end else begin
      reg_sign <= _T;
    end
    reg_sub <= _T ^ _T_10;
  end
endmodule
module FPAddStage2(
  input         clock,
  input  [23:0] io_manta_in,
  input  [23:0] io_mantb_in,
  input  [7:0]  io_exp_in,
  input  [7:0]  io_mant_shift,
  input         io_b_larger,
  input         io_sign_in,
  input         io_sub_in,
  output [8:0]  io_manta_out,
  output [8:0]  io_mantb_out,
  output [7:0]  io_exp_out,
  output        io_sign_out,
  output        io_sub_out
);
  wire [23:0] smaller_mant; // @[FPAdd.scala 106:24]
  wire  _T; // @[FPAdd.scala 114:42]
  wire [23:0] _T_1; // @[FPAdd.scala 115:53]
  reg [23:0] reg_manta; // @[FPAdd.scala 116:28]
  reg [31:0] _RAND_0;
  reg [23:0] reg_mantb; // @[FPAdd.scala 117:28]
  reg [31:0] _RAND_1;
  reg  reg_sign; // @[FPAdd.scala 118:27]
  reg [31:0] _RAND_2;
  reg  reg_sub; // @[FPAdd.scala 119:26]
  reg [31:0] _RAND_3;
  reg [7:0] reg_exp; // @[FPAdd.scala 120:26]
  reg [31:0] _RAND_4;
  assign smaller_mant = io_b_larger ? io_manta_in : io_mantb_in; // @[FPAdd.scala 106:24]
  assign _T = io_mant_shift > 8'h18; // @[FPAdd.scala 114:42]
  assign _T_1 = smaller_mant >> io_mant_shift; // @[FPAdd.scala 115:53]
  assign io_manta_out = reg_manta[8:0]; // @[FPAdd.scala 122:18]
  assign io_mantb_out = reg_mantb[8:0]; // @[FPAdd.scala 123:18]
  assign io_exp_out = reg_exp; // @[FPAdd.scala 126:16]
  assign io_sign_out = reg_sign; // @[FPAdd.scala 124:17]
  assign io_sub_out = reg_sub; // @[FPAdd.scala 125:16]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  reg_manta = _RAND_0[23:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  reg_mantb = _RAND_1[23:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  reg_sign = _RAND_2[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  reg_sub = _RAND_3[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{`RANDOM}};
  reg_exp = _RAND_4[7:0];
  `endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`endif // SYNTHESIS
  always @(posedge clock) begin
    if (io_b_larger) begin
      reg_manta <= io_mantb_in;
    end else begin
      reg_manta <= io_manta_in;
    end
    if (_T) begin
      reg_mantb <= 24'h0;
    end else begin
      reg_mantb <= _T_1;
    end
    reg_sign <= io_sign_in;
    reg_sub <= io_sub_in;
    reg_exp <= io_exp_in;
  end
endmodule
module FPAddStage3(
  input         clock,
  input         reset,
  input  [23:0] io_manta,
  input  [23:0] io_mantb,
  input  [7:0]  io_exp_in,
  input         io_sign_in,
  input         io_sub,
  output [8:0]  io_mant_out,
  output        io_sign_out,
  output [7:0]  io_exp_out
);
  wire [24:0] manta_ext; // @[Cat.scala 29:58]
  wire [24:0] mantb_ext; // @[Cat.scala 29:58]
  wire [24:0] _T_1; // @[FPAdd.scala 149:42]
  wire [24:0] _T_3; // @[FPAdd.scala 149:65]
  wire [24:0] mant_sum; // @[FPAdd.scala 149:23]
  reg [23:0] reg_mant; // @[FPAdd.scala 152:23]
  reg [31:0] _RAND_0;
  reg  reg_sign; // @[FPAdd.scala 153:23]
  reg [31:0] _RAND_1;
  reg [7:0] reg_exp; // @[FPAdd.scala 154:26]
  reg [31:0] _RAND_2;
  wire  _T_4; // @[FPAdd.scala 158:19]
  wire [23:0] _T_6; // @[FPAdd.scala 160:34]
  wire [23:0] _T_8; // @[FPAdd.scala 160:25]
  wire  _T_9; // @[FPAdd.scala 161:25]
  wire [23:0] _T_10; // @[FPAdd.scala 166:33]
  wire [7:0] _T_12; // @[FPAdd.scala 167:34]
  assign manta_ext = {1'h0,io_manta}; // @[Cat.scala 29:58]
  assign mantb_ext = {1'h0,io_mantb}; // @[Cat.scala 29:58]
  assign _T_1 = manta_ext - mantb_ext; // @[FPAdd.scala 149:42]
  assign _T_3 = manta_ext + mantb_ext; // @[FPAdd.scala 149:65]
  assign mant_sum = io_sub ? _T_1 : _T_3; // @[FPAdd.scala 149:23]
  assign _T_4 = mant_sum[24]; // @[FPAdd.scala 158:19]
  assign _T_6 = mant_sum[23:0]; // @[FPAdd.scala 160:34]
  assign _T_8 = 24'h0 - _T_6; // @[FPAdd.scala 160:25]
  assign _T_9 = io_sign_in == 1'h0; // @[FPAdd.scala 161:25]
  assign _T_10 = mant_sum[24:1]; // @[FPAdd.scala 166:33]
  assign _T_12 = io_exp_in + 8'h1; // @[FPAdd.scala 167:34]
  assign io_mant_out = reg_mant[8:0]; // @[FPAdd.scala 178:17]
  assign io_sign_out = reg_sign; // @[FPAdd.scala 176:17]
  assign io_exp_out = reg_exp; // @[FPAdd.scala 177:16]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  reg_mant = _RAND_0[23:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  reg_sign = _RAND_1[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  reg_exp = _RAND_2[7:0];
  `endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`endif // SYNTHESIS
  always @(posedge clock) begin
    if (_T_4) begin
      if (io_sub) begin
        reg_mant <= _T_8;
      end else begin
        reg_mant <= _T_10;
      end
    end else begin
      reg_mant <= _T_6;
    end
    if (_T_4) begin
      if (io_sub) begin
        reg_sign <= _T_9;
      end else begin
        reg_sign <= io_sign_in;
      end
    end else begin
      reg_sign <= io_sign_in;
    end
    if (reset) begin
      reg_exp <= 8'h0;
    end else if (_T_4) begin
      if (io_sub) begin
        reg_exp <= io_exp_in;
      end else begin
        reg_exp <= _T_12;
      end
    end else begin
      reg_exp <= io_exp_in;
    end
  end
endmodule
module FPAddStage4(
  input  [7:0]  io_exp_in,
  input  [23:0] io_mant_in,
  output [7:0]  io_exp_out,
  output [22:0] io_mant_out
);
  wire [15:0] _T; // @[Bitwise.scala 108:18]
  wire [7:0] _T_3; // @[Bitwise.scala 102:21]
  wire [15:0] _T_4; // @[Bitwise.scala 102:31]
  wire [7:0] _T_5; // @[Bitwise.scala 102:46]
  wire [15:0] _T_6; // @[Bitwise.scala 102:65]
  wire [15:0] _T_8; // @[Bitwise.scala 102:75]
  wire [15:0] _T_9; // @[Bitwise.scala 102:39]
  wire [11:0] _T_13; // @[Bitwise.scala 102:21]
  wire [15:0] _GEN_2; // @[Bitwise.scala 102:31]
  wire [15:0] _T_14; // @[Bitwise.scala 102:31]
  wire [11:0] _T_15; // @[Bitwise.scala 102:46]
  wire [15:0] _T_16; // @[Bitwise.scala 102:65]
  wire [15:0] _T_18; // @[Bitwise.scala 102:75]
  wire [15:0] _T_19; // @[Bitwise.scala 102:39]
  wire [13:0] _T_23; // @[Bitwise.scala 102:21]
  wire [15:0] _GEN_3; // @[Bitwise.scala 102:31]
  wire [15:0] _T_24; // @[Bitwise.scala 102:31]
  wire [13:0] _T_25; // @[Bitwise.scala 102:46]
  wire [15:0] _T_26; // @[Bitwise.scala 102:65]
  wire [15:0] _T_28; // @[Bitwise.scala 102:75]
  wire [15:0] _T_29; // @[Bitwise.scala 102:39]
  wire [14:0] _T_33; // @[Bitwise.scala 102:21]
  wire [15:0] _GEN_4; // @[Bitwise.scala 102:31]
  wire [15:0] _T_34; // @[Bitwise.scala 102:31]
  wire [14:0] _T_35; // @[Bitwise.scala 102:46]
  wire [15:0] _T_36; // @[Bitwise.scala 102:65]
  wire [15:0] _T_38; // @[Bitwise.scala 102:75]
  wire [15:0] _T_39; // @[Bitwise.scala 102:39]
  wire [7:0] _T_40; // @[Bitwise.scala 108:44]
  wire [3:0] _T_43; // @[Bitwise.scala 102:21]
  wire [7:0] _T_44; // @[Bitwise.scala 102:31]
  wire [3:0] _T_45; // @[Bitwise.scala 102:46]
  wire [7:0] _T_46; // @[Bitwise.scala 102:65]
  wire [7:0] _T_48; // @[Bitwise.scala 102:75]
  wire [7:0] _T_49; // @[Bitwise.scala 102:39]
  wire [5:0] _T_53; // @[Bitwise.scala 102:21]
  wire [7:0] _GEN_5; // @[Bitwise.scala 102:31]
  wire [7:0] _T_54; // @[Bitwise.scala 102:31]
  wire [5:0] _T_55; // @[Bitwise.scala 102:46]
  wire [7:0] _T_56; // @[Bitwise.scala 102:65]
  wire [7:0] _T_58; // @[Bitwise.scala 102:75]
  wire [7:0] _T_59; // @[Bitwise.scala 102:39]
  wire [6:0] _T_63; // @[Bitwise.scala 102:21]
  wire [7:0] _GEN_6; // @[Bitwise.scala 102:31]
  wire [7:0] _T_64; // @[Bitwise.scala 102:31]
  wire [6:0] _T_65; // @[Bitwise.scala 102:46]
  wire [7:0] _T_66; // @[Bitwise.scala 102:65]
  wire [7:0] _T_68; // @[Bitwise.scala 102:75]
  wire [7:0] _T_69; // @[Bitwise.scala 102:39]
  wire [23:0] _T_70; // @[Cat.scala 29:58]
  wire  _T_71; // @[OneHot.scala 47:40]
  wire  _T_72; // @[OneHot.scala 47:40]
  wire  _T_73; // @[OneHot.scala 47:40]
  wire  _T_74; // @[OneHot.scala 47:40]
  wire  _T_75; // @[OneHot.scala 47:40]
  wire  _T_76; // @[OneHot.scala 47:40]
  wire  _T_77; // @[OneHot.scala 47:40]
  wire  _T_78; // @[OneHot.scala 47:40]
  wire  _T_79; // @[OneHot.scala 47:40]
  wire  _T_80; // @[OneHot.scala 47:40]
  wire  _T_81; // @[OneHot.scala 47:40]
  wire  _T_82; // @[OneHot.scala 47:40]
  wire  _T_83; // @[OneHot.scala 47:40]
  wire  _T_84; // @[OneHot.scala 47:40]
  wire  _T_85; // @[OneHot.scala 47:40]
  wire  _T_86; // @[OneHot.scala 47:40]
  wire  _T_87; // @[OneHot.scala 47:40]
  wire  _T_88; // @[OneHot.scala 47:40]
  wire  _T_89; // @[OneHot.scala 47:40]
  wire  _T_90; // @[OneHot.scala 47:40]
  wire  _T_91; // @[OneHot.scala 47:40]
  wire  _T_92; // @[OneHot.scala 47:40]
  wire  _T_93; // @[OneHot.scala 47:40]
  wire [4:0] _T_95; // @[Mux.scala 47:69]
  wire [4:0] _T_96; // @[Mux.scala 47:69]
  wire [4:0] _T_97; // @[Mux.scala 47:69]
  wire [4:0] _T_98; // @[Mux.scala 47:69]
  wire [4:0] _T_99; // @[Mux.scala 47:69]
  wire [4:0] _T_100; // @[Mux.scala 47:69]
  wire [4:0] _T_101; // @[Mux.scala 47:69]
  wire [4:0] _T_102; // @[Mux.scala 47:69]
  wire [4:0] _T_103; // @[Mux.scala 47:69]
  wire [4:0] _T_104; // @[Mux.scala 47:69]
  wire [4:0] _T_105; // @[Mux.scala 47:69]
  wire [4:0] _T_106; // @[Mux.scala 47:69]
  wire [4:0] _T_107; // @[Mux.scala 47:69]
  wire [4:0] _T_108; // @[Mux.scala 47:69]
  wire [4:0] _T_109; // @[Mux.scala 47:69]
  wire [4:0] _T_110; // @[Mux.scala 47:69]
  wire [4:0] _T_111; // @[Mux.scala 47:69]
  wire [4:0] _T_112; // @[Mux.scala 47:69]
  wire [4:0] _T_113; // @[Mux.scala 47:69]
  wire [4:0] _T_114; // @[Mux.scala 47:69]
  wire [4:0] _T_115; // @[Mux.scala 47:69]
  wire [4:0] _T_116; // @[Mux.scala 47:69]
  wire [4:0] norm_shift; // @[Mux.scala 47:69]
  wire  _T_117; // @[FPAdd.scala 198:22]
  wire [54:0] _GEN_7; // @[FPAdd.scala 202:36]
  wire [54:0] _T_118; // @[FPAdd.scala 202:36]
  wire [22:0] _T_119; // @[FPAdd.scala 202:50]
  wire [7:0] _GEN_8; // @[FPAdd.scala 203:33]
  wire [7:0] _T_121; // @[FPAdd.scala 203:33]
  assign _T = io_mant_in[15:0]; // @[Bitwise.scala 108:18]
  assign _T_3 = _T[15:8]; // @[Bitwise.scala 102:21]
  assign _T_4 = {{8'd0}, _T_3}; // @[Bitwise.scala 102:31]
  assign _T_5 = _T[7:0]; // @[Bitwise.scala 102:46]
  assign _T_6 = {_T_5, 8'h0}; // @[Bitwise.scala 102:65]
  assign _T_8 = _T_6 & 16'hff00; // @[Bitwise.scala 102:75]
  assign _T_9 = _T_4 | _T_8; // @[Bitwise.scala 102:39]
  assign _T_13 = _T_9[15:4]; // @[Bitwise.scala 102:21]
  assign _GEN_2 = {{4'd0}, _T_13}; // @[Bitwise.scala 102:31]
  assign _T_14 = _GEN_2 & 16'hf0f; // @[Bitwise.scala 102:31]
  assign _T_15 = _T_9[11:0]; // @[Bitwise.scala 102:46]
  assign _T_16 = {_T_15, 4'h0}; // @[Bitwise.scala 102:65]
  assign _T_18 = _T_16 & 16'hf0f0; // @[Bitwise.scala 102:75]
  assign _T_19 = _T_14 | _T_18; // @[Bitwise.scala 102:39]
  assign _T_23 = _T_19[15:2]; // @[Bitwise.scala 102:21]
  assign _GEN_3 = {{2'd0}, _T_23}; // @[Bitwise.scala 102:31]
  assign _T_24 = _GEN_3 & 16'h3333; // @[Bitwise.scala 102:31]
  assign _T_25 = _T_19[13:0]; // @[Bitwise.scala 102:46]
  assign _T_26 = {_T_25, 2'h0}; // @[Bitwise.scala 102:65]
  assign _T_28 = _T_26 & 16'hcccc; // @[Bitwise.scala 102:75]
  assign _T_29 = _T_24 | _T_28; // @[Bitwise.scala 102:39]
  assign _T_33 = _T_29[15:1]; // @[Bitwise.scala 102:21]
  assign _GEN_4 = {{1'd0}, _T_33}; // @[Bitwise.scala 102:31]
  assign _T_34 = _GEN_4 & 16'h5555; // @[Bitwise.scala 102:31]
  assign _T_35 = _T_29[14:0]; // @[Bitwise.scala 102:46]
  assign _T_36 = {_T_35, 1'h0}; // @[Bitwise.scala 102:65]
  assign _T_38 = _T_36 & 16'haaaa; // @[Bitwise.scala 102:75]
  assign _T_39 = _T_34 | _T_38; // @[Bitwise.scala 102:39]
  assign _T_40 = io_mant_in[23:16]; // @[Bitwise.scala 108:44]
  assign _T_43 = _T_40[7:4]; // @[Bitwise.scala 102:21]
  assign _T_44 = {{4'd0}, _T_43}; // @[Bitwise.scala 102:31]
  assign _T_45 = _T_40[3:0]; // @[Bitwise.scala 102:46]
  assign _T_46 = {_T_45, 4'h0}; // @[Bitwise.scala 102:65]
  assign _T_48 = _T_46 & 8'hf0; // @[Bitwise.scala 102:75]
  assign _T_49 = _T_44 | _T_48; // @[Bitwise.scala 102:39]
  assign _T_53 = _T_49[7:2]; // @[Bitwise.scala 102:21]
  assign _GEN_5 = {{2'd0}, _T_53}; // @[Bitwise.scala 102:31]
  assign _T_54 = _GEN_5 & 8'h33; // @[Bitwise.scala 102:31]
  assign _T_55 = _T_49[5:0]; // @[Bitwise.scala 102:46]
  assign _T_56 = {_T_55, 2'h0}; // @[Bitwise.scala 102:65]
  assign _T_58 = _T_56 & 8'hcc; // @[Bitwise.scala 102:75]
  assign _T_59 = _T_54 | _T_58; // @[Bitwise.scala 102:39]
  assign _T_63 = _T_59[7:1]; // @[Bitwise.scala 102:21]
  assign _GEN_6 = {{1'd0}, _T_63}; // @[Bitwise.scala 102:31]
  assign _T_64 = _GEN_6 & 8'h55; // @[Bitwise.scala 102:31]
  assign _T_65 = _T_59[6:0]; // @[Bitwise.scala 102:46]
  assign _T_66 = {_T_65, 1'h0}; // @[Bitwise.scala 102:65]
  assign _T_68 = _T_66 & 8'haa; // @[Bitwise.scala 102:75]
  assign _T_69 = _T_64 | _T_68; // @[Bitwise.scala 102:39]
  assign _T_70 = {_T_39,_T_69}; // @[Cat.scala 29:58]
  assign _T_71 = _T_70[0]; // @[OneHot.scala 47:40]
  assign _T_72 = _T_70[1]; // @[OneHot.scala 47:40]
  assign _T_73 = _T_70[2]; // @[OneHot.scala 47:40]
  assign _T_74 = _T_70[3]; // @[OneHot.scala 47:40]
  assign _T_75 = _T_70[4]; // @[OneHot.scala 47:40]
  assign _T_76 = _T_70[5]; // @[OneHot.scala 47:40]
  assign _T_77 = _T_70[6]; // @[OneHot.scala 47:40]
  assign _T_78 = _T_70[7]; // @[OneHot.scala 47:40]
  assign _T_79 = _T_70[8]; // @[OneHot.scala 47:40]
  assign _T_80 = _T_70[9]; // @[OneHot.scala 47:40]
  assign _T_81 = _T_70[10]; // @[OneHot.scala 47:40]
  assign _T_82 = _T_70[11]; // @[OneHot.scala 47:40]
  assign _T_83 = _T_70[12]; // @[OneHot.scala 47:40]
  assign _T_84 = _T_70[13]; // @[OneHot.scala 47:40]
  assign _T_85 = _T_70[14]; // @[OneHot.scala 47:40]
  assign _T_86 = _T_70[15]; // @[OneHot.scala 47:40]
  assign _T_87 = _T_70[16]; // @[OneHot.scala 47:40]
  assign _T_88 = _T_70[17]; // @[OneHot.scala 47:40]
  assign _T_89 = _T_70[18]; // @[OneHot.scala 47:40]
  assign _T_90 = _T_70[19]; // @[OneHot.scala 47:40]
  assign _T_91 = _T_70[20]; // @[OneHot.scala 47:40]
  assign _T_92 = _T_70[21]; // @[OneHot.scala 47:40]
  assign _T_93 = _T_70[22]; // @[OneHot.scala 47:40]
  assign _T_95 = _T_93 ? 5'h16 : 5'h17; // @[Mux.scala 47:69]
  assign _T_96 = _T_92 ? 5'h15 : _T_95; // @[Mux.scala 47:69]
  assign _T_97 = _T_91 ? 5'h14 : _T_96; // @[Mux.scala 47:69]
  assign _T_98 = _T_90 ? 5'h13 : _T_97; // @[Mux.scala 47:69]
  assign _T_99 = _T_89 ? 5'h12 : _T_98; // @[Mux.scala 47:69]
  assign _T_100 = _T_88 ? 5'h11 : _T_99; // @[Mux.scala 47:69]
  assign _T_101 = _T_87 ? 5'h10 : _T_100; // @[Mux.scala 47:69]
  assign _T_102 = _T_86 ? 5'hf : _T_101; // @[Mux.scala 47:69]
  assign _T_103 = _T_85 ? 5'he : _T_102; // @[Mux.scala 47:69]
  assign _T_104 = _T_84 ? 5'hd : _T_103; // @[Mux.scala 47:69]
  assign _T_105 = _T_83 ? 5'hc : _T_104; // @[Mux.scala 47:69]
  assign _T_106 = _T_82 ? 5'hb : _T_105; // @[Mux.scala 47:69]
  assign _T_107 = _T_81 ? 5'ha : _T_106; // @[Mux.scala 47:69]
  assign _T_108 = _T_80 ? 5'h9 : _T_107; // @[Mux.scala 47:69]
  assign _T_109 = _T_79 ? 5'h8 : _T_108; // @[Mux.scala 47:69]
  assign _T_110 = _T_78 ? 5'h7 : _T_109; // @[Mux.scala 47:69]
  assign _T_111 = _T_77 ? 5'h6 : _T_110; // @[Mux.scala 47:69]
  assign _T_112 = _T_76 ? 5'h5 : _T_111; // @[Mux.scala 47:69]
  assign _T_113 = _T_75 ? 5'h4 : _T_112; // @[Mux.scala 47:69]
  assign _T_114 = _T_74 ? 5'h3 : _T_113; // @[Mux.scala 47:69]
  assign _T_115 = _T_73 ? 5'h2 : _T_114; // @[Mux.scala 47:69]
  assign _T_116 = _T_72 ? 5'h1 : _T_115; // @[Mux.scala 47:69]
  assign norm_shift = _T_71 ? 5'h0 : _T_116; // @[Mux.scala 47:69]
  assign _T_117 = io_mant_in == 24'h0; // @[FPAdd.scala 198:22]
  assign _GEN_7 = {{31'd0}, io_mant_in}; // @[FPAdd.scala 202:36]
  assign _T_118 = _GEN_7 << norm_shift; // @[FPAdd.scala 202:36]
  assign _T_119 = _T_118[22:0]; // @[FPAdd.scala 202:50]
  assign _GEN_8 = {{3'd0}, norm_shift}; // @[FPAdd.scala 203:33]
  assign _T_121 = io_exp_in - _GEN_8; // @[FPAdd.scala 203:33]
  assign io_exp_out = _T_117 ? 8'h0 : _T_121; // @[FPAdd.scala 200:20 FPAdd.scala 203:20]
  assign io_mant_out = _T_117 ? 23'h0 : _T_119; // @[FPAdd.scala 199:21 FPAdd.scala 202:21]
endmodule
module FPAdd32(
  input         clock,
  input         reset,
  input  [31:0] io_a,
  input  [31:0] io_b,
  output [31:0] io_res
);
  wire  stage1_clock; // @[FPAdd.scala 216:24]
  wire  stage1_reset; // @[FPAdd.scala 216:24]
  wire [31:0] stage1_io_a; // @[FPAdd.scala 216:24]
  wire [31:0] stage1_io_b; // @[FPAdd.scala 216:24]
  wire  stage1_io_b_larger; // @[FPAdd.scala 216:24]
  wire [7:0] stage1_io_mant_shift; // @[FPAdd.scala 216:24]
  wire [7:0] stage1_io_exp; // @[FPAdd.scala 216:24]
  wire [8:0] stage1_io_manta; // @[FPAdd.scala 216:24]
  wire [8:0] stage1_io_mantb; // @[FPAdd.scala 216:24]
  wire  stage1_io_sign; // @[FPAdd.scala 216:24]
  wire  stage1_io_sub; // @[FPAdd.scala 216:24]
  wire  stage2_clock; // @[FPAdd.scala 221:24]
  wire [23:0] stage2_io_manta_in; // @[FPAdd.scala 221:24]
  wire [23:0] stage2_io_mantb_in; // @[FPAdd.scala 221:24]
  wire [7:0] stage2_io_exp_in; // @[FPAdd.scala 221:24]
  wire [7:0] stage2_io_mant_shift; // @[FPAdd.scala 221:24]
  wire  stage2_io_b_larger; // @[FPAdd.scala 221:24]
  wire  stage2_io_sign_in; // @[FPAdd.scala 221:24]
  wire  stage2_io_sub_in; // @[FPAdd.scala 221:24]
  wire [8:0] stage2_io_manta_out; // @[FPAdd.scala 221:24]
  wire [8:0] stage2_io_mantb_out; // @[FPAdd.scala 221:24]
  wire [7:0] stage2_io_exp_out; // @[FPAdd.scala 221:24]
  wire  stage2_io_sign_out; // @[FPAdd.scala 221:24]
  wire  stage2_io_sub_out; // @[FPAdd.scala 221:24]
  wire  stage3_clock; // @[FPAdd.scala 231:24]
  wire  stage3_reset; // @[FPAdd.scala 231:24]
  wire [23:0] stage3_io_manta; // @[FPAdd.scala 231:24]
  wire [23:0] stage3_io_mantb; // @[FPAdd.scala 231:24]
  wire [7:0] stage3_io_exp_in; // @[FPAdd.scala 231:24]
  wire  stage3_io_sign_in; // @[FPAdd.scala 231:24]
  wire  stage3_io_sub; // @[FPAdd.scala 231:24]
  wire [8:0] stage3_io_mant_out; // @[FPAdd.scala 231:24]
  wire  stage3_io_sign_out; // @[FPAdd.scala 231:24]
  wire [7:0] stage3_io_exp_out; // @[FPAdd.scala 231:24]
  wire [7:0] stage4_io_exp_in; // @[FPAdd.scala 239:24]
  wire [23:0] stage4_io_mant_in; // @[FPAdd.scala 239:24]
  wire [7:0] stage4_io_exp_out; // @[FPAdd.scala 239:24]
  wire [22:0] stage4_io_mant_out; // @[FPAdd.scala 239:24]
  wire [8:0] _T; // @[Cat.scala 29:58]
  FPAddStage1 stage1 ( // @[FPAdd.scala 216:24]
    .clock(stage1_clock),
    .reset(stage1_reset),
    .io_a(stage1_io_a),
    .io_b(stage1_io_b),
    .io_b_larger(stage1_io_b_larger),
    .io_mant_shift(stage1_io_mant_shift),
    .io_exp(stage1_io_exp),
    .io_manta(stage1_io_manta),
    .io_mantb(stage1_io_mantb),
    .io_sign(stage1_io_sign),
    .io_sub(stage1_io_sub)
  );
  FPAddStage2 stage2 ( // @[FPAdd.scala 221:24]
    .clock(stage2_clock),
    .io_manta_in(stage2_io_manta_in),
    .io_mantb_in(stage2_io_mantb_in),
    .io_exp_in(stage2_io_exp_in),
    .io_mant_shift(stage2_io_mant_shift),
    .io_b_larger(stage2_io_b_larger),
    .io_sign_in(stage2_io_sign_in),
    .io_sub_in(stage2_io_sub_in),
    .io_manta_out(stage2_io_manta_out),
    .io_mantb_out(stage2_io_mantb_out),
    .io_exp_out(stage2_io_exp_out),
    .io_sign_out(stage2_io_sign_out),
    .io_sub_out(stage2_io_sub_out)
  );
  FPAddStage3 stage3 ( // @[FPAdd.scala 231:24]
    .clock(stage3_clock),
    .reset(stage3_reset),
    .io_manta(stage3_io_manta),
    .io_mantb(stage3_io_mantb),
    .io_exp_in(stage3_io_exp_in),
    .io_sign_in(stage3_io_sign_in),
    .io_sub(stage3_io_sub),
    .io_mant_out(stage3_io_mant_out),
    .io_sign_out(stage3_io_sign_out),
    .io_exp_out(stage3_io_exp_out)
  );
  FPAddStage4 stage4 ( // @[FPAdd.scala 239:24]
    .io_exp_in(stage4_io_exp_in),
    .io_mant_in(stage4_io_mant_in),
    .io_exp_out(stage4_io_exp_out),
    .io_mant_out(stage4_io_mant_out)
  );
  assign _T = {stage3_io_sign_out,stage4_io_exp_out}; // @[Cat.scala 29:58]
  assign io_res = {_T,stage4_io_mant_out}; // @[FPAdd.scala 244:12]
  assign stage1_clock = clock;
  assign stage1_reset = reset;
  assign stage1_io_a = io_a; // @[FPAdd.scala 218:17]
  assign stage1_io_b = io_b; // @[FPAdd.scala 219:17]
  assign stage2_clock = clock;
  assign stage2_io_manta_in = {{15'd0}, stage1_io_manta}; // @[FPAdd.scala 223:24]
  assign stage2_io_mantb_in = {{15'd0}, stage1_io_mantb}; // @[FPAdd.scala 224:24]
  assign stage2_io_exp_in = stage1_io_exp; // @[FPAdd.scala 225:22]
  assign stage2_io_mant_shift = stage1_io_mant_shift; // @[FPAdd.scala 229:26]
  assign stage2_io_b_larger = stage1_io_b_larger; // @[FPAdd.scala 228:24]
  assign stage2_io_sign_in = stage1_io_sign; // @[FPAdd.scala 226:23]
  assign stage2_io_sub_in = stage1_io_sub; // @[FPAdd.scala 227:22]
  assign stage3_clock = clock;
  assign stage3_reset = reset;
  assign stage3_io_manta = {{15'd0}, stage2_io_manta_out}; // @[FPAdd.scala 233:21]
  assign stage3_io_mantb = {{15'd0}, stage2_io_mantb_out}; // @[FPAdd.scala 234:21]
  assign stage3_io_exp_in = stage2_io_exp_out; // @[FPAdd.scala 235:22]
  assign stage3_io_sign_in = stage2_io_sign_out; // @[FPAdd.scala 236:23]
  assign stage3_io_sub = stage2_io_sub_out; // @[FPAdd.scala 237:19]
  assign stage4_io_exp_in = stage3_io_exp_out; // @[FPAdd.scala 241:22]
  assign stage4_io_mant_in = {{15'd0}, stage3_io_mant_out}; // @[FPAdd.scala 242:23]
endmodule
