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
-- Generated on "12/24/2021 14:00:26"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          DATA_FLOW
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY DATA_FLOW_vhd_vec_tst IS
END DATA_FLOW_vhd_vec_tst;
ARCHITECTURE DATA_FLOW_arch OF DATA_FLOW_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL A : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL ACC : STD_LOGIC;
SIGNAL ALU_OUT : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL B : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL CARRYOUT : STD_LOGIC;
SIGNAL CLOCK : STD_LOGIC;
SIGNAL OP : STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL REG_A_OUT : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL REG_B_OUT : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL REG_C_OUT : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL RESET : STD_LOGIC;
SIGNAL RST_A : STD_LOGIC;
SIGNAL RST_B : STD_LOGIC;
SIGNAL RST_C : STD_LOGIC;
SIGNAL START : STD_LOGIC;
SIGNAL STATE_OUT : STD_LOGIC_VECTOR(2 DOWNTO 0);
COMPONENT DATA_FLOW
	PORT (
	A : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	ACC : IN STD_LOGIC;
	ALU_OUT : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	B : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	CARRYOUT : OUT STD_LOGIC;
	CLOCK : IN STD_LOGIC;
	OP : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
	REG_A_OUT : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	REG_B_OUT : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	REG_C_OUT : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	RESET : IN STD_LOGIC;
	RST_A : IN STD_LOGIC;
	RST_B : IN STD_LOGIC;
	RST_C : IN STD_LOGIC;
	START : IN STD_LOGIC;
	STATE_OUT : OUT STD_LOGIC_VECTOR(2 DOWNTO 0)
	);
END COMPONENT;
BEGIN
	i1 : DATA_FLOW
	PORT MAP (
-- list connections between master ports and signals
	A => A,
	ACC => ACC,
	ALU_OUT => ALU_OUT,
	B => B,
	CARRYOUT => CARRYOUT,
	CLOCK => CLOCK,
	OP => OP,
	REG_A_OUT => REG_A_OUT,
	REG_B_OUT => REG_B_OUT,
	REG_C_OUT => REG_C_OUT,
	RESET => RESET,
	RST_A => RST_A,
	RST_B => RST_B,
	RST_C => RST_C,
	START => START,
	STATE_OUT => STATE_OUT
	);

-- CLOCK
t_prcs_CLOCK: PROCESS
BEGIN
LOOP
	CLOCK <= '0';
	WAIT FOR 100000 ps;
	CLOCK <= '1';
	WAIT FOR 100000 ps;
	IF (NOW >= 2000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_CLOCK;
-- OP[2]
t_prcs_OP_2: PROCESS
BEGIN
	OP(2) <= '0';
WAIT;
END PROCESS t_prcs_OP_2;
-- OP[1]
t_prcs_OP_1: PROCESS
BEGIN
	OP(1) <= '0';
WAIT;
END PROCESS t_prcs_OP_1;
-- OP[0]
t_prcs_OP_0: PROCESS
BEGIN
	OP(0) <= '0';
WAIT;
END PROCESS t_prcs_OP_0;

-- RESET
t_prcs_RESET: PROCESS
BEGIN
	RESET <= '1';
	WAIT FOR 140000 ps;
	RESET <= '0';
WAIT;
END PROCESS t_prcs_RESET;

-- ACC
t_prcs_ACC: PROCESS
BEGIN
	ACC <= '0';
	WAIT FOR 1140000 ps;
	ACC <= '1';
	WAIT FOR 160000 ps;
	ACC <= '0';
WAIT;
END PROCESS t_prcs_ACC;

-- START
t_prcs_START: PROCESS
BEGIN
	START <= '0';
	WAIT FOR 200000 ps;
	START <= '1';
	WAIT FOR 220000 ps;
	START <= '0';
	WAIT FOR 720000 ps;
	START <= '1';
	WAIT FOR 160000 ps;
	START <= '0';
WAIT;
END PROCESS t_prcs_START;
-- A[7]
t_prcs_A_7: PROCESS
BEGIN
	A(7) <= '0';
WAIT;
END PROCESS t_prcs_A_7;
-- A[6]
t_prcs_A_6: PROCESS
BEGIN
	A(6) <= '0';
WAIT;
END PROCESS t_prcs_A_6;
-- A[5]
t_prcs_A_5: PROCESS
BEGIN
	A(5) <= '1';
WAIT;
END PROCESS t_prcs_A_5;
-- A[4]
t_prcs_A_4: PROCESS
BEGIN
	A(4) <= '0';
WAIT;
END PROCESS t_prcs_A_4;
-- A[3]
t_prcs_A_3: PROCESS
BEGIN
	A(3) <= '1';
WAIT;
END PROCESS t_prcs_A_3;
-- A[2]
t_prcs_A_2: PROCESS
BEGIN
	A(2) <= '1';
WAIT;
END PROCESS t_prcs_A_2;
-- A[1]
t_prcs_A_1: PROCESS
BEGIN
	A(1) <= '1';
WAIT;
END PROCESS t_prcs_A_1;
-- A[0]
t_prcs_A_0: PROCESS
BEGIN
	A(0) <= '1';
WAIT;
END PROCESS t_prcs_A_0;
-- B[7]
t_prcs_B_7: PROCESS
BEGIN
	B(7) <= '0';
WAIT;
END PROCESS t_prcs_B_7;
-- B[6]
t_prcs_B_6: PROCESS
BEGIN
	B(6) <= '1';
WAIT;
END PROCESS t_prcs_B_6;
-- B[5]
t_prcs_B_5: PROCESS
BEGIN
	B(5) <= '0';
WAIT;
END PROCESS t_prcs_B_5;
-- B[4]
t_prcs_B_4: PROCESS
BEGIN
	B(4) <= '1';
WAIT;
END PROCESS t_prcs_B_4;
-- B[3]
t_prcs_B_3: PROCESS
BEGIN
	B(3) <= '1';
WAIT;
END PROCESS t_prcs_B_3;
-- B[2]
t_prcs_B_2: PROCESS
BEGIN
	B(2) <= '0';
WAIT;
END PROCESS t_prcs_B_2;
-- B[1]
t_prcs_B_1: PROCESS
BEGIN
	B(1) <= '1';
WAIT;
END PROCESS t_prcs_B_1;
-- B[0]
t_prcs_B_0: PROCESS
BEGIN
	B(0) <= '1';
WAIT;
END PROCESS t_prcs_B_0;

-- RST_A
t_prcs_RST_A: PROCESS
BEGIN
	RST_A <= '0';
WAIT;
END PROCESS t_prcs_RST_A;

-- RST_B
t_prcs_RST_B: PROCESS
BEGIN
	RST_B <= '0';
WAIT;
END PROCESS t_prcs_RST_B;

-- RST_C
t_prcs_RST_C: PROCESS
BEGIN
	RST_C <= '0';
WAIT;
END PROCESS t_prcs_RST_C;
END DATA_FLOW_arch;
