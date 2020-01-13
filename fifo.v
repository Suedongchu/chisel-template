module fifo(
  input         clock,
  input         reset,
  input  [15:0] io_dataIn,
  output [15:0] io_dataOut,
  input         io_writeFlag,
  input         io_readFlag,
  output        io_full,
  output        io_empty
);
  reg [15:0] mem [0:7]; // @[fifo.scala 16:16]
  reg [31:0] _RAND_0;
  wire [15:0] mem__T_4_data; // @[fifo.scala 16:16]
  wire [2:0] mem__T_4_addr; // @[fifo.scala 16:16]
  wire [15:0] mem__T_29_data; // @[fifo.scala 16:16]
  wire [2:0] mem__T_29_addr; // @[fifo.scala 16:16]
  wire [15:0] mem__T_9_data; // @[fifo.scala 16:16]
  wire [2:0] mem__T_9_addr; // @[fifo.scala 16:16]
  wire  mem__T_9_mask; // @[fifo.scala 16:16]
  wire  mem__T_9_en; // @[fifo.scala 16:16]
  wire [15:0] mem__T_18_data; // @[fifo.scala 16:16]
  wire [2:0] mem__T_18_addr; // @[fifo.scala 16:16]
  wire  mem__T_18_mask; // @[fifo.scala 16:16]
  wire  mem__T_18_en; // @[fifo.scala 16:16]
  reg [3:0] count; // @[fifo.scala 15:22]
  reg [31:0] _RAND_1;
  reg [2:0] wPointer; // @[fifo.scala 17:25]
  reg [31:0] _RAND_2;
  reg [2:0] rPointer; // @[fifo.scala 18:25]
  reg [31:0] _RAND_3;
  reg [15:0] dataOut; // @[fifo.scala 19:24]
  reg [31:0] _RAND_4;
  wire  _T_2; // @[fifo.scala 25:32]
  wire  _T_3; // @[fifo.scala 26:16]
  wire  _T_5; // @[fifo.scala 22:17]
  wire [2:0] _T_7; // @[fifo.scala 22:46]
  wire  _T_10; // @[fifo.scala 22:17]
  wire [2:0] _T_12; // @[fifo.scala 22:46]
  wire  _GEN_3; // @[fifo.scala 26:25]
  wire  _T_15; // @[fifo.scala 33:55]
  wire  _T_16; // @[fifo.scala 33:40]
  wire  _T_17; // @[fifo.scala 35:16]
  wire [3:0] _T_24; // @[fifo.scala 38:22]
  wire  _T_25; // @[fifo.scala 40:29]
  wire  _T_27; // @[fifo.scala 40:41]
  wire  _T_28; // @[fifo.scala 41:16]
  wire [3:0] _T_35; // @[fifo.scala 44:22]
  wire  _GEN_24; // @[fifo.scala 40:68]
  wire  _GEN_31; // @[fifo.scala 33:68]
  wire  _GEN_38; // @[fifo.scala 33:68]
  assign mem__T_4_addr = rPointer;
  assign mem__T_4_data = mem[mem__T_4_addr]; // @[fifo.scala 16:16]
  assign mem__T_29_addr = rPointer;
  assign mem__T_29_data = mem[mem__T_29_addr]; // @[fifo.scala 16:16]
  assign mem__T_9_data = io_dataIn;
  assign mem__T_9_addr = wPointer;
  assign mem__T_9_mask = 1'h1;
  assign mem__T_9_en = _T_2 & _GEN_3;
  assign mem__T_18_data = io_dataIn;
  assign mem__T_18_addr = wPointer;
  assign mem__T_18_mask = 1'h1;
  assign mem__T_18_en = _T_2 ? 1'h0 : _GEN_31;
  assign _T_2 = io_writeFlag & io_readFlag; // @[fifo.scala 25:32]
  assign _T_3 = count == 4'h0; // @[fifo.scala 26:16]
  assign _T_5 = rPointer == 3'h7; // @[fifo.scala 22:17]
  assign _T_7 = rPointer + 3'h1; // @[fifo.scala 22:46]
  assign _T_10 = wPointer == 3'h7; // @[fifo.scala 22:17]
  assign _T_12 = wPointer + 3'h1; // @[fifo.scala 22:46]
  assign _GEN_3 = _T_3 ? 1'h0 : 1'h1; // @[fifo.scala 26:25]
  assign _T_15 = io_readFlag == 1'h0; // @[fifo.scala 33:55]
  assign _T_16 = io_writeFlag & _T_15; // @[fifo.scala 33:40]
  assign _T_17 = count < 4'h8; // @[fifo.scala 35:16]
  assign _T_24 = count + 4'h1; // @[fifo.scala 38:22]
  assign _T_25 = io_writeFlag == 1'h0; // @[fifo.scala 40:29]
  assign _T_27 = _T_25 & io_readFlag; // @[fifo.scala 40:41]
  assign _T_28 = count > 4'h0; // @[fifo.scala 41:16]
  assign _T_35 = count - 4'h1; // @[fifo.scala 44:22]
  assign _GEN_24 = _T_27 & _T_28; // @[fifo.scala 40:68]
  assign _GEN_31 = _T_16 & _T_17; // @[fifo.scala 33:68]
  assign _GEN_38 = _T_16 ? 1'h0 : _GEN_24; // @[fifo.scala 33:68]
  assign io_dataOut = dataOut; // @[fifo.scala 52:14]
  assign io_full = 4'h8 == count; // @[fifo.scala 53:11]
  assign io_empty = count == 4'h0; // @[fifo.scala 54:12]
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
  _RAND_0 = {1{`RANDOM}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 8; initvar = initvar+1)
    mem[initvar] = _RAND_0[15:0];
  `endif // RANDOMIZE_MEM_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  count = _RAND_1[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  wPointer = _RAND_2[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  rPointer = _RAND_3[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{`RANDOM}};
  dataOut = _RAND_4[15:0];
  `endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`endif // SYNTHESIS
  always @(posedge clock) begin
    if(mem__T_9_en & mem__T_9_mask) begin
      mem[mem__T_9_addr] <= mem__T_9_data; // @[fifo.scala 16:16]
    end
    if(mem__T_18_en & mem__T_18_mask) begin
      mem[mem__T_18_addr] <= mem__T_18_data; // @[fifo.scala 16:16]
    end
    if (reset) begin
      count <= 4'h0;
    end else if (!(_T_2)) begin
      if (_T_16) begin
        if (_T_17) begin
          count <= _T_24;
        end
      end else if (_T_27) begin
        if (_T_28) begin
          count <= _T_35;
        end
      end
    end
    if (reset) begin
      wPointer <= 3'h0;
    end else if (_T_2) begin
      if (!(_T_3)) begin
        if (_T_10) begin
          wPointer <= 3'h0;
        end else begin
          wPointer <= _T_12;
        end
      end
    end else if (_T_16) begin
      if (_T_17) begin
        if (_T_10) begin
          wPointer <= 3'h0;
        end else begin
          wPointer <= _T_12;
        end
      end
    end
    if (reset) begin
      rPointer <= 3'h0;
    end else if (_T_2) begin
      if (!(_T_3)) begin
        if (_T_5) begin
          rPointer <= 3'h0;
        end else begin
          rPointer <= _T_7;
        end
      end
    end else if (!(_T_16)) begin
      if (_T_27) begin
        if (_T_28) begin
          if (_T_5) begin
            rPointer <= 3'h0;
          end else begin
            rPointer <= _T_7;
          end
        end
      end
    end
    if (reset) begin
      dataOut <= 16'h0;
    end else if (_T_2) begin
      if (_T_3) begin
        dataOut <= io_dataIn;
      end else begin
        dataOut <= mem__T_4_data;
      end
    end else if (_T_16) begin
      dataOut <= 16'h0;
    end else if (_T_27) begin
      if (_T_28) begin
        dataOut <= mem__T_29_data;
      end else begin
        dataOut <= 16'h0;
      end
    end else begin
      dataOut <= 16'h0;
    end
  end
endmodule
