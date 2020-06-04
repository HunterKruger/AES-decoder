library AESLibrary;
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use AESLibrary.state_definition_package.all;

entity InvMixColumns is
port(
    InvMixColumns_i: in type_state;
    InvMixColumns_o: out type_state
);
end InvMixColumns;


architecture InvMixColumns_Arch of InvMixColumns is

--use component Multiply to calculate each column
component Multiply
port(
    Multiply_i: in column_state;
    Multiply_o: out column_state
);
end component;

begin
  
Multiply_0:Multiply port map(
    Multiply_i(0)=>InvMixColumns_i(0)(0),
    Multiply_i(1)=>InvMixColumns_i(1)(0),
    Multiply_i(2)=>InvMixColumns_i(2)(0),
    Multiply_i(3)=>InvMixColumns_i(3)(0),
    Multiply_o(0)=>InvMixColumns_o(0)(0),
    Multiply_o(1)=>InvMixColumns_o(1)(0),
    Multiply_o(2)=>InvMixColumns_o(2)(0),
    Multiply_o(3)=>InvMixColumns_o(3)(0)
);

Multiply_1:Multiply port map(
    Multiply_i(0)=>InvMixColumns_i(0)(1),
    Multiply_i(1)=>InvMixColumns_i(1)(1),
    Multiply_i(2)=>InvMixColumns_i(2)(1),
    Multiply_i(3)=>InvMixColumns_i(3)(1),
    Multiply_o(0)=>InvMixColumns_o(0)(1),
    Multiply_o(1)=>InvMixColumns_o(1)(1),
    Multiply_o(2)=>InvMixColumns_o(2)(1),
    Multiply_o(3)=>InvMixColumns_o(3)(1)
);

Multiply_2:Multiply port map(
    Multiply_i(0)=>InvMixColumns_i(0)(2),
    Multiply_i(1)=>InvMixColumns_i(1)(2),
    Multiply_i(2)=>InvMixColumns_i(2)(2),
    Multiply_i(3)=>InvMixColumns_i(3)(2),
    Multiply_o(0)=>InvMixColumns_o(0)(2),
    Multiply_o(1)=>InvMixColumns_o(1)(2),
    Multiply_o(2)=>InvMixColumns_o(2)(2),
    Multiply_o(3)=>InvMixColumns_o(3)(2)
);

Multiply_3:Multiply port map(
    Multiply_i(0)=>InvMixColumns_i(0)(3),
    Multiply_i(1)=>InvMixColumns_i(1)(3),
    Multiply_i(2)=>InvMixColumns_i(2)(3),
    Multiply_i(3)=>InvMixColumns_i(3)(3),
    Multiply_o(0)=>InvMixColumns_o(0)(3),
    Multiply_o(1)=>InvMixColumns_o(1)(3),
    Multiply_o(2)=>InvMixColumns_o(2)(3),
    Multiply_o(3)=>InvMixColumns_o(3)(3)
);

end InvMixColumns_Arch;
