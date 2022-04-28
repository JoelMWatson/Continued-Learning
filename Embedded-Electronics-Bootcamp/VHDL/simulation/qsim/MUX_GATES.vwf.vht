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
-- Generated on "12/19/2021 14:04:46"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          MUX_GATES
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY MUX_GATES_vhd_vec_tst IS
END MUX_GATES_vhd_vec_tst;
ARCHITECTURE MUX_GATES_arch OF MUX_GATES_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL INPUT_0 : STD_LOGIC;
SIGNAL INPUT_1 : STD_LOGIC;
SIGNAL MUX_OUT : STD_LOGIC;
SIGNAL SELECT_LINE : STD_LOGIC;
COMPONENT MUX_GATES
	PORT (
	INPUT_0 : IN STD_LOGIC;
	INPUT_1 : IN STD_LOGIC;
	MUX_OUT : OUT STD_LOGIC;
	SELECT_LINE : IN STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : MUX_GATES
	PORT MAP (
-- list connections between master ports and signals
	INPUT_0 => INPUT_0,
	INPUT_1 => INPUT_1,
	MUX_OUT => MUX_OUT,
	SELECT_LINE => SELECT_LINE
	);

-- INPUT_0
t_prcs_INPUT_0: PROCESS
BEGIN
	INPUT_0 <= '0';
	WAIT FOR 20000 ps;
	INPUT_0 <= '1';
	WAIT FOR 160000 ps;
	INPUT_0 <= '0';
WAIT;
END PROCESS t_prcs_INPUT_0;

-- INPUT_1
t_prcs_INPUT_1: PROCESS
BEGIN
	INPUT_1 <= '0';
	WAIT FOR 180000 ps;
	INPUT_1 <= '1';
	WAIT FOR 200000 ps;
	INPUT_1 <= '0';
WAIT;
END PROCESS t_prcs_INPUT_1;

-- SELECT_LINE
t_prcs_SELECT_LINE: PROCESS
BEGIN
	SELECT_LINE <= '0';
	WAIT FOR 180000 ps;
	SELECT_LINE <= '1';
	WAIT FOR 200000 ps;
	SELECT_LINE <= '0';
WAIT;
END PROCESS t_prcs_SELECT_LINE;
END MUX_GATES_arch;
