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
-- Generated on "12/23/2021 22:03:04"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          SR_LATCH
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY SR_LATCH_vhd_vec_tst IS
END SR_LATCH_vhd_vec_tst;
ARCHITECTURE SR_LATCH_arch OF SR_LATCH_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL Q : STD_LOGIC;
SIGNAL R : STD_LOGIC;
SIGNAL S : STD_LOGIC;
COMPONENT SR_LATCH
	PORT (
	Q : INOUT STD_LOGIC;
	R : IN STD_LOGIC;
	S : IN STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : SR_LATCH
	PORT MAP (
-- list connections between master ports and signals
	Q => Q,
	R => R,
	S => S
	);

-- S
t_prcs_S: PROCESS
BEGIN
	S <= '0';
	WAIT FOR 130000 ps;
	S <= '1';
	WAIT FOR 400000 ps;
	S <= '0';
WAIT;
END PROCESS t_prcs_S;

-- R
t_prcs_R: PROCESS
BEGIN
	R <= '0';
	WAIT FOR 130000 ps;
	R <= '1';
	WAIT FOR 170000 ps;
	R <= '0';
	WAIT FOR 230000 ps;
	R <= '1';
	WAIT FOR 120000 ps;
	R <= '0';
WAIT;
END PROCESS t_prcs_R;

-- Q
t_prcs_Q: PROCESS
BEGIN
	Q <= 'Z';
WAIT;
END PROCESS t_prcs_Q;
END SR_LATCH_arch;
