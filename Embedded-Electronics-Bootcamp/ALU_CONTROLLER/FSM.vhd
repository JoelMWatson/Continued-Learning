LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

entity FSM is 
port 
(
CLOCK : IN STD_LOGIC;
RESET : IN STD_LOGIC;
ACC, START : IN STD_LOGIC;
WRA, WRB, WRC, SEL : OUT STD_LOGIC;
STATE_OUT : OUT STD_LOGIC_VECTOR(2 downto 0)
);
end FSM;

architecture Behavioral of FSM is

type STATE is (INIT, FETCH, PROC, WR_RES, ACCUM);
signal CUR_STATE, NXT_STATE : STATE;

begin

process(CLOCK, RESET)
begin
if (RESET='1') then
CUR_STATE <= INIT;
elsif (falling_edge(CLOCK)) then
CUR_STATE <= NXT_STATE;
end if;
end process;

process(START, ACC)
begin
case(CUR_STATE) is
when INIT =>
STATE_OUT <= "000";
WRA <= '0';
WRB <= '0';
WRC <= '0';
SEL <= '0';
if (START='1' and ACC='0') then
NXT_STATE <= FETCH;
elsif (START='1' and ACC='1') then
NXT_STATE <= ACCUM;
else
NXT_STATE <= INIT;
end if;

when FETCH =>
STATE_OUT <= "001";
WRA <= '1';
WRB <= '1';
WRC <= '0';
SEL <= '0';
NXT_STATE <= PROC;

when ACCUM =>
STATE_OUT <= "010";
WRA <= '0';
WRB <= '0';
WRC <= '1';
SEL <= '1';
NXT_STATE <= PROC;

when PROC =>
STATE_OUT <= "011";
WRA <= '0';
WRB <= '0';
NXT_STATE <= WR_RES;

when WR_RES =>
STATE_OUT <= "100";
WRA <= '0';
WRB <= '0';
WRC <= '1';
SEL <= '0';
NXT_STATE <= INIT;

end case;
end process;
end Behavioral;