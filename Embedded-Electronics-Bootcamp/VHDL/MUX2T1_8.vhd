LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

entity MUX2T1_8 is
port (

-- Specify an 8 bit input
D0 : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
D1 : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
SEL: IN STD_LOGIC;
DATA_OUT : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)

);
end MUX2T1_8;

Architecture behavioral of MUX2T1_8 is
begin

DATA_OUT <= D0 when (SEL = '0') 
				else
				D1 when (SEL = '1');
				
end behavioral;
