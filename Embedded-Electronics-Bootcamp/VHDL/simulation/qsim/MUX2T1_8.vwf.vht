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
-- Generated on "12/19/2021 19:14:41"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          MUX2T1_8
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY MUX2T1_8_vhd_vec_tst IS
END MUX2T1_8_vhd_vec_tst;
ARCHITECTURE MUX2T1_8_arch OF MUX2T1_8_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL D0 : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL D1 : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL DATA_OUT : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL SEL : STD_LOGIC;
COMPONENT MUX2T1_8
	PORT (
	D0 : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	D1 : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	DATA_OUT : BUFFER STD_LOGIC_VECTOR(7 DOWNTO 0);
	SEL : IN STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : MUX2T1_8
	PORT MAP (
-- list connections between master ports and signals
	D0 => D0,
	D1 => D1,
	DATA_OUT => DATA_OUT,
	SEL => SEL
	);
-- D0[7]
t_prcs_D0_7: PROCESS
BEGIN
	D0(7) <= '0';
WAIT;
END PROCESS t_prcs_D0_7;
-- D0[6]
t_prcs_D0_6: PROCESS
BEGIN
	D0(6) <= '0';
WAIT;
END PROCESS t_prcs_D0_6;
-- D0[5]
t_prcs_D0_5: PROCESS
BEGIN
	D0(5) <= '0';
WAIT;
END PROCESS t_prcs_D0_5;
-- D0[4]
t_prcs_D0_4: PROCESS
BEGIN
	D0(4) <= '1';
WAIT;
END PROCESS t_prcs_D0_4;
-- D0[3]
t_prcs_D0_3: PROCESS
BEGIN
	D0(3) <= '1';
WAIT;
END PROCESS t_prcs_D0_3;
-- D0[2]
t_prcs_D0_2: PROCESS
BEGIN
	D0(2) <= '0';
WAIT;
END PROCESS t_prcs_D0_2;
-- D0[1]
t_prcs_D0_1: PROCESS
BEGIN
	D0(1) <= '0';
WAIT;
END PROCESS t_prcs_D0_1;
-- D0[0]
t_prcs_D0_0: PROCESS
BEGIN
	D0(0) <= '1';
WAIT;
END PROCESS t_prcs_D0_0;
-- D1[7]
t_prcs_D1_7: PROCESS
BEGIN
	D1(7) <= '0';
WAIT;
END PROCESS t_prcs_D1_7;
-- D1[6]
t_prcs_D1_6: PROCESS
BEGIN
	D1(6) <= '1';
WAIT;
END PROCESS t_prcs_D1_6;
-- D1[5]
t_prcs_D1_5: PROCESS
BEGIN
	D1(5) <= '0';
WAIT;
END PROCESS t_prcs_D1_5;
-- D1[4]
t_prcs_D1_4: PROCESS
BEGIN
	D1(4) <= '1';
WAIT;
END PROCESS t_prcs_D1_4;
-- D1[3]
t_prcs_D1_3: PROCESS
BEGIN
	D1(3) <= '0';
WAIT;
END PROCESS t_prcs_D1_3;
-- D1[2]
t_prcs_D1_2: PROCESS
BEGIN
	D1(2) <= '1';
WAIT;
END PROCESS t_prcs_D1_2;
-- D1[1]
t_prcs_D1_1: PROCESS
BEGIN
	D1(1) <= '1';
WAIT;
END PROCESS t_prcs_D1_1;
-- D1[0]
t_prcs_D1_0: PROCESS
BEGIN
	D1(0) <= '1';
WAIT;
END PROCESS t_prcs_D1_0;

-- SEL
t_prcs_SEL: PROCESS
BEGIN
	SEL <= '1';
	WAIT FOR 500000 ps;
	SEL <= '0';
WAIT;
END PROCESS t_prcs_SEL;
END MUX2T1_8_arch;
