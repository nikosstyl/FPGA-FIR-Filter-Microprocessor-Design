// -------------------------------------------------------------
//
// Module: fir_20_24b_1p
// Generated by MATLAB(R) 9.12 and Filter Design HDL Coder 3.1.11.
// Generated on: 2023-06-21 23:43:19
// -------------------------------------------------------------

// -------------------------------------------------------------
// HDL Code Generation Options:
//
// FIRAdderStyle: tree
// MultiplierInputPipeline: 1
// MultiplierOutputPipeline: 1
// OptimizeForHDL: on
// TargetDirectory: W:\Nikos\UTh\Σχεδίαση Επεξεργαστών\Project\FIR_20_Order\multiplier_1_pipeline\24b_fixed_point
// AddPipelineRegisters: on
// Name: fir_20_24b_1p
// InputDataType: numerictype(1,24,0)
// TargetLanguage: Verilog
// TestBenchName: fir_20_24b_1p_tb
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
// Numerator         : s24,24 -> [-5.000000e-01 5.000000e-01)
// -------------------------------------------------------------




`timescale 1 ns / 1 ns

module fir_20_24b_1p
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
  output  signed [52:0] filter_out; //sfix53_En24

////////////////////////////////////////////////////////////////
//Module Architecture: fir_20_24b_1p
////////////////////////////////////////////////////////////////
  // Local Functions
  // Type Definitions
  // Constants
  parameter signed [23:0] coeff1 = 24'b000000000000011001010011; //sfix24_En24
  parameter signed [23:0] coeff2 = 24'b000000000011100000111110; //sfix24_En24
  parameter signed [23:0] coeff3 = 24'b000000001111111100011101; //sfix24_En24
  parameter signed [23:0] coeff4 = 24'b000000110010011111100000; //sfix24_En24
  parameter signed [23:0] coeff5 = 24'b000001111100110100001011; //sfix24_En24
  parameter signed [23:0] coeff6 = 24'b000011111110110000011001; //sfix24_En24
  parameter signed [23:0] coeff7 = 24'b000110111011011100011110; //sfix24_En24
  parameter signed [23:0] coeff8 = 24'b001010011111101000001101; //sfix24_En24
  parameter signed [23:0] coeff9 = 24'b001110000000011111001100; //sfix24_En24
  parameter signed [23:0] coeff10 = 24'b010000100111000000010111; //sfix24_En24
  parameter signed [23:0] coeff11 = 24'b010001100100100110010110; //sfix24_En24
  parameter signed [23:0] coeff12 = 24'b010000100111000000010111; //sfix24_En24
  parameter signed [23:0] coeff13 = 24'b001110000000011111001100; //sfix24_En24
  parameter signed [23:0] coeff14 = 24'b001010011111101000001101; //sfix24_En24
  parameter signed [23:0] coeff15 = 24'b000110111011011100011110; //sfix24_En24
  parameter signed [23:0] coeff16 = 24'b000011111110110000011001; //sfix24_En24
  parameter signed [23:0] coeff17 = 24'b000001111100110100001011; //sfix24_En24
  parameter signed [23:0] coeff18 = 24'b000000110010011111100000; //sfix24_En24
  parameter signed [23:0] coeff19 = 24'b000000001111111100011101; //sfix24_En24
  parameter signed [23:0] coeff20 = 24'b000000000011100000111110; //sfix24_En24
  parameter signed [23:0] coeff21 = 24'b000000000000011001010011; //sfix24_En24

  // Signals
  reg  signed [23:0] delay_pipeline [0:20] ; // sfix24
  wire signed [47:0] product21; // sfix48_En24
  reg  signed [23:0] delay_pipeline_20_under_pipe; // sfix24
  reg  signed [23:0] coeff21_pipe; // sfix24_En24
  reg  signed [47:0] product21_pipe; // sfix48_En24
  wire signed [47:0] product20; // sfix48_En24
  reg  signed [23:0] delay_pipeline_19_under_pipe; // sfix24
  reg  signed [23:0] coeff20_pipe; // sfix24_En24
  reg  signed [47:0] product20_pipe; // sfix48_En24
  wire signed [47:0] product19; // sfix48_En24
  reg  signed [23:0] delay_pipeline_18_under_pipe; // sfix24
  reg  signed [23:0] coeff19_pipe; // sfix24_En24
  reg  signed [47:0] product19_pipe; // sfix48_En24
  wire signed [47:0] product18; // sfix48_En24
  reg  signed [23:0] delay_pipeline_17_under_pipe; // sfix24
  reg  signed [23:0] coeff18_pipe; // sfix24_En24
  reg  signed [47:0] product18_pipe; // sfix48_En24
  wire signed [47:0] product17; // sfix48_En24
  reg  signed [23:0] delay_pipeline_16_under_pipe; // sfix24
  reg  signed [23:0] coeff17_pipe; // sfix24_En24
  reg  signed [47:0] product17_pipe; // sfix48_En24
  wire signed [47:0] product16; // sfix48_En24
  reg  signed [23:0] delay_pipeline_15_under_pipe; // sfix24
  reg  signed [23:0] coeff16_pipe; // sfix24_En24
  reg  signed [47:0] product16_pipe; // sfix48_En24
  wire signed [47:0] product15; // sfix48_En24
  reg  signed [23:0] delay_pipeline_14_under_pipe; // sfix24
  reg  signed [23:0] coeff15_pipe; // sfix24_En24
  reg  signed [47:0] product15_pipe; // sfix48_En24
  wire signed [47:0] product14; // sfix48_En24
  reg  signed [23:0] delay_pipeline_13_under_pipe; // sfix24
  reg  signed [23:0] coeff14_pipe; // sfix24_En24
  reg  signed [47:0] product14_pipe; // sfix48_En24
  wire signed [47:0] product13; // sfix48_En24
  reg  signed [23:0] delay_pipeline_12_under_pipe; // sfix24
  reg  signed [23:0] coeff13_pipe; // sfix24_En24
  reg  signed [47:0] product13_pipe; // sfix48_En24
  wire signed [47:0] product12; // sfix48_En24
  reg  signed [23:0] delay_pipeline_11_under_pipe; // sfix24
  reg  signed [23:0] coeff12_pipe; // sfix24_En24
  reg  signed [47:0] product12_pipe; // sfix48_En24
  wire signed [47:0] product11; // sfix48_En24
  reg  signed [23:0] delay_pipeline_10_under_pipe; // sfix24
  reg  signed [23:0] coeff11_pipe; // sfix24_En24
  reg  signed [47:0] product11_pipe; // sfix48_En24
  wire signed [47:0] product10; // sfix48_En24
  reg  signed [23:0] delay_pipeline_9_under_pipe; // sfix24
  reg  signed [23:0] coeff10_pipe; // sfix24_En24
  reg  signed [47:0] product10_pipe; // sfix48_En24
  wire signed [47:0] product9; // sfix48_En24
  reg  signed [23:0] delay_pipeline_8_under_pipe; // sfix24
  reg  signed [23:0] coeff9_pipe; // sfix24_En24
  reg  signed [47:0] product9_pipe; // sfix48_En24
  wire signed [47:0] product8; // sfix48_En24
  reg  signed [23:0] delay_pipeline_7_under_pipe; // sfix24
  reg  signed [23:0] coeff8_pipe; // sfix24_En24
  reg  signed [47:0] product8_pipe; // sfix48_En24
  wire signed [47:0] product7; // sfix48_En24
  reg  signed [23:0] delay_pipeline_6_under_pipe; // sfix24
  reg  signed [23:0] coeff7_pipe; // sfix24_En24
  reg  signed [47:0] product7_pipe; // sfix48_En24
  wire signed [47:0] product6; // sfix48_En24
  reg  signed [23:0] delay_pipeline_5_under_pipe; // sfix24
  reg  signed [23:0] coeff6_pipe; // sfix24_En24
  reg  signed [47:0] product6_pipe; // sfix48_En24
  wire signed [47:0] product5; // sfix48_En24
  reg  signed [23:0] delay_pipeline_4_under_pipe; // sfix24
  reg  signed [23:0] coeff5_pipe; // sfix24_En24
  reg  signed [47:0] product5_pipe; // sfix48_En24
  wire signed [47:0] product4; // sfix48_En24
  reg  signed [23:0] delay_pipeline_3_under_pipe; // sfix24
  reg  signed [23:0] coeff4_pipe; // sfix24_En24
  reg  signed [47:0] product4_pipe; // sfix48_En24
  wire signed [47:0] product3; // sfix48_En24
  reg  signed [23:0] delay_pipeline_2_under_pipe; // sfix24
  reg  signed [23:0] coeff3_pipe; // sfix24_En24
  reg  signed [47:0] product3_pipe; // sfix48_En24
  wire signed [47:0] product2; // sfix48_En24
  reg  signed [23:0] delay_pipeline_1_under_pipe; // sfix24
  reg  signed [23:0] coeff2_pipe; // sfix24_En24
  reg  signed [47:0] product2_pipe; // sfix48_En24
  wire signed [47:0] product1; // sfix48_En24
  reg  signed [23:0] delay_pipeline_0_under_pipe; // sfix24
  reg  signed [23:0] coeff1_pipe; // sfix24_En24
  reg  signed [47:0] product1_pipe; // sfix48_En24
  wire signed [52:0] sum_final; // sfix53_En24
  wire signed [52:0] sum1_1; // sfix53_En24
  wire signed [47:0] add_signext; // sfix48_En24
  wire signed [47:0] add_signext_1; // sfix48_En24
  wire signed [48:0] add_temp; // sfix49_En24
  reg  signed [52:0] sumpipe1_1; // sfix53_En24
  wire signed [52:0] sum1_2; // sfix53_En24
  wire signed [47:0] add_signext_2; // sfix48_En24
  wire signed [47:0] add_signext_3; // sfix48_En24
  wire signed [48:0] add_temp_1; // sfix49_En24
  reg  signed [52:0] sumpipe1_2; // sfix53_En24
  wire signed [52:0] sum1_3; // sfix53_En24
  wire signed [47:0] add_signext_4; // sfix48_En24
  wire signed [47:0] add_signext_5; // sfix48_En24
  wire signed [48:0] add_temp_2; // sfix49_En24
  reg  signed [52:0] sumpipe1_3; // sfix53_En24
  wire signed [52:0] sum1_4; // sfix53_En24
  wire signed [47:0] add_signext_6; // sfix48_En24
  wire signed [47:0] add_signext_7; // sfix48_En24
  wire signed [48:0] add_temp_3; // sfix49_En24
  reg  signed [52:0] sumpipe1_4; // sfix53_En24
  wire signed [52:0] sum1_5; // sfix53_En24
  wire signed [47:0] add_signext_8; // sfix48_En24
  wire signed [47:0] add_signext_9; // sfix48_En24
  wire signed [48:0] add_temp_4; // sfix49_En24
  reg  signed [52:0] sumpipe1_5; // sfix53_En24
  wire signed [52:0] sum1_6; // sfix53_En24
  wire signed [47:0] add_signext_10; // sfix48_En24
  wire signed [47:0] add_signext_11; // sfix48_En24
  wire signed [48:0] add_temp_5; // sfix49_En24
  reg  signed [52:0] sumpipe1_6; // sfix53_En24
  wire signed [52:0] sum1_7; // sfix53_En24
  wire signed [47:0] add_signext_12; // sfix48_En24
  wire signed [47:0] add_signext_13; // sfix48_En24
  wire signed [48:0] add_temp_6; // sfix49_En24
  reg  signed [52:0] sumpipe1_7; // sfix53_En24
  wire signed [52:0] sum1_8; // sfix53_En24
  wire signed [47:0] add_signext_14; // sfix48_En24
  wire signed [47:0] add_signext_15; // sfix48_En24
  wire signed [48:0] add_temp_7; // sfix49_En24
  reg  signed [52:0] sumpipe1_8; // sfix53_En24
  wire signed [52:0] sum1_9; // sfix53_En24
  wire signed [47:0] add_signext_16; // sfix48_En24
  wire signed [47:0] add_signext_17; // sfix48_En24
  wire signed [48:0] add_temp_8; // sfix49_En24
  reg  signed [52:0] sumpipe1_9; // sfix53_En24
  wire signed [52:0] sum1_10; // sfix53_En24
  wire signed [47:0] add_signext_18; // sfix48_En24
  wire signed [47:0] add_signext_19; // sfix48_En24
  wire signed [48:0] add_temp_9; // sfix49_En24
  reg  signed [52:0] sumpipe1_10; // sfix53_En24
  reg  signed [47:0] sumpipe1_11; // sfix48_En24
  wire signed [52:0] sum2_1; // sfix53_En24
  wire signed [52:0] add_signext_20; // sfix53_En24
  wire signed [52:0] add_signext_21; // sfix53_En24
  wire signed [53:0] add_temp_10; // sfix54_En24
  reg  signed [52:0] sumpipe2_1; // sfix53_En24
  wire signed [52:0] sum2_2; // sfix53_En24
  wire signed [52:0] add_signext_22; // sfix53_En24
  wire signed [52:0] add_signext_23; // sfix53_En24
  wire signed [53:0] add_temp_11; // sfix54_En24
  reg  signed [52:0] sumpipe2_2; // sfix53_En24
  wire signed [52:0] sum2_3; // sfix53_En24
  wire signed [52:0] add_signext_24; // sfix53_En24
  wire signed [52:0] add_signext_25; // sfix53_En24
  wire signed [53:0] add_temp_12; // sfix54_En24
  reg  signed [52:0] sumpipe2_3; // sfix53_En24
  wire signed [52:0] sum2_4; // sfix53_En24
  wire signed [52:0] add_signext_26; // sfix53_En24
  wire signed [52:0] add_signext_27; // sfix53_En24
  wire signed [53:0] add_temp_13; // sfix54_En24
  reg  signed [52:0] sumpipe2_4; // sfix53_En24
  wire signed [52:0] sum2_5; // sfix53_En24
  wire signed [52:0] add_signext_28; // sfix53_En24
  wire signed [52:0] add_signext_29; // sfix53_En24
  wire signed [53:0] add_temp_14; // sfix54_En24
  reg  signed [52:0] sumpipe2_5; // sfix53_En24
  reg  signed [47:0] sumpipe2_6; // sfix48_En24
  wire signed [52:0] sum3_1; // sfix53_En24
  wire signed [52:0] add_signext_30; // sfix53_En24
  wire signed [52:0] add_signext_31; // sfix53_En24
  wire signed [53:0] add_temp_15; // sfix54_En24
  reg  signed [52:0] sumpipe3_1; // sfix53_En24
  wire signed [52:0] sum3_2; // sfix53_En24
  wire signed [52:0] add_signext_32; // sfix53_En24
  wire signed [52:0] add_signext_33; // sfix53_En24
  wire signed [53:0] add_temp_16; // sfix54_En24
  reg  signed [52:0] sumpipe3_2; // sfix53_En24
  wire signed [52:0] sum3_3; // sfix53_En24
  wire signed [52:0] add_signext_34; // sfix53_En24
  wire signed [52:0] add_signext_35; // sfix53_En24
  wire signed [53:0] add_temp_17; // sfix54_En24
  reg  signed [52:0] sumpipe3_3; // sfix53_En24
  wire signed [52:0] sum4_1; // sfix53_En24
  wire signed [52:0] add_signext_36; // sfix53_En24
  wire signed [52:0] add_signext_37; // sfix53_En24
  wire signed [53:0] add_temp_18; // sfix54_En24
  reg  signed [52:0] sumpipe4_1; // sfix53_En24
  reg  signed [52:0] sumpipe4_2; // sfix53_En24
  wire signed [52:0] sum5_1; // sfix53_En24
  wire signed [52:0] add_signext_38; // sfix53_En24
  wire signed [52:0] add_signext_39; // sfix53_En24
  wire signed [53:0] add_temp_19; // sfix54_En24
  reg  signed [52:0] sumpipe5_1; // sfix53_En24
  reg  signed [52:0] output_register; // sfix53_En24

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


  always @ (posedge clk or posedge reset)
    begin: temp_process1
      if (reset == 1'b1) begin
        delay_pipeline_20_under_pipe <= 0;
        coeff21_pipe <= 0;
        product21_pipe <= 0;
      end
      else begin
        if (clk_enable == 1'b1) begin
          delay_pipeline_20_under_pipe <= delay_pipeline[20];
          coeff21_pipe <= coeff21;

          product21_pipe <= delay_pipeline_20_under_pipe * coeff21_pipe;

        end
      end
    end // temp_process1

  assign product21 = product21_pipe;

  always @ (posedge clk or posedge reset)
    begin: temp_process2
      if (reset == 1'b1) begin
        delay_pipeline_19_under_pipe <= 0;
        coeff20_pipe <= 0;
        product20_pipe <= 0;
      end
      else begin
        if (clk_enable == 1'b1) begin
          delay_pipeline_19_under_pipe <= delay_pipeline[19];
          coeff20_pipe <= coeff20;

          product20_pipe <= delay_pipeline_19_under_pipe * coeff20_pipe;

        end
      end
    end // temp_process2

  assign product20 = product20_pipe;

  always @ (posedge clk or posedge reset)
    begin: temp_process3
      if (reset == 1'b1) begin
        delay_pipeline_18_under_pipe <= 0;
        coeff19_pipe <= 0;
        product19_pipe <= 0;
      end
      else begin
        if (clk_enable == 1'b1) begin
          delay_pipeline_18_under_pipe <= delay_pipeline[18];
          coeff19_pipe <= coeff19;

          product19_pipe <= delay_pipeline_18_under_pipe * coeff19_pipe;

        end
      end
    end // temp_process3

  assign product19 = product19_pipe;

  always @ (posedge clk or posedge reset)
    begin: temp_process4
      if (reset == 1'b1) begin
        delay_pipeline_17_under_pipe <= 0;
        coeff18_pipe <= 0;
        product18_pipe <= 0;
      end
      else begin
        if (clk_enable == 1'b1) begin
          delay_pipeline_17_under_pipe <= delay_pipeline[17];
          coeff18_pipe <= coeff18;

          product18_pipe <= delay_pipeline_17_under_pipe * coeff18_pipe;

        end
      end
    end // temp_process4

  assign product18 = product18_pipe;

  always @ (posedge clk or posedge reset)
    begin: temp_process5
      if (reset == 1'b1) begin
        delay_pipeline_16_under_pipe <= 0;
        coeff17_pipe <= 0;
        product17_pipe <= 0;
      end
      else begin
        if (clk_enable == 1'b1) begin
          delay_pipeline_16_under_pipe <= delay_pipeline[16];
          coeff17_pipe <= coeff17;

          product17_pipe <= delay_pipeline_16_under_pipe * coeff17_pipe;

        end
      end
    end // temp_process5

  assign product17 = product17_pipe;

  always @ (posedge clk or posedge reset)
    begin: temp_process6
      if (reset == 1'b1) begin
        delay_pipeline_15_under_pipe <= 0;
        coeff16_pipe <= 0;
        product16_pipe <= 0;
      end
      else begin
        if (clk_enable == 1'b1) begin
          delay_pipeline_15_under_pipe <= delay_pipeline[15];
          coeff16_pipe <= coeff16;

          product16_pipe <= delay_pipeline_15_under_pipe * coeff16_pipe;

        end
      end
    end // temp_process6

  assign product16 = product16_pipe;

  always @ (posedge clk or posedge reset)
    begin: temp_process7
      if (reset == 1'b1) begin
        delay_pipeline_14_under_pipe <= 0;
        coeff15_pipe <= 0;
        product15_pipe <= 0;
      end
      else begin
        if (clk_enable == 1'b1) begin
          delay_pipeline_14_under_pipe <= delay_pipeline[14];
          coeff15_pipe <= coeff15;

          product15_pipe <= delay_pipeline_14_under_pipe * coeff15_pipe;

        end
      end
    end // temp_process7

  assign product15 = product15_pipe;

  always @ (posedge clk or posedge reset)
    begin: temp_process8
      if (reset == 1'b1) begin
        delay_pipeline_13_under_pipe <= 0;
        coeff14_pipe <= 0;
        product14_pipe <= 0;
      end
      else begin
        if (clk_enable == 1'b1) begin
          delay_pipeline_13_under_pipe <= delay_pipeline[13];
          coeff14_pipe <= coeff14;

          product14_pipe <= delay_pipeline_13_under_pipe * coeff14_pipe;

        end
      end
    end // temp_process8

  assign product14 = product14_pipe;

  always @ (posedge clk or posedge reset)
    begin: temp_process9
      if (reset == 1'b1) begin
        delay_pipeline_12_under_pipe <= 0;
        coeff13_pipe <= 0;
        product13_pipe <= 0;
      end
      else begin
        if (clk_enable == 1'b1) begin
          delay_pipeline_12_under_pipe <= delay_pipeline[12];
          coeff13_pipe <= coeff13;

          product13_pipe <= delay_pipeline_12_under_pipe * coeff13_pipe;

        end
      end
    end // temp_process9

  assign product13 = product13_pipe;

  always @ (posedge clk or posedge reset)
    begin: temp_process10
      if (reset == 1'b1) begin
        delay_pipeline_11_under_pipe <= 0;
        coeff12_pipe <= 0;
        product12_pipe <= 0;
      end
      else begin
        if (clk_enable == 1'b1) begin
          delay_pipeline_11_under_pipe <= delay_pipeline[11];
          coeff12_pipe <= coeff12;

          product12_pipe <= delay_pipeline_11_under_pipe * coeff12_pipe;

        end
      end
    end // temp_process10

  assign product12 = product12_pipe;

  always @ (posedge clk or posedge reset)
    begin: temp_process11
      if (reset == 1'b1) begin
        delay_pipeline_10_under_pipe <= 0;
        coeff11_pipe <= 0;
        product11_pipe <= 0;
      end
      else begin
        if (clk_enable == 1'b1) begin
          delay_pipeline_10_under_pipe <= delay_pipeline[10];
          coeff11_pipe <= coeff11;

          product11_pipe <= delay_pipeline_10_under_pipe * coeff11_pipe;

        end
      end
    end // temp_process11

  assign product11 = product11_pipe;

  always @ (posedge clk or posedge reset)
    begin: temp_process12
      if (reset == 1'b1) begin
        delay_pipeline_9_under_pipe <= 0;
        coeff10_pipe <= 0;
        product10_pipe <= 0;
      end
      else begin
        if (clk_enable == 1'b1) begin
          delay_pipeline_9_under_pipe <= delay_pipeline[9];
          coeff10_pipe <= coeff10;

          product10_pipe <= delay_pipeline_9_under_pipe * coeff10_pipe;

        end
      end
    end // temp_process12

  assign product10 = product10_pipe;

  always @ (posedge clk or posedge reset)
    begin: temp_process13
      if (reset == 1'b1) begin
        delay_pipeline_8_under_pipe <= 0;
        coeff9_pipe <= 0;
        product9_pipe <= 0;
      end
      else begin
        if (clk_enable == 1'b1) begin
          delay_pipeline_8_under_pipe <= delay_pipeline[8];
          coeff9_pipe <= coeff9;

          product9_pipe <= delay_pipeline_8_under_pipe * coeff9_pipe;

        end
      end
    end // temp_process13

  assign product9 = product9_pipe;

  always @ (posedge clk or posedge reset)
    begin: temp_process14
      if (reset == 1'b1) begin
        delay_pipeline_7_under_pipe <= 0;
        coeff8_pipe <= 0;
        product8_pipe <= 0;
      end
      else begin
        if (clk_enable == 1'b1) begin
          delay_pipeline_7_under_pipe <= delay_pipeline[7];
          coeff8_pipe <= coeff8;

          product8_pipe <= delay_pipeline_7_under_pipe * coeff8_pipe;

        end
      end
    end // temp_process14

  assign product8 = product8_pipe;

  always @ (posedge clk or posedge reset)
    begin: temp_process15
      if (reset == 1'b1) begin
        delay_pipeline_6_under_pipe <= 0;
        coeff7_pipe <= 0;
        product7_pipe <= 0;
      end
      else begin
        if (clk_enable == 1'b1) begin
          delay_pipeline_6_under_pipe <= delay_pipeline[6];
          coeff7_pipe <= coeff7;

          product7_pipe <= delay_pipeline_6_under_pipe * coeff7_pipe;

        end
      end
    end // temp_process15

  assign product7 = product7_pipe;

  always @ (posedge clk or posedge reset)
    begin: temp_process16
      if (reset == 1'b1) begin
        delay_pipeline_5_under_pipe <= 0;
        coeff6_pipe <= 0;
        product6_pipe <= 0;
      end
      else begin
        if (clk_enable == 1'b1) begin
          delay_pipeline_5_under_pipe <= delay_pipeline[5];
          coeff6_pipe <= coeff6;

          product6_pipe <= delay_pipeline_5_under_pipe * coeff6_pipe;

        end
      end
    end // temp_process16

  assign product6 = product6_pipe;

  always @ (posedge clk or posedge reset)
    begin: temp_process17
      if (reset == 1'b1) begin
        delay_pipeline_4_under_pipe <= 0;
        coeff5_pipe <= 0;
        product5_pipe <= 0;
      end
      else begin
        if (clk_enable == 1'b1) begin
          delay_pipeline_4_under_pipe <= delay_pipeline[4];
          coeff5_pipe <= coeff5;

          product5_pipe <= delay_pipeline_4_under_pipe * coeff5_pipe;

        end
      end
    end // temp_process17

  assign product5 = product5_pipe;

  always @ (posedge clk or posedge reset)
    begin: temp_process18
      if (reset == 1'b1) begin
        delay_pipeline_3_under_pipe <= 0;
        coeff4_pipe <= 0;
        product4_pipe <= 0;
      end
      else begin
        if (clk_enable == 1'b1) begin
          delay_pipeline_3_under_pipe <= delay_pipeline[3];
          coeff4_pipe <= coeff4;

          product4_pipe <= delay_pipeline_3_under_pipe * coeff4_pipe;

        end
      end
    end // temp_process18

  assign product4 = product4_pipe;

  always @ (posedge clk or posedge reset)
    begin: temp_process19
      if (reset == 1'b1) begin
        delay_pipeline_2_under_pipe <= 0;
        coeff3_pipe <= 0;
        product3_pipe <= 0;
      end
      else begin
        if (clk_enable == 1'b1) begin
          delay_pipeline_2_under_pipe <= delay_pipeline[2];
          coeff3_pipe <= coeff3;

          product3_pipe <= delay_pipeline_2_under_pipe * coeff3_pipe;

        end
      end
    end // temp_process19

  assign product3 = product3_pipe;

  always @ (posedge clk or posedge reset)
    begin: temp_process20
      if (reset == 1'b1) begin
        delay_pipeline_1_under_pipe <= 0;
        coeff2_pipe <= 0;
        product2_pipe <= 0;
      end
      else begin
        if (clk_enable == 1'b1) begin
          delay_pipeline_1_under_pipe <= delay_pipeline[1];
          coeff2_pipe <= coeff2;

          product2_pipe <= delay_pipeline_1_under_pipe * coeff2_pipe;

        end
      end
    end // temp_process20

  assign product2 = product2_pipe;

  always @ (posedge clk or posedge reset)
    begin: temp_process21
      if (reset == 1'b1) begin
        delay_pipeline_0_under_pipe <= 0;
        coeff1_pipe <= 0;
        product1_pipe <= 0;
      end
      else begin
        if (clk_enable == 1'b1) begin
          delay_pipeline_0_under_pipe <= delay_pipeline[0];
          coeff1_pipe <= coeff1;

          product1_pipe <= delay_pipeline_0_under_pipe * coeff1_pipe;

        end
      end
    end // temp_process21

  assign product1 = product1_pipe;

  assign add_signext = product21;
  assign add_signext_1 = product20;
  assign add_temp = add_signext + add_signext_1;
  assign sum1_1 = $signed({{4{add_temp[48]}}, add_temp});

  assign add_signext_2 = product19;
  assign add_signext_3 = product18;
  assign add_temp_1 = add_signext_2 + add_signext_3;
  assign sum1_2 = $signed({{4{add_temp_1[48]}}, add_temp_1});

  assign add_signext_4 = product17;
  assign add_signext_5 = product16;
  assign add_temp_2 = add_signext_4 + add_signext_5;
  assign sum1_3 = $signed({{4{add_temp_2[48]}}, add_temp_2});

  assign add_signext_6 = product15;
  assign add_signext_7 = product14;
  assign add_temp_3 = add_signext_6 + add_signext_7;
  assign sum1_4 = $signed({{4{add_temp_3[48]}}, add_temp_3});

  assign add_signext_8 = product13;
  assign add_signext_9 = product12;
  assign add_temp_4 = add_signext_8 + add_signext_9;
  assign sum1_5 = $signed({{4{add_temp_4[48]}}, add_temp_4});

  assign add_signext_10 = product11;
  assign add_signext_11 = product10;
  assign add_temp_5 = add_signext_10 + add_signext_11;
  assign sum1_6 = $signed({{4{add_temp_5[48]}}, add_temp_5});

  assign add_signext_12 = product9;
  assign add_signext_13 = product8;
  assign add_temp_6 = add_signext_12 + add_signext_13;
  assign sum1_7 = $signed({{4{add_temp_6[48]}}, add_temp_6});

  assign add_signext_14 = product7;
  assign add_signext_15 = product6;
  assign add_temp_7 = add_signext_14 + add_signext_15;
  assign sum1_8 = $signed({{4{add_temp_7[48]}}, add_temp_7});

  assign add_signext_16 = product5;
  assign add_signext_17 = product4;
  assign add_temp_8 = add_signext_16 + add_signext_17;
  assign sum1_9 = $signed({{4{add_temp_8[48]}}, add_temp_8});

  assign add_signext_18 = product3;
  assign add_signext_19 = product2;
  assign add_temp_9 = add_signext_18 + add_signext_19;
  assign sum1_10 = $signed({{4{add_temp_9[48]}}, add_temp_9});

  always @ (posedge clk or posedge reset)
    begin: temp_process22
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
        sumpipe1_10 <= 0;
        sumpipe1_11 <= 0;
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
          sumpipe1_9 <= sum1_9;
          sumpipe1_10 <= sum1_10;
          sumpipe1_11 <= product1;
        end
      end
    end // temp_process22

  assign add_signext_20 = sumpipe1_1;
  assign add_signext_21 = sumpipe1_2;
  assign add_temp_10 = add_signext_20 + add_signext_21;
  assign sum2_1 = add_temp_10[52:0];

  assign add_signext_22 = sumpipe1_3;
  assign add_signext_23 = sumpipe1_4;
  assign add_temp_11 = add_signext_22 + add_signext_23;
  assign sum2_2 = add_temp_11[52:0];

  assign add_signext_24 = sumpipe1_5;
  assign add_signext_25 = sumpipe1_6;
  assign add_temp_12 = add_signext_24 + add_signext_25;
  assign sum2_3 = add_temp_12[52:0];

  assign add_signext_26 = sumpipe1_7;
  assign add_signext_27 = sumpipe1_8;
  assign add_temp_13 = add_signext_26 + add_signext_27;
  assign sum2_4 = add_temp_13[52:0];

  assign add_signext_28 = sumpipe1_9;
  assign add_signext_29 = sumpipe1_10;
  assign add_temp_14 = add_signext_28 + add_signext_29;
  assign sum2_5 = add_temp_14[52:0];

  always @ (posedge clk or posedge reset)
    begin: temp_process23
      if (reset == 1'b1) begin
        sumpipe2_1 <= 0;
        sumpipe2_2 <= 0;
        sumpipe2_3 <= 0;
        sumpipe2_4 <= 0;
        sumpipe2_5 <= 0;
        sumpipe2_6 <= 0;
      end
      else begin
        if (clk_enable == 1'b1) begin
          sumpipe2_1 <= sum2_1;
          sumpipe2_2 <= sum2_2;
          sumpipe2_3 <= sum2_3;
          sumpipe2_4 <= sum2_4;
          sumpipe2_5 <= sum2_5;
          sumpipe2_6 <= sumpipe1_11;
        end
      end
    end // temp_process23

  assign add_signext_30 = sumpipe2_1;
  assign add_signext_31 = sumpipe2_2;
  assign add_temp_15 = add_signext_30 + add_signext_31;
  assign sum3_1 = add_temp_15[52:0];

  assign add_signext_32 = sumpipe2_3;
  assign add_signext_33 = sumpipe2_4;
  assign add_temp_16 = add_signext_32 + add_signext_33;
  assign sum3_2 = add_temp_16[52:0];

  assign add_signext_34 = sumpipe2_5;
  assign add_signext_35 = $signed({{5{sumpipe2_6[47]}}, sumpipe2_6});
  assign add_temp_17 = add_signext_34 + add_signext_35;
  assign sum3_3 = add_temp_17[52:0];

  always @ (posedge clk or posedge reset)
    begin: temp_process24
      if (reset == 1'b1) begin
        sumpipe3_1 <= 0;
        sumpipe3_2 <= 0;
        sumpipe3_3 <= 0;
      end
      else begin
        if (clk_enable == 1'b1) begin
          sumpipe3_1 <= sum3_1;
          sumpipe3_2 <= sum3_2;
          sumpipe3_3 <= sum3_3;
        end
      end
    end // temp_process24

  assign add_signext_36 = sumpipe3_1;
  assign add_signext_37 = sumpipe3_2;
  assign add_temp_18 = add_signext_36 + add_signext_37;
  assign sum4_1 = add_temp_18[52:0];

  always @ (posedge clk or posedge reset)
    begin: temp_process25
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
    end // temp_process25

  assign add_signext_38 = sumpipe4_1;
  assign add_signext_39 = sumpipe4_2;
  assign add_temp_19 = add_signext_38 + add_signext_39;
  assign sum5_1 = add_temp_19[52:0];

  always @ (posedge clk or posedge reset)
    begin: temp_process26
      if (reset == 1'b1) begin
        sumpipe5_1 <= 0;
      end
      else begin
        if (clk_enable == 1'b1) begin
          sumpipe5_1 <= sum5_1;
        end
      end
    end // temp_process26

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
endmodule  // fir_20_24b_1p
