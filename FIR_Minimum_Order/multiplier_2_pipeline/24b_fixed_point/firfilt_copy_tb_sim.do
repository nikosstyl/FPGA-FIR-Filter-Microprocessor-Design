onbreak resume
onerror resume
vsim -voptargs=+acc work.firfilt_copy_tb
add wave sim:/firfilt_copy_tb/u_fir_min_24b_2p/clk
add wave sim:/firfilt_copy_tb/u_fir_min_24b_2p/clk_enable
add wave sim:/firfilt_copy_tb/u_fir_min_24b_2p/reset
add wave sim:/firfilt_copy_tb/u_fir_min_24b_2p/filter_in
add wave sim:/firfilt_copy_tb/u_fir_min_24b_2p/filter_out
add wave sim:/firfilt_copy_tb/filter_out_ref
run -all
