onbreak resume
onerror resume
vsim -voptargs=+acc work.fir_20_16b_fcsd_tb
add wave sim:/fir_20_16b_fcsd_tb/u_fir_20_8b_fcsd/clk
add wave sim:/fir_20_16b_fcsd_tb/u_fir_20_8b_fcsd/clk_enable
add wave sim:/fir_20_16b_fcsd_tb/u_fir_20_8b_fcsd/reset
add wave sim:/fir_20_16b_fcsd_tb/u_fir_20_8b_fcsd/filter_in
add wave sim:/fir_20_16b_fcsd_tb/u_fir_20_8b_fcsd/filter_out
add wave sim:/fir_20_16b_fcsd_tb/filter_out_ref
run -all
