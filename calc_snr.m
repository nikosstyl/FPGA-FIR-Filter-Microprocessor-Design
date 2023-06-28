function snr_val = calc_snr(filter_out, filter_expected)

noise = (filter_expected - filter_out);

snr_val = snr(filter_out, noise);

end