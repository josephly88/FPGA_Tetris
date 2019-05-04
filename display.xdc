set_property IOSTANDARD LVCMOS33 [get_ports {clk100MHz}]
set_property PACKAGE_PIN Y9 [get_ports {clk100MHz}]
create_clock -period 10 [get_ports clk100MHz]
# ----------------------------------------------------------------------------
# VGA Output - Bank 33
# ----------------------------------------------------------------------------
set_property PACKAGE_PIN Y21 [get_ports {blue[0]}]; # "VGA-B0"
set_property PACKAGE_PIN Y20 [get_ports {blue[1]}]; # "VGA-B1"
set_property PACKAGE_PIN AB20 [get_ports {blue[2]}]; # "VGA-B2"
set_property PACKAGE_PIN AB19 [get_ports {blue[3]}]; # "VGA-B3"
set_property PACKAGE_PIN AB22 [get_ports {green[0]}]; # "VGA-G0"
set_property PACKAGE_PIN AA22 [get_ports {green[1]}]; # "VGA-G1"
set_property PACKAGE_PIN AB21 [get_ports {green[2]}]; # "VGA-G2"
set_property PACKAGE_PIN AA21 [get_ports {green[3]}]; # "VGA-G3"
set_property PACKAGE_PIN V20 [get_ports {red[0]}]; # "VGA-R0"
set_property PACKAGE_PIN U20 [get_ports {red[1]}]; # "VGA-R1"
set_property PACKAGE_PIN V19 [get_ports {red[2]}]; # "VGA-R2"
set_property PACKAGE_PIN V18 [get_ports {red[3]}]; # "VGA-R3"
set_property PACKAGE_PIN AA19 [get_ports {hsync}]; # "VGA-HS"
set_property PACKAGE_PIN Y19 [get_ports {vsync}]; # "VGA-VS"
set_property IOSTANDARD LVCMOS33 [get_ports -of_objects [get_iobanks 33]];

#---------------------------------------------------------------------

set_property IOSTANDARD LVCMOS33 [get_ports led]
set_property PACKAGE_PIN T22 [get_ports {led[0]}]
set_property PACKAGE_PIN T21 [get_ports {led[1]}]
set_property PACKAGE_PIN U22 [get_ports {led[2]}]
set_property PACKAGE_PIN U21 [get_ports {led[3]}]
set_property PACKAGE_PIN V22 [get_ports {led[4]}]
set_property PACKAGE_PIN W22 [get_ports {led[5]}]
set_property PACKAGE_PIN U19 [get_ports {led[6]}]
set_property PACKAGE_PIN U14 [get_ports {led[7]}]

set_property IOSTANDARD LVCMOS25 [get_ports btnU]
set_property PACKAGE_PIN T18 [get_ports btnU]
set_property IOSTANDARD LVCMOS25 [get_ports btnD]
set_property PACKAGE_PIN R16 [get_ports btnD]
set_property IOSTANDARD LVCMOS25 [get_ports btnC]
set_property PACKAGE_PIN P16 [get_ports btnC]
set_property IOSTANDARD LVCMOS25 [get_ports btnL]
set_property PACKAGE_PIN N15 [get_ports btnL]
set_property IOSTANDARD LVCMOS25 [get_ports btnR]
set_property PACKAGE_PIN R18 [get_ports btnR]

set_property IOSTANDARD LVCMOS33 [get_ports JA]
set_property PACKAGE_PIN Y11 [get_ports {JA[0]}]
set_property PACKAGE_PIN AA11 [get_ports {JA[1]}]
set_property PACKAGE_PIN Y10 [get_ports {JA[2]}]
set_property PACKAGE_PIN AA9 [get_ports {JA[3]}]
set_property PACKAGE_PIN AB11 [get_ports {JA[4]}]
set_property PACKAGE_PIN AB10 [get_ports {JA[5]}]
set_property PACKAGE_PIN AB9 [get_ports {JA[6]}]
set_property PACKAGE_PIN AA8 [get_ports {JA[7]}]