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
-- Generated on "12/20/2021 16:39:49"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          HALF_ADDER
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY HALF_ADDER_vhd_vec_tst IS
END HALF_ADDER_vhd_vec_tst;
ARCHITECTURE HALF_ADDER_arch OF HALF_ADDER_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL CARRY : STD_LOGIC;
SIGNAL IN_A : STD_LOGIC;
SIGNAL IN_B : STD_LOGIC;
SIGNAL SUM : STD_LOGIC;
COMPONENT HALF_ADDER
	PORT (
	CARRY : OUT STD_LOGIC;
	IN_A : IN STD_LOGIC;
	IN_B : IN STD_LOGIC;
	SUM : OUT STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : HALF_ADDER
	PORT MAP (
-- list connections between master ports and signals
	CARRY => CARRY,
	IN_A => IN_A,
	IN_B => IN_B,
	SUM => SUM
	);

-- IN_A
t_prcs_IN_A: PROCESS
BEGIN
	IN_A <= '0';
	WAIT FOR 110000 ps;
	IN_A <= '1';
	WAIT FOR 110000 ps;
	IN_A <= '0';
	WAIT FOR 120000 ps;
	IN_A <= '1';
	WAIT FOR 140000 ps;
	IN_A <= '0';
WAIT;
END PROCESS t_prcs_IN_A;

-- IN_B
t_prcs_IN_B: PROCESS
BEGIN
	IN_B <= '0';
	WAIT FOR 220000 ps;
	IN_B <= '1';
	WAIT FOR 260000 ps;
	IN_B <= '0';
WAIT;
END PROCESS t_prcs_IN_B;
END HALF_ADDER_arch;
