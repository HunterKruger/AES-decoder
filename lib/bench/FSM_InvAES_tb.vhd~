library AESLibrary;
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use AESLibrary.state_definition_package.all;
library source;

entity FSM_InvAES_tb is
end FSM_InvAES_tb;

architecture FSM_InvAES_tb_arch of FSM_InvAES_tb is 
    component FSM_InvAES 
        port(
            clock_i: in std_logic;
            resetb_i: in std_logic;
            round_i: in bit4;
            start_i: in std_logic;

            done_o: out std_logic;
            enableCounter_o: out std_logic;
            enableMixcolumns_o: out std_logic;
            enableOutput_o: out std_logic;
            enableRoundcomputing_o: out std_logic;
            getciphertext_o: out std_logic;
            resetCounter_o: out std_logic
        );
    end component;
 
signal clock_test_i: std_logic:='0';
signal resetb_test_i: std_logic;
signal round_test_i: bit4;
signal start_test_i: std_logic;

signal done_test_o: std_logic;
signal enableCounter_test_o: std_logic;
signal enableMixcolumns_test_o: std_logic;
signal enableOutput_test_o: std_logic;
signal enableRoundcomputing_test_o: std_logic;
signal getciphertext_test_o: std_logic;
signal resetCounter_test_o: std_logic;

begin
    DUT: FSM_InvAES
    port map(
        clock_i=>clock_test_i,  
        resetb_i=>resetb_test_i, 
        round_i=>round_test_i,   
        start_i=>start_test_i,  

        done_o=>done_test_o,
        enableCounter_o=>enableCounter_test_o,
        enableMixcolumns_o=>enableMixcolumns_test_o,
        enableOutput_o=>enableOutput_test_o,
        enableRoundcomputing_o=>enableRoundcomputing_test_o,
        getciphertext_o=>getciphertext_test_o,
        resetCounter_o=>resetCounter_test_o
    );

    clock_test_i<=not(clock_test_i) after 50 ns;
    resetb_test_i<='0','1' after 100 ns;
    round_test_i<=X"a" after 300 ns ,X"1" after 400 ns, X"a" after 800 ns, X"1" after 900 ns;
    start_test_i<='0','1' after 200 ns;

end FSM_InvAES_tb_arch;


configuration FSM_InvAES_tb_cfig of FSM_InvAES_tb is 
    for FSM_InvAES_tb_Arch
        for DUT: FSM_InvAES
            use entity source.FSM_InvAES(FSM_InvAES_Arch_Moore);
        end for;
    end for;
end FSM_InvAES_tb_cfig;
