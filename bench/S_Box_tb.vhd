library AESLibrary;
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use AESLibrary.state_definition_package.all;
library source;

entity S_Box_tb is
end S_Box_tb;

architecture S_Box_tb_arch of S_Box_tb is 
component S_Box 
port(
    S_Box_i : in bit8;
    S_Box_o: out bit8
);
end component;
 
signal S_Box_test_i : bit8;
signal S_Box_test_o: bit8;

begin
DUT: S_Box
port map(
    S_Box_i=>S_Box_test_i,
    S_Box_o=>S_Box_test_o
);
S_Box_test_i<=X"ed",X"ee" after 100 ns,X"ef" after 200 ns;
end S_Box_tb_arch;

configuration S_Box_tb_cfig of S_Box_tb is 
for S_Box_tb_arch
    for DUT: S_Box
        use entity source.S_Box(S_Box_arch);
    end for;
end for;
end S_Box_tb_cfig;




