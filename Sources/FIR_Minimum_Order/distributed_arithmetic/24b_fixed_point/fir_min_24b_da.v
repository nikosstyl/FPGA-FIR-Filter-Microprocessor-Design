// -------------------------------------------------------------
//
// Module: fir_min_24b_da
// Generated by MATLAB(R) 9.12 and Filter Design HDL Coder 3.1.11.
// Generated on: 2023-06-27 19:43:58
// -------------------------------------------------------------

// -------------------------------------------------------------
// HDL Code Generation Options:
//
// FIRAdderStyle: tree
// MultiplierInputPipeline: 1
// MultiplierOutputPipeline: 1
// OptimizeForHDL: on
// TargetDirectory: W:\Nikos\UTh\Σχεδίαση Επεξεργαστών\Project\FIR_Minimum_Order\distributed_arithmetic\24b_fixed_point
// AddPipelineRegisters: on
// Name: fir_min_24b_da
// DALUTPartition: 4
// InputDataType: numerictype(1,24,0)
// TargetLanguage: Verilog
// TestBenchName: fir_min_24b_da_tb
// TestBenchStimulus: impulse step ramp chirp noise 

// Filter Specifications:
//
// Sample Rate     : 46 kHz
// Response        : Lowpass
// Specification   : N,Fp,Fst,Ap
// Stopband Edge   : 9.6 kHz
// Passband Ripple : 60 dB
// Filter Order    : 3
// Passband Edge   : 8 kHz
// -------------------------------------------------------------

// -------------------------------------------------------------
// HDL Implementation    : Distributed arithmetic (DA)
// Folding Factor        : 24
// LUT Address Width     : 4
// Total LUT Size (bits) : 416
// -------------------------------------------------------------
// Filter Settings:
//
// Discrete-Time FIR Filter (real)
// -------------------------------
// Filter Structure  : Direct-Form FIR
// Filter Length     : 4
// Stable            : Yes
// Linear Phase      : Yes (Type 2)
// Arithmetic        : fixed
// Numerator         : s24,32 -> [-1.953125e-03 1.953125e-03)
// -------------------------------------------------------------




`timescale 1 ns / 1 ns

module fir_min_24b_da
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
  input   signed [23:0] filter_in; //sfix24
  output  signed [49:0] filter_out; //sfix50_En32

////////////////////////////////////////////////////////////////
//Module Architecture: fir_min_24b_da
////////////////////////////////////////////////////////////////
  // Local Functions
  // Type Definitions
  // Constants
  parameter signed [23:0] coeff1 = 24'b001111110011111010100011; //sfix24_En32
  parameter signed [23:0] coeff2 = 24'b010001101000010110011010; //sfix24_En32
  parameter signed [23:0] coeff3 = 24'b010001101000010110011010; //sfix24_En32
  parameter signed [23:0] coeff4 = 24'b001111110011111010100011; //sfix24_En32

  // Signals
  wire signed [23:0] filter_in_cast; // sfix24
  reg  [4:0] cur_count; // ufix5
  wire phase_23; // boolean
  wire phase_0; // boolean
  wire serialoutb1; // ufix1
  reg  signed [23:0] shiftreg; // sfix24
  reg  delay_pipeline [0:71] ; // boolean
  wire [3:0] mem_addr; // ufix4
  reg  signed [25:0] memoutb1; // sfix26_En32
  reg  signed [49:0] acc_out; // sfix50_En55
  wire signed [49:0] memoutb1_cast; // sfix50_En55
  wire signed [49:0] add_sub_out; // sfix50_En55
  wire signed [49:0] acc_out_shft; // sfix50_En55
  wire signed [49:0] acc_in; // sfix50_En55
  wire signed [49:0] addsub_add; // sfix50_En55
  wire signed [49:0] addsub_sub; // sfix50_En55
  wire signed [49:0] add_signext; // sfix50_En55
  wire signed [49:0] add_signext_1; // sfix50_En55
  wire signed [50:0] add_temp; // sfix51_En55
  wire signed [49:0] sub_signext; // sfix50_En55
  wire signed [49:0] sub_signext_1; // sfix50_En55
  wire signed [50:0] sub_temp; // sfix51_En55
  reg  signed [49:0] final_acc_out; // sfix50_En55
  wire signed [49:0] output_da; // sfix50_En32
  wire signed [49:0] output_typeconvert; // sfix50_En32
  reg  signed [49:0] output_register; // sfix50_En32

  // Block Statements
  assign filter_in_cast = filter_in;

  always @ (posedge clk or posedge reset)
    begin: Counter_process
      if (reset == 1'b1) begin
        cur_count <= 5'b10111;
      end
      else begin
        if (clk_enable == 1'b1) begin
          if (cur_count >= 5'b10111) begin
            cur_count <= 5'b00000;
          end
          else begin
            cur_count <= cur_count + 5'b00001;
          end
        end
      end
    end // Counter_process

  assign  phase_23 = (cur_count == 5'b10111 && clk_enable == 1'b1) ? 1'b1 : 1'b0;

  assign  phase_0 = (cur_count == 5'b00000 && clk_enable == 1'b1) ? 1'b1 : 1'b0;

  always @ (posedge clk or posedge reset)
    begin: Serializer_1_process
      if (reset == 1'b1) begin
        shiftreg <= 24'b000000000000000000000000;
      end
      else begin
        if (clk_enable == 1'b1) begin
          if (phase_23 == 1'b1) begin
            shiftreg <= filter_in_cast;
          end
          else begin
            shiftreg <= {1'b0, shiftreg[23 : 1]};
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
        end
      end
    end // Delay_Pipeline_1_process


  assign mem_addr = {delay_pipeline[71], delay_pipeline[47], delay_pipeline[23], serialoutb1};

  always @(mem_addr)
  begin
    case(mem_addr)
      4'b0000 : memoutb1 = 26'b00000000000000000000000000;
      4'b0001 : memoutb1 = 26'b00001111110011111010100011;
      4'b0010 : memoutb1 = 26'b00010001101000010110011010;
      4'b0011 : memoutb1 = 26'b00100001011100010000111101;
      4'b0100 : memoutb1 = 26'b00010001101000010110011010;
      4'b0101 : memoutb1 = 26'b00100001011100010000111101;
      4'b0110 : memoutb1 = 26'b00100011010000101100110100;
      4'b0111 : memoutb1 = 26'b00110011000100100111010111;
      4'b1000 : memoutb1 = 26'b00001111110011111010100011;
      4'b1001 : memoutb1 = 26'b00011111100111110101000110;
      4'b1010 : memoutb1 = 26'b00100001011100010000111101;
      4'b1011 : memoutb1 = 26'b00110001010000001011100000;
      4'b1100 : memoutb1 = 26'b00100001011100010000111101;
      4'b1101 : memoutb1 = 26'b00110001010000001011100000;
      4'b1110 : memoutb1 = 26'b00110011000100100111010111;
      4'b1111 : memoutb1 = 26'b01000010111000100001111010;
      default : memoutb1 = 26'b01000010111000100001111010;
    endcase
  end

  //  Shift and add the LUT results to compute the scaled accumulated sum

  assign memoutb1_cast = $signed({memoutb1[25:0], 23'b00000000000000000000000});

  assign acc_out_shft = $signed({{1{acc_out[49]}}, acc_out[49:1]});

  assign add_signext = acc_out_shft;
  assign add_signext_1 = memoutb1_cast;
  assign add_temp = add_signext + add_signext_1;
  assign addsub_add = add_temp[49:0];

  assign sub_signext = acc_out_shft;
  assign sub_signext_1 = memoutb1_cast;
  assign sub_temp = sub_signext - sub_signext_1;
  assign addsub_sub = sub_temp[49:0];

  assign add_sub_out = (phase_23 == 1'b1) ? addsub_sub :
                      addsub_add;

  assign acc_in = (phase_0 == 1'b1) ? memoutb1_cast :
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
        if (phase_0 == 1'b1) begin
          final_acc_out <= acc_out;
        end
      end
    end // Finalsum_reg_process

  assign output_da = final_acc_out;

  assign output_typeconvert = output_da;

  always @ (posedge clk or posedge reset)
    begin: Output_Register_process
      if (reset == 1'b1) begin
        output_register <= 0;
      end
      else begin
        if (phase_23 == 1'b1) begin
          output_register <= output_typeconvert;
        end
      end
    end // Output_Register_process

  // Assignment Statements
  assign filter_out = output_register;
endmodule  // fir_min_24b_da
