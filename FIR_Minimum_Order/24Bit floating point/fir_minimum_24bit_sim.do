onbreak resume
onerror resume
vsim -voptargs=+acc work.fir_minimum_24bit
add wave sim:/fir_minimum_24bit/u_fir_minimum_24bit/clk
add wave sim:/fir_minimum_24bit/u_fir_minimum_24bit/clk_enable
add wave sim:/fir_minimum_24bit/u_fir_minimum_24bit/reset
add wave sim:/fir_minimum_24bit/u_fir_minimum_24bit/filter_in
add wave sim:/fir_minimum_24bit/u_fir_minimum_24bit/filter_out
add wave sim:/fir_minimum_24bit/filter_out_ref
run -all
