library AESLibrary;
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use AESLibrary.state_definition_package.all;
library source;

entity InvMixColumns_tb is
end InvMixColumns_tb;

architecture InvMixColumns_tb_arch of InvMixColumns_tb is 
component InvMixColumns 
port(
    InvMixColumns_i: in type_state;
    InvMixColumns_o: out type_state
);
end component;
 
signal InvMixColumns_test_i : type_state;
signal InvMixColumns_test_o: type_state;

begin
DUT: InvMixColumns
port map(
    InvMixColumns_i=>InvMixColumns_test_i,
    InvMixColumns_o=>InvMixColumns_test_o
);
--test in Round7
InvMixColumns_test_i<=((X"28",X"af",X"2a",X"81"),
                       (X"8e",X"a2",X"9e",X"f7"),
                       (X"89",X"4e",X"1f",X"71"), 
                       (X"49",X"2a",X"ea",X"77"));
end InvMixColumns_tb_arch;

configuration InvMixColumns_tb_cfig of InvMixColumns_tb is 
for InvMixColumns_tb_arch
    for DUT: InvMixColumns
        use entity source.InvMixColumns(InvMixColumns_Arch);
    end for;
end for;
end InvMixColumns_tb_cfig;







