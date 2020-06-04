library AESLibrary;
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use AESLibrary.state_definition_package.all;
library source;

entity InvShiftRows_tb is
end InvShiftRows_tb;

architecture InvShiftRows_tb_arch of InvShiftRows_tb is 
component InvShiftRows 
port(
    InvShiftRows_i: in type_state;
    InvShiftRows_o: out type_state
);
end component;
 
signal InvShiftRows_test_i : type_state;
signal InvShiftRows_test_o: type_state;

begin
DUT: InvShiftRows
port map(
    InvShiftRows_i=>InvShiftRows_test_i,
    InvShiftRows_o=>InvShiftRows_test_o
);
  
InvShiftRows_test_i<=((X"00",X"01",X"02",X"03"),
                      (X"10",X"11",X"12",X"13"),
                      (X"20",X"21",X"22",X"23"), 
                      (X"30",X"31",X"32",X"33"));
end InvShiftRows_tb_arch;

configuration InvShiftRows_tb_cfig of InvShiftRows_tb is 
for InvShiftRows_tb_arch
    for DUT: InvShiftRows
        use entity source.InvShiftRows(InvShiftRows_Arch);
    end for;
end for;
end InvShiftRows_tb_cfig;

