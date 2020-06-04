library AESLibrary;
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use AESLibrary.state_definition_package.all;

entity InvShiftRows is
port(
    InvShiftRows_i: in type_state;
    InvShiftRows_o: out type_state
);
end InvShiftRows;

architecture InvShiftRows_Arch of InvShiftRows is
begin
    --each element of the state is replaced after Inverse Shift Row
    InvShiftRows_o(0)(0)<=InvShiftRows_i(0)(0);
    InvShiftRows_o(0)(1)<=InvShiftRows_i(0)(1);
    InvShiftRows_o(0)(2)<=InvShiftRows_i(0)(2);
    InvShiftRows_o(0)(3)<=InvShiftRows_i(0)(3);
    InvShiftRows_o(1)(0)<=InvShiftRows_i(1)(3);
    InvShiftRows_o(1)(1)<=InvShiftRows_i(1)(0);
    InvShiftRows_o(1)(2)<=InvShiftRows_i(1)(1);
    InvShiftRows_o(1)(3)<=InvShiftRows_i(1)(2);
    InvShiftRows_o(2)(0)<=InvShiftRows_i(2)(2);
    InvShiftRows_o(2)(1)<=InvShiftRows_i(2)(3);
    InvShiftRows_o(2)(2)<=InvShiftRows_i(2)(0);
    InvShiftRows_o(2)(3)<=InvShiftRows_i(2)(1);
    InvShiftRows_o(3)(0)<=InvShiftRows_i(3)(1);
    InvShiftRows_o(3)(1)<=InvShiftRows_i(3)(2);
    InvShiftRows_o(3)(2)<=InvShiftRows_i(3)(3);
    InvShiftRows_o(3)(3)<=InvShiftRows_i(3)(0);
end InvShiftRows_Arch;

