LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

entity D_LATCH is
port
(
D, CLK : IN STD_LOGIC;
Q : OUT STD_LOGIC
);
end D_LATCH;

architecture Behavioral of D_LATCH is

begin
process(CLK, D)
begin
if (CLK = '1') then
Q <= D;
end if;
end process;
end Behavioral;