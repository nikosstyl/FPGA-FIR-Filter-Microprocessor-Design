onbreak resume
onerror resume
vsim -voptargs=+acc work.fir_minimum_8bit_tb
add wave sim:/fir_minimum_8bit_tb/u_fir_minimum_8bit/clk
add wave sim:/fir_minimum_8bit_tb/u_fir_minimum_8bit/clk_enable
add wave sim:/fir_minimum_8bit_tb/u_fir_minimum_8bit/reset
add wave sim:/fir_minimum_8bit_tb/u_fir_minimum_8bit/filter_in
add wave sim:/fir_minimum_8bit_tb/u_fir_minimum_8bit/filter_out
add wave sim:/fir_minimum_8bit_tb/filter_out_ref
run -all
