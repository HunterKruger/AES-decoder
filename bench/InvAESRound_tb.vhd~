library AESLibrary;
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use AESLibrary.state_definition_package.all;
library source;

entity InvAESRound_tb is
end InvAESRound_tb;

architecture InvAESRound_tb_arch of InvAESRound_tb is 
    component InvAESRound 
        port(
  		 clock_i: in std_logic;
   		 round_i: in bit4;
   		 currenttext_i: in bit128;
   		 enableInvMixColumns_i: in std_logic;
    		 enableRoundcomputing_i: in std_logic;
   		 resetb_i: in std_logic;
  		 data_o: out bit128
        );
    end component;
 
    signal clock_test_i : std_logic:='0';
    signal round_test_i : bit4;
    signal currenttext_test_i: bit128;
    signal enableInvMixColumns_test_i: std_logic;
    signal enableRoundcomputing_test_i: std_logic;
    signal resetb_test_i: std_logic;
    signal data_test_o: bit128;

begin
    DUT: InvAESRound
    port map(
        clock_i=>clock_test_i,
        round_i=>round_test_i,
        currenttext_i=>currenttext_test_i,
        enableInvMixColumns_i=>enableInvMixColumns_test_i,
        enableRoundcomputing_i=>enableRoundcomputing_test_i,
        resetb_i=>resetb_test_i,
        data_o=>data_test_o     
    );

    clock_test_i<=not(clock_test_i) after 50 ns;
    --test Round 10 and 7
    round_test_i<=X"A",X"7" after 300 ns;
    currenttext_test_i<=X"d6efa6dc4ce8efd2476b9546d76acdf0",X"335453078c0795a0e4d1f3358a57176a" after 300 ns;
    enableInvMixColumns_test_i<='0','1' after 300 ns; 
    enableRoundcomputing_test_i<='1','0' after 300 ns;
    resetb_test_i<='0','1' after 100 ns;


end InvAESRound_tb_arch;

configuration InvAESRound_tb_cfig of InvAESRound_tb is 
    for InvAESRound_tb_arch
        for DUT: InvAESRound
            use entity source.InvAESRound(InvAESRound_Arch);
        end for;
    end for;
end InvAESRound_tb_cfig;


