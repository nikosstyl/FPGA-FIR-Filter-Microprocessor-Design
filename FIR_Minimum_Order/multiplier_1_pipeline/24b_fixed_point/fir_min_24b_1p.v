// -------------------------------------------------------------
//
// Module: fir_min_24b_1p
// Generated by MATLAB(R) 9.12 and Filter Design HDL Coder 3.1.11.
// Generated on: 2023-06-27 19:34:07
// -------------------------------------------------------------

// -------------------------------------------------------------
// HDL Code Generation Options:
//
// FIRAdderStyle: tree
// MultiplierInputPipeline: 1
// MultiplierOutputPipeline: 1
// OptimizeForHDL: on
// TargetDirectory: W:\Nikos\UTh\Σχεδίαση Επεξεργαστών\Project\FIR_Minimum_Order\multiplier_1_pipeline\24b_fixed_point
// AddPipelineRegisters: on
// Name: fir_min_24b_1p
// InputDataType: numerictype(1,24,0)
// TargetLanguage: Verilog
// TestBenchName: fir_min_24b_1p_tb
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
// HDL Implementation    : Fully parallel
// Folding Factor        : 1
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

module fir_min_24b_1p
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
//Module Architecture: fir_min_24b_1p
////////////////////////////////////////////////////////////////
  // Local Functions
  // Type Definitions
  // Constants
  parameter signed [23:0] coeff1 = 24'b001111110011111010100011; //sfix24_En32
  parameter signed [23:0] coeff2 = 24'b010001101000010110011010; //sfix24_En32
  parameter signed [23:0] coeff3 = 24'b010001101000010110011010; //sfix24_En32
  parameter signed [23:0] coeff4 = 24'b001111110011111010100011; //sfix24_En32

  // Signals
  reg  signed [23:0] delay_pipeline [0:3] ; // sfix24
  wire signed [47:0] product4; // sfix48_En32
  reg  signed [23:0] delay_pipeline_3_under_pipe; // sfix24
  reg  signed [23:0] coeff4_pipe; // sfix24_En32
  reg  signed [47:0] product4_pipe; // sfix48_En32
  wire signed [47:0] product3; // sfix48_En32
  reg  signed [23:0] delay_pipeline_2_under_pipe; // sfix24
  reg  signed [23:0] coeff3_pipe; // sfix24_En32
  reg  signed [47:0] product3_pipe; // sfix48_En32
  wire signed [47:0] product2; // sfix48_En32
  reg  signed [23:0] delay_pipeline_1_under_pipe; // sfix24
  reg  signed [23:0] coeff2_pipe; // sfix24_En32
  reg  signed [47:0] product2_pipe; // sfix48_En32
  wire signed [47:0] product1; // sfix48_En32
  reg  signed [23:0] delay_pipeline_0_under_pipe; // sfix24
  reg  signed [23:0] coeff1_pipe; // sfix24_En32
  reg  signed [47:0] product1_pipe; // sfix48_En32
  wire signed [49:0] sum_final; // sfix50_En32
  wire signed [49:0] sum1_1; // sfix50_En32
  wire signed [47:0] add_signext; // sfix48_En32
  wire signed [47:0] add_signext_1; // sfix48_En32
  wire signed [48:0] add_temp; // sfix49_En32
  reg  signed [49:0] sumpipe1_1; // sfix50_En32
  wire signed [49:0] sum1_2; // sfix50_En32
  wire signed [47:0] add_signext_2; // sfix48_En32
  wire signed [47:0] add_signext_3; // sfix48_En32
  wire signed [48:0] add_temp_1; // sfix49_En32
  reg  signed [49:0] sumpipe1_2; // sfix50_En32
  wire signed [49:0] sum2_1; // sfix50_En32
  wire signed [49:0] add_signext_4; // sfix50_En32
  wire signed [49:0] add_signext_5; // sfix50_En32
  wire signed [50:0] add_temp_2; // sfix51_En32
  reg  signed [49:0] sumpipe2_1; // sfix50_En32
  reg  signed [49:0] output_register; // sfix50_En32

  // Block Statements
  always @( posedge clk or posedge reset)
    begin: Delay_Pipeline_process
      if (reset == 1'b1) begin
        delay_pipeline[0] <= 0;
        delay_pipeline[1] <= 0;
        delay_pipeline[2] <= 0;
        delay_pipeline[3] <= 0;
      end
      else begin
        if (clk_enable == 1'b1) begin
          delay_pipeline[0] <= filter_in;
          delay_pipeline[1] <= delay_pipeline[0];
          delay_pipeline[2] <= delay_pipeline[1];
          delay_pipeline[3] <= delay_pipeline[2];
        end
      end
    end // Delay_Pipeline_process


  always @ (posedge clk or posedge reset)
    begin: temp_process1
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
    end // temp_process1

  assign product4 = product4_pipe;

  always @ (posedge clk or posedge reset)
    begin: temp_process2
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
    end // temp_process2

  assign product3 = product3_pipe;

  always @ (posedge clk or posedge reset)
    begin: temp_process3
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
    end // temp_process3

  assign product2 = product2_pipe;

  always @ (posedge clk or posedge reset)
    begin: temp_process4
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
    end // temp_process4

  assign product1 = product1_pipe;

  assign add_signext = product4;
  assign add_signext_1 = product3;
  assign add_temp = add_signext + add_signext_1;
  assign sum1_1 = $signed({{1{add_temp[48]}}, add_temp});

  assign add_signext_2 = product2;
  assign add_signext_3 = product1;
  assign add_temp_1 = add_signext_2 + add_signext_3;
  assign sum1_2 = $signed({{1{add_temp_1[48]}}, add_temp_1});

  always @ (posedge clk or posedge reset)
    begin: temp_process5
      if (reset == 1'b1) begin
        sumpipe1_1 <= 0;
        sumpipe1_2 <= 0;
      end
      else begin
        if (clk_enable == 1'b1) begin
          sumpipe1_1 <= sum1_1;
          sumpipe1_2 <= sum1_2;
        end
      end
    end // temp_process5

  assign add_signext_4 = sumpipe1_1;
  assign add_signext_5 = sumpipe1_2;
  assign add_temp_2 = add_signext_4 + add_signext_5;
  assign sum2_1 = add_temp_2[49:0];

  always @ (posedge clk or posedge reset)
    begin: temp_process6
      if (reset == 1'b1) begin
        sumpipe2_1 <= 0;
      end
      else begin
        if (clk_enable == 1'b1) begin
          sumpipe2_1 <= sum2_1;
        end
      end
    end // temp_process6

  assign sum_final = sumpipe2_1;

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
endmodule  // fir_min_24b_1p
