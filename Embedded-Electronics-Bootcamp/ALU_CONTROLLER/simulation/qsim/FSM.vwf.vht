-- Copyright (C) 2020  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and any partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details, at
-- https://fpgasoftware.intel.com/eula.

-- *****************************************************************************
-- This file contains a Vhdl test bench with test vectors .The test vectors     
-- are exported from a vector file in the Quartus Waveform Editor and apply to  
-- the top level entity of the current Quartus project .The user can use this   
-- testbench to simulate his design using a third-party simulation tool .       
-- *****************************************************************************
-- Generated on "12/24/2021 13:16:45"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          FSM
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY FSM_vhd_vec_tst IS
END FSM_vhd_vec_tst;
ARCHITECTURE FSM_arch OF FSM_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL ACC : STD_LOGIC;
SIGNAL CLOCK : STD_LOGIC;
SIGNAL RESET : STD_LOGIC;
SIGNAL SEL : STD_LOGIC;
SIGNAL START : STD_LOGIC;
SIGNAL STATE_OUT : STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL WRA : STD_LOGIC;
SIGNAL WRB : STD_LOGIC;
SIGNAL WRC : STD_LOGIC;
COMPONENT FSM
	PORT (
	ACC : IN STD_LOGIC;
	CLOCK : IN STD_LOGIC;
	RESET : IN STD_LOGIC;
	SEL : OUT STD_LOGIC;
	START : IN STD_LOGIC;
	STATE_OUT : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
	WRA : OUT STD_LOGIC;
	WRB : OUT STD_LOGIC;
	WRC : OUT STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : FSM
	PORT MAP (
-- list connections between master ports and signals
	ACC => ACC,
	CLOCK => CLOCK,
	RESET => RESET,
	SEL => SEL,
	START => START,
	STATE_OUT => STATE_OUT,
	WRA => WRA,
	WRB => WRB,
	WRC => WRC
	);

-- CLOCK
t_prcs_CLOCK: PROCESS
BEGIN
LOOP
	CLOCK <= '0';
	WAIT FOR 100000 ps;
	CLOCK <= '1';
	WAIT FOR 100000 ps;
	IF (NOW >= 1000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_CLOCK;

-- ACC
t_prcs_ACC: PROCESS
BEGIN
	ACC <= '0';
WAIT;
END PROCESS t_prcs_ACC;

-- RESET
t_prcs_RESET: PROCESS
BEGIN
	RESET <= '1';
	WAIT FOR 70000 ps;
	RESET <= '0';
WAIT;
END PROCESS t_prcs_RESET;

-- START
t_prcs_START: PROCESS
BEGIN
	START <= '0';
	WAIT FOR 80000 ps;
	START <= '1';
	WAIT FOR 200000 ps;
	START <= '0';
WAIT;
END PROCESS t_prcs_START;
END FSM_arch;
