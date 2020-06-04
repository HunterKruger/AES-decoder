library AESLibrary;
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use AESLibrary.state_definition_package.all;

entity InvSubBytes is
port(
    InvSubBytes_i: in type_state;
    InvSubBytes_o: out type_state
);
end InvSubBytes;


architecture InvSubBytes_Arch of InvSubBytes is

component S_Box
port(
    S_Box_i : in bit8;
    S_Box_o: out bit8
);
end component;

begin
    --each element in the state should be substituted by S_Box
    S_Box_00:S_Box port map(
        S_Box_i=>InvSubBytes_i(0)(0),
        S_Box_o=>InvSubBytes_o(0)(0)
    );
    S_Box_01:S_Box port map(
        S_Box_i=>InvSubBytes_i(0)(1),
        S_Box_o=>InvSubBytes_o(0)(1)
    );
    S_Box_02:S_Box port map(
        S_Box_i=>InvSubBytes_i(0)(2),
        S_Box_o=>InvSubBytes_o(0)(2)
    );
    S_Box_03:S_Box port map(
        S_Box_i=>InvSubBytes_i(0)(3),
        S_Box_o=>InvSubBytes_o(0)(3)
    );
    S_Box_10:S_Box port map(
        S_Box_i=>InvSubBytes_i(1)(0),
        S_Box_o=>InvSubBytes_o(1)(0)
    );
    S_Box_11:S_Box port map(
        S_Box_i=>InvSubBytes_i(1)(1),
        S_Box_o=>InvSubBytes_o(1)(1)
    );
    S_Box_12:S_Box port map(
        S_Box_i=>InvSubBytes_i(1)(2),
        S_Box_o=>InvSubBytes_o(1)(2)
    );
    S_Box_13:S_Box port map(
        S_Box_i=>InvSubBytes_i(1)(3),
        S_Box_o=>InvSubBytes_o(1)(3)
    );
    S_Box_20:S_Box port map(
        S_Box_i=>InvSubBytes_i(2)(0),
        S_Box_o=>InvSubBytes_o(2)(0)
    );
    S_Box_21:S_Box port map(
        S_Box_i=>InvSubBytes_i(2)(1),
        S_Box_o=>InvSubBytes_o(2)(1)
    );
    S_Box_22:S_Box port map(
        S_Box_i=>InvSubBytes_i(2)(2),
        S_Box_o=>InvSubBytes_o(2)(2)
    );
    S_Box_23:S_Box port map(
        S_Box_i=>InvSubBytes_i(2)(3),
        S_Box_o=>InvSubBytes_o(2)(3)
    );
    S_Box_30:S_Box port map(
        S_Box_i=>InvSubBytes_i(3)(0),
        S_Box_o=>InvSubBytes_o(3)(0)
    );
    S_Box_31:S_Box port map(
        S_Box_i=>InvSubBytes_i(3)(1),
        S_Box_o=>InvSubBytes_o(3)(1)
    );
    S_Box_32:S_Box port map(
        S_Box_i=>InvSubBytes_i(3)(2),
        S_Box_o=>InvSubBytes_o(3)(2)
    );
    S_Box_33:S_Box port map(
        S_Box_i=>InvSubBytes_i(3)(3),
        S_Box_o=>InvSubBytes_o(3)(3)
    );

end InvSubBytes_Arch;
