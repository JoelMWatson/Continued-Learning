LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

entity Project1 is
port
(
-- VARIABLES : DIRECTON TYPE;
INPUT_A, INPUT_B : IN STD_LOGIC;
OUTPUT : OUT STD_LOGIC
);
end Project1;

Architecture behavioral of Project1 is
begin

OUTPUT<= INPUT_A AND INPUT_B;

end behavioral;
