onbreak resume
onerror resume
vsim -voptargs=+acc work.fir_30_16b_fcsd_tb
add wave sim:/fir_30_16b_fcsd_tb/u_fir_30_16b_fcsd/clk
add wave sim:/fir_30_16b_fcsd_tb/u_fir_30_16b_fcsd/clk_enable
add wave sim:/fir_30_16b_fcsd_tb/u_fir_30_16b_fcsd/reset
add wave sim:/fir_30_16b_fcsd_tb/u_fir_30_16b_fcsd/filter_in
add wave sim:/fir_30_16b_fcsd_tb/u_fir_30_16b_fcsd/filter_out
add wave sim:/fir_30_16b_fcsd_tb/filter_out_ref
run -all
