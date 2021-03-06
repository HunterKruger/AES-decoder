library AESLibrary;
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use AESLibrary.state_definition_package.all;

entity Counter is
port(
    clock_i: in std_logic;
    enable_i: in std_logic;
    resetb_i: in std_logic;
    count_o: out bit4
);
end Counter;

 
architecture Counter_Arch of Counter is

signal counter_s : integer range 0 to 10;  -- 10 rounds in all

begin

counter: process(clock_i,resetb_i)
begin 
    if resetb_i='0' then
        counter_s<=10;
    elsif clock_i'event and clock_i='1' then   --trigger by up edge 
        if enable_i='1' then
            if counter_s = 0 then
                counter_s<=10;
            else
                counter_s<=counter_s-1;
            end if;
        end if;
    end if;
end process;
    count_o <= std_logic_vector(to_unsigned(counter_s,4)); --force type change to bit4
end Counter_Arch;
