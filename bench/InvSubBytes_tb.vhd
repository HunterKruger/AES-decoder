library AESLibrary;
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use AESLibrary.state_definition_package.all;
library source;

entity InvSubBytes_tb is
end InvSubBytes_tb;

architecture InvSubBytes_tb_arch of InvSubBytes_tb is 
component InvSubBytes 
port(
    InvSubBytes_i: in type_state;
    InvSubBytes_o: out type_state
    );
end component;
 
signal InvSubBytes_test_i : type_state;
signal InvSubBytes_test_o: type_state;

begin
DUT: InvSubBytes
port map(
    InvSubBytes_i=>InvSubBytes_test_i,
    InvSubBytes_o=>InvSubBytes_test_o
);

InvSubBytes_test_i<=((X"00",X"01",X"02",X"03"),
                     (X"10",X"11",X"12",X"13"),
                     (X"20",X"21",X"22",X"23"), 
                     (X"30",X"31",X"32",X"33"));
end InvSubBytes_tb_arch;

configuration InvSubBytes_tb_cfig of InvSubBytes_tb is 
for InvSubBytes_tb_arch
    for DUT: InvSubBytes
        use entity source.InvSubBytes(InvSubBytes_Arch);
    end for;
end for;
end InvSubBytes_tb_cfig;







