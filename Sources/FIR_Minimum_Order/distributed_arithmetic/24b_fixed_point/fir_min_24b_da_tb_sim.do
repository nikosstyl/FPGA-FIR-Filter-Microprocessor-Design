onbreak resume
onerror resume
vsim -voptargs=+acc work.fir_min_24b_da_tb
add wave sim:/fir_min_24b_da_tb/u_fir_min_24b_da/clk
add wave sim:/fir_min_24b_da_tb/u_fir_min_24b_da/clk_enable
add wave sim:/fir_min_24b_da_tb/u_fir_min_24b_da/reset
add wave sim:/fir_min_24b_da_tb/u_fir_min_24b_da/filter_in
add wave sim:/fir_min_24b_da_tb/u_fir_min_24b_da/filter_out
add wave sim:/fir_min_24b_da_tb/filter_out_ref
run -all
