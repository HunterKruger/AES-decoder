library AESLibrary;
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use AESLibrary.state_definition_package.all;

entity FSM_InvAES is
port(
    clock_i:in std_logic;
    resetb_i:in std_logic;
    round_i:in bit4;
    start_i:in std_logic;
    done_o:out std_logic;
    enableCounter_o:out std_logic;
    enableMixcolumns_o:out std_logic;
    enableOutput_o:out std_logic;
    enableRoundcomputing_o:out std_logic;
    getciphertext_o:out std_logic;
    resetCounter_o:out std_logic
);
end FSM_InvAES;


architecture FSM_InvAES_Arch_Moore of FSM_InvAES is

--5 type of states in a loop
type state is (init, waiting, round10, round9to1, round0);
signal state_present, state_future : state;

begin 

seq_0:process(clock_i,resetb_i)
begin
    if resetb_i='0' then 
        state_present<=init;
    elsif clock_i'event and clock_i='1' then  --up edge of clock can trigger the state enter next state
        state_present<=state_future;
    end if;
end process seq_0;

comb0:process(state_present,round_i,resetb_i,start_i)
begin 
    case state_present is 
        when init=>
            state_future<=waiting;
        when waiting=>
            if start_i='1' then
                state_future<=round10;  
            else       
                state_future<=waiting;
            end if;
        when round10=>
            --enter next state in advance because state_present lag one clock period than state_future
            if round_i=X"a" then 
                state_future<=round9to1;
            end if;
        when round9to1=>
            --enter next state in advance because state_present lag one clock period than state_future
            if round_i=X"1" then  
                state_future<=round0;
            end if;
            --enter waiting state if all rounds are finished
        when round0=>
            state_future<=waiting;
    end case;
end process comb0;

comb1:process(state_present)
begin 
    case state_present is 
        when init=>
            done_o<='0';
            enableCounter_o<='0';
            enableMixcolumns_o<='1';
            enableOutput_o<='0';
            enableRoundcomputing_o<='1';
            getciphertext_o<='0';
            resetCounter_o<='0'; 
        when waiting=>
            done_o<='0';
            enableCounter_o<='0';
            enableMixcolumns_o<='1'; 
            enableOutput_o<='1'; 
            enableRoundcomputing_o<='1'; 
            getciphertext_o<='1'; 
            resetCounter_o<='0';  
        when round10=>
            done_o<='0';
            enableCounter_o<='1';
            enableMixcolumns_o<='0';
            enableOutput_o<='1'; 
            enableRoundcomputing_o<='1';
            getciphertext_o<='1'; 
            resetCounter_o<='1'; 
        when round9to1=>
            done_o<='0';
            enableCounter_o<='1';
            enableMixcolumns_o<='1';
            enableOutput_o<='1';
            enableRoundcomputing_o<='0';
            getciphertext_o<='0';
            resetCounter_o<='1'; 
        when round0=>
            done_o<='1';
            enableCounter_o<='1';
            enableMixcolumns_o<='0';
            enableOutput_o<='1';
            enableRoundcomputing_o<='0';
            getciphertext_o<='0';
            resetCounter_o<='1';  
    end case;
end process comb1;


end  FSM_InvAES_Arch_Moore;
