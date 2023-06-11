onbreak resume
onerror resume
vsim -voptargs=+acc work.fir_minimum_fp_tb
add wave sim:/fir_minimum_fp_tb/u_fir_minimum_fp/clk
add wave sim:/fir_minimum_fp_tb/u_fir_minimum_fp/clk_enable
add wave sim:/fir_minimum_fp_tb/u_fir_minimum_fp/reset
add wave sim:/fir_minimum_fp_tb/u_fir_minimum_fp/filter_in
add wave sim:/fir_minimum_fp_tb/u_fir_minimum_fp/filter_out
add wave sim:/fir_minimum_fp_tb/filter_out_ref
run -all
