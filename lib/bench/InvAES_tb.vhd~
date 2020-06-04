library AESLibrary;
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use AESLibrary.state_definition_package.all;
library source;

entity InvAES_tb is
end InvAES_tb;

architecture InvAES_tb_arch of InvAES_tb is 
    component InvAES
        port(
    		start_i : in std_logic;
    		clock_i: in std_logic;
    		reset_i: in std_logic;
    		data_i: in bit128;
    		data_o: out bit128;
    		aes_on_o: out std_logic
        );
    end component;
 
    signal start_test_i : std_logic;
    signal clock_test_i : std_logic:='0';  
    signal reset_test_i : std_logic;
    signal data_test_i: bit128;
    signal data_test_o: bit128;
    signal aes_on_test_o: std_logic;

begin
    DUT: InvAES
    port map(
	start_i=>start_test_i,
        clock_i=>clock_test_i,
 	reset_i=>reset_test_i,
	data_i=>data_test_i,
        data_o=>data_test_o,
	aes_on_o=>aes_on_test_o
    );

    start_test_i<='0','1' after 200 ns;  --200
    clock_test_i<=not(clock_test_i) after 50 ns;
    reset_test_i<='1','0' after 100 ns;  --100
    data_test_i<=X"d6efa6dc4ce8efd2476b9546d76acdf0";
    

end InvAES_tb_arch;

configuration InvAES_tb_cfig of InvAES_tb is 
    for InvAES_tb_arch
        for DUT: InvAES
            use entity source.InvAES(InvAES_arch);
        end for;
    end for;
end InvAES_tb_cfig;

