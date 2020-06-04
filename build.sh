#!/bin/bash

source /soft/MENTOR/config_bashrc/.bashrc_mentor
source /soft/MENTOR/config_bashrc/.bashrc_modelsim

export PROJECTNAME="."
echo "the project location is : $PROJECTNAME"
# clean source and bench libs
echo "removing libs"
vdel -lib $PROJECTNAME/lib/source -all
vdel -lib $PROJECTNAME/lib/bench -all

# create source and bench libs
echo "creating work libs"
vlib $PROJECTNAME/lib/source
vmap source $PROJECTNAME/lib/source
vlib $PROJECTNAME/lib/bench
vmap bench $PROJECTNAME/lib/bench
# map existing AESLibrary lib
vlib $PROJECTNAME/lib/AESLibrary
vmap AESLibrary $PROJECTNAME/lib/AESLibrary

# compile sources and launch the VHDL simulator
echo "compile vhdl sources"
vcom -work source $PROJECTNAME/sources/S_Box.vhd
vcom -work source $PROJECTNAME/sources/InvSubBytes.vhd
vcom -work source $PROJECTNAME/sources/InvShiftRows.vhd
vcom -work source $PROJECTNAME/sources/Multiply.vhd
vcom -work source $PROJECTNAME/sources/InvMixColumns.vhd
vcom -work source $PROJECTNAME/sources/InvAddRoundKey.vhd
vcom -work source $PROJECTNAME/sources/KeyExpansion_table.vhd
vcom -work source $PROJECTNAME/sources/Counter.vhd
vcom -work source $PROJECTNAME/sources/RTL_MUX.vhd
vcom -work source $PROJECTNAME/sources/FSM_InvAES.vhd
vcom -work source $PROJECTNAME/sources/InvAESRound.vhd
vcom -work source $PROJECTNAME/sources/InvAES.vhd

echo "compile vhdl test bench"
vcom -work bench $PROJECTNAME/bench/S_Box_tb.vhd
vcom -work bench $PROJECTNAME/bench/InvSubBytes_tb.vhd
vcom -work bench $PROJECTNAME/bench/InvShiftRows_tb.vhd
vcom -work bench $PROJECTNAME/bench/InvMixColumns_tb.vhd
vcom -work bench $PROJECTNAME/bench/InvAddRoundKey_tb.vhd
vcom -work bench $PROJECTNAME/bench/Counter_tb.vhd
vcom -work bench $PROJECTNAME/bench/RTL_MUX_tb.vhd
vcom -work bench $PROJECTNAME/bench/FSM_InvAES_tb.vhd
vcom -work bench $PROJECTNAME/bench/InvAESRound_tb.vhd
vcom -work bench $PROJECTNAME/bench/InvAES_tb.vhd

echo "compilation finished"
echo "start simulation..."

vsim

