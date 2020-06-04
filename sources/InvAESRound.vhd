library AESLibrary;
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use AESLibrary.state_definition_package.all;

entity InvAESRound is
port(
    clock_i:in std_logic;
    round_i:in bit4;
    currenttext_i:in bit128;
    enableInvMixColumns_i:in std_logic;
    enableRoundcomputing_i:in std_logic;
    resetb_i:in std_logic;
    data_o:out bit128
);
end InvAESRound;


architecture InvAESRound_Arch of InvAESRound is

component InvAddRoundKey
port(
    InvAddRoundKey_i:in type_state;
    InvAddRoundKey_round_i:in bit4;
    InvAddRoundKey_o:out type_state
);
end component;

component InvShiftRows
port(
    InvShiftRows_i:in type_state;
    InvShiftRows_o:out type_state
);
end component;

component InvSubBytes
port(
    InvSubBytes_i:in type_state;
    InvSubBytes_o:out type_state
);
end component;

component InvMixColumns
port(
    InvMixColumns_i:in type_state;
    InvMixColumns_o:out type_state
);
end component;


signal inter_state0_s:type_state;
signal inter_state1_s:type_state;
signal inter_state2_s:type_state;
signal inter_state3_s:type_state;
signal inter_state4_s:type_state;
signal inter_state5_s:type_state;
signal data_state_s:type_state;


begin

InvShiftRows0:InvShiftRows port map(
    InvShiftRows_i=>inter_state0_s,
    InvShiftRows_o=>inter_state1_s
);

InvSubBytes0:InvSubBytes port map(
    InvSubBytes_i=>inter_state1_s,
    InvSubBytes_o=>inter_state2_s
);

InvAddRoundKey0:InvAddRoundKey port map(
    InvAddRoundKey_i=>inter_state2_s,
    InvAddRoundKey_round_i=>round_i,
    InvAddRoundKey_o=>inter_state3_s
);

InvAddRoundKey1:InvAddRoundKey port map(
    InvAddRoundKey_i=>inter_state0_s,
    InvAddRoundKey_round_i=>round_i,  
    InvAddRoundKey_o=>inter_state5_s
);

InvMixColumns0:InvMixColumns port map(
    InvMixColumns_i=>inter_state3_s,
    InvMixColumns_o=>inter_state4_s
);

--save currenttext in a state
    inter_state0_s(0)(0)<=currenttext_i(127 downto 120);
    inter_state0_s(1)(0)<=currenttext_i(119 downto 112);
    inter_state0_s(2)(0)<=currenttext_i(111 downto 104);
    inter_state0_s(3)(0)<=currenttext_i(103 downto 96);
    inter_state0_s(0)(1)<=currenttext_i(95 downto 88);
    inter_state0_s(1)(1)<=currenttext_i(87 downto 80);
    inter_state0_s(2)(1)<=currenttext_i(79 downto 72);
    inter_state0_s(3)(1)<=currenttext_i(71 downto 64);	
    inter_state0_s(0)(2)<=currenttext_i(63 downto 56);
    inter_state0_s(1)(2)<=currenttext_i(55 downto 48);
    inter_state0_s(2)(2)<=currenttext_i(47 downto 40);
    inter_state0_s(3)(2)<=currenttext_i(39 downto 32);	
    inter_state0_s(0)(3)<=currenttext_i(31 downto 24);
    inter_state0_s(1)(3)<=currenttext_i(23 downto 16);
    inter_state0_s(2)(3)<=currenttext_i(15 downto 8);
    inter_state0_s(3)(3)<=currenttext_i(7 downto 0);

handle:process(enableRoundcomputing_i,enableInvMixColumns_i,resetb_i,clock_i)
begin

if resetb_i='0' then
    --default output
    data_state_s<=((X"00",X"00",X"00",X"00"),
                   (X"00",X"00",X"00",X"00"),
                   (X"00",X"00",X"00",X"00"), 
                   (X"00",X"00",X"00",X"00"));
elsif clock_i'event and clock_i='1' then      
    if enableRoundcomputing_i='1' and enableInvMixColumns_i='1' then --in state waiting
        data_state_s<=inter_state0_s;
    end if;
    if enableRoundcomputing_i='1' and enableInvMixColumns_i='0' then --in state Round 10
        data_state_s<=inter_state5_s;
    end if;
    if enableInvMixColumns_i='1' and enableRoundcomputing_i='0' then --in state Round 9 to 1
        data_state_s<=inter_state4_s;
    end if;
    if enableInvMixColumns_i='0' and enableRoundcomputing_i='0' then  --in state Round 0
        data_state_s<=inter_state3_s;
    end if;
end if;

end process;
    --send result to output
    data_o(127 downto 120)<=data_state_s(0)(0);
    data_o(119 downto 112)<=data_state_s(1)(0);
    data_o(111 downto 104)<=data_state_s(2)(0);
    data_o(103 downto 96)<=data_state_s(3)(0);
    data_o(95 downto 88)<=data_state_s(0)(1);
    data_o(87 downto 80)<=data_state_s(1)(1);
    data_o(79 downto 72)<=data_state_s(2)(1);
    data_o(71 downto 64)<=data_state_s(3)(1);
    data_o(63 downto 56)<=data_state_s(0)(2);
    data_o(55 downto 48)<=data_state_s(1)(2);
    data_o(47 downto 40)<=data_state_s(2)(2);
    data_o(39 downto 32)<=data_state_s(3)(2);
    data_o(31 downto 24)<=data_state_s(0)(3);
    data_o(23 downto 16)<=data_state_s(1)(3);
    data_o(15 downto 8)<=data_state_s(2)(3);
    data_o(7 downto 0)<=data_state_s(3)(3);

end InvAESRound_Arch;
