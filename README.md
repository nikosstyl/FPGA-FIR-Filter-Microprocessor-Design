# Microprocessor Design Semester Project

For this project, I have to implement an FIR filter with **Fs=4.6 kHz, Fpass=8 kHz and Fstop=9.6 kHz**.

## Specifications

* Minimum order 
* Order = 20 coefficients
* Order = 30 coefficients

**Each order implementation** has to be implemented with:

* Single precision floating point
* Fixed point 24 bits.
* Fixed point 16 bits.
* Fixed point 8 bits.

**Each above architecture** has to be implemented using:

* 1 stage pipelining.
* 2 stage pipelining.
* Multiplierles using CSD.
* Distributed arithmetic.

## Folder Structure

```
├── Images
│   ├── FIR_20_Order
│   ├── FIR_30_Order
│   ├── FIR_min_Order
│   ├── fir.svg
│   ├── fir_minimum_mag_response.png
│   └── matlab_create_hdl.png
├── README.md
├── Sources
│   ├── FIR_20_Order
│   ├── FIR_30_Order
│   └── FIR_Minimum_Order
├── Vivado_Files
│   ├── FIR_20_Order
│   ├── FIR_30_Order
│   ├── FIR_min_Order
│   └── common
├── calc_snr.m
└── generate_filters.m
```

* ``Images``: Contains every image generated for the report/presentation
* ``Sources``: MATLAB HDL Coder output RTL files.
* ``Vivado_Files``: Vivado projects needed for simulation/data extraction.
* ``calc_snr.m``: MATLAB source file that has as inputs the expected and actual output of filters and as output it calculates SNR.
* ``generate_filters.m``: The main script that implements every filter needed.

## Usage

In order to export a filter from MATLAB using ``generate_filters.m``, the user has to uncomment three commands:

* ``fprintf()`` because it indicates which numeric and filter order is being used at that time,
* ``fdhdltool()`` to actually export the filter from MATLAB and
* ``pause()`` in order to make MATLAB wait for the export to finish.