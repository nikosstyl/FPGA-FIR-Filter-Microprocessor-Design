onbreak resume
onerror resume
vsim -voptargs=+acc work.fir_20_16b_1p_tb
add wave sim:/fir_20_16b_1p_tb/u_fir_20_8b_1p/clk
add wave sim:/fir_20_16b_1p_tb/u_fir_20_8b_1p/clk_enable
add wave sim:/fir_20_16b_1p_tb/u_fir_20_8b_1p/reset
add wave sim:/fir_20_16b_1p_tb/u_fir_20_8b_1p/filter_in
add wave sim:/fir_20_16b_1p_tb/u_fir_20_8b_1p/filter_out
add wave sim:/fir_20_16b_1p_tb/filter_out_ref
run -all
