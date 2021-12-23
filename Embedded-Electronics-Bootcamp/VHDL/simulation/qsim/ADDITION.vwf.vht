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
-- Generated on "12/20/2021 17:29:43"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          ADDITION
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY ADDITION_vhd_vec_tst IS
END ADDITION_vhd_vec_tst;
ARCHITECTURE ADDITION_arch OF ADDITION_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL CARRY_OUT : STD_LOGIC;
SIGNAL IN_A1 : STD_LOGIC;
SIGNAL IN_A2 : STD_LOGIC;
SIGNAL IN_A3 : STD_LOGIC;
SIGNAL IN_A4 : STD_LOGIC;
SIGNAL IN_B1 : STD_LOGIC;
SIGNAL IN_B2 : STD_LOGIC;
SIGNAL IN_B3 : STD_LOGIC;
SIGNAL IN_B4 : STD_LOGIC;
SIGNAL OUT_1 : STD_LOGIC;
SIGNAL OUT_2 : STD_LOGIC;
SIGNAL OUT_3 : STD_LOGIC;
SIGNAL OUT_4 : STD_LOGIC;
COMPONENT ADDITION
	PORT (
	CARRY_OUT : OUT STD_LOGIC;
	IN_A1 : IN STD_LOGIC;
	IN_A2 : IN STD_LOGIC;
	IN_A3 : IN STD_LOGIC;
	IN_A4 : IN STD_LOGIC;
	IN_B1 : IN STD_LOGIC;
	IN_B2 : IN STD_LOGIC;
	IN_B3 : IN STD_LOGIC;
	IN_B4 : IN STD_LOGIC;
	OUT_1 : OUT STD_LOGIC;
	OUT_2 : OUT STD_LOGIC;
	OUT_3 : OUT STD_LOGIC;
	OUT_4 : OUT STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : ADDITION
	PORT MAP (
-- list connections between master ports and signals
	CARRY_OUT => CARRY_OUT,
	IN_A1 => IN_A1,
	IN_A2 => IN_A2,
	IN_A3 => IN_A3,
	IN_A4 => IN_A4,
	IN_B1 => IN_B1,
	IN_B2 => IN_B2,
	IN_B3 => IN_B3,
	IN_B4 => IN_B4,
	OUT_1 => OUT_1,
	OUT_2 => OUT_2,
	OUT_3 => OUT_3,
	OUT_4 => OUT_4
	);

-- IN_A1
t_prcs_IN_A1: PROCESS
BEGIN
	IN_A1 <= '0';
WAIT;
END PROCESS t_prcs_IN_A1;

-- IN_A2
t_prcs_IN_A2: PROCESS
BEGIN
	IN_A2 <= '0';
WAIT;
END PROCESS t_prcs_IN_A2;

-- IN_A3
t_prcs_IN_A3: PROCESS
BEGIN
	IN_A3 <= '1';
WAIT;
END PROCESS t_prcs_IN_A3;

-- IN_A4
t_prcs_IN_A4: PROCESS
BEGIN
	IN_A4 <= '1';
WAIT;
END PROCESS t_prcs_IN_A4;

-- IN_B1
t_prcs_IN_B1: PROCESS
BEGIN
	IN_B1 <= '0';
WAIT;
END PROCESS t_prcs_IN_B1;

-- IN_B2
t_prcs_IN_B2: PROCESS
BEGIN
	IN_B2 <= '1';
WAIT;
END PROCESS t_prcs_IN_B2;

-- IN_B3
t_prcs_IN_B3: PROCESS
BEGIN
	IN_B3 <= '0';
WAIT;
END PROCESS t_prcs_IN_B3;

-- IN_B4
t_prcs_IN_B4: PROCESS
BEGIN
	IN_B4 <= '0';
WAIT;
END PROCESS t_prcs_IN_B4;
END ADDITION_arch;
