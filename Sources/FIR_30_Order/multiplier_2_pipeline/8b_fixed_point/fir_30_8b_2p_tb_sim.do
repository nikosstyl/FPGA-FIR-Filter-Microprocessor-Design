onbreak resume
onerror resume
vsim -voptargs=+acc work.fir_30_8b_2p_tb
add wave sim:/fir_30_8b_2p_tb/u_fir_30_8b_2p/clk
add wave sim:/fir_30_8b_2p_tb/u_fir_30_8b_2p/clk_enable
add wave sim:/fir_30_8b_2p_tb/u_fir_30_8b_2p/reset
add wave sim:/fir_30_8b_2p_tb/u_fir_30_8b_2p/filter_in
add wave sim:/fir_30_8b_2p_tb/u_fir_30_8b_2p/filter_out
add wave sim:/fir_30_8b_2p_tb/filter_out_ref
run -all
