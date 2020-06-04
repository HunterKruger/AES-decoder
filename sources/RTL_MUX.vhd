library AESLibrary;
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use AESLibrary.state_definition_package.all;

entity RTL_MUX is
port(
    text0_i: in bit128;
    text1_i: in bit128;
    getText_i: in std_logic;
    text_o: out bit128
);
end RTL_MUX;

 
architecture RTL_MUX_Arch of RTL_MUX is

signal text_s: bit128;
begin
    text_s<=text0_i when getText_i='1' else   --send plain text to InvAESRound
        text1_i when getText_i='0';  --send previous round result to InvAESRound
    text_o<=text_s;
end RTL_MUX_Arch;
