LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.NUMERIC_STD.ALL;

entity ALU is 
port
(
A,B : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
OP : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
RESULT: OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
CARRYOUT : OUT STD_LOGIC
);
end ALU;

architecture behavioral of ALU is

signal ALU_RESULT : STD_LOGIC_VECTOR(7 DOWNTO 0);
signal OVERFLOW : STD_LOGIC_VECTOR(8 DOWNTO 0);

begin

process (A,B,OP)
begin
case(OP) is
when "000" => -- Add
ALU_RESULT <= A+B;
-- Extend the vector by 1 bit
OVERFLOW <= ('0' & A) + ('0' & B);
when "001" => -- Subtract
ALU_RESULT <= A-B;
-- Extend the vector by 1 bit
OVERFLOW <= ('0' & A) - ('0' & B);
when "010" => -- Multiply
ALU_RESULT <= STD_LOGIC_VECTOR(TO_UNSIGNED(TO_INTEGER(UNSIGNED(A)) * TO_INTEGER(UNSIGNED(B)),8));

when "011" => -- Divide
ALU_RESULT <= STD_LOGIC_VECTOR(TO_UNSIGNED(TO_INTEGER(UNSIGNED(A)) / TO_INTEGER(UNSIGNED(B)),8));

when "100" => -- XOR
ALU_RESULT <= A XOR B;
when "101" => -- XNOR
ALU_RESULT <= A XNOR B;
when "110" => -- EQUAL
if (A=B) then
ALU_RESULT <= x"01";
else 
ALU_RESULT <= x"00";
end if;
when "111" => -- LESS THAN
if (A<B) then
ALU_RESULT <= x"01";
else 
ALU_RESULT <= x"00";
end if;
when others =>
ALU_RESULT <= A;
-- Extend the vector by 1 bit
OVERFLOW <= ('0' & A) + ('0' & B);
end case;
end process;

RESULT <= ALU_RESULT;
CARRYOUT <= OVERFLOW(8);

end behavioral;