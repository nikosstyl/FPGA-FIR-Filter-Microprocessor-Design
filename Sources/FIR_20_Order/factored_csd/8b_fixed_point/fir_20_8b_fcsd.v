// -------------------------------------------------------------
//
// Module: fir_20_8b_fcsd
// Generated by MATLAB(R) 9.12 and Filter Design HDL Coder 3.1.11.
// Generated on: 2023-06-21 23:56:56
// -------------------------------------------------------------

// -------------------------------------------------------------
// HDL Code Generation Options:
//
// CoeffMultipliers: Factored-CSD
// FIRAdderStyle: tree
// OptimizeForHDL: on
// TargetDirectory: W:\Nikos\UTh\Σχεδίαση Επεξεργαστών\Project\FIR_20_Order\factored_csd\8b_fixed_point
// AddPipelineRegisters: on
// Name: fir_20_8b_fcsd
// InputDataType: numerictype(1,8,0)
// TargetLanguage: Verilog
// TestBenchName: fir_20_16b_fcsd_tb
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
// HDL Implementation    : Fully parallel
// Folding Factor        : 1
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

module fir_20_8b_fcsd
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
//Module Architecture: fir_20_8b_fcsd
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
  reg  signed [7:0] delay_pipeline [0:20] ; // sfix8
  wire signed [15:0] product19; // sfix16_En8
  wire signed [15:0] product18; // sfix16_En8
  wire signed [10:0] mulcsd_temp; // sfix11_En8
  wire signed [15:0] product17; // sfix16_En8
  wire signed [15:0] product16; // sfix16_En8
  wire signed [15:0] product15; // sfix16_En8
  wire signed [13:0] mulcsd_temp_1; // sfix14_En8
  wire signed [15:0] product14; // sfix16_En8
  wire signed [13:0] mulcsd_temp_2; // sfix14_En8
  wire signed [15:0] product13; // sfix16_En8
  wire signed [14:0] mulcsd_temp_3; // sfix15_En8
  wire signed [15:0] product12; // sfix16_En8
  wire signed [14:0] mulcsd_temp_4; // sfix15_En8
  wire signed [15:0] product11; // sfix16_En8
  wire signed [14:0] mulcsd_temp_5; // sfix15_En8
  wire signed [15:0] product10; // sfix16_En8
  wire signed [14:0] mulcsd_temp_6; // sfix15_En8
  wire signed [15:0] product9; // sfix16_En8
  wire signed [14:0] mulcsd_temp_7; // sfix15_En8
  wire signed [15:0] product8; // sfix16_En8
  wire signed [13:0] mulcsd_temp_8; // sfix14_En8
  wire signed [15:0] product7; // sfix16_En8
  wire signed [13:0] mulcsd_temp_9; // sfix14_En8
  wire signed [15:0] product6; // sfix16_En8
  wire signed [15:0] product5; // sfix16_En8
  wire signed [15:0] product4; // sfix16_En8
  wire signed [10:0] mulcsd_temp_10; // sfix11_En8
  wire signed [15:0] product3; // sfix16_En8
  wire signed [20:0] sum_final; // sfix21_En8
  wire signed [20:0] sum1_1; // sfix21_En8
  wire signed [15:0] add_signext; // sfix16_En8
  wire signed [15:0] add_signext_1; // sfix16_En8
  wire signed [16:0] add_temp; // sfix17_En8
  reg  signed [20:0] sumpipe1_1; // sfix21_En8
  wire signed [20:0] sum1_2; // sfix21_En8
  wire signed [15:0] add_signext_2; // sfix16_En8
  wire signed [15:0] add_signext_3; // sfix16_En8
  wire signed [16:0] add_temp_1; // sfix17_En8
  reg  signed [20:0] sumpipe1_2; // sfix21_En8
  wire signed [20:0] sum1_3; // sfix21_En8
  wire signed [15:0] add_signext_4; // sfix16_En8
  wire signed [15:0] add_signext_5; // sfix16_En8
  wire signed [16:0] add_temp_2; // sfix17_En8
  reg  signed [20:0] sumpipe1_3; // sfix21_En8
  wire signed [20:0] sum1_4; // sfix21_En8
  wire signed [15:0] add_signext_6; // sfix16_En8
  wire signed [15:0] add_signext_7; // sfix16_En8
  wire signed [16:0] add_temp_3; // sfix17_En8
  reg  signed [20:0] sumpipe1_4; // sfix21_En8
  wire signed [20:0] sum1_5; // sfix21_En8
  wire signed [15:0] add_signext_8; // sfix16_En8
  wire signed [15:0] add_signext_9; // sfix16_En8
  wire signed [16:0] add_temp_4; // sfix17_En8
  reg  signed [20:0] sumpipe1_5; // sfix21_En8
  wire signed [20:0] sum1_6; // sfix21_En8
  wire signed [15:0] add_signext_10; // sfix16_En8
  wire signed [15:0] add_signext_11; // sfix16_En8
  wire signed [16:0] add_temp_5; // sfix17_En8
  reg  signed [20:0] sumpipe1_6; // sfix21_En8
  wire signed [20:0] sum1_7; // sfix21_En8
  wire signed [15:0] add_signext_12; // sfix16_En8
  wire signed [15:0] add_signext_13; // sfix16_En8
  wire signed [16:0] add_temp_6; // sfix17_En8
  reg  signed [20:0] sumpipe1_7; // sfix21_En8
  wire signed [20:0] sum1_8; // sfix21_En8
  wire signed [15:0] add_signext_14; // sfix16_En8
  wire signed [15:0] add_signext_15; // sfix16_En8
  wire signed [16:0] add_temp_7; // sfix17_En8
  reg  signed [20:0] sumpipe1_8; // sfix21_En8
  reg  signed [15:0] sumpipe1_9; // sfix16_En8
  wire signed [20:0] sum2_1; // sfix21_En8
  wire signed [20:0] add_signext_16; // sfix21_En8
  wire signed [20:0] add_signext_17; // sfix21_En8
  wire signed [21:0] add_temp_8; // sfix22_En8
  reg  signed [20:0] sumpipe2_1; // sfix21_En8
  wire signed [20:0] sum2_2; // sfix21_En8
  wire signed [20:0] add_signext_18; // sfix21_En8
  wire signed [20:0] add_signext_19; // sfix21_En8
  wire signed [21:0] add_temp_9; // sfix22_En8
  reg  signed [20:0] sumpipe2_2; // sfix21_En8
  wire signed [20:0] sum2_3; // sfix21_En8
  wire signed [20:0] add_signext_20; // sfix21_En8
  wire signed [20:0] add_signext_21; // sfix21_En8
  wire signed [21:0] add_temp_10; // sfix22_En8
  reg  signed [20:0] sumpipe2_3; // sfix21_En8
  wire signed [20:0] sum2_4; // sfix21_En8
  wire signed [20:0] add_signext_22; // sfix21_En8
  wire signed [20:0] add_signext_23; // sfix21_En8
  wire signed [21:0] add_temp_11; // sfix22_En8
  reg  signed [20:0] sumpipe2_4; // sfix21_En8
  reg  signed [15:0] sumpipe2_5; // sfix16_En8
  wire signed [20:0] sum3_1; // sfix21_En8
  wire signed [20:0] add_signext_24; // sfix21_En8
  wire signed [20:0] add_signext_25; // sfix21_En8
  wire signed [21:0] add_temp_12; // sfix22_En8
  reg  signed [20:0] sumpipe3_1; // sfix21_En8
  wire signed [20:0] sum3_2; // sfix21_En8
  wire signed [20:0] add_signext_26; // sfix21_En8
  wire signed [20:0] add_signext_27; // sfix21_En8
  wire signed [21:0] add_temp_13; // sfix22_En8
  reg  signed [20:0] sumpipe3_2; // sfix21_En8
  reg  signed [15:0] sumpipe3_3; // sfix16_En8
  wire signed [20:0] sum4_1; // sfix21_En8
  wire signed [20:0] add_signext_28; // sfix21_En8
  wire signed [20:0] add_signext_29; // sfix21_En8
  wire signed [21:0] add_temp_14; // sfix22_En8
  reg  signed [20:0] sumpipe4_1; // sfix21_En8
  reg  signed [15:0] sumpipe4_2; // sfix16_En8
  wire signed [20:0] sum5_1; // sfix21_En8
  wire signed [20:0] add_signext_30; // sfix21_En8
  wire signed [20:0] add_signext_31; // sfix21_En8
  wire signed [21:0] add_temp_15; // sfix22_En8
  reg  signed [20:0] sumpipe5_1; // sfix21_En8
  reg  signed [20:0] output_register; // sfix21_En8

  // Block Statements
  always @( posedge clk or posedge reset)
    begin: Delay_Pipeline_process
      if (reset == 1'b1) begin
        delay_pipeline[0] <= 0;
        delay_pipeline[1] <= 0;
        delay_pipeline[2] <= 0;
        delay_pipeline[3] <= 0;
        delay_pipeline[4] <= 0;
        delay_pipeline[5] <= 0;
        delay_pipeline[6] <= 0;
        delay_pipeline[7] <= 0;
        delay_pipeline[8] <= 0;
        delay_pipeline[9] <= 0;
        delay_pipeline[10] <= 0;
        delay_pipeline[11] <= 0;
        delay_pipeline[12] <= 0;
        delay_pipeline[13] <= 0;
        delay_pipeline[14] <= 0;
        delay_pipeline[15] <= 0;
        delay_pipeline[16] <= 0;
        delay_pipeline[17] <= 0;
        delay_pipeline[18] <= 0;
        delay_pipeline[19] <= 0;
        delay_pipeline[20] <= 0;
      end
      else begin
        if (clk_enable == 1'b1) begin
          delay_pipeline[0] <= filter_in;
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
        end
      end
    end // Delay_Pipeline_process


  assign product19 = $signed({{8{delay_pipeline[18][7]}}, delay_pipeline[18]});

// For FCSD of 3, optimizing to CSD due to lower cost
  assign mulcsd_temp = 
        $signed({delay_pipeline[17], 2'b00}) -
        delay_pipeline[17];
  assign product18 = $signed({{5{mulcsd_temp[10]}}, mulcsd_temp});

  assign product17 = $signed({delay_pipeline[16][7:0], 3'b000});

  assign product16 = $signed({delay_pipeline[15][7:0], 4'b0000});

// For FCSD of 28, optimizing to CSD due to lower cost
  assign mulcsd_temp_1 = 
        $signed({delay_pipeline[14], 5'b00000}) -
        $signed({delay_pipeline[14], 2'b00});
  assign product15 = $signed({{2{mulcsd_temp_1[13]}}, mulcsd_temp_1});

// For FCSD of 42, optimizing to CSD due to lower cost
  assign mulcsd_temp_2 = 
        $signed({delay_pipeline[13], 5'b00000}) +
        $signed({delay_pipeline[13], 3'b000}) +
        $signed({delay_pipeline[13], 1'b0});
  assign product14 = $signed({{2{mulcsd_temp_2[13]}}, mulcsd_temp_2});

// For FCSD of 56, optimizing to CSD due to lower cost
  assign mulcsd_temp_3 = 
        $signed({delay_pipeline[12], 6'b000000}) -
        $signed({delay_pipeline[12], 3'b000});
  assign product13 = $signed({{1{mulcsd_temp_3[14]}}, mulcsd_temp_3});

// For FCSD of 66, optimizing to CSD due to lower cost
  assign mulcsd_temp_4 = 
        $signed({delay_pipeline[11], 6'b000000}) +
        $signed({delay_pipeline[11], 1'b0});
  assign product12 = $signed({{1{mulcsd_temp_4[14]}}, mulcsd_temp_4});

// For FCSD of 70, optimizing to CSD due to lower cost
  assign mulcsd_temp_5 = 
        $signed({delay_pipeline[10], 6'b000000}) +
        $signed({delay_pipeline[10], 3'b000}) -
        $signed({delay_pipeline[10], 1'b0});
  assign product11 = $signed({{1{mulcsd_temp_5[14]}}, mulcsd_temp_5});

// For FCSD of 66, optimizing to CSD due to lower cost
  assign mulcsd_temp_6 = 
        $signed({delay_pipeline[9], 6'b000000}) +
        $signed({delay_pipeline[9], 1'b0});
  assign product10 = $signed({{1{mulcsd_temp_6[14]}}, mulcsd_temp_6});

// For FCSD of 56, optimizing to CSD due to lower cost
  assign mulcsd_temp_7 = 
        $signed({delay_pipeline[8], 6'b000000}) -
        $signed({delay_pipeline[8], 3'b000});
  assign product9 = $signed({{1{mulcsd_temp_7[14]}}, mulcsd_temp_7});

// For FCSD of 42, optimizing to CSD due to lower cost
  assign mulcsd_temp_8 = 
        $signed({delay_pipeline[7], 5'b00000}) +
        $signed({delay_pipeline[7], 3'b000}) +
        $signed({delay_pipeline[7], 1'b0});
  assign product8 = $signed({{2{mulcsd_temp_8[13]}}, mulcsd_temp_8});

// For FCSD of 28, optimizing to CSD due to lower cost
  assign mulcsd_temp_9 = 
        $signed({delay_pipeline[6], 5'b00000}) -
        $signed({delay_pipeline[6], 2'b00});
  assign product7 = $signed({{2{mulcsd_temp_9[13]}}, mulcsd_temp_9});

  assign product6 = $signed({delay_pipeline[5][7:0], 4'b0000});

  assign product5 = $signed({delay_pipeline[4][7:0], 3'b000});

// For FCSD of 3, optimizing to CSD due to lower cost
  assign mulcsd_temp_10 = 
        $signed({delay_pipeline[3], 2'b00}) -
        delay_pipeline[3];
  assign product4 = $signed({{5{mulcsd_temp_10[10]}}, mulcsd_temp_10});

  assign product3 = $signed({{8{delay_pipeline[2][7]}}, delay_pipeline[2]});

  assign add_signext = product19;
  assign add_signext_1 = product18;
  assign add_temp = add_signext + add_signext_1;
  assign sum1_1 = $signed({{4{add_temp[16]}}, add_temp});

  assign add_signext_2 = product17;
  assign add_signext_3 = product16;
  assign add_temp_1 = add_signext_2 + add_signext_3;
  assign sum1_2 = $signed({{4{add_temp_1[16]}}, add_temp_1});

  assign add_signext_4 = product15;
  assign add_signext_5 = product14;
  assign add_temp_2 = add_signext_4 + add_signext_5;
  assign sum1_3 = $signed({{4{add_temp_2[16]}}, add_temp_2});

  assign add_signext_6 = product13;
  assign add_signext_7 = product12;
  assign add_temp_3 = add_signext_6 + add_signext_7;
  assign sum1_4 = $signed({{4{add_temp_3[16]}}, add_temp_3});

  assign add_signext_8 = product11;
  assign add_signext_9 = product10;
  assign add_temp_4 = add_signext_8 + add_signext_9;
  assign sum1_5 = $signed({{4{add_temp_4[16]}}, add_temp_4});

  assign add_signext_10 = product9;
  assign add_signext_11 = product8;
  assign add_temp_5 = add_signext_10 + add_signext_11;
  assign sum1_6 = $signed({{4{add_temp_5[16]}}, add_temp_5});

  assign add_signext_12 = product7;
  assign add_signext_13 = product6;
  assign add_temp_6 = add_signext_12 + add_signext_13;
  assign sum1_7 = $signed({{4{add_temp_6[16]}}, add_temp_6});

  assign add_signext_14 = product5;
  assign add_signext_15 = product4;
  assign add_temp_7 = add_signext_14 + add_signext_15;
  assign sum1_8 = $signed({{4{add_temp_7[16]}}, add_temp_7});

  always @ (posedge clk or posedge reset)
    begin: temp_process1
      if (reset == 1'b1) begin
        sumpipe1_1 <= 0;
        sumpipe1_2 <= 0;
        sumpipe1_3 <= 0;
        sumpipe1_4 <= 0;
        sumpipe1_5 <= 0;
        sumpipe1_6 <= 0;
        sumpipe1_7 <= 0;
        sumpipe1_8 <= 0;
        sumpipe1_9 <= 0;
      end
      else begin
        if (clk_enable == 1'b1) begin
          sumpipe1_1 <= sum1_1;
          sumpipe1_2 <= sum1_2;
          sumpipe1_3 <= sum1_3;
          sumpipe1_4 <= sum1_4;
          sumpipe1_5 <= sum1_5;
          sumpipe1_6 <= sum1_6;
          sumpipe1_7 <= sum1_7;
          sumpipe1_8 <= sum1_8;
          sumpipe1_9 <= product3;
        end
      end
    end // temp_process1

  assign add_signext_16 = sumpipe1_1;
  assign add_signext_17 = sumpipe1_2;
  assign add_temp_8 = add_signext_16 + add_signext_17;
  assign sum2_1 = add_temp_8[20:0];

  assign add_signext_18 = sumpipe1_3;
  assign add_signext_19 = sumpipe1_4;
  assign add_temp_9 = add_signext_18 + add_signext_19;
  assign sum2_2 = add_temp_9[20:0];

  assign add_signext_20 = sumpipe1_5;
  assign add_signext_21 = sumpipe1_6;
  assign add_temp_10 = add_signext_20 + add_signext_21;
  assign sum2_3 = add_temp_10[20:0];

  assign add_signext_22 = sumpipe1_7;
  assign add_signext_23 = sumpipe1_8;
  assign add_temp_11 = add_signext_22 + add_signext_23;
  assign sum2_4 = add_temp_11[20:0];

  always @ (posedge clk or posedge reset)
    begin: temp_process2
      if (reset == 1'b1) begin
        sumpipe2_1 <= 0;
        sumpipe2_2 <= 0;
        sumpipe2_3 <= 0;
        sumpipe2_4 <= 0;
        sumpipe2_5 <= 0;
      end
      else begin
        if (clk_enable == 1'b1) begin
          sumpipe2_1 <= sum2_1;
          sumpipe2_2 <= sum2_2;
          sumpipe2_3 <= sum2_3;
          sumpipe2_4 <= sum2_4;
          sumpipe2_5 <= sumpipe1_9;
        end
      end
    end // temp_process2

  assign add_signext_24 = sumpipe2_1;
  assign add_signext_25 = sumpipe2_2;
  assign add_temp_12 = add_signext_24 + add_signext_25;
  assign sum3_1 = add_temp_12[20:0];

  assign add_signext_26 = sumpipe2_3;
  assign add_signext_27 = sumpipe2_4;
  assign add_temp_13 = add_signext_26 + add_signext_27;
  assign sum3_2 = add_temp_13[20:0];

  always @ (posedge clk or posedge reset)
    begin: temp_process3
      if (reset == 1'b1) begin
        sumpipe3_1 <= 0;
        sumpipe3_2 <= 0;
        sumpipe3_3 <= 0;
      end
      else begin
        if (clk_enable == 1'b1) begin
          sumpipe3_1 <= sum3_1;
          sumpipe3_2 <= sum3_2;
          sumpipe3_3 <= sumpipe2_5;
        end
      end
    end // temp_process3

  assign add_signext_28 = sumpipe3_1;
  assign add_signext_29 = sumpipe3_2;
  assign add_temp_14 = add_signext_28 + add_signext_29;
  assign sum4_1 = add_temp_14[20:0];

  always @ (posedge clk or posedge reset)
    begin: temp_process4
      if (reset == 1'b1) begin
        sumpipe4_1 <= 0;
        sumpipe4_2 <= 0;
      end
      else begin
        if (clk_enable == 1'b1) begin
          sumpipe4_1 <= sum4_1;
          sumpipe4_2 <= sumpipe3_3;
        end
      end
    end // temp_process4

  assign add_signext_30 = sumpipe4_1;
  assign add_signext_31 = $signed({{5{sumpipe4_2[15]}}, sumpipe4_2});
  assign add_temp_15 = add_signext_30 + add_signext_31;
  assign sum5_1 = add_temp_15[20:0];

  always @ (posedge clk or posedge reset)
    begin: temp_process5
      if (reset == 1'b1) begin
        sumpipe5_1 <= 0;
      end
      else begin
        if (clk_enable == 1'b1) begin
          sumpipe5_1 <= sum5_1;
        end
      end
    end // temp_process5

  assign sum_final = sumpipe5_1;

  always @ (posedge clk or posedge reset)
    begin: Output_Register_process
      if (reset == 1'b1) begin
        output_register <= 0;
      end
      else begin
        if (clk_enable == 1'b1) begin
          output_register <= sum_final;
        end
      end
    end // Output_Register_process

  // Assignment Statements
  assign filter_out = output_register;
endmodule  // fir_20_8b_fcsd