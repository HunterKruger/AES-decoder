library AESLibrary;
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use AESLibrary.state_definition_package.all;
library source;

entity InvAddRoundKey_tb is
end InvAddRoundKey_tb;

architecture InvAddRoundKey_tb_arch of InvAddRoundKey_tb is 
component InvAddRoundKey 
port(
    InvAddRoundKey_i: in type_state;
    InvAddRoundKey_round_i: in bit4;
    InvAddRoundKey_o: out type_state
);
end component;
 
signal InvAddRoundKey_test_i : type_state;
signal InvAddRoundKey_round_test_i : bit4;
signal InvAddRoundKey_test_o: type_state;

begin
DUT: InvAddRoundKey
port map(
    InvAddRoundKey_i=>InvAddRoundKey_test_i,
    InvAddRoundKey_o=>InvAddRoundKey_test_o,
    InvAddRoundKey_round_i=>InvAddRoundKey_round_test_i
);

--test Round10
InvAddRoundKey_test_i<=((X"d6",X"4c",X"47",X"d7"),
                        (X"ef",X"e8",X"6b",X"6a"),
                        (X"a6",X"ef",X"95",X"cd"), 
                        (X"dc",X"d2",X"46",X"f0"));
InvAddRoundKey_round_test_i<=X"a"; 
end InvAddRoundKey_tb_arch;

configuration InvAddRoundKey_tb_cfig of InvAddRoundKey_tb is 
for InvAddRoundKey_tb_arch
    for DUT: InvAddRoundKey
        use entity source.InvAddRoundKey(InvAddRoundKey_Arch);
    end for;
end for;
end InvAddRoundKey_tb_cfig;


