library AESLibrary;
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use AESLibrary.state_definition_package.all;

--this entity is to calulate a specific column of state by using invMixColumn algorithm
entity Multiply is
port(
    Multiply_i: in column_state;
    Multiply_o: out column_state
);
end Multiply;


architecture Multiply_Arch of Multiply is
-----------------------------------------
--to save each element of the column
signal ElementRow0_s: bit8;
signal ElementRow1_s: bit8;
signal ElementRow2_s: bit8;
signal ElementRow3_s: bit8;
-----------------------------------------
--to save the mutiplication results of the first element of the input column
signal ER0_Mul2_s: bit8; --multiply 2
signal ER0_Mul4_s: bit8; --multiply 4
signal ER0_Mul8_s: bit8; --multiply 8

signal ER0_Mul09_s: bit8; --multiply 9
signal ER0_Mul0B_s: bit8; --multiply B
signal ER0_Mul0D_s: bit8; --multiply D
signal ER0_Mul0E_s: bit8; --multiply E
-----------------------------------------
--to save the mutiplication results of the second element of the input column
signal ER1_Mul2_s: bit8; --multiply 2
signal ER1_Mul4_s: bit8; --multiply 4
signal ER1_Mul8_s: bit8; --multiply 8

signal ER1_Mul09_s: bit8; --multiply 9
signal ER1_Mul0B_s: bit8; --multiply B
signal ER1_Mul0D_s: bit8; --multiply D
signal ER1_Mul0E_s: bit8; --multiply E
-----------------------------------------
--to save the mutiplication results of the third element of the input column
signal ER2_Mul2_s: bit8; --multiply 2
signal ER2_Mul4_s: bit8; --multiply 4
signal ER2_Mul8_s: bit8; --multiply 8

signal ER2_Mul09_s: bit8; --multiply 9
signal ER2_Mul0B_s: bit8; --multiply B
signal ER2_Mul0D_s: bit8; --multiply D
signal ER2_Mul0E_s: bit8; --multiply E
-----------------------------------------
--to save the mutiplication results of the fourth element of the input column
signal ER3_Mul2_s: bit8; --multiply 2
signal ER3_Mul4_s: bit8; --multiply 4
signal ER3_Mul8_s: bit8; --multiply 8

signal ER3_Mul09_s: bit8; --multiply 9
signal ER3_Mul0B_s: bit8; --multiply B
signal ER3_Mul0D_s: bit8; --multiply D
signal ER3_Mul0E_s: bit8; --multiply E
-----------------------------------------

begin
--to get each element of the column
ElementRow0_s <= Multiply_i(0);
ElementRow1_s <= Multiply_i(1);
ElementRow2_s <= Multiply_i(2);
ElementRow3_s <= Multiply_i(3);
-----------------------------------------
--to calculate the mutiplication of the first element of the column
ER0_Mul2_s <= ( ElementRow0_s(6 downto 0) & '0' ) xor ( "000" & ElementRow0_s(7) & ElementRow0_s(7) & '0' & ElementRow0_s(7) & ElementRow0_s(7) );
ER0_Mul4_s <= ( ER0_Mul2_s(6 downto 0) & '0' ) xor ( "000" & ER0_Mul2_s(7) & ER0_Mul2_s(7) & '0' & ER0_Mul2_s(7) & ER0_Mul2_s(7) );
ER0_Mul8_s <= ( ER0_Mul4_s(6 downto 0) & '0' ) xor ( "000" & ER0_Mul4_s(7) & ER0_Mul4_s(7) & '0' & ER0_Mul4_s(7) & ER0_Mul4_s(7) );

ER0_Mul09_s <= ER0_Mul8_s xor ElementRow0_s;
ER0_Mul0B_s <= ER0_Mul8_s xor ER0_Mul2_s xor ElementRow0_s;
ER0_Mul0D_s <= ER0_Mul8_s xor ER0_Mul4_s xor ElementRow0_s;
ER0_Mul0E_s <= ER0_Mul8_s xor ER0_Mul4_s xor ER0_Mul2_s;
-----------------------------------------
--to calculate the mutiplication of the second element of the column
ER1_Mul2_s <= ( ElementRow1_s(6 downto 0) & '0' ) xor ( "000" & ElementRow1_s(7) & ElementRow1_s(7) & '0' & ElementRow1_s(7) & ElementRow1_s(7) );
ER1_Mul4_s <= ( ER1_Mul2_s(6 downto 0) & '0' ) xor ( "000" & ER1_Mul2_s(7) & ER1_Mul2_s(7) & '0' & ER1_Mul2_s(7) & ER1_Mul2_s(7) );
ER1_Mul8_s <= ( ER1_Mul4_s(6 downto 0) & '0' ) xor ( "000" & ER1_Mul4_s(7) & ER1_Mul4_s(7) & '0' & ER1_Mul4_s(7) & ER1_Mul4_s(7) );

ER1_Mul09_s <= ER1_Mul8_s xor ElementRow1_s;
ER1_Mul0B_s <= ER1_Mul8_s xor ER1_Mul2_s xor ElementRow1_s;
ER1_Mul0D_s <= ER1_Mul8_s xor ER1_Mul4_s xor ElementRow1_s;
ER1_Mul0E_s <= ER1_Mul8_s xor ER1_Mul4_s xor ER1_Mul2_s;
-----------------------------------------
--to calculate the mutiplication of the third element of the column
ER2_Mul2_s <= ( ElementRow2_s(6 downto 0) & '0'  ) xor ( "000" & ElementRow2_s(7) & ElementRow2_s(7) & '0' & ElementRow2_s(7) & ElementRow2_s(7) );
ER2_Mul4_s <= ( ER2_Mul2_s(6 downto 0) & '0'  ) xor ( "000" & ER2_Mul2_s(7) & ER2_Mul2_s(7) & '0' & ER2_Mul2_s(7) & ER2_Mul2_s(7) );
ER2_Mul8_s <= ( ER2_Mul4_s(6 downto 0) & '0'  ) xor ( "000" & ER2_Mul4_s(7) & ER2_Mul4_s(7) & '0' & ER2_Mul4_s(7) & ER2_Mul4_s(7) );

ER2_Mul09_s <= ER2_Mul8_s xor ElementRow2_s;
ER2_Mul0B_s <= ER2_Mul8_s xor ER2_Mul2_s xor ElementRow2_s;
ER2_Mul0D_s <= ER2_Mul8_s xor ER2_Mul4_s xor ElementRow2_s;
ER2_Mul0E_s <= ER2_Mul8_s xor ER2_Mul4_s xor ER2_Mul2_s;
-----------------------------------------
--to calculate the mutiplication of the fourth element of the column
ER3_Mul2_s <= ( ElementRow3_s(6 downto 0) & '0'  ) xor ( "000" & ElementRow3_s(7) & ElementRow3_s(7) & '0' & ElementRow3_s(7) & ElementRow3_s(7) );
ER3_Mul4_s <= ( ER3_Mul2_s(6 downto 0) & '0'  ) xor ( "000" & ER3_Mul2_s(7) & ER3_Mul2_s(7) & '0' & ER3_Mul2_s(7) & ER3_Mul2_s(7) );
ER3_Mul8_s <= ( ER3_Mul4_s(6 downto 0) & '0'  ) xor ( "000" & ER3_Mul4_s(7) & ER3_Mul4_s(7) & '0' & ER3_Mul4_s(7) & ER3_Mul4_s(7) );

ER3_Mul09_s <= ER3_Mul8_s xor ElementRow3_s;
ER3_Mul0B_s <= ER3_Mul8_s xor ER3_Mul2_s xor ElementRow3_s;
ER3_Mul0D_s <= ER3_Mul8_s xor ER3_Mul4_s xor ElementRow3_s;
ER3_Mul0E_s <= ER3_Mul8_s xor ER3_Mul4_s xor ER3_Mul2_s;
-----------------------------------------
--to calculate the result of each element of output column 
Multiply_o(0) <= ER0_Mul0E_s xor ER1_Mul0B_s xor ER2_Mul0D_s xor ER3_Mul09_s;
Multiply_o(1) <= ER0_Mul09_s xor ER1_Mul0E_s xor ER2_Mul0B_s xor ER3_Mul0D_s;
Multiply_o(2) <= ER0_Mul0D_s xor ER1_Mul09_s xor ER2_Mul0E_s xor ER3_Mul0B_s;
Multiply_o(3) <= ER0_Mul0B_s xor ER1_Mul0D_s xor ER2_Mul09_s xor ER3_Mul0E_s;
  
end Multiply_Arch;
