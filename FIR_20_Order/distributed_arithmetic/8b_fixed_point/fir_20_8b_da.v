// -------------------------------------------------------------
//
// Module: fir_20_8b_da
// Generated by MATLAB(R) 9.12 and Filter Design HDL Coder 3.1.11.
// Generated on: 2023-06-22 00:02:42
// -------------------------------------------------------------

// -------------------------------------------------------------
// HDL Code Generation Options:
//
// FIRAdderStyle: tree
// MultiplierInputPipeline: 1
// MultiplierOutputPipeline: 1
// OptimizeForHDL: on
// TargetDirectory: W:\Nikos\UTh\Σχεδίαση Επεξεργαστών\Project\FIR_20_Order\distributed_arithmetic\8b_fixed_point
// AddPipelineRegisters: on
// Name: fir_20_8b_da
// DALUTPartition: [6  6  5]
// InputDataType: numerictype(1,8,0)
// TargetLanguage: Verilog
// TestBenchName: fir_20_8b_da_tb
// TestBenchStimulus: impulse step ramp chirp noise 

// Filter Specifications:
//
// Sample Rate     : 46 kHz
// Response        : Lowpass
// Specification   : N,Fp,Fst,Ap
// Stopband Edge   : 9.6 kHz
// Filter Order    : 20
// Passband Edge   : 8 kHz
// Passband Ripple : 60 dB
// -------------------------------------------------------------

// -------------------------------------------------------------
// HDL Implementation    : Distributed arithmetic (DA)
// Folding Factor        : 8
// LUT Address Width     : 6
// Total LUT Size (bits) : 1376
// -------------------------------------------------------------
// Filter Settings:
//
// Discrete-Time FIR Filter (real)
// -------------------------------
// Filter Structure  : Direct-Form FIR
// Filter Length     : 21
// Stable            : Yes
// Linear Phase      : Yes (Type 1)
// Arithmetic        : fixed
// Numerator         : s8,8 -> [-5.000000e-01 5.000000e-01)
// -------------------------------------------------------------




`timescale 1 ns / 1 ns

module fir_20_8b_da
               (
                clk,
                clk_enable,
                reset,
                filter_in,
                filter_out
                );

  input   clk; 
  input   clk_enable; 
  input   reset; 
  input   signed [7:0] filter_in; //sfix8
  output  signed [20:0] filter_out; //sfix21_En8

////////////////////////////////////////////////////////////////
//Module Architecture: fir_20_8b_da
////////////////////////////////////////////////////////////////
  // Local Functions
  // Type Definitions
  // Constants
  parameter signed [7:0] coeff1 = 8'b00000000; //sfix8_En8
  parameter signed [7:0] coeff2 = 8'b00000000; //sfix8_En8
  parameter signed [7:0] coeff3 = 8'b00000001; //sfix8_En8
  parameter signed [7:0] coeff4 = 8'b00000011; //sfix8_En8
  parameter signed [7:0] coeff5 = 8'b00001000; //sfix8_En8
  parameter signed [7:0] coeff6 = 8'b00010000; //sfix8_En8
  parameter signed [7:0] coeff7 = 8'b00011100; //sfix8_En8
  parameter signed [7:0] coeff8 = 8'b00101010; //sfix8_En8
  parameter signed [7:0] coeff9 = 8'b00111000; //sfix8_En8
  parameter signed [7:0] coeff10 = 8'b01000010; //sfix8_En8
  parameter signed [7:0] coeff11 = 8'b01000110; //sfix8_En8
  parameter signed [7:0] coeff12 = 8'b01000010; //sfix8_En8
  parameter signed [7:0] coeff13 = 8'b00111000; //sfix8_En8
  parameter signed [7:0] coeff14 = 8'b00101010; //sfix8_En8
  parameter signed [7:0] coeff15 = 8'b00011100; //sfix8_En8
  parameter signed [7:0] coeff16 = 8'b00010000; //sfix8_En8
  parameter signed [7:0] coeff17 = 8'b00001000; //sfix8_En8
  parameter signed [7:0] coeff18 = 8'b00000011; //sfix8_En8
  parameter signed [7:0] coeff19 = 8'b00000001; //sfix8_En8
  parameter signed [7:0] coeff20 = 8'b00000000; //sfix8_En8
  parameter signed [7:0] coeff21 = 8'b00000000; //sfix8_En8

  // Signals
  wire signed [7:0] filter_in_cast; // sfix8
  reg  [2:0] cur_count; // ufix3
  wire phase_7; // boolean
  wire phase_1; // boolean
  wire phase_2; // boolean
  wire serialoutb1; // ufix1
  reg  signed [7:0] shiftreg; // sfix8
  reg  delay_pipeline [0:143] ; // boolean
  wire [5:0] mem_addr_1; // ufix6
  reg  signed [7:0] memoutb1_1; // sfix8_En8
  wire [5:0] mem_addr_2; // ufix6
  reg  signed [9:0] memoutb1_2; // sfix10_En8
  wire [4:0] mem_addr_3; // ufix5
  reg  signed [6:0] memoutb1_3; // sfix7_En8
  wire signed [9:0] memoutb1; // sfix10_En8
  wire signed [10:0] sum1_1; // sfix11_En8
  wire signed [9:0] add_signext; // sfix10_En8
  wire signed [9:0] add_signext_1; // sfix10_En8
  reg  signed [10:0] sumpipe1_1; // sfix11_En8
  reg  signed [6:0] sumpipe1_2; // sfix7_En8
  wire signed [11:0] sum2_1; // sfix12_En8
  wire signed [10:0] add_signext_2; // sfix11_En8
  wire signed [10:0] add_signext_3; // sfix11_En8
  reg  signed [11:0] sumpipe2_1; // sfix12_En8
  reg  signed [17:0] acc_out; // sfix18_En15
  wire signed [17:0] memoutb1_cast; // sfix18_En15
  wire signed [17:0] add_sub_out; // sfix18_En15
  wire signed [17:0] acc_out_shft; // sfix18_En15
  wire signed [17:0] acc_in; // sfix18_En15
  wire signed [17:0] addsub_add; // sfix18_En15
  wire signed [17:0] addsub_sub; // sfix18_En15
  wire signed [17:0] add_signext_4; // sfix18_En15
  wire signed [17:0] add_signext_5; // sfix18_En15
  wire signed [18:0] add_temp; // sfix19_En15
  wire signed [17:0] sub_signext; // sfix18_En15
  wire signed [17:0] sub_signext_1; // sfix18_En15
  wire signed [18:0] sub_temp; // sfix19_En15
  reg  signed [17:0] final_acc_out; // sfix18_En15
  wire signed [17:0] output_da; // sfix18_En8
  wire signed [20:0] output_typeconvert; // sfix21_En8
  reg  signed [20:0] output_register; // sfix21_En8

  // Block Statements
  assign filter_in_cast = filter_in;

  always @ (posedge clk or posedge reset)
    begin: Counter_process
      if (reset == 1'b1) begin
        cur_count <= 3'b111;
      end
      else begin
        if (clk_enable == 1'b1) begin
          if (cur_count >= 3'b111) begin
            cur_count <= 3'b000;
          end
          else begin
            cur_count <= cur_count + 3'b001;
          end
        end
      end
    end // Counter_process

  assign  phase_7 = (cur_count == 3'b111 && clk_enable == 1'b1) ? 1'b1 : 1'b0;

  assign  phase_1 = (cur_count == 3'b001 && clk_enable == 1'b1) ? 1'b1 : 1'b0;

  assign  phase_2 = (cur_count == 3'b010 && clk_enable == 1'b1) ? 1'b1 : 1'b0;

  always @ (posedge clk or posedge reset)
    begin: Serializer_1_process
      if (reset == 1'b1) begin
        shiftreg <= 8'b00000000;
      end
      else begin
        if (clk_enable == 1'b1) begin
          if (phase_7 == 1'b1) begin
            shiftreg <= filter_in_cast;
          end
          else begin
            shiftreg <= {1'b0, shiftreg[7 : 1]};
          end
        end
      end 
    end // Serializer_1_process;

  assign   serialoutb1=shiftreg[0];
 
  always @( posedge clk or posedge reset)
    begin: Delay_Pipeline_1_process
      if (reset == 1'b1) begin
        delay_pipeline[0] <= 1'b0;
        delay_pipeline[1] <= 1'b0;
        delay_pipeline[2] <= 1'b0;
        delay_pipeline[3] <= 1'b0;
        delay_pipeline[4] <= 1'b0;
        delay_pipeline[5] <= 1'b0;
        delay_pipeline[6] <= 1'b0;
        delay_pipeline[7] <= 1'b0;
        delay_pipeline[8] <= 1'b0;
        delay_pipeline[9] <= 1'b0;
        delay_pipeline[10] <= 1'b0;
        delay_pipeline[11] <= 1'b0;
        delay_pipeline[12] <= 1'b0;
        delay_pipeline[13] <= 1'b0;
        delay_pipeline[14] <= 1'b0;
        delay_pipeline[15] <= 1'b0;
        delay_pipeline[16] <= 1'b0;
        delay_pipeline[17] <= 1'b0;
        delay_pipeline[18] <= 1'b0;
        delay_pipeline[19] <= 1'b0;
        delay_pipeline[20] <= 1'b0;
        delay_pipeline[21] <= 1'b0;
        delay_pipeline[22] <= 1'b0;
        delay_pipeline[23] <= 1'b0;
        delay_pipeline[24] <= 1'b0;
        delay_pipeline[25] <= 1'b0;
        delay_pipeline[26] <= 1'b0;
        delay_pipeline[27] <= 1'b0;
        delay_pipeline[28] <= 1'b0;
        delay_pipeline[29] <= 1'b0;
        delay_pipeline[30] <= 1'b0;
        delay_pipeline[31] <= 1'b0;
        delay_pipeline[32] <= 1'b0;
        delay_pipeline[33] <= 1'b0;
        delay_pipeline[34] <= 1'b0;
        delay_pipeline[35] <= 1'b0;
        delay_pipeline[36] <= 1'b0;
        delay_pipeline[37] <= 1'b0;
        delay_pipeline[38] <= 1'b0;
        delay_pipeline[39] <= 1'b0;
        delay_pipeline[40] <= 1'b0;
        delay_pipeline[41] <= 1'b0;
        delay_pipeline[42] <= 1'b0;
        delay_pipeline[43] <= 1'b0;
        delay_pipeline[44] <= 1'b0;
        delay_pipeline[45] <= 1'b0;
        delay_pipeline[46] <= 1'b0;
        delay_pipeline[47] <= 1'b0;
        delay_pipeline[48] <= 1'b0;
        delay_pipeline[49] <= 1'b0;
        delay_pipeline[50] <= 1'b0;
        delay_pipeline[51] <= 1'b0;
        delay_pipeline[52] <= 1'b0;
        delay_pipeline[53] <= 1'b0;
        delay_pipeline[54] <= 1'b0;
        delay_pipeline[55] <= 1'b0;
        delay_pipeline[56] <= 1'b0;
        delay_pipeline[57] <= 1'b0;
        delay_pipeline[58] <= 1'b0;
        delay_pipeline[59] <= 1'b0;
        delay_pipeline[60] <= 1'b0;
        delay_pipeline[61] <= 1'b0;
        delay_pipeline[62] <= 1'b0;
        delay_pipeline[63] <= 1'b0;
        delay_pipeline[64] <= 1'b0;
        delay_pipeline[65] <= 1'b0;
        delay_pipeline[66] <= 1'b0;
        delay_pipeline[67] <= 1'b0;
        delay_pipeline[68] <= 1'b0;
        delay_pipeline[69] <= 1'b0;
        delay_pipeline[70] <= 1'b0;
        delay_pipeline[71] <= 1'b0;
        delay_pipeline[72] <= 1'b0;
        delay_pipeline[73] <= 1'b0;
        delay_pipeline[74] <= 1'b0;
        delay_pipeline[75] <= 1'b0;
        delay_pipeline[76] <= 1'b0;
        delay_pipeline[77] <= 1'b0;
        delay_pipeline[78] <= 1'b0;
        delay_pipeline[79] <= 1'b0;
        delay_pipeline[80] <= 1'b0;
        delay_pipeline[81] <= 1'b0;
        delay_pipeline[82] <= 1'b0;
        delay_pipeline[83] <= 1'b0;
        delay_pipeline[84] <= 1'b0;
        delay_pipeline[85] <= 1'b0;
        delay_pipeline[86] <= 1'b0;
        delay_pipeline[87] <= 1'b0;
        delay_pipeline[88] <= 1'b0;
        delay_pipeline[89] <= 1'b0;
        delay_pipeline[90] <= 1'b0;
        delay_pipeline[91] <= 1'b0;
        delay_pipeline[92] <= 1'b0;
        delay_pipeline[93] <= 1'b0;
        delay_pipeline[94] <= 1'b0;
        delay_pipeline[95] <= 1'b0;
        delay_pipeline[96] <= 1'b0;
        delay_pipeline[97] <= 1'b0;
        delay_pipeline[98] <= 1'b0;
        delay_pipeline[99] <= 1'b0;
        delay_pipeline[100] <= 1'b0;
        delay_pipeline[101] <= 1'b0;
        delay_pipeline[102] <= 1'b0;
        delay_pipeline[103] <= 1'b0;
        delay_pipeline[104] <= 1'b0;
        delay_pipeline[105] <= 1'b0;
        delay_pipeline[106] <= 1'b0;
        delay_pipeline[107] <= 1'b0;
        delay_pipeline[108] <= 1'b0;
        delay_pipeline[109] <= 1'b0;
        delay_pipeline[110] <= 1'b0;
        delay_pipeline[111] <= 1'b0;
        delay_pipeline[112] <= 1'b0;
        delay_pipeline[113] <= 1'b0;
        delay_pipeline[114] <= 1'b0;
        delay_pipeline[115] <= 1'b0;
        delay_pipeline[116] <= 1'b0;
        delay_pipeline[117] <= 1'b0;
        delay_pipeline[118] <= 1'b0;
        delay_pipeline[119] <= 1'b0;
        delay_pipeline[120] <= 1'b0;
        delay_pipeline[121] <= 1'b0;
        delay_pipeline[122] <= 1'b0;
        delay_pipeline[123] <= 1'b0;
        delay_pipeline[124] <= 1'b0;
        delay_pipeline[125] <= 1'b0;
        delay_pipeline[126] <= 1'b0;
        delay_pipeline[127] <= 1'b0;
        delay_pipeline[128] <= 1'b0;
        delay_pipeline[129] <= 1'b0;
        delay_pipeline[130] <= 1'b0;
        delay_pipeline[131] <= 1'b0;
        delay_pipeline[132] <= 1'b0;
        delay_pipeline[133] <= 1'b0;
        delay_pipeline[134] <= 1'b0;
        delay_pipeline[135] <= 1'b0;
        delay_pipeline[136] <= 1'b0;
        delay_pipeline[137] <= 1'b0;
        delay_pipeline[138] <= 1'b0;
        delay_pipeline[139] <= 1'b0;
        delay_pipeline[140] <= 1'b0;
        delay_pipeline[141] <= 1'b0;
        delay_pipeline[142] <= 1'b0;
        delay_pipeline[143] <= 1'b0;
      end
      else begin
        if (clk_enable == 1'b1) begin
          delay_pipeline[0] <= serialoutb1;
          delay_pipeline[1] <= delay_pipeline[0];
          delay_pipeline[2] <= delay_pipeline[1];
          delay_pipeline[3] <= delay_pipeline[2];
          delay_pipeline[4] <= delay_pipeline[3];
          delay_pipeline[5] <= delay_pipeline[4];
          delay_pipeline[6] <= delay_pipeline[5];
          delay_pipeline[7] <= delay_pipeline[6];
          delay_pipeline[8] <= delay_pipeline[7];
          delay_pipeline[9] <= delay_pipeline[8];
          delay_pipeline[10] <= delay_pipeline[9];
          delay_pipeline[11] <= delay_pipeline[10];
          delay_pipeline[12] <= delay_pipeline[11];
          delay_pipeline[13] <= delay_pipeline[12];
          delay_pipeline[14] <= delay_pipeline[13];
          delay_pipeline[15] <= delay_pipeline[14];
          delay_pipeline[16] <= delay_pipeline[15];
          delay_pipeline[17] <= delay_pipeline[16];
          delay_pipeline[18] <= delay_pipeline[17];
          delay_pipeline[19] <= delay_pipeline[18];
          delay_pipeline[20] <= delay_pipeline[19];
          delay_pipeline[21] <= delay_pipeline[20];
          delay_pipeline[22] <= delay_pipeline[21];
          delay_pipeline[23] <= delay_pipeline[22];
          delay_pipeline[24] <= delay_pipeline[23];
          delay_pipeline[25] <= delay_pipeline[24];
          delay_pipeline[26] <= delay_pipeline[25];
          delay_pipeline[27] <= delay_pipeline[26];
          delay_pipeline[28] <= delay_pipeline[27];
          delay_pipeline[29] <= delay_pipeline[28];
          delay_pipeline[30] <= delay_pipeline[29];
          delay_pipeline[31] <= delay_pipeline[30];
          delay_pipeline[32] <= delay_pipeline[31];
          delay_pipeline[33] <= delay_pipeline[32];
          delay_pipeline[34] <= delay_pipeline[33];
          delay_pipeline[35] <= delay_pipeline[34];
          delay_pipeline[36] <= delay_pipeline[35];
          delay_pipeline[37] <= delay_pipeline[36];
          delay_pipeline[38] <= delay_pipeline[37];
          delay_pipeline[39] <= delay_pipeline[38];
          delay_pipeline[40] <= delay_pipeline[39];
          delay_pipeline[41] <= delay_pipeline[40];
          delay_pipeline[42] <= delay_pipeline[41];
          delay_pipeline[43] <= delay_pipeline[42];
          delay_pipeline[44] <= delay_pipeline[43];
          delay_pipeline[45] <= delay_pipeline[44];
          delay_pipeline[46] <= delay_pipeline[45];
          delay_pipeline[47] <= delay_pipeline[46];
          delay_pipeline[48] <= delay_pipeline[47];
          delay_pipeline[49] <= delay_pipeline[48];
          delay_pipeline[50] <= delay_pipeline[49];
          delay_pipeline[51] <= delay_pipeline[50];
          delay_pipeline[52] <= delay_pipeline[51];
          delay_pipeline[53] <= delay_pipeline[52];
          delay_pipeline[54] <= delay_pipeline[53];
          delay_pipeline[55] <= delay_pipeline[54];
          delay_pipeline[56] <= delay_pipeline[55];
          delay_pipeline[57] <= delay_pipeline[56];
          delay_pipeline[58] <= delay_pipeline[57];
          delay_pipeline[59] <= delay_pipeline[58];
          delay_pipeline[60] <= delay_pipeline[59];
          delay_pipeline[61] <= delay_pipeline[60];
          delay_pipeline[62] <= delay_pipeline[61];
          delay_pipeline[63] <= delay_pipeline[62];
          delay_pipeline[64] <= delay_pipeline[63];
          delay_pipeline[65] <= delay_pipeline[64];
          delay_pipeline[66] <= delay_pipeline[65];
          delay_pipeline[67] <= delay_pipeline[66];
          delay_pipeline[68] <= delay_pipeline[67];
          delay_pipeline[69] <= delay_pipeline[68];
          delay_pipeline[70] <= delay_pipeline[69];
          delay_pipeline[71] <= delay_pipeline[70];
          delay_pipeline[72] <= delay_pipeline[71];
          delay_pipeline[73] <= delay_pipeline[72];
          delay_pipeline[74] <= delay_pipeline[73];
          delay_pipeline[75] <= delay_pipeline[74];
          delay_pipeline[76] <= delay_pipeline[75];
          delay_pipeline[77] <= delay_pipeline[76];
          delay_pipeline[78] <= delay_pipeline[77];
          delay_pipeline[79] <= delay_pipeline[78];
          delay_pipeline[80] <= delay_pipeline[79];
          delay_pipeline[81] <= delay_pipeline[80];
          delay_pipeline[82] <= delay_pipeline[81];
          delay_pipeline[83] <= delay_pipeline[82];
          delay_pipeline[84] <= delay_pipeline[83];
          delay_pipeline[85] <= delay_pipeline[84];
          delay_pipeline[86] <= delay_pipeline[85];
          delay_pipeline[87] <= delay_pipeline[86];
          delay_pipeline[88] <= delay_pipeline[87];
          delay_pipeline[89] <= delay_pipeline[88];
          delay_pipeline[90] <= delay_pipeline[89];
          delay_pipeline[91] <= delay_pipeline[90];
          delay_pipeline[92] <= delay_pipeline[91];
          delay_pipeline[93] <= delay_pipeline[92];
          delay_pipeline[94] <= delay_pipeline[93];
          delay_pipeline[95] <= delay_pipeline[94];
          delay_pipeline[96] <= delay_pipeline[95];
          delay_pipeline[97] <= delay_pipeline[96];
          delay_pipeline[98] <= delay_pipeline[97];
          delay_pipeline[99] <= delay_pipeline[98];
          delay_pipeline[100] <= delay_pipeline[99];
          delay_pipeline[101] <= delay_pipeline[100];
          delay_pipeline[102] <= delay_pipeline[101];
          delay_pipeline[103] <= delay_pipeline[102];
          delay_pipeline[104] <= delay_pipeline[103];
          delay_pipeline[105] <= delay_pipeline[104];
          delay_pipeline[106] <= delay_pipeline[105];
          delay_pipeline[107] <= delay_pipeline[106];
          delay_pipeline[108] <= delay_pipeline[107];
          delay_pipeline[109] <= delay_pipeline[108];
          delay_pipeline[110] <= delay_pipeline[109];
          delay_pipeline[111] <= delay_pipeline[110];
          delay_pipeline[112] <= delay_pipeline[111];
          delay_pipeline[113] <= delay_pipeline[112];
          delay_pipeline[114] <= delay_pipeline[113];
          delay_pipeline[115] <= delay_pipeline[114];
          delay_pipeline[116] <= delay_pipeline[115];
          delay_pipeline[117] <= delay_pipeline[116];
          delay_pipeline[118] <= delay_pipeline[117];
          delay_pipeline[119] <= delay_pipeline[118];
          delay_pipeline[120] <= delay_pipeline[119];
          delay_pipeline[121] <= delay_pipeline[120];
          delay_pipeline[122] <= delay_pipeline[121];
          delay_pipeline[123] <= delay_pipeline[122];
          delay_pipeline[124] <= delay_pipeline[123];
          delay_pipeline[125] <= delay_pipeline[124];
          delay_pipeline[126] <= delay_pipeline[125];
          delay_pipeline[127] <= delay_pipeline[126];
          delay_pipeline[128] <= delay_pipeline[127];
          delay_pipeline[129] <= delay_pipeline[128];
          delay_pipeline[130] <= delay_pipeline[129];
          delay_pipeline[131] <= delay_pipeline[130];
          delay_pipeline[132] <= delay_pipeline[131];
          delay_pipeline[133] <= delay_pipeline[132];
          delay_pipeline[134] <= delay_pipeline[133];
          delay_pipeline[135] <= delay_pipeline[134];
          delay_pipeline[136] <= delay_pipeline[135];
          delay_pipeline[137] <= delay_pipeline[136];
          delay_pipeline[138] <= delay_pipeline[137];
          delay_pipeline[139] <= delay_pipeline[138];
          delay_pipeline[140] <= delay_pipeline[139];
          delay_pipeline[141] <= delay_pipeline[140];
          delay_pipeline[142] <= delay_pipeline[141];
          delay_pipeline[143] <= delay_pipeline[142];
        end
      end
    end // Delay_Pipeline_1_process


  assign mem_addr_1 = {delay_pipeline[55], delay_pipeline[47], delay_pipeline[39], delay_pipeline[31], delay_pipeline[23], delay_pipeline[15]};

  always @(mem_addr_1)
  begin
    case(mem_addr_1)
      6'b000000 : memoutb1_1 = 8'b00000000;
      6'b000001 : memoutb1_1 = 8'b00000001;
      6'b000010 : memoutb1_1 = 8'b00000011;
      6'b000011 : memoutb1_1 = 8'b00000100;
      6'b000100 : memoutb1_1 = 8'b00001000;
      6'b000101 : memoutb1_1 = 8'b00001001;
      6'b000110 : memoutb1_1 = 8'b00001011;
      6'b000111 : memoutb1_1 = 8'b00001100;
      6'b001000 : memoutb1_1 = 8'b00010000;
      6'b001001 : memoutb1_1 = 8'b00010001;
      6'b001010 : memoutb1_1 = 8'b00010011;
      6'b001011 : memoutb1_1 = 8'b00010100;
      6'b001100 : memoutb1_1 = 8'b00011000;
      6'b001101 : memoutb1_1 = 8'b00011001;
      6'b001110 : memoutb1_1 = 8'b00011011;
      6'b001111 : memoutb1_1 = 8'b00011100;
      6'b010000 : memoutb1_1 = 8'b00011100;
      6'b010001 : memoutb1_1 = 8'b00011101;
      6'b010010 : memoutb1_1 = 8'b00011111;
      6'b010011 : memoutb1_1 = 8'b00100000;
      6'b010100 : memoutb1_1 = 8'b00100100;
      6'b010101 : memoutb1_1 = 8'b00100101;
      6'b010110 : memoutb1_1 = 8'b00100111;
      6'b010111 : memoutb1_1 = 8'b00101000;
      6'b011000 : memoutb1_1 = 8'b00101100;
      6'b011001 : memoutb1_1 = 8'b00101101;
      6'b011010 : memoutb1_1 = 8'b00101111;
      6'b011011 : memoutb1_1 = 8'b00110000;
      6'b011100 : memoutb1_1 = 8'b00110100;
      6'b011101 : memoutb1_1 = 8'b00110101;
      6'b011110 : memoutb1_1 = 8'b00110111;
      6'b011111 : memoutb1_1 = 8'b00111000;
      6'b100000 : memoutb1_1 = 8'b00101010;
      6'b100001 : memoutb1_1 = 8'b00101011;
      6'b100010 : memoutb1_1 = 8'b00101101;
      6'b100011 : memoutb1_1 = 8'b00101110;
      6'b100100 : memoutb1_1 = 8'b00110010;
      6'b100101 : memoutb1_1 = 8'b00110011;
      6'b100110 : memoutb1_1 = 8'b00110101;
      6'b100111 : memoutb1_1 = 8'b00110110;
      6'b101000 : memoutb1_1 = 8'b00111010;
      6'b101001 : memoutb1_1 = 8'b00111011;
      6'b101010 : memoutb1_1 = 8'b00111101;
      6'b101011 : memoutb1_1 = 8'b00111110;
      6'b101100 : memoutb1_1 = 8'b01000010;
      6'b101101 : memoutb1_1 = 8'b01000011;
      6'b101110 : memoutb1_1 = 8'b01000101;
      6'b101111 : memoutb1_1 = 8'b01000110;
      6'b110000 : memoutb1_1 = 8'b01000110;
      6'b110001 : memoutb1_1 = 8'b01000111;
      6'b110010 : memoutb1_1 = 8'b01001001;
      6'b110011 : memoutb1_1 = 8'b01001010;
      6'b110100 : memoutb1_1 = 8'b01001110;
      6'b110101 : memoutb1_1 = 8'b01001111;
      6'b110110 : memoutb1_1 = 8'b01010001;
      6'b110111 : memoutb1_1 = 8'b01010010;
      6'b111000 : memoutb1_1 = 8'b01010110;
      6'b111001 : memoutb1_1 = 8'b01010111;
      6'b111010 : memoutb1_1 = 8'b01011001;
      6'b111011 : memoutb1_1 = 8'b01011010;
      6'b111100 : memoutb1_1 = 8'b01011110;
      6'b111101 : memoutb1_1 = 8'b01011111;
      6'b111110 : memoutb1_1 = 8'b01100001;
      6'b111111 : memoutb1_1 = 8'b01100010;
      default : memoutb1_1 = 8'b01100010;
    endcase
  end

  assign mem_addr_2 = {delay_pipeline[103], delay_pipeline[95], delay_pipeline[87], delay_pipeline[79], delay_pipeline[71], delay_pipeline[63]};

  always @(mem_addr_2)
  begin
    case(mem_addr_2)
      6'b000000 : memoutb1_2 = 10'b0000000000;
      6'b000001 : memoutb1_2 = 10'b0000111000;
      6'b000010 : memoutb1_2 = 10'b0001000010;
      6'b000011 : memoutb1_2 = 10'b0001111010;
      6'b000100 : memoutb1_2 = 10'b0001000110;
      6'b000101 : memoutb1_2 = 10'b0001111110;
      6'b000110 : memoutb1_2 = 10'b0010001000;
      6'b000111 : memoutb1_2 = 10'b0011000000;
      6'b001000 : memoutb1_2 = 10'b0001000010;
      6'b001001 : memoutb1_2 = 10'b0001111010;
      6'b001010 : memoutb1_2 = 10'b0010000100;
      6'b001011 : memoutb1_2 = 10'b0010111100;
      6'b001100 : memoutb1_2 = 10'b0010001000;
      6'b001101 : memoutb1_2 = 10'b0011000000;
      6'b001110 : memoutb1_2 = 10'b0011001010;
      6'b001111 : memoutb1_2 = 10'b0100000010;
      6'b010000 : memoutb1_2 = 10'b0000111000;
      6'b010001 : memoutb1_2 = 10'b0001110000;
      6'b010010 : memoutb1_2 = 10'b0001111010;
      6'b010011 : memoutb1_2 = 10'b0010110010;
      6'b010100 : memoutb1_2 = 10'b0001111110;
      6'b010101 : memoutb1_2 = 10'b0010110110;
      6'b010110 : memoutb1_2 = 10'b0011000000;
      6'b010111 : memoutb1_2 = 10'b0011111000;
      6'b011000 : memoutb1_2 = 10'b0001111010;
      6'b011001 : memoutb1_2 = 10'b0010110010;
      6'b011010 : memoutb1_2 = 10'b0010111100;
      6'b011011 : memoutb1_2 = 10'b0011110100;
      6'b011100 : memoutb1_2 = 10'b0011000000;
      6'b011101 : memoutb1_2 = 10'b0011111000;
      6'b011110 : memoutb1_2 = 10'b0100000010;
      6'b011111 : memoutb1_2 = 10'b0100111010;
      6'b100000 : memoutb1_2 = 10'b0000101010;
      6'b100001 : memoutb1_2 = 10'b0001100010;
      6'b100010 : memoutb1_2 = 10'b0001101100;
      6'b100011 : memoutb1_2 = 10'b0010100100;
      6'b100100 : memoutb1_2 = 10'b0001110000;
      6'b100101 : memoutb1_2 = 10'b0010101000;
      6'b100110 : memoutb1_2 = 10'b0010110010;
      6'b100111 : memoutb1_2 = 10'b0011101010;
      6'b101000 : memoutb1_2 = 10'b0001101100;
      6'b101001 : memoutb1_2 = 10'b0010100100;
      6'b101010 : memoutb1_2 = 10'b0010101110;
      6'b101011 : memoutb1_2 = 10'b0011100110;
      6'b101100 : memoutb1_2 = 10'b0010110010;
      6'b101101 : memoutb1_2 = 10'b0011101010;
      6'b101110 : memoutb1_2 = 10'b0011110100;
      6'b101111 : memoutb1_2 = 10'b0100101100;
      6'b110000 : memoutb1_2 = 10'b0001100010;
      6'b110001 : memoutb1_2 = 10'b0010011010;
      6'b110010 : memoutb1_2 = 10'b0010100100;
      6'b110011 : memoutb1_2 = 10'b0011011100;
      6'b110100 : memoutb1_2 = 10'b0010101000;
      6'b110101 : memoutb1_2 = 10'b0011100000;
      6'b110110 : memoutb1_2 = 10'b0011101010;
      6'b110111 : memoutb1_2 = 10'b0100100010;
      6'b111000 : memoutb1_2 = 10'b0010100100;
      6'b111001 : memoutb1_2 = 10'b0011011100;
      6'b111010 : memoutb1_2 = 10'b0011100110;
      6'b111011 : memoutb1_2 = 10'b0100011110;
      6'b111100 : memoutb1_2 = 10'b0011101010;
      6'b111101 : memoutb1_2 = 10'b0100100010;
      6'b111110 : memoutb1_2 = 10'b0100101100;
      6'b111111 : memoutb1_2 = 10'b0101100100;
      default : memoutb1_2 = 10'b0101100100;
    endcase
  end

  assign mem_addr_3 = {delay_pipeline[143], delay_pipeline[135], delay_pipeline[127], delay_pipeline[119], delay_pipeline[111]};

  always @(mem_addr_3)
  begin
    case(mem_addr_3)
      5'b00000 : memoutb1_3 = 7'b0000000;
      5'b00001 : memoutb1_3 = 7'b0011100;
      5'b00010 : memoutb1_3 = 7'b0010000;
      5'b00011 : memoutb1_3 = 7'b0101100;
      5'b00100 : memoutb1_3 = 7'b0001000;
      5'b00101 : memoutb1_3 = 7'b0100100;
      5'b00110 : memoutb1_3 = 7'b0011000;
      5'b00111 : memoutb1_3 = 7'b0110100;
      5'b01000 : memoutb1_3 = 7'b0000011;
      5'b01001 : memoutb1_3 = 7'b0011111;
      5'b01010 : memoutb1_3 = 7'b0010011;
      5'b01011 : memoutb1_3 = 7'b0101111;
      5'b01100 : memoutb1_3 = 7'b0001011;
      5'b01101 : memoutb1_3 = 7'b0100111;
      5'b01110 : memoutb1_3 = 7'b0011011;
      5'b01111 : memoutb1_3 = 7'b0110111;
      5'b10000 : memoutb1_3 = 7'b0000001;
      5'b10001 : memoutb1_3 = 7'b0011101;
      5'b10010 : memoutb1_3 = 7'b0010001;
      5'b10011 : memoutb1_3 = 7'b0101101;
      5'b10100 : memoutb1_3 = 7'b0001001;
      5'b10101 : memoutb1_3 = 7'b0100101;
      5'b10110 : memoutb1_3 = 7'b0011001;
      5'b10111 : memoutb1_3 = 7'b0110101;
      5'b11000 : memoutb1_3 = 7'b0000100;
      5'b11001 : memoutb1_3 = 7'b0100000;
      5'b11010 : memoutb1_3 = 7'b0010100;
      5'b11011 : memoutb1_3 = 7'b0110000;
      5'b11100 : memoutb1_3 = 7'b0001100;
      5'b11101 : memoutb1_3 = 7'b0101000;
      5'b11110 : memoutb1_3 = 7'b0011100;
      5'b11111 : memoutb1_3 = 7'b0111000;
      default : memoutb1_3 = 7'b0111000;
    endcase
  end

  assign add_signext = $signed({{2{memoutb1_1[7]}}, memoutb1_1});
  assign add_signext_1 = memoutb1_2;
  assign sum1_1 = add_signext + add_signext_1;

  always @ (posedge clk or posedge reset)
    begin: temp_process1
      if (reset == 1'b1) begin
        sumpipe1_1 <= 0;
        sumpipe1_2 <= 0;
      end
      else begin
        if (clk_enable == 1'b1) begin
          sumpipe1_1 <= sum1_1;
          sumpipe1_2 <= memoutb1_3;
        end
      end
    end // temp_process1

  assign add_signext_2 = sumpipe1_1;
  assign add_signext_3 = $signed({{4{sumpipe1_2[6]}}, sumpipe1_2});
  assign sum2_1 = add_signext_2 + add_signext_3;

  always @ (posedge clk or posedge reset)
    begin: temp_process2
      if (reset == 1'b1) begin
        sumpipe2_1 <= 0;
      end
      else begin
        if (clk_enable == 1'b1) begin
          sumpipe2_1 <= sum2_1;
        end
      end
    end // temp_process2

  assign memoutb1 = sumpipe2_1[9:0];

  //  Shift and add the LUT results to compute the scaled accumulated sum

  assign memoutb1_cast = $signed({memoutb1[9:0], 7'b0000000});

  assign acc_out_shft = $signed({{1{acc_out[17]}}, acc_out[17:1]});

  assign add_signext_4 = acc_out_shft;
  assign add_signext_5 = memoutb1_cast;
  assign add_temp = add_signext_4 + add_signext_5;
  assign addsub_add = add_temp[17:0];

  assign sub_signext = acc_out_shft;
  assign sub_signext_1 = memoutb1_cast;
  assign sub_temp = sub_signext - sub_signext_1;
  assign addsub_sub = sub_temp[17:0];

  assign add_sub_out = (phase_1 == 1'b1) ? addsub_sub :
                      addsub_add;

  assign acc_in = (phase_2 == 1'b1) ? memoutb1_cast :
            add_sub_out;

  always @ (posedge clk or posedge reset)
    begin: Acc_reg_process
      if (reset == 1'b1) begin
        acc_out <= 0;
      end
      else begin
        if (clk_enable == 1'b1) begin
          acc_out <= acc_in;
        end
      end
    end // Acc_reg_process

  always @ (posedge clk or posedge reset)
    begin: Finalsum_reg_process
      if (reset == 1'b1) begin
        final_acc_out <= 0;
      end
      else begin
        if (phase_2 == 1'b1) begin
          final_acc_out <= acc_out;
        end
      end
    end // Finalsum_reg_process

  assign output_da = final_acc_out;

  assign output_typeconvert = $signed({{3{output_da[17]}}, output_da});

  always @ (posedge clk or posedge reset)
    begin: Output_Register_process
      if (reset == 1'b1) begin
        output_register <= 0;
      end
      else begin
        if (phase_7 == 1'b1) begin
          output_register <= output_typeconvert;
        end
      end
    end // Output_Register_process

  // Assignment Statements
  assign filter_out = output_register;
endmodule  // fir_20_8b_da