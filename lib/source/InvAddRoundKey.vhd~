library AESLibrary;
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use AESLibrary.state_definition_package.all;

entity InvAddRoundKey is
port(
    InvAddRoundKey_i: in type_state;
    InvAddRoundKey_round_i: in bit4;
    InvAddRoundKey_o: out type_state
);
end InvAddRoundKey;


architecture InvAddRoundKey_Arch of InvAddRoundKey is

component KeyExpansion_table
port(
    round_i : in bit4;
    expansion_key_o : out bit128
);
end component;

--inter signals to save current keys
signal ek_s: bit128;  
signal ek0_s: bit8;
signal ek1_s: bit8;
signal ek2_s: bit8;
signal ek3_s: bit8;
signal ek4_s: bit8;
signal ek5_s: bit8;
signal ek6_s: bit8;
signal ek7_s: bit8;
signal ek8_s: bit8;
signal ek9_s: bit8;
signal ek10_s: bit8;
signal ek11_s: bit8;
signal ek12_s: bit8;
signal ek13_s: bit8;
signal ek14_s: bit8;
signal ek15_s: bit8;

begin

KeyExpansion_table1:KeyExpansion_table port map(
    round_i=>InvAddRoundKey_round_i,
    expansion_key_o=>ek_s
);

--get each continuous 8 bits from current key
ek0_s<=ek_s(127 downto 120);
ek1_s<=ek_s(119 downto 112);
ek2_s<=ek_s(111 downto 104);
ek3_s<=ek_s(103 downto 96);
ek4_s<=ek_s(95 downto 88);
ek5_s<=ek_s(87 downto 80);
ek6_s<=ek_s(79 downto 72);
ek7_s<=ek_s(71 downto 64);
ek8_s<=ek_s(63 downto 56);
ek9_s<=ek_s(55 downto 48);
ek10_s<=ek_s(47 downto 40);
ek11_s<=ek_s(39 downto 32);
ek12_s<=ek_s(31 downto 24);
ek13_s<=ek_s(23 downto 16);
ek14_s<=ek_s(15 downto 8);
ek15_s<=ek_s(7 downto 0);

--XOR operation for each element of the state
InvAddRoundKey_o(0)(0)<= ek0_s xor InvAddRoundKey_i(0)(0);
InvAddRoundKey_o(1)(0)<= ek1_s xor InvAddRoundKey_i(1)(0);
InvAddRoundKey_o(2)(0)<= ek2_s xor InvAddRoundKey_i(2)(0);
InvAddRoundKey_o(3)(0)<= ek3_s xor InvAddRoundKey_i(3)(0);
InvAddRoundKey_o(0)(1)<= ek4_s xor InvAddRoundKey_i(0)(1);
InvAddRoundKey_o(1)(1)<= ek5_s xor InvAddRoundKey_i(1)(1);
InvAddRoundKey_o(2)(1)<= ek6_s xor InvAddRoundKey_i(2)(1);
InvAddRoundKey_o(3)(1)<= ek7_s xor InvAddRoundKey_i(3)(1);
InvAddRoundKey_o(0)(2)<= ek8_s xor InvAddRoundKey_i(0)(2);
InvAddRoundKey_o(1)(2)<= ek9_s xor InvAddRoundKey_i(1)(2);
InvAddRoundKey_o(2)(2)<= ek10_s xor InvAddRoundKey_i(2)(2);
InvAddRoundKey_o(3)(2)<= ek11_s xor InvAddRoundKey_i(3)(2);
InvAddRoundKey_o(0)(3)<= ek12_s xor InvAddRoundKey_i(0)(3);
InvAddRoundKey_o(1)(3)<= ek13_s xor InvAddRoundKey_i(1)(3);
InvAddRoundKey_o(2)(3)<= ek14_s xor InvAddRoundKey_i(2)(3);
InvAddRoundKey_o(3)(3)<= ek15_s xor InvAddRoundKey_i(3)(3);

end InvAddRoundKey_Arch;

