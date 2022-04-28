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
-- Generated on "12/19/2021 02:02:09"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          OR_GATE
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY OR_GATE_vhd_vec_tst IS
END OR_GATE_vhd_vec_tst;
ARCHITECTURE OR_GATE_arch OF OR_GATE_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL INPUT_A : STD_LOGIC;
SIGNAL INPUT_B : STD_LOGIC;
SIGNAL OUTPUT : STD_LOGIC;
COMPONENT OR_GATE
	PORT (
	INPUT_A : IN STD_LOGIC;
	INPUT_B : IN STD_LOGIC;
	OUTPUT : OUT STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : OR_GATE
	PORT MAP (
-- list connections between master ports and signals
	INPUT_A => INPUT_A,
	INPUT_B => INPUT_B,
	OUTPUT => OUTPUT
	);

-- INPUT_A
t_prcs_INPUT_A: PROCESS
BEGIN
	INPUT_A <= '0';
	WAIT FOR 160000 ps;
	INPUT_A <= '1';
	WAIT FOR 100000 ps;
	INPUT_A <= '0';
	WAIT FOR 90000 ps;
	INPUT_A <= '1';
	WAIT FOR 120000 ps;
	INPUT_A <= '0';
WAIT;
END PROCESS t_prcs_INPUT_A;

-- INPUT_B
t_prcs_INPUT_B: PROCESS
BEGIN
	INPUT_B <= '0';
	WAIT FOR 260000 ps;
	INPUT_B <= '1';
	WAIT FOR 210000 ps;
	INPUT_B <= '0';
WAIT;
END PROCESS t_prcs_INPUT_B;
END OR_GATE_arch;
