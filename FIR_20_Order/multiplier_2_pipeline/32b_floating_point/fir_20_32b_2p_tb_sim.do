onbreak resume
onerror resume
vsim -voptargs=+acc work.fir_20_32b_2p_tb
add wave sim:/fir_20_32b_2p_tb/u_fir_20_32b_2p/clk
add wave sim:/fir_20_32b_2p_tb/u_fir_20_32b_2p/clk_enable
add wave sim:/fir_20_32b_2p_tb/u_fir_20_32b_2p/reset
add wave sim:/fir_20_32b_2p_tb/u_fir_20_32b_2p/filter_in
add wave sim:/fir_20_32b_2p_tb/u_fir_20_32b_2p/filter_out
add wave sim:/fir_20_32b_2p_tb/filter_out_ref
run -all
