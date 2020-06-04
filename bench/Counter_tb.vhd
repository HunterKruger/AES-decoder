library AESLibrary;
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use AESLibrary.state_definition_package.all;
library source;

entity Counter_tb is
end Counter_tb;

architecture Counter_tb_arch of Counter_tb is 
    component Counter 
        port(
            clock_i: in std_logic;
            enable_i: in std_logic;
            resetb_i: in std_logic;
            count_o: out bit4
        );
    end component;
 
    signal clock_test_i : std_logic:='0';
    signal enable_test_i : std_logic;
    signal resetb_test_i : std_logic;
    signal count_test_o: bit4;
    

begin
    DUT: Counter
    port map(
        clock_i=>clock_test_i,
        enable_i=>enable_test_i,
        resetb_i=>resetb_test_i,
        count_o=>count_test_o
    );
    clock_test_i<=not(clock_test_i) after 50 ns;
    enable_test_i<='1';
    resetb_test_i<='1';
   
end Counter_tb_arch;

configuration Counter_tb_cfig of Counter_tb is 
    for Counter_tb_arch
        for DUT: Counter
            use entity source.Counter(Counter_Arch);
        end for;
    end for;
end Counter_tb_cfig;


