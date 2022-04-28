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

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 20.1.0 Build 711 06/05/2020 SJ Lite Edition"

-- DATE "12/24/2021 14:00:28"

-- 
-- Device: Altera 5CEBA4F17C6 Package FBGA256
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY ALTERA_LNSIM;
LIBRARY CYCLONEV;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE ALTERA_LNSIM.ALTERA_LNSIM_COMPONENTS.ALL;
USE CYCLONEV.CYCLONEV_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	DATA_FLOW IS
    PORT (
	CARRYOUT : OUT std_logic;
	ALU_OUT : OUT std_logic_vector(7 DOWNTO 0);
	CLOCK : IN std_logic;
	RESET : IN std_logic;
	ACC : IN std_logic;
	START : IN std_logic;
	RST_A : IN std_logic;
	A : IN std_logic_vector(7 DOWNTO 0);
	RST_C : IN std_logic;
	RST_B : IN std_logic;
	B : IN std_logic_vector(7 DOWNTO 0);
	OP : IN std_logic_vector(2 DOWNTO 0);
	REG_A_OUT : OUT std_logic_vector(7 DOWNTO 0);
	REG_B_OUT : OUT std_logic_vector(7 DOWNTO 0);
	REG_C_OUT : OUT std_logic_vector(7 DOWNTO 0);
	STATE_OUT : OUT std_logic_vector(2 DOWNTO 0)
	);
END DATA_FLOW;

-- Design Ports Information
-- CARRYOUT	=>  Location: PIN_P2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ALU_OUT[7]	=>  Location: PIN_D14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ALU_OUT[6]	=>  Location: PIN_L13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ALU_OUT[5]	=>  Location: PIN_E15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ALU_OUT[4]	=>  Location: PIN_M11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ALU_OUT[3]	=>  Location: PIN_T14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ALU_OUT[2]	=>  Location: PIN_D13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ALU_OUT[1]	=>  Location: PIN_M12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ALU_OUT[0]	=>  Location: PIN_N15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- REG_A_OUT[7]	=>  Location: PIN_P16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- REG_A_OUT[6]	=>  Location: PIN_L14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- REG_A_OUT[5]	=>  Location: PIN_B16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- REG_A_OUT[4]	=>  Location: PIN_E12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- REG_A_OUT[3]	=>  Location: PIN_N14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- REG_A_OUT[2]	=>  Location: PIN_M13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- REG_A_OUT[1]	=>  Location: PIN_J1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- REG_A_OUT[0]	=>  Location: PIN_L10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- REG_B_OUT[7]	=>  Location: PIN_H15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- REG_B_OUT[6]	=>  Location: PIN_F12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- REG_B_OUT[5]	=>  Location: PIN_H13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- REG_B_OUT[4]	=>  Location: PIN_E16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- REG_B_OUT[3]	=>  Location: PIN_K15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- REG_B_OUT[2]	=>  Location: PIN_G15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- REG_B_OUT[1]	=>  Location: PIN_K16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- REG_B_OUT[0]	=>  Location: PIN_J14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- REG_C_OUT[7]	=>  Location: PIN_P14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- REG_C_OUT[6]	=>  Location: PIN_F15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- REG_C_OUT[5]	=>  Location: PIN_J3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- REG_C_OUT[4]	=>  Location: PIN_C16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- REG_C_OUT[3]	=>  Location: PIN_J16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- REG_C_OUT[2]	=>  Location: PIN_J12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- REG_C_OUT[1]	=>  Location: PIN_N11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- REG_C_OUT[0]	=>  Location: PIN_H16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- STATE_OUT[2]	=>  Location: PIN_E9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- STATE_OUT[1]	=>  Location: PIN_T10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- STATE_OUT[0]	=>  Location: PIN_R12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- OP[2]	=>  Location: PIN_K12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- OP[1]	=>  Location: PIN_D16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- OP[0]	=>  Location: PIN_B15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- B[7]	=>  Location: PIN_R15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RST_B	=>  Location: PIN_E2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RST_C	=>  Location: PIN_G16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- A[7]	=>  Location: PIN_C11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RST_A	=>  Location: PIN_N16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- B[1]	=>  Location: PIN_M10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- B[6]	=>  Location: PIN_C15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- B[5]	=>  Location: PIN_L15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- B[4]	=>  Location: PIN_G13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- B[3]	=>  Location: PIN_T15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- B[2]	=>  Location: PIN_G2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- A[6]	=>  Location: PIN_P11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- A[5]	=>  Location: PIN_R9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- A[4]	=>  Location: PIN_P9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- A[3]	=>  Location: PIN_L9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- A[2]	=>  Location: PIN_T12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- A[1]	=>  Location: PIN_P13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- B[0]	=>  Location: PIN_T13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- A[0]	=>  Location: PIN_F14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- CLOCK	=>  Location: PIN_G12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RESET	=>  Location: PIN_R10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ACC	=>  Location: PIN_R14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- START	=>  Location: PIN_T8,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF DATA_FLOW IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_CARRYOUT : std_logic;
SIGNAL ww_ALU_OUT : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_CLOCK : std_logic;
SIGNAL ww_RESET : std_logic;
SIGNAL ww_ACC : std_logic;
SIGNAL ww_START : std_logic;
SIGNAL ww_RST_A : std_logic;
SIGNAL ww_A : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_RST_C : std_logic;
SIGNAL ww_RST_B : std_logic;
SIGNAL ww_B : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_OP : std_logic_vector(2 DOWNTO 0);
SIGNAL ww_REG_A_OUT : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_REG_B_OUT : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_REG_C_OUT : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_STATE_OUT : std_logic_vector(2 DOWNTO 0);
SIGNAL \inst|Mult0~8_ACLR_bus\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \inst|Mult0~8_CLK_bus\ : std_logic_vector(2 DOWNTO 0);
SIGNAL \inst|Mult0~8_ENA_bus\ : std_logic_vector(2 DOWNTO 0);
SIGNAL \inst|Mult0~8_AX_bus\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \inst|Mult0~8_AY_bus\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \inst|Mult0~8_RESULTA_bus\ : std_logic_vector(63 DOWNTO 0);
SIGNAL \inst|Mult0~16\ : std_logic;
SIGNAL \inst|Mult0~17\ : std_logic;
SIGNAL \inst|Mult0~18\ : std_logic;
SIGNAL \inst|Mult0~19\ : std_logic;
SIGNAL \inst|Mult0~20\ : std_logic;
SIGNAL \inst|Mult0~21\ : std_logic;
SIGNAL \inst|Mult0~22\ : std_logic;
SIGNAL \inst|Mult0~23\ : std_logic;
SIGNAL \inst|Mult0~24\ : std_logic;
SIGNAL \inst|Mult0~25\ : std_logic;
SIGNAL \inst|Mult0~26\ : std_logic;
SIGNAL \inst|Mult0~27\ : std_logic;
SIGNAL \inst|Mult0~28\ : std_logic;
SIGNAL \inst|Mult0~29\ : std_logic;
SIGNAL \inst|Mult0~30\ : std_logic;
SIGNAL \inst|Mult0~31\ : std_logic;
SIGNAL \inst|Mult0~32\ : std_logic;
SIGNAL \inst|Mult0~33\ : std_logic;
SIGNAL \inst|Mult0~34\ : std_logic;
SIGNAL \inst|Mult0~35\ : std_logic;
SIGNAL \inst|Mult0~36\ : std_logic;
SIGNAL \inst|Mult0~37\ : std_logic;
SIGNAL \inst|Mult0~38\ : std_logic;
SIGNAL \inst|Mult0~39\ : std_logic;
SIGNAL \inst|Mult0~40\ : std_logic;
SIGNAL \inst|Mult0~41\ : std_logic;
SIGNAL \inst|Mult0~42\ : std_logic;
SIGNAL \inst|Mult0~43\ : std_logic;
SIGNAL \inst|Mult0~44\ : std_logic;
SIGNAL \inst|Mult0~45\ : std_logic;
SIGNAL \inst|Mult0~46\ : std_logic;
SIGNAL \inst|Mult0~47\ : std_logic;
SIGNAL \inst|Mult0~48\ : std_logic;
SIGNAL \inst|Mult0~49\ : std_logic;
SIGNAL \inst|Mult0~50\ : std_logic;
SIGNAL \inst|Mult0~51\ : std_logic;
SIGNAL \inst|Mult0~52\ : std_logic;
SIGNAL \inst|Mult0~53\ : std_logic;
SIGNAL \inst|Mult0~54\ : std_logic;
SIGNAL \inst|Mult0~55\ : std_logic;
SIGNAL \inst|Mult0~56\ : std_logic;
SIGNAL \inst|Mult0~57\ : std_logic;
SIGNAL \inst|Mult0~58\ : std_logic;
SIGNAL \inst|Mult0~59\ : std_logic;
SIGNAL \inst|Mult0~60\ : std_logic;
SIGNAL \inst|Mult0~61\ : std_logic;
SIGNAL \inst|Mult0~62\ : std_logic;
SIGNAL \inst|Mult0~63\ : std_logic;
SIGNAL \inst|Mult0~64\ : std_logic;
SIGNAL \inst|Mult0~65\ : std_logic;
SIGNAL \inst|Mult0~66\ : std_logic;
SIGNAL \inst|Mult0~67\ : std_logic;
SIGNAL \inst|Mult0~68\ : std_logic;
SIGNAL \inst|Mult0~69\ : std_logic;
SIGNAL \inst|Mult0~70\ : std_logic;
SIGNAL \inst|Mult0~71\ : std_logic;
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \CLOCK~input_o\ : std_logic;
SIGNAL \START~input_o\ : std_logic;
SIGNAL \ACC~input_o\ : std_logic;
SIGNAL \CLOCK~inputCLKENA0_outclk\ : std_logic;
SIGNAL \inst14|NXT_STATE.ACCUM~0_combout\ : std_logic;
SIGNAL \RESET~input_o\ : std_logic;
SIGNAL \inst14|CUR_STATE.ACCUM~q\ : std_logic;
SIGNAL \inst14|NXT_STATE.PROC~combout\ : std_logic;
SIGNAL \inst14|CUR_STATE.PROC~q\ : std_logic;
SIGNAL \inst14|CUR_STATE.WR_RES~q\ : std_logic;
SIGNAL \inst14|Selector4~0_combout\ : std_logic;
SIGNAL \inst14|CUR_STATE.INIT~q\ : std_logic;
SIGNAL \inst14|NXT_STATE.FETCH~0_combout\ : std_logic;
SIGNAL \inst14|CUR_STATE.FETCH~q\ : std_logic;
SIGNAL \A[7]~input_o\ : std_logic;
SIGNAL \RST_A~input_o\ : std_logic;
SIGNAL \inst14|SEL~combout\ : std_logic;
SIGNAL \inst14|WRC~1_combout\ : std_logic;
SIGNAL \inst14|WRC~combout\ : std_logic;
SIGNAL \RST_C~input_o\ : std_logic;
SIGNAL \inst2|DATA_OUT[7]~0_combout\ : std_logic;
SIGNAL \B[7]~input_o\ : std_logic;
SIGNAL \RST_B~input_o\ : std_logic;
SIGNAL \inst3|Q[7]~_Duplicate_1_q\ : std_logic;
SIGNAL \inst|ALU_RESULT~0_combout\ : std_logic;
SIGNAL \OP[0]~input_o\ : std_logic;
SIGNAL \OP[2]~input_o\ : std_logic;
SIGNAL \B[6]~input_o\ : std_logic;
SIGNAL \inst3|Q[6]~_Duplicate_1_q\ : std_logic;
SIGNAL \A[6]~input_o\ : std_logic;
SIGNAL \OP[1]~input_o\ : std_logic;
SIGNAL \B[4]~input_o\ : std_logic;
SIGNAL \inst3|Q[4]~_Duplicate_1_q\ : std_logic;
SIGNAL \B[5]~input_o\ : std_logic;
SIGNAL \inst3|Q[5]~_Duplicate_1_q\ : std_logic;
SIGNAL \B[3]~input_o\ : std_logic;
SIGNAL \inst3|Q[3]~_Duplicate_1_q\ : std_logic;
SIGNAL \A[5]~input_o\ : std_logic;
SIGNAL \inst2|DATA_OUT[5]~2_combout\ : std_logic;
SIGNAL \inst|ALU_RESULT~2_combout\ : std_logic;
SIGNAL \inst2|DATA_OUT[6]~1_combout\ : std_logic;
SIGNAL \A[4]~input_o\ : std_logic;
SIGNAL \inst|ALU_RESULT~3_combout\ : std_logic;
SIGNAL \A[3]~input_o\ : std_logic;
SIGNAL \B[2]~input_o\ : std_logic;
SIGNAL \inst3|Q[2]~_Duplicate_1_q\ : std_logic;
SIGNAL \A[2]~input_o\ : std_logic;
SIGNAL \inst4|Q[2]~feeder_combout\ : std_logic;
SIGNAL \inst2|DATA_OUT[2]~5_combout\ : std_logic;
SIGNAL \inst|ALU_RESULT~5_combout\ : std_logic;
SIGNAL \B[1]~input_o\ : std_logic;
SIGNAL \inst3|Q[1]~_Duplicate_1_q\ : std_logic;
SIGNAL \A[1]~input_o\ : std_logic;
SIGNAL \A[0]~input_o\ : std_logic;
SIGNAL \B[0]~input_o\ : std_logic;
SIGNAL \inst3|Q[0]~_Duplicate_1_q\ : std_logic;
SIGNAL \inst|Add0~34_cout\ : std_logic;
SIGNAL \inst|Add0~30\ : std_logic;
SIGNAL \inst|Add0~25_sumout\ : std_logic;
SIGNAL \inst|Mux6~1_combout\ : std_logic;
SIGNAL \inst2|DATA_OUT[3]~4_combout\ : std_logic;
SIGNAL \inst|Mult0~9\ : std_logic;
SIGNAL \inst|Div0|auto_generated|divider|divider|add_sub_0_result_int[0]~5_sumout\ : std_logic;
SIGNAL \inst|Div0|auto_generated|divider|divider|add_sub_0_result_int[0]~6\ : std_logic;
SIGNAL \inst|Div0|auto_generated|divider|divider|add_sub_0_result_int[0]~7\ : std_logic;
SIGNAL \inst|Div0|auto_generated|divider|divider|add_sub_0_result_int[1]~1_sumout\ : std_logic;
SIGNAL \inst|Div0|auto_generated|divider|divider|add_sub_1_result_int[0]~10\ : std_logic;
SIGNAL \inst|Div0|auto_generated|divider|divider|add_sub_1_result_int[0]~11\ : std_logic;
SIGNAL \inst|Div0|auto_generated|divider|divider|add_sub_1_result_int[1]~5_sumout\ : std_logic;
SIGNAL \inst|Div0|auto_generated|divider|divider|add_sub_1_result_int[1]~6\ : std_logic;
SIGNAL \inst|Div0|auto_generated|divider|divider|add_sub_1_result_int[1]~7\ : std_logic;
SIGNAL \inst|Div0|auto_generated|divider|divider|add_sub_1_result_int[2]~1_sumout\ : std_logic;
SIGNAL \inst|Div0|auto_generated|divider|divider|StageOut[9]~1_combout\ : std_logic;
SIGNAL \inst|Div0|auto_generated|divider|divider|StageOut[0]~0_combout\ : std_logic;
SIGNAL \inst|Div0|auto_generated|divider|divider|add_sub_1_result_int[0]~9_sumout\ : std_logic;
SIGNAL \inst|Div0|auto_generated|divider|divider|op_3~18_cout\ : std_logic;
SIGNAL \inst|Div0|auto_generated|divider|divider|op_3~14\ : std_logic;
SIGNAL \inst|Div0|auto_generated|divider|divider|op_3~10\ : std_logic;
SIGNAL \inst|Div0|auto_generated|divider|divider|op_3~5_sumout\ : std_logic;
SIGNAL \inst|Div0|auto_generated|divider|divider|op_3~6\ : std_logic;
SIGNAL \inst|Div0|auto_generated|divider|divider|op_3~1_sumout\ : std_logic;
SIGNAL \inst|Div0|auto_generated|divider|divider|StageOut[9]~2_combout\ : std_logic;
SIGNAL \inst|Div0|auto_generated|divider|divider|op_3~9_sumout\ : std_logic;
SIGNAL \inst|Div0|auto_generated|divider|divider|StageOut[8]~9_combout\ : std_logic;
SIGNAL \inst|Div0|auto_generated|divider|divider|op_3~13_sumout\ : std_logic;
SIGNAL \inst|Div0|auto_generated|divider|divider|op_4~22_cout\ : std_logic;
SIGNAL \inst|Div0|auto_generated|divider|divider|op_4~18\ : std_logic;
SIGNAL \inst|Div0|auto_generated|divider|divider|op_4~14\ : std_logic;
SIGNAL \inst|Div0|auto_generated|divider|divider|op_4~10\ : std_logic;
SIGNAL \inst|Div0|auto_generated|divider|divider|op_4~6\ : std_logic;
SIGNAL \inst|Div0|auto_generated|divider|divider|op_4~1_sumout\ : std_logic;
SIGNAL \inst|Div0|auto_generated|divider|divider|StageOut[18]~3_combout\ : std_logic;
SIGNAL \inst|Div0|auto_generated|divider|divider|op_4~5_sumout\ : std_logic;
SIGNAL \inst|Div0|auto_generated|divider|divider|StageOut[17]~10_combout\ : std_logic;
SIGNAL \inst|Div0|auto_generated|divider|divider|op_4~9_sumout\ : std_logic;
SIGNAL \inst|Div0|auto_generated|divider|divider|op_4~13_sumout\ : std_logic;
SIGNAL \inst|Div0|auto_generated|divider|divider|StageOut[16]~14_combout\ : std_logic;
SIGNAL \inst|Div0|auto_generated|divider|divider|op_4~17_sumout\ : std_logic;
SIGNAL \inst|Div0|auto_generated|divider|divider|op_5~26_cout\ : std_logic;
SIGNAL \inst|Div0|auto_generated|divider|divider|op_5~22\ : std_logic;
SIGNAL \inst|Div0|auto_generated|divider|divider|op_5~18\ : std_logic;
SIGNAL \inst|Div0|auto_generated|divider|divider|op_5~14\ : std_logic;
SIGNAL \inst|Div0|auto_generated|divider|divider|op_5~10\ : std_logic;
SIGNAL \inst|Div0|auto_generated|divider|divider|op_5~5_sumout\ : std_logic;
SIGNAL \inst|Div0|auto_generated|divider|divider|StageOut[27]~4_combout\ : std_logic;
SIGNAL \inst|Div0|auto_generated|divider|divider|op_5~6\ : std_logic;
SIGNAL \inst|Div0|auto_generated|divider|divider|op_5~1_sumout\ : std_logic;
SIGNAL \inst|Div0|auto_generated|divider|divider|StageOut[27]~5_combout\ : std_logic;
SIGNAL \inst|Div0|auto_generated|divider|divider|StageOut[26]~11_combout\ : std_logic;
SIGNAL \inst|Div0|auto_generated|divider|divider|op_5~9_sumout\ : std_logic;
SIGNAL \inst|Div0|auto_generated|divider|divider|StageOut[25]~15_combout\ : std_logic;
SIGNAL \inst|Div0|auto_generated|divider|divider|op_5~13_sumout\ : std_logic;
SIGNAL \inst|Div0|auto_generated|divider|divider|op_5~17_sumout\ : std_logic;
SIGNAL \inst|Div0|auto_generated|divider|divider|StageOut[24]~18_combout\ : std_logic;
SIGNAL \inst|Div0|auto_generated|divider|divider|op_5~21_sumout\ : std_logic;
SIGNAL \inst|Div0|auto_generated|divider|divider|op_6~30_cout\ : std_logic;
SIGNAL \inst|Div0|auto_generated|divider|divider|op_6~26\ : std_logic;
SIGNAL \inst|Div0|auto_generated|divider|divider|op_6~22\ : std_logic;
SIGNAL \inst|Div0|auto_generated|divider|divider|op_6~18\ : std_logic;
SIGNAL \inst|Div0|auto_generated|divider|divider|op_6~14\ : std_logic;
SIGNAL \inst|Div0|auto_generated|divider|divider|op_6~10\ : std_logic;
SIGNAL \inst|Div0|auto_generated|divider|divider|op_6~6\ : std_logic;
SIGNAL \inst|Div0|auto_generated|divider|divider|op_6~1_sumout\ : std_logic;
SIGNAL \inst|Div0|auto_generated|divider|divider|StageOut[36]~6_combout\ : std_logic;
SIGNAL \inst|Div0|auto_generated|divider|divider|op_6~5_sumout\ : std_logic;
SIGNAL \inst|Div0|auto_generated|divider|divider|StageOut[35]~12_combout\ : std_logic;
SIGNAL \inst|Div0|auto_generated|divider|divider|op_6~9_sumout\ : std_logic;
SIGNAL \inst|Div0|auto_generated|divider|divider|StageOut[34]~16_combout\ : std_logic;
SIGNAL \inst|Div0|auto_generated|divider|divider|op_6~13_sumout\ : std_logic;
SIGNAL \inst|Div0|auto_generated|divider|divider|StageOut[33]~19_combout\ : std_logic;
SIGNAL \inst|Div0|auto_generated|divider|divider|op_6~17_sumout\ : std_logic;
SIGNAL \inst|Div0|auto_generated|divider|divider|op_6~21_sumout\ : std_logic;
SIGNAL \inst|Div0|auto_generated|divider|divider|StageOut[32]~21_combout\ : std_logic;
SIGNAL \inst|Div0|auto_generated|divider|divider|op_6~25_sumout\ : std_logic;
SIGNAL \inst|Div0|auto_generated|divider|divider|op_7~34_cout\ : std_logic;
SIGNAL \inst|Div0|auto_generated|divider|divider|op_7~30\ : std_logic;
SIGNAL \inst|Div0|auto_generated|divider|divider|op_7~26\ : std_logic;
SIGNAL \inst|Div0|auto_generated|divider|divider|op_7~22\ : std_logic;
SIGNAL \inst|Div0|auto_generated|divider|divider|op_7~18\ : std_logic;
SIGNAL \inst|Div0|auto_generated|divider|divider|op_7~14\ : std_logic;
SIGNAL \inst|Div0|auto_generated|divider|divider|op_7~10\ : std_logic;
SIGNAL \inst|Div0|auto_generated|divider|divider|op_7~6\ : std_logic;
SIGNAL \inst|Div0|auto_generated|divider|divider|op_7~1_sumout\ : std_logic;
SIGNAL \inst|Mux6~0_combout\ : std_logic;
SIGNAL \inst2|DATA_OUT[1]~6_combout\ : std_logic;
SIGNAL \inst|Mult0~10\ : std_logic;
SIGNAL \inst|Mux5~0_combout\ : std_logic;
SIGNAL \inst|Add0~26\ : std_logic;
SIGNAL \inst|Add0~21_sumout\ : std_logic;
SIGNAL \inst|Mux5~1_combout\ : std_logic;
SIGNAL \inst|Add0~22\ : std_logic;
SIGNAL \inst|Add0~17_sumout\ : std_logic;
SIGNAL \inst|ALU_RESULT~4_combout\ : std_logic;
SIGNAL \inst|Mult0~11\ : std_logic;
SIGNAL \inst|Mux4~0_combout\ : std_logic;
SIGNAL \inst|Mux4~1_combout\ : std_logic;
SIGNAL \inst|Add0~18\ : std_logic;
SIGNAL \inst|Add0~13_sumout\ : std_logic;
SIGNAL \inst|Mult0~12\ : std_logic;
SIGNAL \inst|Mux3~0_combout\ : std_logic;
SIGNAL \inst|Mux3~1_combout\ : std_logic;
SIGNAL \inst2|DATA_OUT[4]~3_combout\ : std_logic;
SIGNAL \inst|LessThan0~0_combout\ : std_logic;
SIGNAL \inst|LessThan0~1_combout\ : std_logic;
SIGNAL \inst|LessThan0~2_combout\ : std_logic;
SIGNAL \inst|Mux7~1_combout\ : std_logic;
SIGNAL \inst|ALU_RESULT~7_combout\ : std_logic;
SIGNAL \inst|ALU_RESULT~6_combout\ : std_logic;
SIGNAL \inst|Mux7~2_combout\ : std_logic;
SIGNAL \inst|ALU_RESULT~1_combout\ : std_logic;
SIGNAL \inst|Mux7~3_combout\ : std_logic;
SIGNAL \inst|Mux7~0_combout\ : std_logic;
SIGNAL \inst|Mux7~4_combout\ : std_logic;
SIGNAL \inst|Div0|auto_generated|divider|divider|op_7~5_sumout\ : std_logic;
SIGNAL \inst|Div0|auto_generated|divider|divider|StageOut[45]~7_combout\ : std_logic;
SIGNAL \inst|Div0|auto_generated|divider|divider|StageOut[45]~8_combout\ : std_logic;
SIGNAL \inst|Div0|auto_generated|divider|divider|StageOut[44]~13_combout\ : std_logic;
SIGNAL \inst|Div0|auto_generated|divider|divider|op_7~9_sumout\ : std_logic;
SIGNAL \inst|Div0|auto_generated|divider|divider|StageOut[43]~17_combout\ : std_logic;
SIGNAL \inst|Div0|auto_generated|divider|divider|op_7~13_sumout\ : std_logic;
SIGNAL \inst|Div0|auto_generated|divider|divider|StageOut[42]~20_combout\ : std_logic;
SIGNAL \inst|Div0|auto_generated|divider|divider|op_7~17_sumout\ : std_logic;
SIGNAL \inst|Div0|auto_generated|divider|divider|StageOut[41]~22_combout\ : std_logic;
SIGNAL \inst|Div0|auto_generated|divider|divider|op_7~21_sumout\ : std_logic;
SIGNAL \inst|Div0|auto_generated|divider|divider|op_7~25_sumout\ : std_logic;
SIGNAL \inst|Div0|auto_generated|divider|divider|StageOut[40]~23_combout\ : std_logic;
SIGNAL \inst|Div0|auto_generated|divider|divider|op_7~29_sumout\ : std_logic;
SIGNAL \inst|Div0|auto_generated|divider|divider|op_8~38_cout\ : std_logic;
SIGNAL \inst|Div0|auto_generated|divider|divider|op_8~34_cout\ : std_logic;
SIGNAL \inst|Div0|auto_generated|divider|divider|op_8~30_cout\ : std_logic;
SIGNAL \inst|Div0|auto_generated|divider|divider|op_8~26_cout\ : std_logic;
SIGNAL \inst|Div0|auto_generated|divider|divider|op_8~22_cout\ : std_logic;
SIGNAL \inst|Div0|auto_generated|divider|divider|op_8~18_cout\ : std_logic;
SIGNAL \inst|Div0|auto_generated|divider|divider|op_8~14_cout\ : std_logic;
SIGNAL \inst|Div0|auto_generated|divider|divider|op_8~10_cout\ : std_logic;
SIGNAL \inst|Div0|auto_generated|divider|divider|op_8~6_cout\ : std_logic;
SIGNAL \inst|Div0|auto_generated|divider|divider|op_8~1_sumout\ : std_logic;
SIGNAL \inst|Add0~29_sumout\ : std_logic;
SIGNAL \inst|Mult0~8_resulta\ : std_logic;
SIGNAL \inst|Mux7~5_combout\ : std_logic;
SIGNAL \inst2|DATA_OUT[0]~7_combout\ : std_logic;
SIGNAL \inst|Mult0~13\ : std_logic;
SIGNAL \inst|Mux2~0_combout\ : std_logic;
SIGNAL \inst|Add0~14\ : std_logic;
SIGNAL \inst|Add0~9_sumout\ : std_logic;
SIGNAL \inst|Mux2~1_combout\ : std_logic;
SIGNAL \inst|Add0~10\ : std_logic;
SIGNAL \inst|Add0~5_sumout\ : std_logic;
SIGNAL \inst|Mult0~14\ : std_logic;
SIGNAL \inst|Mux1~0_combout\ : std_logic;
SIGNAL \inst|Mux1~1_combout\ : std_logic;
SIGNAL \inst|Add0~6\ : std_logic;
SIGNAL \inst|Add0~1_sumout\ : std_logic;
SIGNAL \inst|Mult0~15\ : std_logic;
SIGNAL \inst|Mux0~0_combout\ : std_logic;
SIGNAL \inst|Mux0~1_combout\ : std_logic;
SIGNAL \inst5|Q\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \inst|Div0|auto_generated|divider|divider|selnose\ : std_logic_vector(71 DOWNTO 0);
SIGNAL \inst4|Q\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \inst|Div0|auto_generated|divider|divider|sel\ : std_logic_vector(71 DOWNTO 0);
SIGNAL \inst14|STATE_OUT\ : std_logic_vector(2 DOWNTO 0);
SIGNAL \inst|ALT_INV_Mult0~11\ : std_logic;
SIGNAL \inst|ALT_INV_Mult0~10\ : std_logic;
SIGNAL \inst|ALT_INV_Mult0~9\ : std_logic;
SIGNAL \inst|ALT_INV_Mult0~8_resulta\ : std_logic;
SIGNAL \inst|Div0|auto_generated|divider|divider|ALT_INV_add_sub_0_result_int[1]~1_sumout\ : std_logic;
SIGNAL \inst|ALT_INV_Add0~1_sumout\ : std_logic;
SIGNAL \inst|Div0|auto_generated|divider|divider|ALT_INV_op_4~17_sumout\ : std_logic;
SIGNAL \inst|Div0|auto_generated|divider|divider|ALT_INV_op_7~13_sumout\ : std_logic;
SIGNAL \inst|Div0|auto_generated|divider|divider|ALT_INV_op_6~13_sumout\ : std_logic;
SIGNAL \inst|Div0|auto_generated|divider|divider|ALT_INV_op_5~13_sumout\ : std_logic;
SIGNAL \inst|Div0|auto_generated|divider|divider|ALT_INV_op_4~13_sumout\ : std_logic;
SIGNAL \inst|Div0|auto_generated|divider|divider|ALT_INV_op_3~13_sumout\ : std_logic;
SIGNAL \inst|Div0|auto_generated|divider|divider|ALT_INV_op_7~9_sumout\ : std_logic;
SIGNAL \inst|Div0|auto_generated|divider|divider|ALT_INV_op_6~9_sumout\ : std_logic;
SIGNAL \inst|Div0|auto_generated|divider|divider|ALT_INV_op_5~9_sumout\ : std_logic;
SIGNAL \inst|Div0|auto_generated|divider|divider|ALT_INV_op_4~9_sumout\ : std_logic;
SIGNAL \inst|Div0|auto_generated|divider|divider|ALT_INV_op_3~9_sumout\ : std_logic;
SIGNAL \inst|Div0|auto_generated|divider|divider|ALT_INV_add_sub_1_result_int[0]~9_sumout\ : std_logic;
SIGNAL \inst|Div0|auto_generated|divider|divider|ALT_INV_op_7~5_sumout\ : std_logic;
SIGNAL \inst|Div0|auto_generated|divider|divider|ALT_INV_op_6~5_sumout\ : std_logic;
SIGNAL \inst|Div0|auto_generated|divider|divider|ALT_INV_op_5~5_sumout\ : std_logic;
SIGNAL \inst|Div0|auto_generated|divider|divider|ALT_INV_op_4~5_sumout\ : std_logic;
SIGNAL \inst|Div0|auto_generated|divider|divider|ALT_INV_op_3~5_sumout\ : std_logic;
SIGNAL \inst|Div0|auto_generated|divider|divider|ALT_INV_add_sub_1_result_int[1]~5_sumout\ : std_logic;
SIGNAL \inst|Div0|auto_generated|divider|divider|ALT_INV_add_sub_0_result_int[0]~5_sumout\ : std_logic;
SIGNAL \inst|ALT_INV_Add0~29_sumout\ : std_logic;
SIGNAL \inst|Div0|auto_generated|divider|divider|ALT_INV_op_8~1_sumout\ : std_logic;
SIGNAL \inst|Div0|auto_generated|divider|divider|ALT_INV_op_7~1_sumout\ : std_logic;
SIGNAL \inst|ALT_INV_Add0~25_sumout\ : std_logic;
SIGNAL \inst|Div0|auto_generated|divider|divider|ALT_INV_op_6~1_sumout\ : std_logic;
SIGNAL \inst|ALT_INV_Add0~21_sumout\ : std_logic;
SIGNAL \inst|Div0|auto_generated|divider|divider|ALT_INV_op_5~1_sumout\ : std_logic;
SIGNAL \inst|ALT_INV_Add0~17_sumout\ : std_logic;
SIGNAL \inst|Div0|auto_generated|divider|divider|ALT_INV_op_4~1_sumout\ : std_logic;
SIGNAL \inst|ALT_INV_Add0~13_sumout\ : std_logic;
SIGNAL \inst|Div0|auto_generated|divider|divider|ALT_INV_op_3~1_sumout\ : std_logic;
SIGNAL \inst|ALT_INV_Add0~9_sumout\ : std_logic;
SIGNAL \inst|Div0|auto_generated|divider|divider|ALT_INV_add_sub_1_result_int[2]~1_sumout\ : std_logic;
SIGNAL \inst|ALT_INV_Add0~5_sumout\ : std_logic;
SIGNAL \inst|ALT_INV_Mult0~15\ : std_logic;
SIGNAL \inst|ALT_INV_Mult0~14\ : std_logic;
SIGNAL \inst|ALT_INV_Mult0~13\ : std_logic;
SIGNAL \inst|ALT_INV_Mult0~12\ : std_logic;
SIGNAL \inst|Div0|auto_generated|divider|divider|ALT_INV_StageOut[17]~10_combout\ : std_logic;
SIGNAL \inst|Div0|auto_generated|divider|divider|ALT_INV_StageOut[8]~9_combout\ : std_logic;
SIGNAL \inst|Div0|auto_generated|divider|divider|ALT_INV_StageOut[45]~8_combout\ : std_logic;
SIGNAL \inst|Div0|auto_generated|divider|divider|ALT_INV_StageOut[45]~7_combout\ : std_logic;
SIGNAL \inst|Div0|auto_generated|divider|divider|ALT_INV_selnose\ : std_logic_vector(54 DOWNTO 0);
SIGNAL \inst|Div0|auto_generated|divider|divider|ALT_INV_StageOut[36]~6_combout\ : std_logic;
SIGNAL \inst|Div0|auto_generated|divider|divider|ALT_INV_StageOut[27]~5_combout\ : std_logic;
SIGNAL \inst|Div0|auto_generated|divider|divider|ALT_INV_StageOut[27]~4_combout\ : std_logic;
SIGNAL \inst|Div0|auto_generated|divider|divider|ALT_INV_StageOut[18]~3_combout\ : std_logic;
SIGNAL \inst|Div0|auto_generated|divider|divider|ALT_INV_StageOut[9]~2_combout\ : std_logic;
SIGNAL \inst|Div0|auto_generated|divider|divider|ALT_INV_StageOut[9]~1_combout\ : std_logic;
SIGNAL \inst|Div0|auto_generated|divider|divider|ALT_INV_StageOut[0]~0_combout\ : std_logic;
SIGNAL \inst14|ALT_INV_WRC~1_combout\ : std_logic;
SIGNAL \inst14|ALT_INV_CUR_STATE.INIT~q\ : std_logic;
SIGNAL \inst14|ALT_INV_CUR_STATE.FETCH~q\ : std_logic;
SIGNAL \inst14|ALT_INV_CUR_STATE.ACCUM~q\ : std_logic;
SIGNAL \inst14|ALT_INV_CUR_STATE.PROC~q\ : std_logic;
SIGNAL \inst14|ALT_INV_CUR_STATE.WR_RES~q\ : std_logic;
SIGNAL \inst|ALT_INV_Mux7~4_combout\ : std_logic;
SIGNAL \inst|ALT_INV_Mux7~3_combout\ : std_logic;
SIGNAL \inst|ALT_INV_Mux7~2_combout\ : std_logic;
SIGNAL \inst|ALT_INV_ALU_RESULT~7_combout\ : std_logic;
SIGNAL \inst|ALT_INV_ALU_RESULT~6_combout\ : std_logic;
SIGNAL \inst|ALT_INV_Mux7~1_combout\ : std_logic;
SIGNAL \inst|ALT_INV_LessThan0~2_combout\ : std_logic;
SIGNAL \inst|ALT_INV_LessThan0~1_combout\ : std_logic;
SIGNAL \inst|ALT_INV_LessThan0~0_combout\ : std_logic;
SIGNAL \inst2|ALT_INV_DATA_OUT[0]~7_combout\ : std_logic;
SIGNAL \inst|ALT_INV_Mux7~0_combout\ : std_logic;
SIGNAL \inst4|ALT_INV_Q\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \inst3|ALT_INV_Q[0]~_Duplicate_1_q\ : std_logic;
SIGNAL \inst5|ALT_INV_Q\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \inst2|ALT_INV_DATA_OUT[1]~6_combout\ : std_logic;
SIGNAL \inst|ALT_INV_Mux5~0_combout\ : std_logic;
SIGNAL \inst|ALT_INV_ALU_RESULT~5_combout\ : std_logic;
SIGNAL \inst2|ALT_INV_DATA_OUT[2]~5_combout\ : std_logic;
SIGNAL \inst|ALT_INV_Mux4~0_combout\ : std_logic;
SIGNAL \inst|ALT_INV_ALU_RESULT~4_combout\ : std_logic;
SIGNAL \inst2|ALT_INV_DATA_OUT[3]~4_combout\ : std_logic;
SIGNAL \inst|ALT_INV_Mux3~0_combout\ : std_logic;
SIGNAL \inst|Div0|auto_generated|divider|divider|ALT_INV_sel\ : std_logic_vector(5 DOWNTO 1);
SIGNAL \inst|ALT_INV_ALU_RESULT~3_combout\ : std_logic;
SIGNAL \inst2|ALT_INV_DATA_OUT[4]~3_combout\ : std_logic;
SIGNAL \inst|ALT_INV_Mux2~0_combout\ : std_logic;
SIGNAL \inst|ALT_INV_ALU_RESULT~2_combout\ : std_logic;
SIGNAL \inst2|ALT_INV_DATA_OUT[5]~2_combout\ : std_logic;
SIGNAL \inst|ALT_INV_Mux1~0_combout\ : std_logic;
SIGNAL \inst|ALT_INV_ALU_RESULT~1_combout\ : std_logic;
SIGNAL \inst2|ALT_INV_DATA_OUT[6]~1_combout\ : std_logic;
SIGNAL \inst|ALT_INV_Mux0~0_combout\ : std_logic;
SIGNAL \inst3|ALT_INV_Q[2]~_Duplicate_1_q\ : std_logic;
SIGNAL \inst3|ALT_INV_Q[3]~_Duplicate_1_q\ : std_logic;
SIGNAL \inst3|ALT_INV_Q[4]~_Duplicate_1_q\ : std_logic;
SIGNAL \inst3|ALT_INV_Q[5]~_Duplicate_1_q\ : std_logic;
SIGNAL \inst3|ALT_INV_Q[6]~_Duplicate_1_q\ : std_logic;
SIGNAL \inst3|ALT_INV_Q[1]~_Duplicate_1_q\ : std_logic;
SIGNAL \inst|ALT_INV_ALU_RESULT~0_combout\ : std_logic;
SIGNAL \inst2|ALT_INV_DATA_OUT[7]~0_combout\ : std_logic;
SIGNAL \inst3|ALT_INV_Q[7]~_Duplicate_1_q\ : std_logic;
SIGNAL \inst|Div0|auto_generated|divider|divider|ALT_INV_op_7~29_sumout\ : std_logic;
SIGNAL \inst|Div0|auto_generated|divider|divider|ALT_INV_op_7~25_sumout\ : std_logic;
SIGNAL \inst|Div0|auto_generated|divider|divider|ALT_INV_op_6~25_sumout\ : std_logic;
SIGNAL \inst|Div0|auto_generated|divider|divider|ALT_INV_op_7~21_sumout\ : std_logic;
SIGNAL \inst|Div0|auto_generated|divider|divider|ALT_INV_op_6~21_sumout\ : std_logic;
SIGNAL \inst|Div0|auto_generated|divider|divider|ALT_INV_op_5~21_sumout\ : std_logic;
SIGNAL \inst|Div0|auto_generated|divider|divider|ALT_INV_op_7~17_sumout\ : std_logic;
SIGNAL \inst|Div0|auto_generated|divider|divider|ALT_INV_op_6~17_sumout\ : std_logic;
SIGNAL \inst|Div0|auto_generated|divider|divider|ALT_INV_op_5~17_sumout\ : std_logic;
SIGNAL \ALT_INV_CLOCK~inputCLKENA0_outclk\ : std_logic;
SIGNAL \ALT_INV_START~input_o\ : std_logic;
SIGNAL \ALT_INV_ACC~input_o\ : std_logic;
SIGNAL \ALT_INV_RESET~input_o\ : std_logic;
SIGNAL \ALT_INV_CLOCK~input_o\ : std_logic;
SIGNAL \ALT_INV_A[2]~input_o\ : std_logic;
SIGNAL \ALT_INV_RST_A~input_o\ : std_logic;
SIGNAL \ALT_INV_RST_C~input_o\ : std_logic;
SIGNAL \ALT_INV_RST_B~input_o\ : std_logic;
SIGNAL \ALT_INV_OP[0]~input_o\ : std_logic;
SIGNAL \ALT_INV_OP[1]~input_o\ : std_logic;
SIGNAL \ALT_INV_OP[2]~input_o\ : std_logic;
SIGNAL \inst14|ALT_INV_WRC~combout\ : std_logic;
SIGNAL \inst14|ALT_INV_SEL~combout\ : std_logic;
SIGNAL \inst|ALT_INV_Mux6~1_combout\ : std_logic;
SIGNAL \inst|Div0|auto_generated|divider|divider|ALT_INV_StageOut[40]~23_combout\ : std_logic;
SIGNAL \inst|Div0|auto_generated|divider|divider|ALT_INV_StageOut[41]~22_combout\ : std_logic;
SIGNAL \inst|Div0|auto_generated|divider|divider|ALT_INV_StageOut[32]~21_combout\ : std_logic;
SIGNAL \inst|Div0|auto_generated|divider|divider|ALT_INV_StageOut[42]~20_combout\ : std_logic;
SIGNAL \inst|Div0|auto_generated|divider|divider|ALT_INV_StageOut[33]~19_combout\ : std_logic;
SIGNAL \inst|Div0|auto_generated|divider|divider|ALT_INV_StageOut[24]~18_combout\ : std_logic;
SIGNAL \inst|Div0|auto_generated|divider|divider|ALT_INV_StageOut[43]~17_combout\ : std_logic;
SIGNAL \inst|Div0|auto_generated|divider|divider|ALT_INV_StageOut[34]~16_combout\ : std_logic;
SIGNAL \inst|Div0|auto_generated|divider|divider|ALT_INV_StageOut[25]~15_combout\ : std_logic;
SIGNAL \inst|Div0|auto_generated|divider|divider|ALT_INV_StageOut[16]~14_combout\ : std_logic;
SIGNAL \inst|Div0|auto_generated|divider|divider|ALT_INV_StageOut[44]~13_combout\ : std_logic;
SIGNAL \inst|Div0|auto_generated|divider|divider|ALT_INV_StageOut[35]~12_combout\ : std_logic;
SIGNAL \inst|Div0|auto_generated|divider|divider|ALT_INV_StageOut[26]~11_combout\ : std_logic;

BEGIN

CARRYOUT <= ww_CARRYOUT;
ALU_OUT <= ww_ALU_OUT;
ww_CLOCK <= CLOCK;
ww_RESET <= RESET;
ww_ACC <= ACC;
ww_START <= START;
ww_RST_A <= RST_A;
ww_A <= A;
ww_RST_C <= RST_C;
ww_RST_B <= RST_B;
ww_B <= B;
ww_OP <= OP;
REG_A_OUT <= ww_REG_A_OUT;
REG_B_OUT <= ww_REG_B_OUT;
REG_C_OUT <= ww_REG_C_OUT;
STATE_OUT <= ww_STATE_OUT;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\inst|Mult0~8_ACLR_bus\ <= (gnd & \RST_B~input_o\);

\inst|Mult0~8_CLK_bus\ <= (gnd & gnd & \inst14|CUR_STATE.FETCH~q\);

\inst|Mult0~8_ENA_bus\ <= (vcc & vcc & vcc);

\inst|Mult0~8_AX_bus\ <= (\inst2|DATA_OUT[7]~0_combout\ & \inst2|DATA_OUT[6]~1_combout\ & \inst2|DATA_OUT[5]~2_combout\ & \inst2|DATA_OUT[4]~3_combout\ & \inst2|DATA_OUT[3]~4_combout\ & \inst2|DATA_OUT[2]~5_combout\ & \inst2|DATA_OUT[1]~6_combout\ & 
\inst2|DATA_OUT[0]~7_combout\);

\inst|Mult0~8_AY_bus\ <= (\B[7]~input_o\ & \B[6]~input_o\ & \B[5]~input_o\ & \B[4]~input_o\ & \B[3]~input_o\ & \B[2]~input_o\ & \B[1]~input_o\ & \B[0]~input_o\);

\inst|Mult0~8_resulta\ <= \inst|Mult0~8_RESULTA_bus\(0);
\inst|Mult0~9\ <= \inst|Mult0~8_RESULTA_bus\(1);
\inst|Mult0~10\ <= \inst|Mult0~8_RESULTA_bus\(2);
\inst|Mult0~11\ <= \inst|Mult0~8_RESULTA_bus\(3);
\inst|Mult0~12\ <= \inst|Mult0~8_RESULTA_bus\(4);
\inst|Mult0~13\ <= \inst|Mult0~8_RESULTA_bus\(5);
\inst|Mult0~14\ <= \inst|Mult0~8_RESULTA_bus\(6);
\inst|Mult0~15\ <= \inst|Mult0~8_RESULTA_bus\(7);
\inst|Mult0~16\ <= \inst|Mult0~8_RESULTA_bus\(8);
\inst|Mult0~17\ <= \inst|Mult0~8_RESULTA_bus\(9);
\inst|Mult0~18\ <= \inst|Mult0~8_RESULTA_bus\(10);
\inst|Mult0~19\ <= \inst|Mult0~8_RESULTA_bus\(11);
\inst|Mult0~20\ <= \inst|Mult0~8_RESULTA_bus\(12);
\inst|Mult0~21\ <= \inst|Mult0~8_RESULTA_bus\(13);
\inst|Mult0~22\ <= \inst|Mult0~8_RESULTA_bus\(14);
\inst|Mult0~23\ <= \inst|Mult0~8_RESULTA_bus\(15);
\inst|Mult0~24\ <= \inst|Mult0~8_RESULTA_bus\(16);
\inst|Mult0~25\ <= \inst|Mult0~8_RESULTA_bus\(17);
\inst|Mult0~26\ <= \inst|Mult0~8_RESULTA_bus\(18);
\inst|Mult0~27\ <= \inst|Mult0~8_RESULTA_bus\(19);
\inst|Mult0~28\ <= \inst|Mult0~8_RESULTA_bus\(20);
\inst|Mult0~29\ <= \inst|Mult0~8_RESULTA_bus\(21);
\inst|Mult0~30\ <= \inst|Mult0~8_RESULTA_bus\(22);
\inst|Mult0~31\ <= \inst|Mult0~8_RESULTA_bus\(23);
\inst|Mult0~32\ <= \inst|Mult0~8_RESULTA_bus\(24);
\inst|Mult0~33\ <= \inst|Mult0~8_RESULTA_bus\(25);
\inst|Mult0~34\ <= \inst|Mult0~8_RESULTA_bus\(26);
\inst|Mult0~35\ <= \inst|Mult0~8_RESULTA_bus\(27);
\inst|Mult0~36\ <= \inst|Mult0~8_RESULTA_bus\(28);
\inst|Mult0~37\ <= \inst|Mult0~8_RESULTA_bus\(29);
\inst|Mult0~38\ <= \inst|Mult0~8_RESULTA_bus\(30);
\inst|Mult0~39\ <= \inst|Mult0~8_RESULTA_bus\(31);
\inst|Mult0~40\ <= \inst|Mult0~8_RESULTA_bus\(32);
\inst|Mult0~41\ <= \inst|Mult0~8_RESULTA_bus\(33);
\inst|Mult0~42\ <= \inst|Mult0~8_RESULTA_bus\(34);
\inst|Mult0~43\ <= \inst|Mult0~8_RESULTA_bus\(35);
\inst|Mult0~44\ <= \inst|Mult0~8_RESULTA_bus\(36);
\inst|Mult0~45\ <= \inst|Mult0~8_RESULTA_bus\(37);
\inst|Mult0~46\ <= \inst|Mult0~8_RESULTA_bus\(38);
\inst|Mult0~47\ <= \inst|Mult0~8_RESULTA_bus\(39);
\inst|Mult0~48\ <= \inst|Mult0~8_RESULTA_bus\(40);
\inst|Mult0~49\ <= \inst|Mult0~8_RESULTA_bus\(41);
\inst|Mult0~50\ <= \inst|Mult0~8_RESULTA_bus\(42);
\inst|Mult0~51\ <= \inst|Mult0~8_RESULTA_bus\(43);
\inst|Mult0~52\ <= \inst|Mult0~8_RESULTA_bus\(44);
\inst|Mult0~53\ <= \inst|Mult0~8_RESULTA_bus\(45);
\inst|Mult0~54\ <= \inst|Mult0~8_RESULTA_bus\(46);
\inst|Mult0~55\ <= \inst|Mult0~8_RESULTA_bus\(47);
\inst|Mult0~56\ <= \inst|Mult0~8_RESULTA_bus\(48);
\inst|Mult0~57\ <= \inst|Mult0~8_RESULTA_bus\(49);
\inst|Mult0~58\ <= \inst|Mult0~8_RESULTA_bus\(50);
\inst|Mult0~59\ <= \inst|Mult0~8_RESULTA_bus\(51);
\inst|Mult0~60\ <= \inst|Mult0~8_RESULTA_bus\(52);
\inst|Mult0~61\ <= \inst|Mult0~8_RESULTA_bus\(53);
\inst|Mult0~62\ <= \inst|Mult0~8_RESULTA_bus\(54);
\inst|Mult0~63\ <= \inst|Mult0~8_RESULTA_bus\(55);
\inst|Mult0~64\ <= \inst|Mult0~8_RESULTA_bus\(56);
\inst|Mult0~65\ <= \inst|Mult0~8_RESULTA_bus\(57);
\inst|Mult0~66\ <= \inst|Mult0~8_RESULTA_bus\(58);
\inst|Mult0~67\ <= \inst|Mult0~8_RESULTA_bus\(59);
\inst|Mult0~68\ <= \inst|Mult0~8_RESULTA_bus\(60);
\inst|Mult0~69\ <= \inst|Mult0~8_RESULTA_bus\(61);
\inst|Mult0~70\ <= \inst|Mult0~8_RESULTA_bus\(62);
\inst|Mult0~71\ <= \inst|Mult0~8_RESULTA_bus\(63);
\inst|ALT_INV_Mult0~11\ <= NOT \inst|Mult0~11\;
\inst|ALT_INV_Mult0~10\ <= NOT \inst|Mult0~10\;
\inst|ALT_INV_Mult0~9\ <= NOT \inst|Mult0~9\;
\inst|ALT_INV_Mult0~8_resulta\ <= NOT \inst|Mult0~8_resulta\;
\inst|Div0|auto_generated|divider|divider|ALT_INV_add_sub_0_result_int[1]~1_sumout\ <= NOT \inst|Div0|auto_generated|divider|divider|add_sub_0_result_int[1]~1_sumout\;
\inst|ALT_INV_Add0~1_sumout\ <= NOT \inst|Add0~1_sumout\;
\inst|Div0|auto_generated|divider|divider|ALT_INV_op_4~17_sumout\ <= NOT \inst|Div0|auto_generated|divider|divider|op_4~17_sumout\;
\inst|Div0|auto_generated|divider|divider|ALT_INV_op_7~13_sumout\ <= NOT \inst|Div0|auto_generated|divider|divider|op_7~13_sumout\;
\inst|Div0|auto_generated|divider|divider|ALT_INV_op_6~13_sumout\ <= NOT \inst|Div0|auto_generated|divider|divider|op_6~13_sumout\;
\inst|Div0|auto_generated|divider|divider|ALT_INV_op_5~13_sumout\ <= NOT \inst|Div0|auto_generated|divider|divider|op_5~13_sumout\;
\inst|Div0|auto_generated|divider|divider|ALT_INV_op_4~13_sumout\ <= NOT \inst|Div0|auto_generated|divider|divider|op_4~13_sumout\;
\inst|Div0|auto_generated|divider|divider|ALT_INV_op_3~13_sumout\ <= NOT \inst|Div0|auto_generated|divider|divider|op_3~13_sumout\;
\inst|Div0|auto_generated|divider|divider|ALT_INV_op_7~9_sumout\ <= NOT \inst|Div0|auto_generated|divider|divider|op_7~9_sumout\;
\inst|Div0|auto_generated|divider|divider|ALT_INV_op_6~9_sumout\ <= NOT \inst|Div0|auto_generated|divider|divider|op_6~9_sumout\;
\inst|Div0|auto_generated|divider|divider|ALT_INV_op_5~9_sumout\ <= NOT \inst|Div0|auto_generated|divider|divider|op_5~9_sumout\;
\inst|Div0|auto_generated|divider|divider|ALT_INV_op_4~9_sumout\ <= NOT \inst|Div0|auto_generated|divider|divider|op_4~9_sumout\;
\inst|Div0|auto_generated|divider|divider|ALT_INV_op_3~9_sumout\ <= NOT \inst|Div0|auto_generated|divider|divider|op_3~9_sumout\;
\inst|Div0|auto_generated|divider|divider|ALT_INV_add_sub_1_result_int[0]~9_sumout\ <= NOT \inst|Div0|auto_generated|divider|divider|add_sub_1_result_int[0]~9_sumout\;
\inst|Div0|auto_generated|divider|divider|ALT_INV_op_7~5_sumout\ <= NOT \inst|Div0|auto_generated|divider|divider|op_7~5_sumout\;
\inst|Div0|auto_generated|divider|divider|ALT_INV_op_6~5_sumout\ <= NOT \inst|Div0|auto_generated|divider|divider|op_6~5_sumout\;
\inst|Div0|auto_generated|divider|divider|ALT_INV_op_5~5_sumout\ <= NOT \inst|Div0|auto_generated|divider|divider|op_5~5_sumout\;
\inst|Div0|auto_generated|divider|divider|ALT_INV_op_4~5_sumout\ <= NOT \inst|Div0|auto_generated|divider|divider|op_4~5_sumout\;
\inst|Div0|auto_generated|divider|divider|ALT_INV_op_3~5_sumout\ <= NOT \inst|Div0|auto_generated|divider|divider|op_3~5_sumout\;
\inst|Div0|auto_generated|divider|divider|ALT_INV_add_sub_1_result_int[1]~5_sumout\ <= NOT \inst|Div0|auto_generated|divider|divider|add_sub_1_result_int[1]~5_sumout\;
\inst|Div0|auto_generated|divider|divider|ALT_INV_add_sub_0_result_int[0]~5_sumout\ <= NOT \inst|Div0|auto_generated|divider|divider|add_sub_0_result_int[0]~5_sumout\;
\inst|ALT_INV_Add0~29_sumout\ <= NOT \inst|Add0~29_sumout\;
\inst|Div0|auto_generated|divider|divider|ALT_INV_op_8~1_sumout\ <= NOT \inst|Div0|auto_generated|divider|divider|op_8~1_sumout\;
\inst|Div0|auto_generated|divider|divider|ALT_INV_op_7~1_sumout\ <= NOT \inst|Div0|auto_generated|divider|divider|op_7~1_sumout\;
\inst|ALT_INV_Add0~25_sumout\ <= NOT \inst|Add0~25_sumout\;
\inst|Div0|auto_generated|divider|divider|ALT_INV_op_6~1_sumout\ <= NOT \inst|Div0|auto_generated|divider|divider|op_6~1_sumout\;
\inst|ALT_INV_Add0~21_sumout\ <= NOT \inst|Add0~21_sumout\;
\inst|Div0|auto_generated|divider|divider|ALT_INV_op_5~1_sumout\ <= NOT \inst|Div0|auto_generated|divider|divider|op_5~1_sumout\;
\inst|ALT_INV_Add0~17_sumout\ <= NOT \inst|Add0~17_sumout\;
\inst|Div0|auto_generated|divider|divider|ALT_INV_op_4~1_sumout\ <= NOT \inst|Div0|auto_generated|divider|divider|op_4~1_sumout\;
\inst|ALT_INV_Add0~13_sumout\ <= NOT \inst|Add0~13_sumout\;
\inst|Div0|auto_generated|divider|divider|ALT_INV_op_3~1_sumout\ <= NOT \inst|Div0|auto_generated|divider|divider|op_3~1_sumout\;
\inst|ALT_INV_Add0~9_sumout\ <= NOT \inst|Add0~9_sumout\;
\inst|Div0|auto_generated|divider|divider|ALT_INV_add_sub_1_result_int[2]~1_sumout\ <= NOT \inst|Div0|auto_generated|divider|divider|add_sub_1_result_int[2]~1_sumout\;
\inst|ALT_INV_Add0~5_sumout\ <= NOT \inst|Add0~5_sumout\;
\inst|ALT_INV_Mult0~15\ <= NOT \inst|Mult0~15\;
\inst|ALT_INV_Mult0~14\ <= NOT \inst|Mult0~14\;
\inst|ALT_INV_Mult0~13\ <= NOT \inst|Mult0~13\;
\inst|ALT_INV_Mult0~12\ <= NOT \inst|Mult0~12\;
\inst|Div0|auto_generated|divider|divider|ALT_INV_StageOut[17]~10_combout\ <= NOT \inst|Div0|auto_generated|divider|divider|StageOut[17]~10_combout\;
\inst|Div0|auto_generated|divider|divider|ALT_INV_StageOut[8]~9_combout\ <= NOT \inst|Div0|auto_generated|divider|divider|StageOut[8]~9_combout\;
\inst|Div0|auto_generated|divider|divider|ALT_INV_StageOut[45]~8_combout\ <= NOT \inst|Div0|auto_generated|divider|divider|StageOut[45]~8_combout\;
\inst|Div0|auto_generated|divider|divider|ALT_INV_StageOut[45]~7_combout\ <= NOT \inst|Div0|auto_generated|divider|divider|StageOut[45]~7_combout\;
\inst|Div0|auto_generated|divider|divider|ALT_INV_selnose\(54) <= NOT \inst|Div0|auto_generated|divider|divider|selnose\(54);
\inst|Div0|auto_generated|divider|divider|ALT_INV_StageOut[36]~6_combout\ <= NOT \inst|Div0|auto_generated|divider|divider|StageOut[36]~6_combout\;
\inst|Div0|auto_generated|divider|divider|ALT_INV_StageOut[27]~5_combout\ <= NOT \inst|Div0|auto_generated|divider|divider|StageOut[27]~5_combout\;
\inst|Div0|auto_generated|divider|divider|ALT_INV_StageOut[27]~4_combout\ <= NOT \inst|Div0|auto_generated|divider|divider|StageOut[27]~4_combout\;
\inst|Div0|auto_generated|divider|divider|ALT_INV_selnose\(36) <= NOT \inst|Div0|auto_generated|divider|divider|selnose\(36);
\inst|Div0|auto_generated|divider|divider|ALT_INV_StageOut[18]~3_combout\ <= NOT \inst|Div0|auto_generated|divider|divider|StageOut[18]~3_combout\;
\inst|Div0|auto_generated|divider|divider|ALT_INV_StageOut[9]~2_combout\ <= NOT \inst|Div0|auto_generated|divider|divider|StageOut[9]~2_combout\;
\inst|Div0|auto_generated|divider|divider|ALT_INV_StageOut[9]~1_combout\ <= NOT \inst|Div0|auto_generated|divider|divider|StageOut[9]~1_combout\;
\inst|Div0|auto_generated|divider|divider|ALT_INV_selnose\(18) <= NOT \inst|Div0|auto_generated|divider|divider|selnose\(18);
\inst|Div0|auto_generated|divider|divider|ALT_INV_StageOut[0]~0_combout\ <= NOT \inst|Div0|auto_generated|divider|divider|StageOut[0]~0_combout\;
\inst|Div0|auto_generated|divider|divider|ALT_INV_selnose\(0) <= NOT \inst|Div0|auto_generated|divider|divider|selnose\(0);
\inst14|ALT_INV_WRC~1_combout\ <= NOT \inst14|WRC~1_combout\;
\inst14|ALT_INV_CUR_STATE.INIT~q\ <= NOT \inst14|CUR_STATE.INIT~q\;
\inst14|ALT_INV_CUR_STATE.FETCH~q\ <= NOT \inst14|CUR_STATE.FETCH~q\;
\inst14|ALT_INV_CUR_STATE.ACCUM~q\ <= NOT \inst14|CUR_STATE.ACCUM~q\;
\inst14|ALT_INV_CUR_STATE.PROC~q\ <= NOT \inst14|CUR_STATE.PROC~q\;
\inst14|ALT_INV_CUR_STATE.WR_RES~q\ <= NOT \inst14|CUR_STATE.WR_RES~q\;
\inst|ALT_INV_Mux7~4_combout\ <= NOT \inst|Mux7~4_combout\;
\inst|ALT_INV_Mux7~3_combout\ <= NOT \inst|Mux7~3_combout\;
\inst|ALT_INV_Mux7~2_combout\ <= NOT \inst|Mux7~2_combout\;
\inst|ALT_INV_ALU_RESULT~7_combout\ <= NOT \inst|ALU_RESULT~7_combout\;
\inst|ALT_INV_ALU_RESULT~6_combout\ <= NOT \inst|ALU_RESULT~6_combout\;
\inst|ALT_INV_Mux7~1_combout\ <= NOT \inst|Mux7~1_combout\;
\inst|ALT_INV_LessThan0~2_combout\ <= NOT \inst|LessThan0~2_combout\;
\inst|ALT_INV_LessThan0~1_combout\ <= NOT \inst|LessThan0~1_combout\;
\inst|ALT_INV_LessThan0~0_combout\ <= NOT \inst|LessThan0~0_combout\;
\inst2|ALT_INV_DATA_OUT[0]~7_combout\ <= NOT \inst2|DATA_OUT[0]~7_combout\;
\inst|ALT_INV_Mux7~0_combout\ <= NOT \inst|Mux7~0_combout\;
\inst4|ALT_INV_Q\(0) <= NOT \inst4|Q\(0);
\inst3|ALT_INV_Q[0]~_Duplicate_1_q\ <= NOT \inst3|Q[0]~_Duplicate_1_q\;
\inst5|ALT_INV_Q\(0) <= NOT \inst5|Q\(0);
\inst2|ALT_INV_DATA_OUT[1]~6_combout\ <= NOT \inst2|DATA_OUT[1]~6_combout\;
\inst4|ALT_INV_Q\(1) <= NOT \inst4|Q\(1);
\inst5|ALT_INV_Q\(1) <= NOT \inst5|Q\(1);
\inst|ALT_INV_Mux5~0_combout\ <= NOT \inst|Mux5~0_combout\;
\inst|ALT_INV_ALU_RESULT~5_combout\ <= NOT \inst|ALU_RESULT~5_combout\;
\inst2|ALT_INV_DATA_OUT[2]~5_combout\ <= NOT \inst2|DATA_OUT[2]~5_combout\;
\inst4|ALT_INV_Q\(2) <= NOT \inst4|Q\(2);
\inst5|ALT_INV_Q\(2) <= NOT \inst5|Q\(2);
\inst|ALT_INV_Mux4~0_combout\ <= NOT \inst|Mux4~0_combout\;
\inst|ALT_INV_ALU_RESULT~4_combout\ <= NOT \inst|ALU_RESULT~4_combout\;
\inst2|ALT_INV_DATA_OUT[3]~4_combout\ <= NOT \inst2|DATA_OUT[3]~4_combout\;
\inst4|ALT_INV_Q\(3) <= NOT \inst4|Q\(3);
\inst5|ALT_INV_Q\(3) <= NOT \inst5|Q\(3);
\inst|ALT_INV_Mux3~0_combout\ <= NOT \inst|Mux3~0_combout\;
\inst|Div0|auto_generated|divider|divider|ALT_INV_sel\(3) <= NOT \inst|Div0|auto_generated|divider|divider|sel\(3);
\inst|Div0|auto_generated|divider|divider|ALT_INV_sel\(4) <= NOT \inst|Div0|auto_generated|divider|divider|sel\(4);
\inst|ALT_INV_ALU_RESULT~3_combout\ <= NOT \inst|ALU_RESULT~3_combout\;
\inst2|ALT_INV_DATA_OUT[4]~3_combout\ <= NOT \inst2|DATA_OUT[4]~3_combout\;
\inst4|ALT_INV_Q\(4) <= NOT \inst4|Q\(4);
\inst5|ALT_INV_Q\(4) <= NOT \inst5|Q\(4);
\inst|ALT_INV_Mux2~0_combout\ <= NOT \inst|Mux2~0_combout\;
\inst|Div0|auto_generated|divider|divider|ALT_INV_sel\(2) <= NOT \inst|Div0|auto_generated|divider|divider|sel\(2);
\inst|Div0|auto_generated|divider|divider|ALT_INV_sel\(5) <= NOT \inst|Div0|auto_generated|divider|divider|sel\(5);
\inst|ALT_INV_ALU_RESULT~2_combout\ <= NOT \inst|ALU_RESULT~2_combout\;
\inst2|ALT_INV_DATA_OUT[5]~2_combout\ <= NOT \inst2|DATA_OUT[5]~2_combout\;
\inst4|ALT_INV_Q\(5) <= NOT \inst4|Q\(5);
\inst5|ALT_INV_Q\(5) <= NOT \inst5|Q\(5);
\inst|ALT_INV_Mux1~0_combout\ <= NOT \inst|Mux1~0_combout\;
\inst|ALT_INV_ALU_RESULT~1_combout\ <= NOT \inst|ALU_RESULT~1_combout\;
\inst2|ALT_INV_DATA_OUT[6]~1_combout\ <= NOT \inst2|DATA_OUT[6]~1_combout\;
\inst4|ALT_INV_Q\(6) <= NOT \inst4|Q\(6);
\inst5|ALT_INV_Q\(6) <= NOT \inst5|Q\(6);
\inst|ALT_INV_Mux0~0_combout\ <= NOT \inst|Mux0~0_combout\;
\inst|Div0|auto_generated|divider|divider|ALT_INV_sel\(1) <= NOT \inst|Div0|auto_generated|divider|divider|sel\(1);
\inst3|ALT_INV_Q[2]~_Duplicate_1_q\ <= NOT \inst3|Q[2]~_Duplicate_1_q\;
\inst3|ALT_INV_Q[3]~_Duplicate_1_q\ <= NOT \inst3|Q[3]~_Duplicate_1_q\;
\inst3|ALT_INV_Q[4]~_Duplicate_1_q\ <= NOT \inst3|Q[4]~_Duplicate_1_q\;
\inst3|ALT_INV_Q[5]~_Duplicate_1_q\ <= NOT \inst3|Q[5]~_Duplicate_1_q\;
\inst3|ALT_INV_Q[6]~_Duplicate_1_q\ <= NOT \inst3|Q[6]~_Duplicate_1_q\;
\inst3|ALT_INV_Q[1]~_Duplicate_1_q\ <= NOT \inst3|Q[1]~_Duplicate_1_q\;
\inst|ALT_INV_ALU_RESULT~0_combout\ <= NOT \inst|ALU_RESULT~0_combout\;
\inst2|ALT_INV_DATA_OUT[7]~0_combout\ <= NOT \inst2|DATA_OUT[7]~0_combout\;
\inst4|ALT_INV_Q\(7) <= NOT \inst4|Q\(7);
\inst5|ALT_INV_Q\(7) <= NOT \inst5|Q\(7);
\inst3|ALT_INV_Q[7]~_Duplicate_1_q\ <= NOT \inst3|Q[7]~_Duplicate_1_q\;
\inst|Div0|auto_generated|divider|divider|ALT_INV_op_7~29_sumout\ <= NOT \inst|Div0|auto_generated|divider|divider|op_7~29_sumout\;
\inst|Div0|auto_generated|divider|divider|ALT_INV_op_7~25_sumout\ <= NOT \inst|Div0|auto_generated|divider|divider|op_7~25_sumout\;
\inst|Div0|auto_generated|divider|divider|ALT_INV_op_6~25_sumout\ <= NOT \inst|Div0|auto_generated|divider|divider|op_6~25_sumout\;
\inst|Div0|auto_generated|divider|divider|ALT_INV_op_7~21_sumout\ <= NOT \inst|Div0|auto_generated|divider|divider|op_7~21_sumout\;
\inst|Div0|auto_generated|divider|divider|ALT_INV_op_6~21_sumout\ <= NOT \inst|Div0|auto_generated|divider|divider|op_6~21_sumout\;
\inst|Div0|auto_generated|divider|divider|ALT_INV_op_5~21_sumout\ <= NOT \inst|Div0|auto_generated|divider|divider|op_5~21_sumout\;
\inst|Div0|auto_generated|divider|divider|ALT_INV_op_7~17_sumout\ <= NOT \inst|Div0|auto_generated|divider|divider|op_7~17_sumout\;
\inst|Div0|auto_generated|divider|divider|ALT_INV_op_6~17_sumout\ <= NOT \inst|Div0|auto_generated|divider|divider|op_6~17_sumout\;
\inst|Div0|auto_generated|divider|divider|ALT_INV_op_5~17_sumout\ <= NOT \inst|Div0|auto_generated|divider|divider|op_5~17_sumout\;
\ALT_INV_CLOCK~inputCLKENA0_outclk\ <= NOT \CLOCK~inputCLKENA0_outclk\;
\ALT_INV_START~input_o\ <= NOT \START~input_o\;
\ALT_INV_ACC~input_o\ <= NOT \ACC~input_o\;
\ALT_INV_RESET~input_o\ <= NOT \RESET~input_o\;
\ALT_INV_CLOCK~input_o\ <= NOT \CLOCK~input_o\;
\ALT_INV_A[2]~input_o\ <= NOT \A[2]~input_o\;
\ALT_INV_RST_A~input_o\ <= NOT \RST_A~input_o\;
\ALT_INV_RST_C~input_o\ <= NOT \RST_C~input_o\;
\ALT_INV_RST_B~input_o\ <= NOT \RST_B~input_o\;
\ALT_INV_OP[0]~input_o\ <= NOT \OP[0]~input_o\;
\ALT_INV_OP[1]~input_o\ <= NOT \OP[1]~input_o\;
\ALT_INV_OP[2]~input_o\ <= NOT \OP[2]~input_o\;
\inst14|ALT_INV_WRC~combout\ <= NOT \inst14|WRC~combout\;
\inst14|ALT_INV_SEL~combout\ <= NOT \inst14|SEL~combout\;
\inst|ALT_INV_Mux6~1_combout\ <= NOT \inst|Mux6~1_combout\;
\inst|Div0|auto_generated|divider|divider|ALT_INV_StageOut[40]~23_combout\ <= NOT \inst|Div0|auto_generated|divider|divider|StageOut[40]~23_combout\;
\inst|Div0|auto_generated|divider|divider|ALT_INV_StageOut[41]~22_combout\ <= NOT \inst|Div0|auto_generated|divider|divider|StageOut[41]~22_combout\;
\inst|Div0|auto_generated|divider|divider|ALT_INV_StageOut[32]~21_combout\ <= NOT \inst|Div0|auto_generated|divider|divider|StageOut[32]~21_combout\;
\inst|Div0|auto_generated|divider|divider|ALT_INV_StageOut[42]~20_combout\ <= NOT \inst|Div0|auto_generated|divider|divider|StageOut[42]~20_combout\;
\inst|Div0|auto_generated|divider|divider|ALT_INV_StageOut[33]~19_combout\ <= NOT \inst|Div0|auto_generated|divider|divider|StageOut[33]~19_combout\;
\inst|Div0|auto_generated|divider|divider|ALT_INV_StageOut[24]~18_combout\ <= NOT \inst|Div0|auto_generated|divider|divider|StageOut[24]~18_combout\;
\inst|Div0|auto_generated|divider|divider|ALT_INV_StageOut[43]~17_combout\ <= NOT \inst|Div0|auto_generated|divider|divider|StageOut[43]~17_combout\;
\inst|Div0|auto_generated|divider|divider|ALT_INV_StageOut[34]~16_combout\ <= NOT \inst|Div0|auto_generated|divider|divider|StageOut[34]~16_combout\;
\inst|Div0|auto_generated|divider|divider|ALT_INV_StageOut[25]~15_combout\ <= NOT \inst|Div0|auto_generated|divider|divider|StageOut[25]~15_combout\;
\inst|Div0|auto_generated|divider|divider|ALT_INV_StageOut[16]~14_combout\ <= NOT \inst|Div0|auto_generated|divider|divider|StageOut[16]~14_combout\;
\inst|Div0|auto_generated|divider|divider|ALT_INV_StageOut[44]~13_combout\ <= NOT \inst|Div0|auto_generated|divider|divider|StageOut[44]~13_combout\;
\inst|Div0|auto_generated|divider|divider|ALT_INV_StageOut[35]~12_combout\ <= NOT \inst|Div0|auto_generated|divider|divider|StageOut[35]~12_combout\;
\inst|Div0|auto_generated|divider|divider|ALT_INV_StageOut[26]~11_combout\ <= NOT \inst|Div0|auto_generated|divider|divider|StageOut[26]~11_combout\;

-- Location: IOOBUF_X11_Y0_N36
\CARRYOUT~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_CARRYOUT);

-- Location: IOOBUF_X54_Y21_N39
\ALU_OUT[7]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|Mux0~1_combout\,
	devoe => ww_devoe,
	o => ww_ALU_OUT(7));

-- Location: IOOBUF_X54_Y14_N45
\ALU_OUT[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|Mux1~1_combout\,
	devoe => ww_devoe,
	o => ww_ALU_OUT(6));

-- Location: IOOBUF_X54_Y21_N56
\ALU_OUT[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|Mux2~1_combout\,
	devoe => ww_devoe,
	o => ww_ALU_OUT(5));

-- Location: IOOBUF_X36_Y0_N2
\ALU_OUT[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|Mux3~1_combout\,
	devoe => ww_devoe,
	o => ww_ALU_OUT(4));

-- Location: IOOBUF_X38_Y0_N53
\ALU_OUT[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|Mux4~1_combout\,
	devoe => ww_devoe,
	o => ww_ALU_OUT(3));

-- Location: IOOBUF_X54_Y19_N22
\ALU_OUT[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|Mux5~1_combout\,
	devoe => ww_devoe,
	o => ww_ALU_OUT(2));

-- Location: IOOBUF_X36_Y0_N19
\ALU_OUT[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|Mux6~0_combout\,
	devoe => ww_devoe,
	o => ww_ALU_OUT(1));

-- Location: IOOBUF_X54_Y14_N79
\ALU_OUT[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|Mux7~5_combout\,
	devoe => ww_devoe,
	o => ww_ALU_OUT(0));

-- Location: IOOBUF_X33_Y0_N76
\REG_A_OUT[7]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst4|Q\(7),
	devoe => ww_devoe,
	o => ww_REG_A_OUT(7));

-- Location: IOOBUF_X54_Y15_N5
\REG_A_OUT[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst4|Q\(6),
	devoe => ww_devoe,
	o => ww_REG_A_OUT(6));

-- Location: IOOBUF_X54_Y19_N39
\REG_A_OUT[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst4|Q\(5),
	devoe => ww_devoe,
	o => ww_REG_A_OUT(5));

-- Location: IOOBUF_X54_Y19_N5
\REG_A_OUT[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst4|Q\(4),
	devoe => ww_devoe,
	o => ww_REG_A_OUT(4));

-- Location: IOOBUF_X34_Y0_N36
\REG_A_OUT[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst4|Q\(3),
	devoe => ww_devoe,
	o => ww_REG_A_OUT(3));

-- Location: IOOBUF_X34_Y0_N53
\REG_A_OUT[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst4|Q\(2),
	devoe => ww_devoe,
	o => ww_REG_A_OUT(2));

-- Location: IOOBUF_X0_Y18_N79
\REG_A_OUT[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst4|Q\(1),
	devoe => ww_devoe,
	o => ww_REG_A_OUT(1));

-- Location: IOOBUF_X34_Y0_N2
\REG_A_OUT[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst4|Q\(0),
	devoe => ww_devoe,
	o => ww_REG_A_OUT(0));

-- Location: IOOBUF_X54_Y17_N56
\REG_B_OUT[7]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst3|Q[7]~_Duplicate_1_q\,
	devoe => ww_devoe,
	o => ww_REG_B_OUT(7));

-- Location: IOOBUF_X54_Y18_N45
\REG_B_OUT[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst3|Q[6]~_Duplicate_1_q\,
	devoe => ww_devoe,
	o => ww_REG_B_OUT(6));

-- Location: IOOBUF_X54_Y20_N5
\REG_B_OUT[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst3|Q[5]~_Duplicate_1_q\,
	devoe => ww_devoe,
	o => ww_REG_B_OUT(5));

-- Location: IOOBUF_X54_Y18_N79
\REG_B_OUT[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst3|Q[4]~_Duplicate_1_q\,
	devoe => ww_devoe,
	o => ww_REG_B_OUT(4));

-- Location: IOOBUF_X54_Y17_N5
\REG_B_OUT[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst3|Q[3]~_Duplicate_1_q\,
	devoe => ww_devoe,
	o => ww_REG_B_OUT(3));

-- Location: IOOBUF_X54_Y16_N39
\REG_B_OUT[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst3|Q[2]~_Duplicate_1_q\,
	devoe => ww_devoe,
	o => ww_REG_B_OUT(2));

-- Location: IOOBUF_X54_Y17_N22
\REG_B_OUT[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst3|Q[1]~_Duplicate_1_q\,
	devoe => ww_devoe,
	o => ww_REG_B_OUT(1));

-- Location: IOOBUF_X54_Y17_N39
\REG_B_OUT[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst3|Q[0]~_Duplicate_1_q\,
	devoe => ww_devoe,
	o => ww_REG_B_OUT(0));

-- Location: IOOBUF_X36_Y0_N53
\REG_C_OUT[7]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst5|Q\(7),
	devoe => ww_devoe,
	o => ww_REG_C_OUT(7));

-- Location: IOOBUF_X54_Y21_N22
\REG_C_OUT[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst5|Q\(6),
	devoe => ww_devoe,
	o => ww_REG_C_OUT(6));

-- Location: IOOBUF_X0_Y19_N5
\REG_C_OUT[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst5|Q\(5),
	devoe => ww_devoe,
	o => ww_REG_C_OUT(5));

-- Location: IOOBUF_X54_Y19_N56
\REG_C_OUT[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst5|Q\(4),
	devoe => ww_devoe,
	o => ww_REG_C_OUT(4));

-- Location: IOOBUF_X54_Y15_N56
\REG_C_OUT[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst5|Q\(3),
	devoe => ww_devoe,
	o => ww_REG_C_OUT(3));

-- Location: IOOBUF_X54_Y16_N22
\REG_C_OUT[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst5|Q\(2),
	devoe => ww_devoe,
	o => ww_REG_C_OUT(2));

-- Location: IOOBUF_X38_Y0_N2
\REG_C_OUT[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst5|Q\(1),
	devoe => ww_devoe,
	o => ww_REG_C_OUT(1));

-- Location: IOOBUF_X54_Y15_N39
\REG_C_OUT[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst5|Q\(0),
	devoe => ww_devoe,
	o => ww_REG_C_OUT(0));

-- Location: IOOBUF_X34_Y45_N19
\STATE_OUT[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst14|CUR_STATE.WR_RES~q\,
	devoe => ww_devoe,
	o => ww_STATE_OUT(2));

-- Location: IOOBUF_X29_Y0_N53
\STATE_OUT[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst14|STATE_OUT\(1),
	devoe => ww_devoe,
	o => ww_STATE_OUT(1));

-- Location: IOOBUF_X25_Y0_N36
\STATE_OUT[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst14|STATE_OUT\(0),
	devoe => ww_devoe,
	o => ww_STATE_OUT(0));

-- Location: IOIBUF_X54_Y18_N61
\CLOCK~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_CLOCK,
	o => \CLOCK~input_o\);

-- Location: IOIBUF_X24_Y0_N35
\START~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_START,
	o => \START~input_o\);

-- Location: IOIBUF_X38_Y0_N35
\ACC~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ACC,
	o => \ACC~input_o\);

-- Location: CLKCTRL_G9
\CLOCK~inputCLKENA0\ : cyclonev_clkena
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	disable_mode => "low",
	ena_register_mode => "always enabled",
	ena_register_power_up => "high",
	test_syn => "high")
-- pragma translate_on
PORT MAP (
	inclk => \CLOCK~input_o\,
	outclk => \CLOCK~inputCLKENA0_outclk\);

-- Location: LABCELL_X35_Y19_N9
\inst14|NXT_STATE.ACCUM~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst14|NXT_STATE.ACCUM~0_combout\ = ( !\inst14|CUR_STATE.INIT~q\ & ( (\START~input_o\ & \ACC~input_o\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000001111000000000000111100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_START~input_o\,
	datad => \ALT_INV_ACC~input_o\,
	dataf => \inst14|ALT_INV_CUR_STATE.INIT~q\,
	combout => \inst14|NXT_STATE.ACCUM~0_combout\);

-- Location: IOIBUF_X29_Y0_N35
\RESET~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_RESET,
	o => \RESET~input_o\);

-- Location: FF_X35_Y19_N11
\inst14|CUR_STATE.ACCUM\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_CLOCK~inputCLKENA0_outclk\,
	d => \inst14|NXT_STATE.ACCUM~0_combout\,
	clrn => \ALT_INV_RESET~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst14|CUR_STATE.ACCUM~q\);

-- Location: LABCELL_X35_Y19_N27
\inst14|NXT_STATE.PROC\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst14|NXT_STATE.PROC~combout\ = ( \inst14|CUR_STATE.FETCH~q\ ) # ( !\inst14|CUR_STATE.FETCH~q\ & ( \inst14|CUR_STATE.ACCUM~q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011001100110011001111111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \inst14|ALT_INV_CUR_STATE.ACCUM~q\,
	dataf => \inst14|ALT_INV_CUR_STATE.FETCH~q\,
	combout => \inst14|NXT_STATE.PROC~combout\);

-- Location: FF_X35_Y19_N29
\inst14|CUR_STATE.PROC\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_CLOCK~inputCLKENA0_outclk\,
	d => \inst14|NXT_STATE.PROC~combout\,
	clrn => \ALT_INV_RESET~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst14|CUR_STATE.PROC~q\);

-- Location: FF_X35_Y19_N20
\inst14|CUR_STATE.WR_RES\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_CLOCK~inputCLKENA0_outclk\,
	asdata => \inst14|CUR_STATE.PROC~q\,
	clrn => \ALT_INV_RESET~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst14|CUR_STATE.WR_RES~q\);

-- Location: LABCELL_X35_Y19_N42
\inst14|Selector4~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst14|Selector4~0_combout\ = ( !\inst14|CUR_STATE.WR_RES~q\ & ( (\inst14|CUR_STATE.INIT~q\) # (\START~input_o\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001111111111001100111111111100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_START~input_o\,
	datad => \inst14|ALT_INV_CUR_STATE.INIT~q\,
	dataf => \inst14|ALT_INV_CUR_STATE.WR_RES~q\,
	combout => \inst14|Selector4~0_combout\);

-- Location: FF_X35_Y19_N44
\inst14|CUR_STATE.INIT\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_CLOCK~inputCLKENA0_outclk\,
	d => \inst14|Selector4~0_combout\,
	clrn => \ALT_INV_RESET~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst14|CUR_STATE.INIT~q\);

-- Location: LABCELL_X35_Y19_N54
\inst14|NXT_STATE.FETCH~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst14|NXT_STATE.FETCH~0_combout\ = ( !\inst14|CUR_STATE.INIT~q\ & ( (\START~input_o\ & !\ACC~input_o\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011000000110000001100000011000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_START~input_o\,
	datac => \ALT_INV_ACC~input_o\,
	dataf => \inst14|ALT_INV_CUR_STATE.INIT~q\,
	combout => \inst14|NXT_STATE.FETCH~0_combout\);

-- Location: FF_X35_Y19_N56
\inst14|CUR_STATE.FETCH\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_CLOCK~input_o\,
	d => \inst14|NXT_STATE.FETCH~0_combout\,
	clrn => \ALT_INV_RESET~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst14|CUR_STATE.FETCH~q\);

-- Location: IOIBUF_X36_Y45_N18
\A[7]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_A(7),
	o => \A[7]~input_o\);

-- Location: IOIBUF_X54_Y14_N95
\RST_A~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_RST_A,
	o => \RST_A~input_o\);

-- Location: FF_X36_Y19_N14
\inst4|Q[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst14|CUR_STATE.FETCH~q\,
	asdata => \A[7]~input_o\,
	clrn => \ALT_INV_RST_A~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst4|Q\(7));

-- Location: LABCELL_X36_Y19_N21
\inst14|SEL\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst14|SEL~combout\ = ( \inst14|CUR_STATE.ACCUM~q\ & ( (!\inst14|CUR_STATE.PROC~q\) # (\inst14|SEL~combout\) ) ) # ( !\inst14|CUR_STATE.ACCUM~q\ & ( (\inst14|CUR_STATE.PROC~q\ & \inst14|SEL~combout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000001111000000000000111111110000111111111111000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \inst14|ALT_INV_CUR_STATE.PROC~q\,
	datad => \inst14|ALT_INV_SEL~combout\,
	dataf => \inst14|ALT_INV_CUR_STATE.ACCUM~q\,
	combout => \inst14|SEL~combout\);

-- Location: LABCELL_X35_Y19_N39
\inst14|WRC~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst14|WRC~1_combout\ = ( \inst14|CUR_STATE.ACCUM~q\ ) # ( !\inst14|CUR_STATE.ACCUM~q\ & ( \inst14|CUR_STATE.WR_RES~q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101010101010101010111111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst14|ALT_INV_CUR_STATE.WR_RES~q\,
	dataf => \inst14|ALT_INV_CUR_STATE.ACCUM~q\,
	combout => \inst14|WRC~1_combout\);

-- Location: LABCELL_X36_Y19_N12
\inst14|WRC\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst14|WRC~combout\ = ( \inst14|WRC~1_combout\ & ( (!\inst14|CUR_STATE.PROC~q\) # (\inst14|WRC~combout\) ) ) # ( !\inst14|WRC~1_combout\ & ( (\inst14|WRC~combout\ & \inst14|CUR_STATE.PROC~q\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000001100000011000000110000001111110011111100111111001111110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \inst14|ALT_INV_WRC~combout\,
	datac => \inst14|ALT_INV_CUR_STATE.PROC~q\,
	dataf => \inst14|ALT_INV_WRC~1_combout\,
	combout => \inst14|WRC~combout\);

-- Location: IOIBUF_X54_Y16_N55
\RST_C~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_RST_C,
	o => \RST_C~input_o\);

-- Location: FF_X36_Y19_N26
\inst5|Q[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst14|WRC~combout\,
	asdata => \inst|Mux0~1_combout\,
	clrn => \ALT_INV_RST_C~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst5|Q\(7));

-- Location: LABCELL_X36_Y19_N27
\inst2|DATA_OUT[7]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst2|DATA_OUT[7]~0_combout\ = ( \inst5|Q\(7) & ( (\inst14|SEL~combout\) # (\inst4|Q\(7)) ) ) # ( !\inst5|Q\(7) & ( (\inst4|Q\(7) & !\inst14|SEL~combout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100000000000011110000000000001111111111110000111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \inst4|ALT_INV_Q\(7),
	datad => \inst14|ALT_INV_SEL~combout\,
	dataf => \inst5|ALT_INV_Q\(7),
	combout => \inst2|DATA_OUT[7]~0_combout\);

-- Location: IOIBUF_X33_Y0_N92
\B[7]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_B(7),
	o => \B[7]~input_o\);

-- Location: IOIBUF_X0_Y20_N55
\RST_B~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_RST_B,
	o => \RST_B~input_o\);

-- Location: FF_X37_Y19_N41
\inst3|Q[7]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst14|CUR_STATE.FETCH~q\,
	asdata => \B[7]~input_o\,
	clrn => \ALT_INV_RST_B~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst3|Q[7]~_Duplicate_1_q\);

-- Location: LABCELL_X35_Y19_N18
\inst|ALU_RESULT~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|ALU_RESULT~0_combout\ = ( \inst3|Q[7]~_Duplicate_1_q\ & ( !\inst2|DATA_OUT[7]~0_combout\ ) ) # ( !\inst3|Q[7]~_Duplicate_1_q\ & ( \inst2|DATA_OUT[7]~0_combout\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111000011110000111111110000111100001111000011110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \inst2|ALT_INV_DATA_OUT[7]~0_combout\,
	dataf => \inst3|ALT_INV_Q[7]~_Duplicate_1_q\,
	combout => \inst|ALU_RESULT~0_combout\);

-- Location: IOIBUF_X54_Y20_N38
\OP[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_OP(0),
	o => \OP[0]~input_o\);

-- Location: IOIBUF_X54_Y16_N4
\OP[2]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_OP(2),
	o => \OP[2]~input_o\);

-- Location: IOIBUF_X54_Y20_N55
\B[6]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_B(6),
	o => \B[6]~input_o\);

-- Location: FF_X37_Y19_N56
\inst3|Q[6]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst14|CUR_STATE.FETCH~q\,
	asdata => \B[6]~input_o\,
	clrn => \ALT_INV_RST_B~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst3|Q[6]~_Duplicate_1_q\);

-- Location: IOIBUF_X38_Y0_N18
\A[6]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_A(6),
	o => \A[6]~input_o\);

-- Location: FF_X36_Y19_N20
\inst4|Q[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst14|CUR_STATE.FETCH~q\,
	asdata => \A[6]~input_o\,
	clrn => \ALT_INV_RST_A~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst4|Q\(6));

-- Location: IOIBUF_X54_Y18_N95
\OP[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_OP(1),
	o => \OP[1]~input_o\);

-- Location: IOIBUF_X54_Y20_N21
\B[4]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_B(4),
	o => \B[4]~input_o\);

-- Location: FF_X37_Y19_N26
\inst3|Q[4]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst14|CUR_STATE.FETCH~q\,
	asdata => \B[4]~input_o\,
	clrn => \ALT_INV_RST_B~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst3|Q[4]~_Duplicate_1_q\);

-- Location: IOIBUF_X54_Y15_N21
\B[5]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_B(5),
	o => \B[5]~input_o\);

-- Location: FF_X37_Y19_N23
\inst3|Q[5]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst14|CUR_STATE.FETCH~q\,
	asdata => \B[5]~input_o\,
	clrn => \ALT_INV_RST_B~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst3|Q[5]~_Duplicate_1_q\);

-- Location: IOIBUF_X33_Y0_N58
\B[3]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_B(3),
	o => \B[3]~input_o\);

-- Location: FF_X37_Y19_N29
\inst3|Q[3]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst14|CUR_STATE.FETCH~q\,
	asdata => \B[3]~input_o\,
	clrn => \ALT_INV_RST_B~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst3|Q[3]~_Duplicate_1_q\);

-- Location: MLABCELL_X37_Y18_N33
\inst|Div0|auto_generated|divider|divider|sel[5]\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|Div0|auto_generated|divider|divider|sel\(5) = ( \inst3|Q[7]~_Duplicate_1_q\ ) # ( !\inst3|Q[7]~_Duplicate_1_q\ & ( \inst3|Q[6]~_Duplicate_1_q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111111111111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \inst3|ALT_INV_Q[6]~_Duplicate_1_q\,
	dataf => \inst3|ALT_INV_Q[7]~_Duplicate_1_q\,
	combout => \inst|Div0|auto_generated|divider|divider|sel\(5));

-- Location: MLABCELL_X37_Y18_N24
\inst|Div0|auto_generated|divider|divider|sel[2]\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|Div0|auto_generated|divider|divider|sel\(2) = ( \inst|Div0|auto_generated|divider|divider|sel\(5) ) # ( !\inst|Div0|auto_generated|divider|divider|sel\(5) & ( ((\inst3|Q[3]~_Duplicate_1_q\) # (\inst3|Q[5]~_Duplicate_1_q\)) # 
-- (\inst3|Q[4]~_Duplicate_1_q\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011111111111111001111111111111111111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \inst3|ALT_INV_Q[4]~_Duplicate_1_q\,
	datac => \inst3|ALT_INV_Q[5]~_Duplicate_1_q\,
	datad => \inst3|ALT_INV_Q[3]~_Duplicate_1_q\,
	dataf => \inst|Div0|auto_generated|divider|divider|ALT_INV_sel\(5),
	combout => \inst|Div0|auto_generated|divider|divider|sel\(2));

-- Location: IOIBUF_X29_Y0_N18
\A[5]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_A(5),
	o => \A[5]~input_o\);

-- Location: FF_X34_Y19_N26
\inst4|Q[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst14|CUR_STATE.FETCH~q\,
	asdata => \A[5]~input_o\,
	clrn => \ALT_INV_RST_A~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst4|Q\(5));

-- Location: MLABCELL_X34_Y19_N42
\inst2|DATA_OUT[5]~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst2|DATA_OUT[5]~2_combout\ = ( \inst5|Q\(5) & ( \inst4|Q\(5) ) ) # ( !\inst5|Q\(5) & ( \inst4|Q\(5) & ( !\inst14|SEL~combout\ ) ) ) # ( \inst5|Q\(5) & ( !\inst4|Q\(5) & ( \inst14|SEL~combout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000001100110011001111001100110011001111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \inst14|ALT_INV_SEL~combout\,
	datae => \inst5|ALT_INV_Q\(5),
	dataf => \inst4|ALT_INV_Q\(5),
	combout => \inst2|DATA_OUT[5]~2_combout\);

-- Location: MLABCELL_X37_Y18_N12
\inst|ALU_RESULT~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|ALU_RESULT~2_combout\ = ( \inst3|Q[5]~_Duplicate_1_q\ & ( !\inst2|DATA_OUT[5]~2_combout\ ) ) # ( !\inst3|Q[5]~_Duplicate_1_q\ & ( \inst2|DATA_OUT[5]~2_combout\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011001100110011001111001100110011001100110011001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \inst2|ALT_INV_DATA_OUT[5]~2_combout\,
	dataf => \inst3|ALT_INV_Q[5]~_Duplicate_1_q\,
	combout => \inst|ALU_RESULT~2_combout\);

-- Location: LABCELL_X36_Y19_N15
\inst2|DATA_OUT[6]~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst2|DATA_OUT[6]~1_combout\ = ( \inst4|Q\(6) & ( (!\inst14|SEL~combout\) # (\inst5|Q\(6)) ) ) # ( !\inst4|Q\(6) & ( (\inst14|SEL~combout\ & \inst5|Q\(6)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010100000101000001010000010110101111101011111010111110101111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst14|ALT_INV_SEL~combout\,
	datac => \inst5|ALT_INV_Q\(6),
	dataf => \inst4|ALT_INV_Q\(6),
	combout => \inst2|DATA_OUT[6]~1_combout\);

-- Location: IOIBUF_X29_Y0_N1
\A[4]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_A(4),
	o => \A[4]~input_o\);

-- Location: FF_X34_Y19_N2
\inst4|Q[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst14|CUR_STATE.FETCH~q\,
	asdata => \A[4]~input_o\,
	clrn => \ALT_INV_RST_A~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst4|Q\(4));

-- Location: MLABCELL_X37_Y18_N6
\inst|ALU_RESULT~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|ALU_RESULT~3_combout\ = ( \inst3|Q[4]~_Duplicate_1_q\ & ( !\inst2|DATA_OUT[4]~3_combout\ ) ) # ( !\inst3|Q[4]~_Duplicate_1_q\ & ( \inst2|DATA_OUT[4]~3_combout\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111000011110000111111110000111100001111000011110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \inst2|ALT_INV_DATA_OUT[4]~3_combout\,
	dataf => \inst3|ALT_INV_Q[4]~_Duplicate_1_q\,
	combout => \inst|ALU_RESULT~3_combout\);

-- Location: IOIBUF_X24_Y0_N1
\A[3]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_A(3),
	o => \A[3]~input_o\);

-- Location: FF_X34_Y19_N20
\inst4|Q[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst14|CUR_STATE.FETCH~q\,
	asdata => \A[3]~input_o\,
	clrn => \ALT_INV_RST_A~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst4|Q\(3));

-- Location: IOIBUF_X0_Y19_N38
\B[2]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_B(2),
	o => \B[2]~input_o\);

-- Location: FF_X37_Y19_N14
\inst3|Q[2]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst14|CUR_STATE.FETCH~q\,
	asdata => \B[2]~input_o\,
	clrn => \ALT_INV_RST_B~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst3|Q[2]~_Duplicate_1_q\);

-- Location: IOIBUF_X25_Y0_N18
\A[2]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_A(2),
	o => \A[2]~input_o\);

-- Location: MLABCELL_X34_Y19_N30
\inst4|Q[2]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst4|Q[2]~feeder_combout\ = ( \A[2]~input_o\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \ALT_INV_A[2]~input_o\,
	combout => \inst4|Q[2]~feeder_combout\);

-- Location: FF_X34_Y19_N32
\inst4|Q[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst14|CUR_STATE.FETCH~q\,
	d => \inst4|Q[2]~feeder_combout\,
	clrn => \ALT_INV_RST_A~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst4|Q\(2));

-- Location: MLABCELL_X34_Y19_N36
\inst2|DATA_OUT[2]~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst2|DATA_OUT[2]~5_combout\ = ( \inst5|Q\(2) & ( \inst4|Q\(2) ) ) # ( !\inst5|Q\(2) & ( \inst4|Q\(2) & ( !\inst14|SEL~combout\ ) ) ) # ( \inst5|Q\(2) & ( !\inst4|Q\(2) & ( \inst14|SEL~combout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000001100110011001111001100110011001111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \inst14|ALT_INV_SEL~combout\,
	datae => \inst5|ALT_INV_Q\(2),
	dataf => \inst4|ALT_INV_Q\(2),
	combout => \inst2|DATA_OUT[2]~5_combout\);

-- Location: MLABCELL_X34_Y18_N36
\inst|ALU_RESULT~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|ALU_RESULT~5_combout\ = ( !\inst3|Q[2]~_Duplicate_1_q\ & ( \inst2|DATA_OUT[2]~5_combout\ ) ) # ( \inst3|Q[2]~_Duplicate_1_q\ & ( !\inst2|DATA_OUT[2]~5_combout\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111111111111111111110000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datae => \inst3|ALT_INV_Q[2]~_Duplicate_1_q\,
	dataf => \inst2|ALT_INV_DATA_OUT[2]~5_combout\,
	combout => \inst|ALU_RESULT~5_combout\);

-- Location: IOIBUF_X34_Y0_N18
\B[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_B(1),
	o => \B[1]~input_o\);

-- Location: FF_X37_Y19_N20
\inst3|Q[1]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst14|CUR_STATE.FETCH~q\,
	asdata => \B[1]~input_o\,
	clrn => \ALT_INV_RST_B~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst3|Q[1]~_Duplicate_1_q\);

-- Location: IOIBUF_X36_Y0_N35
\A[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_A(1),
	o => \A[1]~input_o\);

-- Location: FF_X36_Y19_N11
\inst4|Q[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst14|CUR_STATE.FETCH~q\,
	asdata => \A[1]~input_o\,
	clrn => \ALT_INV_RST_A~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst4|Q\(1));

-- Location: IOIBUF_X54_Y21_N4
\A[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_A(0),
	o => \A[0]~input_o\);

-- Location: FF_X36_Y19_N17
\inst4|Q[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst14|CUR_STATE.FETCH~q\,
	asdata => \A[0]~input_o\,
	clrn => \ALT_INV_RST_A~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst4|Q\(0));

-- Location: IOIBUF_X25_Y0_N1
\B[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_B(0),
	o => \B[0]~input_o\);

-- Location: FF_X37_Y19_N38
\inst3|Q[0]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst14|CUR_STATE.FETCH~q\,
	asdata => \B[0]~input_o\,
	clrn => \ALT_INV_RST_B~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst3|Q[0]~_Duplicate_1_q\);

-- Location: LABCELL_X36_Y19_N30
\inst|Add0~34\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|Add0~34_cout\ = CARRY(( \OP[0]~input_o\ ) + ( VCC ) + ( !VCC ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_OP[0]~input_o\,
	cin => GND,
	cout => \inst|Add0~34_cout\);

-- Location: LABCELL_X36_Y19_N33
\inst|Add0~29\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|Add0~29_sumout\ = SUM(( (!\inst14|SEL~combout\ & ((\inst4|Q\(0)))) # (\inst14|SEL~combout\ & (\inst5|Q\(0))) ) + ( !\OP[0]~input_o\ $ (!\inst3|Q[0]~_Duplicate_1_q\) ) + ( \inst|Add0~34_cout\ ))
-- \inst|Add0~30\ = CARRY(( (!\inst14|SEL~combout\ & ((\inst4|Q\(0)))) # (\inst14|SEL~combout\ & (\inst5|Q\(0))) ) + ( !\OP[0]~input_o\ $ (!\inst3|Q[0]~_Duplicate_1_q\) ) + ( \inst|Add0~34_cout\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000110011000011001100000000000000000000010111110101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst5|ALT_INV_Q\(0),
	datab => \ALT_INV_OP[0]~input_o\,
	datac => \inst14|ALT_INV_SEL~combout\,
	datad => \inst4|ALT_INV_Q\(0),
	dataf => \inst3|ALT_INV_Q[0]~_Duplicate_1_q\,
	cin => \inst|Add0~34_cout\,
	sumout => \inst|Add0~29_sumout\,
	cout => \inst|Add0~30\);

-- Location: LABCELL_X36_Y19_N36
\inst|Add0~25\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|Add0~25_sumout\ = SUM(( (!\inst14|SEL~combout\ & ((\inst4|Q\(1)))) # (\inst14|SEL~combout\ & (\inst5|Q\(1))) ) + ( !\OP[0]~input_o\ $ (!\inst3|Q[1]~_Duplicate_1_q\) ) + ( \inst|Add0~30\ ))
-- \inst|Add0~26\ = CARRY(( (!\inst14|SEL~combout\ & ((\inst4|Q\(1)))) # (\inst14|SEL~combout\ & (\inst5|Q\(1))) ) + ( !\OP[0]~input_o\ $ (!\inst3|Q[1]~_Duplicate_1_q\) ) + ( \inst|Add0~30\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000101010100101010100000000000000000000001111001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_OP[0]~input_o\,
	datab => \inst14|ALT_INV_SEL~combout\,
	datac => \inst5|ALT_INV_Q\(1),
	datad => \inst4|ALT_INV_Q\(1),
	dataf => \inst3|ALT_INV_Q[1]~_Duplicate_1_q\,
	cin => \inst|Add0~30\,
	sumout => \inst|Add0~25_sumout\,
	cout => \inst|Add0~26\);

-- Location: LABCELL_X36_Y17_N6
\inst|Mux6~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|Mux6~1_combout\ = ( \OP[2]~input_o\ & ( \inst|Add0~25_sumout\ & ( (!\OP[1]~input_o\ & (!\inst3|Q[1]~_Duplicate_1_q\ $ (!\OP[0]~input_o\ $ (\inst2|DATA_OUT[1]~6_combout\)))) ) ) ) # ( !\OP[2]~input_o\ & ( \inst|Add0~25_sumout\ ) ) # ( \OP[2]~input_o\ 
-- & ( !\inst|Add0~25_sumout\ & ( (!\OP[1]~input_o\ & (!\inst3|Q[1]~_Duplicate_1_q\ $ (!\OP[0]~input_o\ $ (\inst2|DATA_OUT[1]~6_combout\)))) ) ) ) # ( !\OP[2]~input_o\ & ( !\inst|Add0~25_sumout\ & ( \OP[1]~input_o\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111011000001001000011111111111111110110000010010000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst3|ALT_INV_Q[1]~_Duplicate_1_q\,
	datab => \ALT_INV_OP[0]~input_o\,
	datac => \ALT_INV_OP[1]~input_o\,
	datad => \inst2|ALT_INV_DATA_OUT[1]~6_combout\,
	datae => \ALT_INV_OP[2]~input_o\,
	dataf => \inst|ALT_INV_Add0~25_sumout\,
	combout => \inst|Mux6~1_combout\);

-- Location: MLABCELL_X34_Y19_N48
\inst2|DATA_OUT[3]~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst2|DATA_OUT[3]~4_combout\ = ( \inst5|Q\(3) & ( \inst4|Q\(3) ) ) # ( !\inst5|Q\(3) & ( \inst4|Q\(3) & ( !\inst14|SEL~combout\ ) ) ) # ( \inst5|Q\(3) & ( !\inst4|Q\(3) & ( \inst14|SEL~combout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000001100110011001111001100110011001111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \inst14|ALT_INV_SEL~combout\,
	datae => \inst5|ALT_INV_Q\(3),
	dataf => \inst4|ALT_INV_Q\(3),
	combout => \inst2|DATA_OUT[3]~4_combout\);

-- Location: DSP_X33_Y19_N0
\inst|Mult0~8\ : cyclonev_mac
-- pragma translate_off
GENERIC MAP (
	accumulate_clock => "none",
	ax_clock => "none",
	ax_width => 8,
	ay_scan_in_clock => "0",
	ay_scan_in_width => 8,
	ay_use_scan_in => "false",
	az_clock => "none",
	bx_clock => "none",
	by_clock => "none",
	by_use_scan_in => "false",
	bz_clock => "none",
	coef_a_0 => 0,
	coef_a_1 => 0,
	coef_a_2 => 0,
	coef_a_3 => 0,
	coef_a_4 => 0,
	coef_a_5 => 0,
	coef_a_6 => 0,
	coef_a_7 => 0,
	coef_b_0 => 0,
	coef_b_1 => 0,
	coef_b_2 => 0,
	coef_b_3 => 0,
	coef_b_4 => 0,
	coef_b_5 => 0,
	coef_b_6 => 0,
	coef_b_7 => 0,
	coef_sel_a_clock => "none",
	coef_sel_b_clock => "none",
	delay_scan_out_ay => "false",
	delay_scan_out_by => "false",
	enable_double_accum => "false",
	load_const_clock => "none",
	load_const_value => 0,
	mode_sub_location => 0,
	negate_clock => "none",
	operand_source_max => "input",
	operand_source_may => "input",
	operand_source_mbx => "input",
	operand_source_mby => "input",
	operation_mode => "m9x9",
	output_clock => "none",
	preadder_subtract_a => "false",
	preadder_subtract_b => "false",
	result_a_width => 64,
	signed_max => "false",
	signed_may => "false",
	signed_mbx => "false",
	signed_mby => "false",
	sub_clock => "none",
	use_chainadder => "false")
-- pragma translate_on
PORT MAP (
	sub => GND,
	negate => GND,
	aclr => \inst|Mult0~8_ACLR_bus\,
	clk => \inst|Mult0~8_CLK_bus\,
	ena => \inst|Mult0~8_ENA_bus\,
	ax => \inst|Mult0~8_AX_bus\,
	ay => \inst|Mult0~8_AY_bus\,
	resulta => \inst|Mult0~8_RESULTA_bus\);

-- Location: MLABCELL_X37_Y19_N39
\inst|Div0|auto_generated|divider|divider|sel[1]\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|Div0|auto_generated|divider|divider|sel\(1) = ( \inst3|Q[7]~_Duplicate_1_q\ & ( \inst3|Q[5]~_Duplicate_1_q\ ) ) # ( !\inst3|Q[7]~_Duplicate_1_q\ & ( \inst3|Q[5]~_Duplicate_1_q\ ) ) # ( \inst3|Q[7]~_Duplicate_1_q\ & ( !\inst3|Q[5]~_Duplicate_1_q\ ) ) 
-- # ( !\inst3|Q[7]~_Duplicate_1_q\ & ( !\inst3|Q[5]~_Duplicate_1_q\ & ( (((\inst3|Q[6]~_Duplicate_1_q\) # (\inst3|Q[3]~_Duplicate_1_q\)) # (\inst3|Q[2]~_Duplicate_1_q\)) # (\inst3|Q[4]~_Duplicate_1_q\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0111111111111111111111111111111111111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst3|ALT_INV_Q[4]~_Duplicate_1_q\,
	datab => \inst3|ALT_INV_Q[2]~_Duplicate_1_q\,
	datac => \inst3|ALT_INV_Q[3]~_Duplicate_1_q\,
	datad => \inst3|ALT_INV_Q[6]~_Duplicate_1_q\,
	datae => \inst3|ALT_INV_Q[7]~_Duplicate_1_q\,
	dataf => \inst3|ALT_INV_Q[5]~_Duplicate_1_q\,
	combout => \inst|Div0|auto_generated|divider|divider|sel\(1));

-- Location: MLABCELL_X37_Y19_N30
\inst|Div0|auto_generated|divider|divider|add_sub_0_result_int[0]~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|Div0|auto_generated|divider|divider|add_sub_0_result_int[0]~5_sumout\ = SUM(( !\inst3|Q[0]~_Duplicate_1_q\ $ (!\inst2|DATA_OUT[7]~0_combout\) ) + ( !VCC ) + ( !VCC ))
-- \inst|Div0|auto_generated|divider|divider|add_sub_0_result_int[0]~6\ = CARRY(( !\inst3|Q[0]~_Duplicate_1_q\ $ (!\inst2|DATA_OUT[7]~0_combout\) ) + ( !VCC ) + ( !VCC ))
-- \inst|Div0|auto_generated|divider|divider|add_sub_0_result_int[0]~7\ = SHARE((!\inst3|Q[0]~_Duplicate_1_q\) # (\inst2|DATA_OUT[7]~0_combout\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111111100000000000000000000111111110000",
	shared_arith => "on")
-- pragma translate_on
PORT MAP (
	datac => \inst3|ALT_INV_Q[0]~_Duplicate_1_q\,
	datad => \inst2|ALT_INV_DATA_OUT[7]~0_combout\,
	cin => GND,
	sharein => GND,
	sumout => \inst|Div0|auto_generated|divider|divider|add_sub_0_result_int[0]~5_sumout\,
	cout => \inst|Div0|auto_generated|divider|divider|add_sub_0_result_int[0]~6\,
	shareout => \inst|Div0|auto_generated|divider|divider|add_sub_0_result_int[0]~7\);

-- Location: MLABCELL_X37_Y19_N33
\inst|Div0|auto_generated|divider|divider|add_sub_0_result_int[1]~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|Div0|auto_generated|divider|divider|add_sub_0_result_int[1]~1_sumout\ = SUM(( VCC ) + ( \inst|Div0|auto_generated|divider|divider|add_sub_0_result_int[0]~7\ ) + ( \inst|Div0|auto_generated|divider|divider|add_sub_0_result_int[0]~6\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000001111111111111111",
	shared_arith => "on")
-- pragma translate_on
PORT MAP (
	cin => \inst|Div0|auto_generated|divider|divider|add_sub_0_result_int[0]~6\,
	sharein => \inst|Div0|auto_generated|divider|divider|add_sub_0_result_int[0]~7\,
	sumout => \inst|Div0|auto_generated|divider|divider|add_sub_0_result_int[1]~1_sumout\);

-- Location: MLABCELL_X37_Y19_N24
\inst|Div0|auto_generated|divider|divider|selnose[0]\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|Div0|auto_generated|divider|divider|selnose\(0) = ( \inst|Div0|auto_generated|divider|divider|add_sub_0_result_int[1]~1_sumout\ ) # ( !\inst|Div0|auto_generated|divider|divider|add_sub_0_result_int[1]~1_sumout\ & ( (\inst3|Q[1]~_Duplicate_1_q\) # 
-- (\inst|Div0|auto_generated|divider|divider|sel\(1)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011111100111111001111110011111111111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \inst|Div0|auto_generated|divider|divider|ALT_INV_sel\(1),
	datac => \inst3|ALT_INV_Q[1]~_Duplicate_1_q\,
	dataf => \inst|Div0|auto_generated|divider|divider|ALT_INV_add_sub_0_result_int[1]~1_sumout\,
	combout => \inst|Div0|auto_generated|divider|divider|selnose\(0));

-- Location: LABCELL_X36_Y19_N0
\inst|Div0|auto_generated|divider|divider|add_sub_1_result_int[0]~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|Div0|auto_generated|divider|divider|add_sub_1_result_int[0]~9_sumout\ = SUM(( !\inst3|Q[0]~_Duplicate_1_q\ $ (!\inst2|DATA_OUT[6]~1_combout\) ) + ( !VCC ) + ( !VCC ))
-- \inst|Div0|auto_generated|divider|divider|add_sub_1_result_int[0]~10\ = CARRY(( !\inst3|Q[0]~_Duplicate_1_q\ $ (!\inst2|DATA_OUT[6]~1_combout\) ) + ( !VCC ) + ( !VCC ))
-- \inst|Div0|auto_generated|divider|divider|add_sub_1_result_int[0]~11\ = SHARE((!\inst3|Q[0]~_Duplicate_1_q\) # (\inst2|DATA_OUT[6]~1_combout\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111111100000000000000000000111111110000",
	shared_arith => "on")
-- pragma translate_on
PORT MAP (
	datac => \inst3|ALT_INV_Q[0]~_Duplicate_1_q\,
	datad => \inst2|ALT_INV_DATA_OUT[6]~1_combout\,
	cin => GND,
	sharein => GND,
	sumout => \inst|Div0|auto_generated|divider|divider|add_sub_1_result_int[0]~9_sumout\,
	cout => \inst|Div0|auto_generated|divider|divider|add_sub_1_result_int[0]~10\,
	shareout => \inst|Div0|auto_generated|divider|divider|add_sub_1_result_int[0]~11\);

-- Location: LABCELL_X36_Y19_N3
\inst|Div0|auto_generated|divider|divider|add_sub_1_result_int[1]~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|Div0|auto_generated|divider|divider|add_sub_1_result_int[1]~5_sumout\ = SUM(( !\inst3|Q[1]~_Duplicate_1_q\ $ (((!\inst|Div0|auto_generated|divider|divider|selnose\(0) & ((\inst|Div0|auto_generated|divider|divider|add_sub_0_result_int[0]~5_sumout\))) 
-- # (\inst|Div0|auto_generated|divider|divider|selnose\(0) & (\inst2|DATA_OUT[7]~0_combout\)))) ) + ( \inst|Div0|auto_generated|divider|divider|add_sub_1_result_int[0]~11\ ) + ( \inst|Div0|auto_generated|divider|divider|add_sub_1_result_int[0]~10\ ))
-- \inst|Div0|auto_generated|divider|divider|add_sub_1_result_int[1]~6\ = CARRY(( !\inst3|Q[1]~_Duplicate_1_q\ $ (((!\inst|Div0|auto_generated|divider|divider|selnose\(0) & ((\inst|Div0|auto_generated|divider|divider|add_sub_0_result_int[0]~5_sumout\))) # 
-- (\inst|Div0|auto_generated|divider|divider|selnose\(0) & (\inst2|DATA_OUT[7]~0_combout\)))) ) + ( \inst|Div0|auto_generated|divider|divider|add_sub_1_result_int[0]~11\ ) + ( \inst|Div0|auto_generated|divider|divider|add_sub_1_result_int[0]~10\ ))
-- \inst|Div0|auto_generated|divider|divider|add_sub_1_result_int[1]~7\ = SHARE((!\inst3|Q[1]~_Duplicate_1_q\ & ((!\inst|Div0|auto_generated|divider|divider|selnose\(0) & ((\inst|Div0|auto_generated|divider|divider|add_sub_0_result_int[0]~5_sumout\))) # 
-- (\inst|Div0|auto_generated|divider|divider|selnose\(0) & (\inst2|DATA_OUT[7]~0_combout\)))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000011000100010000000000000000001100001110011001",
	shared_arith => "on")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|ALT_INV_DATA_OUT[7]~0_combout\,
	datab => \inst3|ALT_INV_Q[1]~_Duplicate_1_q\,
	datac => \inst|Div0|auto_generated|divider|divider|ALT_INV_add_sub_0_result_int[0]~5_sumout\,
	datad => \inst|Div0|auto_generated|divider|divider|ALT_INV_selnose\(0),
	cin => \inst|Div0|auto_generated|divider|divider|add_sub_1_result_int[0]~10\,
	sharein => \inst|Div0|auto_generated|divider|divider|add_sub_1_result_int[0]~11\,
	sumout => \inst|Div0|auto_generated|divider|divider|add_sub_1_result_int[1]~5_sumout\,
	cout => \inst|Div0|auto_generated|divider|divider|add_sub_1_result_int[1]~6\,
	shareout => \inst|Div0|auto_generated|divider|divider|add_sub_1_result_int[1]~7\);

-- Location: LABCELL_X36_Y19_N6
\inst|Div0|auto_generated|divider|divider|add_sub_1_result_int[2]~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|Div0|auto_generated|divider|divider|add_sub_1_result_int[2]~1_sumout\ = SUM(( VCC ) + ( \inst|Div0|auto_generated|divider|divider|add_sub_1_result_int[1]~7\ ) + ( \inst|Div0|auto_generated|divider|divider|add_sub_1_result_int[1]~6\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000001111111111111111",
	shared_arith => "on")
-- pragma translate_on
PORT MAP (
	cin => \inst|Div0|auto_generated|divider|divider|add_sub_1_result_int[1]~6\,
	sharein => \inst|Div0|auto_generated|divider|divider|add_sub_1_result_int[1]~7\,
	sumout => \inst|Div0|auto_generated|divider|divider|add_sub_1_result_int[2]~1_sumout\);

-- Location: MLABCELL_X37_Y18_N21
\inst|Div0|auto_generated|divider|divider|StageOut[9]~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|Div0|auto_generated|divider|divider|StageOut[9]~1_combout\ = ( !\inst|Div0|auto_generated|divider|divider|add_sub_1_result_int[2]~1_sumout\ & ( (!\inst|Div0|auto_generated|divider|divider|sel\(1) & 
-- \inst|Div0|auto_generated|divider|divider|add_sub_1_result_int[1]~5_sumout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011110000000000001111000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \inst|Div0|auto_generated|divider|divider|ALT_INV_sel\(1),
	datad => \inst|Div0|auto_generated|divider|divider|ALT_INV_add_sub_1_result_int[1]~5_sumout\,
	dataf => \inst|Div0|auto_generated|divider|divider|ALT_INV_add_sub_1_result_int[2]~1_sumout\,
	combout => \inst|Div0|auto_generated|divider|divider|StageOut[9]~1_combout\);

-- Location: MLABCELL_X37_Y19_N18
\inst|Div0|auto_generated|divider|divider|StageOut[0]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|Div0|auto_generated|divider|divider|StageOut[0]~0_combout\ = ( \inst|Div0|auto_generated|divider|divider|add_sub_0_result_int[1]~1_sumout\ & ( \inst2|DATA_OUT[7]~0_combout\ ) ) # ( 
-- !\inst|Div0|auto_generated|divider|divider|add_sub_0_result_int[1]~1_sumout\ & ( (!\inst|Div0|auto_generated|divider|divider|sel\(1) & ((!\inst3|Q[1]~_Duplicate_1_q\ & ((\inst|Div0|auto_generated|divider|divider|add_sub_0_result_int[0]~5_sumout\))) # 
-- (\inst3|Q[1]~_Duplicate_1_q\ & (\inst2|DATA_OUT[7]~0_combout\)))) # (\inst|Div0|auto_generated|divider|divider|sel\(1) & (\inst2|DATA_OUT[7]~0_combout\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001110101010101000111010101010101010101010101010101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|ALT_INV_DATA_OUT[7]~0_combout\,
	datab => \inst|Div0|auto_generated|divider|divider|ALT_INV_sel\(1),
	datac => \inst|Div0|auto_generated|divider|divider|ALT_INV_add_sub_0_result_int[0]~5_sumout\,
	datad => \inst3|ALT_INV_Q[1]~_Duplicate_1_q\,
	dataf => \inst|Div0|auto_generated|divider|divider|ALT_INV_add_sub_0_result_int[1]~1_sumout\,
	combout => \inst|Div0|auto_generated|divider|divider|StageOut[0]~0_combout\);

-- Location: MLABCELL_X37_Y19_N0
\inst|Div0|auto_generated|divider|divider|op_3~18\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|Div0|auto_generated|divider|divider|op_3~18_cout\ = CARRY(( VCC ) + ( VCC ) + ( !VCC ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000001111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	cin => GND,
	cout => \inst|Div0|auto_generated|divider|divider|op_3~18_cout\);

-- Location: MLABCELL_X37_Y19_N3
\inst|Div0|auto_generated|divider|divider|op_3~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|Div0|auto_generated|divider|divider|op_3~13_sumout\ = SUM(( !\inst3|Q[0]~_Duplicate_1_q\ ) + ( (!\inst14|SEL~combout\ & ((\inst4|Q\(5)))) # (\inst14|SEL~combout\ & (\inst5|Q\(5))) ) + ( \inst|Div0|auto_generated|divider|divider|op_3~18_cout\ ))
-- \inst|Div0|auto_generated|divider|divider|op_3~14\ = CARRY(( !\inst3|Q[0]~_Duplicate_1_q\ ) + ( (!\inst14|SEL~combout\ & ((\inst4|Q\(5)))) # (\inst14|SEL~combout\ & (\inst5|Q\(5))) ) + ( \inst|Div0|auto_generated|divider|divider|op_3~18_cout\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111000101110001000000000000000001111111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst5|ALT_INV_Q\(5),
	datab => \inst14|ALT_INV_SEL~combout\,
	datac => \inst4|ALT_INV_Q\(5),
	datad => \inst3|ALT_INV_Q[0]~_Duplicate_1_q\,
	cin => \inst|Div0|auto_generated|divider|divider|op_3~18_cout\,
	sumout => \inst|Div0|auto_generated|divider|divider|op_3~13_sumout\,
	cout => \inst|Div0|auto_generated|divider|divider|op_3~14\);

-- Location: MLABCELL_X37_Y19_N6
\inst|Div0|auto_generated|divider|divider|op_3~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|Div0|auto_generated|divider|divider|op_3~9_sumout\ = SUM(( !\inst3|Q[1]~_Duplicate_1_q\ ) + ( (!\inst|Div0|auto_generated|divider|divider|add_sub_1_result_int[2]~1_sumout\ & ((!\inst|Div0|auto_generated|divider|divider|sel\(1) & 
-- (\inst|Div0|auto_generated|divider|divider|add_sub_1_result_int[0]~9_sumout\)) # (\inst|Div0|auto_generated|divider|divider|sel\(1) & ((\inst2|DATA_OUT[6]~1_combout\))))) # (\inst|Div0|auto_generated|divider|divider|add_sub_1_result_int[2]~1_sumout\ & 
-- (((\inst2|DATA_OUT[6]~1_combout\)))) ) + ( \inst|Div0|auto_generated|divider|divider|op_3~14\ ))
-- \inst|Div0|auto_generated|divider|divider|op_3~10\ = CARRY(( !\inst3|Q[1]~_Duplicate_1_q\ ) + ( (!\inst|Div0|auto_generated|divider|divider|add_sub_1_result_int[2]~1_sumout\ & ((!\inst|Div0|auto_generated|divider|divider|sel\(1) & 
-- (\inst|Div0|auto_generated|divider|divider|add_sub_1_result_int[0]~9_sumout\)) # (\inst|Div0|auto_generated|divider|divider|sel\(1) & ((\inst2|DATA_OUT[6]~1_combout\))))) # (\inst|Div0|auto_generated|divider|divider|add_sub_1_result_int[2]~1_sumout\ & 
-- (((\inst2|DATA_OUT[6]~1_combout\)))) ) + ( \inst|Div0|auto_generated|divider|divider|op_3~14\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111101111000000000000000000000001111111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Div0|auto_generated|divider|divider|ALT_INV_add_sub_1_result_int[2]~1_sumout\,
	datab => \inst|Div0|auto_generated|divider|divider|ALT_INV_sel\(1),
	datac => \inst|Div0|auto_generated|divider|divider|ALT_INV_add_sub_1_result_int[0]~9_sumout\,
	datad => \inst3|ALT_INV_Q[1]~_Duplicate_1_q\,
	dataf => \inst2|ALT_INV_DATA_OUT[6]~1_combout\,
	cin => \inst|Div0|auto_generated|divider|divider|op_3~14\,
	sumout => \inst|Div0|auto_generated|divider|divider|op_3~9_sumout\,
	cout => \inst|Div0|auto_generated|divider|divider|op_3~10\);

-- Location: MLABCELL_X37_Y19_N9
\inst|Div0|auto_generated|divider|divider|op_3~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|Div0|auto_generated|divider|divider|op_3~5_sumout\ = SUM(( (!\inst|Div0|auto_generated|divider|divider|add_sub_1_result_int[2]~1_sumout\ & ((!\inst|Div0|auto_generated|divider|divider|sel\(1) & 
-- (\inst|Div0|auto_generated|divider|divider|add_sub_1_result_int[1]~5_sumout\)) # (\inst|Div0|auto_generated|divider|divider|sel\(1) & ((\inst|Div0|auto_generated|divider|divider|StageOut[0]~0_combout\))))) # 
-- (\inst|Div0|auto_generated|divider|divider|add_sub_1_result_int[2]~1_sumout\ & (((\inst|Div0|auto_generated|divider|divider|StageOut[0]~0_combout\)))) ) + ( !\inst3|Q[2]~_Duplicate_1_q\ ) + ( \inst|Div0|auto_generated|divider|divider|op_3~10\ ))
-- \inst|Div0|auto_generated|divider|divider|op_3~6\ = CARRY(( (!\inst|Div0|auto_generated|divider|divider|add_sub_1_result_int[2]~1_sumout\ & ((!\inst|Div0|auto_generated|divider|divider|sel\(1) & 
-- (\inst|Div0|auto_generated|divider|divider|add_sub_1_result_int[1]~5_sumout\)) # (\inst|Div0|auto_generated|divider|divider|sel\(1) & ((\inst|Div0|auto_generated|divider|divider|StageOut[0]~0_combout\))))) # 
-- (\inst|Div0|auto_generated|divider|divider|add_sub_1_result_int[2]~1_sumout\ & (((\inst|Div0|auto_generated|divider|divider|StageOut[0]~0_combout\)))) ) + ( !\inst3|Q[2]~_Duplicate_1_q\ ) + ( \inst|Div0|auto_generated|divider|divider|op_3~10\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000001111111100000000000000000000100001111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Div0|auto_generated|divider|divider|ALT_INV_add_sub_1_result_int[2]~1_sumout\,
	datab => \inst|Div0|auto_generated|divider|divider|ALT_INV_sel\(1),
	datac => \inst|Div0|auto_generated|divider|divider|ALT_INV_add_sub_1_result_int[1]~5_sumout\,
	datad => \inst|Div0|auto_generated|divider|divider|ALT_INV_StageOut[0]~0_combout\,
	dataf => \inst3|ALT_INV_Q[2]~_Duplicate_1_q\,
	cin => \inst|Div0|auto_generated|divider|divider|op_3~10\,
	sumout => \inst|Div0|auto_generated|divider|divider|op_3~5_sumout\,
	cout => \inst|Div0|auto_generated|divider|divider|op_3~6\);

-- Location: MLABCELL_X37_Y19_N12
\inst|Div0|auto_generated|divider|divider|op_3~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|Div0|auto_generated|divider|divider|op_3~1_sumout\ = SUM(( VCC ) + ( GND ) + ( \inst|Div0|auto_generated|divider|divider|op_3~6\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000001111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	cin => \inst|Div0|auto_generated|divider|divider|op_3~6\,
	sumout => \inst|Div0|auto_generated|divider|divider|op_3~1_sumout\);

-- Location: MLABCELL_X37_Y19_N21
\inst|Div0|auto_generated|divider|divider|selnose[18]\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|Div0|auto_generated|divider|divider|selnose\(18) = ( \inst|Div0|auto_generated|divider|divider|op_3~1_sumout\ ) # ( !\inst|Div0|auto_generated|divider|divider|op_3~1_sumout\ & ( \inst|Div0|auto_generated|divider|divider|sel\(2) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111000011110000111111111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \inst|Div0|auto_generated|divider|divider|ALT_INV_sel\(2),
	dataf => \inst|Div0|auto_generated|divider|divider|ALT_INV_op_3~1_sumout\,
	combout => \inst|Div0|auto_generated|divider|divider|selnose\(18));

-- Location: MLABCELL_X37_Y19_N27
\inst|Div0|auto_generated|divider|divider|StageOut[9]~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|Div0|auto_generated|divider|divider|StageOut[9]~2_combout\ = ( \inst|Div0|auto_generated|divider|divider|StageOut[0]~0_combout\ & ( (\inst|Div0|auto_generated|divider|divider|sel\(1)) # 
-- (\inst|Div0|auto_generated|divider|divider|add_sub_1_result_int[2]~1_sumout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000001110111011101110111011101110111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Div0|auto_generated|divider|divider|ALT_INV_add_sub_1_result_int[2]~1_sumout\,
	datab => \inst|Div0|auto_generated|divider|divider|ALT_INV_sel\(1),
	dataf => \inst|Div0|auto_generated|divider|divider|ALT_INV_StageOut[0]~0_combout\,
	combout => \inst|Div0|auto_generated|divider|divider|StageOut[9]~2_combout\);

-- Location: MLABCELL_X37_Y18_N0
\inst|Div0|auto_generated|divider|divider|StageOut[8]~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|Div0|auto_generated|divider|divider|StageOut[8]~9_combout\ = ( \inst|Div0|auto_generated|divider|divider|add_sub_1_result_int[2]~1_sumout\ & ( \inst2|DATA_OUT[6]~1_combout\ ) ) # ( 
-- !\inst|Div0|auto_generated|divider|divider|add_sub_1_result_int[2]~1_sumout\ & ( (!\inst|Div0|auto_generated|divider|divider|sel\(1) & (\inst|Div0|auto_generated|divider|divider|add_sub_1_result_int[0]~9_sumout\)) # 
-- (\inst|Div0|auto_generated|divider|divider|sel\(1) & ((\inst2|DATA_OUT[6]~1_combout\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000110000111111000011000011111100000000111111110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \inst|Div0|auto_generated|divider|divider|ALT_INV_sel\(1),
	datac => \inst|Div0|auto_generated|divider|divider|ALT_INV_add_sub_1_result_int[0]~9_sumout\,
	datad => \inst2|ALT_INV_DATA_OUT[6]~1_combout\,
	dataf => \inst|Div0|auto_generated|divider|divider|ALT_INV_add_sub_1_result_int[2]~1_sumout\,
	combout => \inst|Div0|auto_generated|divider|divider|StageOut[8]~9_combout\);

-- Location: MLABCELL_X37_Y19_N42
\inst|Div0|auto_generated|divider|divider|op_4~22\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|Div0|auto_generated|divider|divider|op_4~22_cout\ = CARRY(( VCC ) + ( VCC ) + ( !VCC ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000001111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	cin => GND,
	cout => \inst|Div0|auto_generated|divider|divider|op_4~22_cout\);

-- Location: MLABCELL_X37_Y19_N45
\inst|Div0|auto_generated|divider|divider|op_4~17\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|Div0|auto_generated|divider|divider|op_4~17_sumout\ = SUM(( !\inst3|Q[0]~_Duplicate_1_q\ ) + ( (!\inst14|SEL~combout\ & ((\inst4|Q\(4)))) # (\inst14|SEL~combout\ & (\inst5|Q\(4))) ) + ( \inst|Div0|auto_generated|divider|divider|op_4~22_cout\ ))
-- \inst|Div0|auto_generated|divider|divider|op_4~18\ = CARRY(( !\inst3|Q[0]~_Duplicate_1_q\ ) + ( (!\inst14|SEL~combout\ & ((\inst4|Q\(4)))) # (\inst14|SEL~combout\ & (\inst5|Q\(4))) ) + ( \inst|Div0|auto_generated|divider|divider|op_4~22_cout\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111000000110000000000000000001111111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \inst5|ALT_INV_Q\(4),
	datac => \inst14|ALT_INV_SEL~combout\,
	datad => \inst3|ALT_INV_Q[0]~_Duplicate_1_q\,
	dataf => \inst4|ALT_INV_Q\(4),
	cin => \inst|Div0|auto_generated|divider|divider|op_4~22_cout\,
	sumout => \inst|Div0|auto_generated|divider|divider|op_4~17_sumout\,
	cout => \inst|Div0|auto_generated|divider|divider|op_4~18\);

-- Location: MLABCELL_X37_Y19_N48
\inst|Div0|auto_generated|divider|divider|op_4~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|Div0|auto_generated|divider|divider|op_4~13_sumout\ = SUM(( (!\inst|Div0|auto_generated|divider|divider|sel\(2) & ((!\inst|Div0|auto_generated|divider|divider|op_3~1_sumout\ & (\inst|Div0|auto_generated|divider|divider|op_3~13_sumout\)) # 
-- (\inst|Div0|auto_generated|divider|divider|op_3~1_sumout\ & ((\inst2|DATA_OUT[5]~2_combout\))))) # (\inst|Div0|auto_generated|divider|divider|sel\(2) & (((\inst2|DATA_OUT[5]~2_combout\)))) ) + ( !\inst3|Q[1]~_Duplicate_1_q\ ) + ( 
-- \inst|Div0|auto_generated|divider|divider|op_4~18\ ))
-- \inst|Div0|auto_generated|divider|divider|op_4~14\ = CARRY(( (!\inst|Div0|auto_generated|divider|divider|sel\(2) & ((!\inst|Div0|auto_generated|divider|divider|op_3~1_sumout\ & (\inst|Div0|auto_generated|divider|divider|op_3~13_sumout\)) # 
-- (\inst|Div0|auto_generated|divider|divider|op_3~1_sumout\ & ((\inst2|DATA_OUT[5]~2_combout\))))) # (\inst|Div0|auto_generated|divider|divider|sel\(2) & (((\inst2|DATA_OUT[5]~2_combout\)))) ) + ( !\inst3|Q[1]~_Duplicate_1_q\ ) + ( 
-- \inst|Div0|auto_generated|divider|divider|op_4~18\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000001111111100000000000000000000100001111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Div0|auto_generated|divider|divider|ALT_INV_sel\(2),
	datab => \inst|Div0|auto_generated|divider|divider|ALT_INV_op_3~1_sumout\,
	datac => \inst|Div0|auto_generated|divider|divider|ALT_INV_op_3~13_sumout\,
	datad => \inst2|ALT_INV_DATA_OUT[5]~2_combout\,
	dataf => \inst3|ALT_INV_Q[1]~_Duplicate_1_q\,
	cin => \inst|Div0|auto_generated|divider|divider|op_4~18\,
	sumout => \inst|Div0|auto_generated|divider|divider|op_4~13_sumout\,
	cout => \inst|Div0|auto_generated|divider|divider|op_4~14\);

-- Location: MLABCELL_X37_Y19_N51
\inst|Div0|auto_generated|divider|divider|op_4~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|Div0|auto_generated|divider|divider|op_4~9_sumout\ = SUM(( (!\inst|Div0|auto_generated|divider|divider|sel\(2) & ((!\inst|Div0|auto_generated|divider|divider|op_3~1_sumout\ & (\inst|Div0|auto_generated|divider|divider|op_3~9_sumout\)) # 
-- (\inst|Div0|auto_generated|divider|divider|op_3~1_sumout\ & ((\inst|Div0|auto_generated|divider|divider|StageOut[8]~9_combout\))))) # (\inst|Div0|auto_generated|divider|divider|sel\(2) & 
-- (((\inst|Div0|auto_generated|divider|divider|StageOut[8]~9_combout\)))) ) + ( !\inst3|Q[2]~_Duplicate_1_q\ ) + ( \inst|Div0|auto_generated|divider|divider|op_4~14\ ))
-- \inst|Div0|auto_generated|divider|divider|op_4~10\ = CARRY(( (!\inst|Div0|auto_generated|divider|divider|sel\(2) & ((!\inst|Div0|auto_generated|divider|divider|op_3~1_sumout\ & (\inst|Div0|auto_generated|divider|divider|op_3~9_sumout\)) # 
-- (\inst|Div0|auto_generated|divider|divider|op_3~1_sumout\ & ((\inst|Div0|auto_generated|divider|divider|StageOut[8]~9_combout\))))) # (\inst|Div0|auto_generated|divider|divider|sel\(2) & 
-- (((\inst|Div0|auto_generated|divider|divider|StageOut[8]~9_combout\)))) ) + ( !\inst3|Q[2]~_Duplicate_1_q\ ) + ( \inst|Div0|auto_generated|divider|divider|op_4~14\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000001111111100000000000000000000100001111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Div0|auto_generated|divider|divider|ALT_INV_sel\(2),
	datab => \inst|Div0|auto_generated|divider|divider|ALT_INV_op_3~1_sumout\,
	datac => \inst|Div0|auto_generated|divider|divider|ALT_INV_op_3~9_sumout\,
	datad => \inst|Div0|auto_generated|divider|divider|ALT_INV_StageOut[8]~9_combout\,
	dataf => \inst3|ALT_INV_Q[2]~_Duplicate_1_q\,
	cin => \inst|Div0|auto_generated|divider|divider|op_4~14\,
	sumout => \inst|Div0|auto_generated|divider|divider|op_4~9_sumout\,
	cout => \inst|Div0|auto_generated|divider|divider|op_4~10\);

-- Location: MLABCELL_X37_Y19_N54
\inst|Div0|auto_generated|divider|divider|op_4~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|Div0|auto_generated|divider|divider|op_4~5_sumout\ = SUM(( (!\inst|Div0|auto_generated|divider|divider|selnose\(18) & (((\inst|Div0|auto_generated|divider|divider|op_3~5_sumout\)))) # (\inst|Div0|auto_generated|divider|divider|selnose\(18) & 
-- (((\inst|Div0|auto_generated|divider|divider|StageOut[9]~2_combout\)) # (\inst|Div0|auto_generated|divider|divider|StageOut[9]~1_combout\))) ) + ( !\inst3|Q[3]~_Duplicate_1_q\ ) + ( \inst|Div0|auto_generated|divider|divider|op_4~10\ ))
-- \inst|Div0|auto_generated|divider|divider|op_4~6\ = CARRY(( (!\inst|Div0|auto_generated|divider|divider|selnose\(18) & (((\inst|Div0|auto_generated|divider|divider|op_3~5_sumout\)))) # (\inst|Div0|auto_generated|divider|divider|selnose\(18) & 
-- (((\inst|Div0|auto_generated|divider|divider|StageOut[9]~2_combout\)) # (\inst|Div0|auto_generated|divider|divider|StageOut[9]~1_combout\))) ) + ( !\inst3|Q[3]~_Duplicate_1_q\ ) + ( \inst|Div0|auto_generated|divider|divider|op_4~10\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000001111111100000000000000000011010100111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Div0|auto_generated|divider|divider|ALT_INV_StageOut[9]~1_combout\,
	datab => \inst|Div0|auto_generated|divider|divider|ALT_INV_op_3~5_sumout\,
	datac => \inst|Div0|auto_generated|divider|divider|ALT_INV_selnose\(18),
	datad => \inst|Div0|auto_generated|divider|divider|ALT_INV_StageOut[9]~2_combout\,
	dataf => \inst3|ALT_INV_Q[3]~_Duplicate_1_q\,
	cin => \inst|Div0|auto_generated|divider|divider|op_4~10\,
	sumout => \inst|Div0|auto_generated|divider|divider|op_4~5_sumout\,
	cout => \inst|Div0|auto_generated|divider|divider|op_4~6\);

-- Location: MLABCELL_X37_Y19_N57
\inst|Div0|auto_generated|divider|divider|op_4~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|Div0|auto_generated|divider|divider|op_4~1_sumout\ = SUM(( VCC ) + ( GND ) + ( \inst|Div0|auto_generated|divider|divider|op_4~6\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000001111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	cin => \inst|Div0|auto_generated|divider|divider|op_4~6\,
	sumout => \inst|Div0|auto_generated|divider|divider|op_4~1_sumout\);

-- Location: MLABCELL_X37_Y18_N51
\inst|Div0|auto_generated|divider|divider|sel[4]\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|Div0|auto_generated|divider|divider|sel\(4) = ( \inst|Div0|auto_generated|divider|divider|sel\(5) ) # ( !\inst|Div0|auto_generated|divider|divider|sel\(5) & ( \inst3|Q[5]~_Duplicate_1_q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111111111111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \inst3|ALT_INV_Q[5]~_Duplicate_1_q\,
	dataf => \inst|Div0|auto_generated|divider|divider|ALT_INV_sel\(5),
	combout => \inst|Div0|auto_generated|divider|divider|sel\(4));

-- Location: MLABCELL_X37_Y18_N18
\inst|Div0|auto_generated|divider|divider|sel[3]\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|Div0|auto_generated|divider|divider|sel\(3) = ( \inst|Div0|auto_generated|divider|divider|sel\(4) ) # ( !\inst|Div0|auto_generated|divider|divider|sel\(4) & ( \inst3|Q[4]~_Duplicate_1_q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011001100110011001111111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \inst3|ALT_INV_Q[4]~_Duplicate_1_q\,
	dataf => \inst|Div0|auto_generated|divider|divider|ALT_INV_sel\(4),
	combout => \inst|Div0|auto_generated|divider|divider|sel\(3));

-- Location: MLABCELL_X37_Y18_N48
\inst|Div0|auto_generated|divider|divider|StageOut[18]~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|Div0|auto_generated|divider|divider|StageOut[18]~3_combout\ = ( \inst|Div0|auto_generated|divider|divider|op_3~1_sumout\ & ( (\inst|Div0|auto_generated|divider|divider|StageOut[9]~1_combout\) # 
-- (\inst|Div0|auto_generated|divider|divider|StageOut[9]~2_combout\) ) ) # ( !\inst|Div0|auto_generated|divider|divider|op_3~1_sumout\ & ( (!\inst|Div0|auto_generated|divider|divider|sel\(2) & (((\inst|Div0|auto_generated|divider|divider|op_3~5_sumout\)))) 
-- # (\inst|Div0|auto_generated|divider|divider|sel\(2) & (((\inst|Div0|auto_generated|divider|divider|StageOut[9]~1_combout\)) # (\inst|Div0|auto_generated|divider|divider|StageOut[9]~2_combout\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001010110111111000101011011111100111111001111110011111100111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Div0|auto_generated|divider|divider|ALT_INV_sel\(2),
	datab => \inst|Div0|auto_generated|divider|divider|ALT_INV_StageOut[9]~2_combout\,
	datac => \inst|Div0|auto_generated|divider|divider|ALT_INV_StageOut[9]~1_combout\,
	datad => \inst|Div0|auto_generated|divider|divider|ALT_INV_op_3~5_sumout\,
	dataf => \inst|Div0|auto_generated|divider|divider|ALT_INV_op_3~1_sumout\,
	combout => \inst|Div0|auto_generated|divider|divider|StageOut[18]~3_combout\);

-- Location: MLABCELL_X37_Y18_N27
\inst|Div0|auto_generated|divider|divider|StageOut[17]~10\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|Div0|auto_generated|divider|divider|StageOut[17]~10_combout\ = ( \inst|Div0|auto_generated|divider|divider|op_3~1_sumout\ & ( \inst|Div0|auto_generated|divider|divider|StageOut[8]~9_combout\ ) ) # ( 
-- !\inst|Div0|auto_generated|divider|divider|op_3~1_sumout\ & ( (!\inst|Div0|auto_generated|divider|divider|sel\(2) & (\inst|Div0|auto_generated|divider|divider|op_3~9_sumout\)) # (\inst|Div0|auto_generated|divider|divider|sel\(2) & 
-- ((\inst|Div0|auto_generated|divider|divider|StageOut[8]~9_combout\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000101001011111000010100101111100000000111111110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Div0|auto_generated|divider|divider|ALT_INV_sel\(2),
	datac => \inst|Div0|auto_generated|divider|divider|ALT_INV_op_3~9_sumout\,
	datad => \inst|Div0|auto_generated|divider|divider|ALT_INV_StageOut[8]~9_combout\,
	dataf => \inst|Div0|auto_generated|divider|divider|ALT_INV_op_3~1_sumout\,
	combout => \inst|Div0|auto_generated|divider|divider|StageOut[17]~10_combout\);

-- Location: MLABCELL_X37_Y18_N15
\inst|Div0|auto_generated|divider|divider|StageOut[16]~14\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|Div0|auto_generated|divider|divider|StageOut[16]~14_combout\ = ( \inst|Div0|auto_generated|divider|divider|op_3~1_sumout\ & ( \inst2|DATA_OUT[5]~2_combout\ ) ) # ( !\inst|Div0|auto_generated|divider|divider|op_3~1_sumout\ & ( 
-- (!\inst|Div0|auto_generated|divider|divider|sel\(2) & ((\inst|Div0|auto_generated|divider|divider|op_3~13_sumout\))) # (\inst|Div0|auto_generated|divider|divider|sel\(2) & (\inst2|DATA_OUT[5]~2_combout\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000110111011000100011011101100110011001100110011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Div0|auto_generated|divider|divider|ALT_INV_sel\(2),
	datab => \inst2|ALT_INV_DATA_OUT[5]~2_combout\,
	datad => \inst|Div0|auto_generated|divider|divider|ALT_INV_op_3~13_sumout\,
	dataf => \inst|Div0|auto_generated|divider|divider|ALT_INV_op_3~1_sumout\,
	combout => \inst|Div0|auto_generated|divider|divider|StageOut[16]~14_combout\);

-- Location: LABCELL_X36_Y18_N12
\inst|Div0|auto_generated|divider|divider|op_5~26\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|Div0|auto_generated|divider|divider|op_5~26_cout\ = CARRY(( VCC ) + ( VCC ) + ( !VCC ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000001111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	cin => GND,
	cout => \inst|Div0|auto_generated|divider|divider|op_5~26_cout\);

-- Location: LABCELL_X36_Y18_N15
\inst|Div0|auto_generated|divider|divider|op_5~21\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|Div0|auto_generated|divider|divider|op_5~21_sumout\ = SUM(( (!\inst14|SEL~combout\ & ((\inst4|Q\(3)))) # (\inst14|SEL~combout\ & (\inst5|Q\(3))) ) + ( !\inst3|Q[0]~_Duplicate_1_q\ ) + ( \inst|Div0|auto_generated|divider|divider|op_5~26_cout\ ))
-- \inst|Div0|auto_generated|divider|divider|op_5~22\ = CARRY(( (!\inst14|SEL~combout\ & ((\inst4|Q\(3)))) # (\inst14|SEL~combout\ & (\inst5|Q\(3))) ) + ( !\inst3|Q[0]~_Duplicate_1_q\ ) + ( \inst|Div0|auto_generated|divider|divider|op_5~26_cout\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000011110000111100000000000000000001000110111011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst14|ALT_INV_SEL~combout\,
	datab => \inst5|ALT_INV_Q\(3),
	datac => \inst3|ALT_INV_Q[0]~_Duplicate_1_q\,
	datad => \inst4|ALT_INV_Q\(3),
	cin => \inst|Div0|auto_generated|divider|divider|op_5~26_cout\,
	sumout => \inst|Div0|auto_generated|divider|divider|op_5~21_sumout\,
	cout => \inst|Div0|auto_generated|divider|divider|op_5~22\);

-- Location: LABCELL_X36_Y18_N18
\inst|Div0|auto_generated|divider|divider|op_5~17\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|Div0|auto_generated|divider|divider|op_5~17_sumout\ = SUM(( !\inst3|Q[1]~_Duplicate_1_q\ ) + ( (!\inst|Div0|auto_generated|divider|divider|op_4~1_sumout\ & ((!\inst|Div0|auto_generated|divider|divider|sel\(3) & 
-- (\inst|Div0|auto_generated|divider|divider|op_4~17_sumout\)) # (\inst|Div0|auto_generated|divider|divider|sel\(3) & ((\inst2|DATA_OUT[4]~3_combout\))))) # (\inst|Div0|auto_generated|divider|divider|op_4~1_sumout\ & (((\inst2|DATA_OUT[4]~3_combout\)))) ) + 
-- ( \inst|Div0|auto_generated|divider|divider|op_5~22\ ))
-- \inst|Div0|auto_generated|divider|divider|op_5~18\ = CARRY(( !\inst3|Q[1]~_Duplicate_1_q\ ) + ( (!\inst|Div0|auto_generated|divider|divider|op_4~1_sumout\ & ((!\inst|Div0|auto_generated|divider|divider|sel\(3) & 
-- (\inst|Div0|auto_generated|divider|divider|op_4~17_sumout\)) # (\inst|Div0|auto_generated|divider|divider|sel\(3) & ((\inst2|DATA_OUT[4]~3_combout\))))) # (\inst|Div0|auto_generated|divider|divider|op_4~1_sumout\ & (((\inst2|DATA_OUT[4]~3_combout\)))) ) + 
-- ( \inst|Div0|auto_generated|divider|divider|op_5~22\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111101111000000000000000000000001111111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Div0|auto_generated|divider|divider|ALT_INV_op_4~1_sumout\,
	datab => \inst|Div0|auto_generated|divider|divider|ALT_INV_sel\(3),
	datac => \inst|Div0|auto_generated|divider|divider|ALT_INV_op_4~17_sumout\,
	datad => \inst3|ALT_INV_Q[1]~_Duplicate_1_q\,
	dataf => \inst2|ALT_INV_DATA_OUT[4]~3_combout\,
	cin => \inst|Div0|auto_generated|divider|divider|op_5~22\,
	sumout => \inst|Div0|auto_generated|divider|divider|op_5~17_sumout\,
	cout => \inst|Div0|auto_generated|divider|divider|op_5~18\);

-- Location: LABCELL_X36_Y18_N21
\inst|Div0|auto_generated|divider|divider|op_5~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|Div0|auto_generated|divider|divider|op_5~13_sumout\ = SUM(( (!\inst|Div0|auto_generated|divider|divider|op_4~1_sumout\ & ((!\inst|Div0|auto_generated|divider|divider|sel\(3) & (\inst|Div0|auto_generated|divider|divider|op_4~13_sumout\)) # 
-- (\inst|Div0|auto_generated|divider|divider|sel\(3) & ((\inst|Div0|auto_generated|divider|divider|StageOut[16]~14_combout\))))) # (\inst|Div0|auto_generated|divider|divider|op_4~1_sumout\ & 
-- (((\inst|Div0|auto_generated|divider|divider|StageOut[16]~14_combout\)))) ) + ( !\inst3|Q[2]~_Duplicate_1_q\ ) + ( \inst|Div0|auto_generated|divider|divider|op_5~18\ ))
-- \inst|Div0|auto_generated|divider|divider|op_5~14\ = CARRY(( (!\inst|Div0|auto_generated|divider|divider|op_4~1_sumout\ & ((!\inst|Div0|auto_generated|divider|divider|sel\(3) & (\inst|Div0|auto_generated|divider|divider|op_4~13_sumout\)) # 
-- (\inst|Div0|auto_generated|divider|divider|sel\(3) & ((\inst|Div0|auto_generated|divider|divider|StageOut[16]~14_combout\))))) # (\inst|Div0|auto_generated|divider|divider|op_4~1_sumout\ & 
-- (((\inst|Div0|auto_generated|divider|divider|StageOut[16]~14_combout\)))) ) + ( !\inst3|Q[2]~_Duplicate_1_q\ ) + ( \inst|Div0|auto_generated|divider|divider|op_5~18\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000001111111100000000000000000000100001111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Div0|auto_generated|divider|divider|ALT_INV_op_4~1_sumout\,
	datab => \inst|Div0|auto_generated|divider|divider|ALT_INV_sel\(3),
	datac => \inst|Div0|auto_generated|divider|divider|ALT_INV_op_4~13_sumout\,
	datad => \inst|Div0|auto_generated|divider|divider|ALT_INV_StageOut[16]~14_combout\,
	dataf => \inst3|ALT_INV_Q[2]~_Duplicate_1_q\,
	cin => \inst|Div0|auto_generated|divider|divider|op_5~18\,
	sumout => \inst|Div0|auto_generated|divider|divider|op_5~13_sumout\,
	cout => \inst|Div0|auto_generated|divider|divider|op_5~14\);

-- Location: LABCELL_X36_Y18_N24
\inst|Div0|auto_generated|divider|divider|op_5~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|Div0|auto_generated|divider|divider|op_5~9_sumout\ = SUM(( (!\inst|Div0|auto_generated|divider|divider|op_4~1_sumout\ & ((!\inst|Div0|auto_generated|divider|divider|sel\(3) & ((\inst|Div0|auto_generated|divider|divider|op_4~9_sumout\))) # 
-- (\inst|Div0|auto_generated|divider|divider|sel\(3) & (\inst|Div0|auto_generated|divider|divider|StageOut[17]~10_combout\)))) # (\inst|Div0|auto_generated|divider|divider|op_4~1_sumout\ & 
-- (((\inst|Div0|auto_generated|divider|divider|StageOut[17]~10_combout\)))) ) + ( !\inst3|Q[3]~_Duplicate_1_q\ ) + ( \inst|Div0|auto_generated|divider|divider|op_5~14\ ))
-- \inst|Div0|auto_generated|divider|divider|op_5~10\ = CARRY(( (!\inst|Div0|auto_generated|divider|divider|op_4~1_sumout\ & ((!\inst|Div0|auto_generated|divider|divider|sel\(3) & ((\inst|Div0|auto_generated|divider|divider|op_4~9_sumout\))) # 
-- (\inst|Div0|auto_generated|divider|divider|sel\(3) & (\inst|Div0|auto_generated|divider|divider|StageOut[17]~10_combout\)))) # (\inst|Div0|auto_generated|divider|divider|op_4~1_sumout\ & 
-- (((\inst|Div0|auto_generated|divider|divider|StageOut[17]~10_combout\)))) ) + ( !\inst3|Q[3]~_Duplicate_1_q\ ) + ( \inst|Div0|auto_generated|divider|divider|op_5~14\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000001111111100000000000000000000011110001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Div0|auto_generated|divider|divider|ALT_INV_op_4~1_sumout\,
	datab => \inst|Div0|auto_generated|divider|divider|ALT_INV_sel\(3),
	datac => \inst|Div0|auto_generated|divider|divider|ALT_INV_StageOut[17]~10_combout\,
	datad => \inst|Div0|auto_generated|divider|divider|ALT_INV_op_4~9_sumout\,
	dataf => \inst3|ALT_INV_Q[3]~_Duplicate_1_q\,
	cin => \inst|Div0|auto_generated|divider|divider|op_5~14\,
	sumout => \inst|Div0|auto_generated|divider|divider|op_5~9_sumout\,
	cout => \inst|Div0|auto_generated|divider|divider|op_5~10\);

-- Location: LABCELL_X36_Y18_N27
\inst|Div0|auto_generated|divider|divider|op_5~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|Div0|auto_generated|divider|divider|op_5~5_sumout\ = SUM(( (!\inst|Div0|auto_generated|divider|divider|op_4~1_sumout\ & ((!\inst|Div0|auto_generated|divider|divider|sel\(3) & ((\inst|Div0|auto_generated|divider|divider|op_4~5_sumout\))) # 
-- (\inst|Div0|auto_generated|divider|divider|sel\(3) & (\inst|Div0|auto_generated|divider|divider|StageOut[18]~3_combout\)))) # (\inst|Div0|auto_generated|divider|divider|op_4~1_sumout\ & 
-- (((\inst|Div0|auto_generated|divider|divider|StageOut[18]~3_combout\)))) ) + ( !\inst3|Q[4]~_Duplicate_1_q\ ) + ( \inst|Div0|auto_generated|divider|divider|op_5~10\ ))
-- \inst|Div0|auto_generated|divider|divider|op_5~6\ = CARRY(( (!\inst|Div0|auto_generated|divider|divider|op_4~1_sumout\ & ((!\inst|Div0|auto_generated|divider|divider|sel\(3) & ((\inst|Div0|auto_generated|divider|divider|op_4~5_sumout\))) # 
-- (\inst|Div0|auto_generated|divider|divider|sel\(3) & (\inst|Div0|auto_generated|divider|divider|StageOut[18]~3_combout\)))) # (\inst|Div0|auto_generated|divider|divider|op_4~1_sumout\ & 
-- (((\inst|Div0|auto_generated|divider|divider|StageOut[18]~3_combout\)))) ) + ( !\inst3|Q[4]~_Duplicate_1_q\ ) + ( \inst|Div0|auto_generated|divider|divider|op_5~10\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000001111111100000000000000000000011110001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Div0|auto_generated|divider|divider|ALT_INV_op_4~1_sumout\,
	datab => \inst|Div0|auto_generated|divider|divider|ALT_INV_sel\(3),
	datac => \inst|Div0|auto_generated|divider|divider|ALT_INV_StageOut[18]~3_combout\,
	datad => \inst|Div0|auto_generated|divider|divider|ALT_INV_op_4~5_sumout\,
	dataf => \inst3|ALT_INV_Q[4]~_Duplicate_1_q\,
	cin => \inst|Div0|auto_generated|divider|divider|op_5~10\,
	sumout => \inst|Div0|auto_generated|divider|divider|op_5~5_sumout\,
	cout => \inst|Div0|auto_generated|divider|divider|op_5~6\);

-- Location: LABCELL_X36_Y18_N9
\inst|Div0|auto_generated|divider|divider|StageOut[27]~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|Div0|auto_generated|divider|divider|StageOut[27]~4_combout\ = ( !\inst|Div0|auto_generated|divider|divider|op_4~1_sumout\ & ( (!\inst|Div0|auto_generated|divider|divider|sel\(3) & \inst|Div0|auto_generated|divider|divider|op_4~5_sumout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011110000000000001111000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \inst|Div0|auto_generated|divider|divider|ALT_INV_sel\(3),
	datad => \inst|Div0|auto_generated|divider|divider|ALT_INV_op_4~5_sumout\,
	dataf => \inst|Div0|auto_generated|divider|divider|ALT_INV_op_4~1_sumout\,
	combout => \inst|Div0|auto_generated|divider|divider|StageOut[27]~4_combout\);

-- Location: LABCELL_X36_Y18_N30
\inst|Div0|auto_generated|divider|divider|op_5~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|Div0|auto_generated|divider|divider|op_5~1_sumout\ = SUM(( VCC ) + ( GND ) + ( \inst|Div0|auto_generated|divider|divider|op_5~6\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000001111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	cin => \inst|Div0|auto_generated|divider|divider|op_5~6\,
	sumout => \inst|Div0|auto_generated|divider|divider|op_5~1_sumout\);

-- Location: LABCELL_X36_Y18_N0
\inst|Div0|auto_generated|divider|divider|selnose[36]\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|Div0|auto_generated|divider|divider|selnose\(36) = ( \inst|Div0|auto_generated|divider|divider|op_5~1_sumout\ ) # ( !\inst|Div0|auto_generated|divider|divider|op_5~1_sumout\ & ( \inst|Div0|auto_generated|divider|divider|sel\(4) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111000011110000111111111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \inst|Div0|auto_generated|divider|divider|ALT_INV_sel\(4),
	dataf => \inst|Div0|auto_generated|divider|divider|ALT_INV_op_5~1_sumout\,
	combout => \inst|Div0|auto_generated|divider|divider|selnose\(36));

-- Location: MLABCELL_X37_Y18_N36
\inst|Div0|auto_generated|divider|divider|StageOut[27]~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|Div0|auto_generated|divider|divider|StageOut[27]~5_combout\ = ( \inst|Div0|auto_generated|divider|divider|StageOut[18]~3_combout\ & ( (\inst|Div0|auto_generated|divider|divider|op_4~1_sumout\) # (\inst|Div0|auto_generated|divider|divider|sel\(3)) ) 
-- )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000001110111011101110111011101110111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Div0|auto_generated|divider|divider|ALT_INV_sel\(3),
	datab => \inst|Div0|auto_generated|divider|divider|ALT_INV_op_4~1_sumout\,
	dataf => \inst|Div0|auto_generated|divider|divider|ALT_INV_StageOut[18]~3_combout\,
	combout => \inst|Div0|auto_generated|divider|divider|StageOut[27]~5_combout\);

-- Location: LABCELL_X36_Y18_N3
\inst|Div0|auto_generated|divider|divider|StageOut[26]~11\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|Div0|auto_generated|divider|divider|StageOut[26]~11_combout\ = ( \inst|Div0|auto_generated|divider|divider|op_4~1_sumout\ & ( \inst|Div0|auto_generated|divider|divider|StageOut[17]~10_combout\ ) ) # ( 
-- !\inst|Div0|auto_generated|divider|divider|op_4~1_sumout\ & ( (!\inst|Div0|auto_generated|divider|divider|sel\(3) & ((\inst|Div0|auto_generated|divider|divider|op_4~9_sumout\))) # (\inst|Div0|auto_generated|divider|divider|sel\(3) & 
-- (\inst|Div0|auto_generated|divider|divider|StageOut[17]~10_combout\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010111110101000001011111010101010101010101010101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Div0|auto_generated|divider|divider|ALT_INV_StageOut[17]~10_combout\,
	datac => \inst|Div0|auto_generated|divider|divider|ALT_INV_sel\(3),
	datad => \inst|Div0|auto_generated|divider|divider|ALT_INV_op_4~9_sumout\,
	dataf => \inst|Div0|auto_generated|divider|divider|ALT_INV_op_4~1_sumout\,
	combout => \inst|Div0|auto_generated|divider|divider|StageOut[26]~11_combout\);

-- Location: MLABCELL_X37_Y18_N30
\inst|Div0|auto_generated|divider|divider|StageOut[25]~15\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|Div0|auto_generated|divider|divider|StageOut[25]~15_combout\ = ( \inst|Div0|auto_generated|divider|divider|op_4~1_sumout\ & ( \inst|Div0|auto_generated|divider|divider|StageOut[16]~14_combout\ ) ) # ( 
-- !\inst|Div0|auto_generated|divider|divider|op_4~1_sumout\ & ( (!\inst|Div0|auto_generated|divider|divider|sel\(3) & ((\inst|Div0|auto_generated|divider|divider|op_4~13_sumout\))) # (\inst|Div0|auto_generated|divider|divider|sel\(3) & 
-- (\inst|Div0|auto_generated|divider|divider|StageOut[16]~14_combout\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000001111110011000000111111001100110011001100110011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \inst|Div0|auto_generated|divider|divider|ALT_INV_StageOut[16]~14_combout\,
	datac => \inst|Div0|auto_generated|divider|divider|ALT_INV_sel\(3),
	datad => \inst|Div0|auto_generated|divider|divider|ALT_INV_op_4~13_sumout\,
	dataf => \inst|Div0|auto_generated|divider|divider|ALT_INV_op_4~1_sumout\,
	combout => \inst|Div0|auto_generated|divider|divider|StageOut[25]~15_combout\);

-- Location: MLABCELL_X37_Y18_N45
\inst|Div0|auto_generated|divider|divider|StageOut[24]~18\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|Div0|auto_generated|divider|divider|StageOut[24]~18_combout\ = ( \inst|Div0|auto_generated|divider|divider|op_4~1_sumout\ & ( \inst2|DATA_OUT[4]~3_combout\ ) ) # ( !\inst|Div0|auto_generated|divider|divider|op_4~1_sumout\ & ( 
-- (!\inst|Div0|auto_generated|divider|divider|sel\(3) & ((\inst|Div0|auto_generated|divider|divider|op_4~17_sumout\))) # (\inst|Div0|auto_generated|divider|divider|sel\(3) & (\inst2|DATA_OUT[4]~3_combout\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010111110101000001011111010101010101010101010101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|ALT_INV_DATA_OUT[4]~3_combout\,
	datac => \inst|Div0|auto_generated|divider|divider|ALT_INV_sel\(3),
	datad => \inst|Div0|auto_generated|divider|divider|ALT_INV_op_4~17_sumout\,
	dataf => \inst|Div0|auto_generated|divider|divider|ALT_INV_op_4~1_sumout\,
	combout => \inst|Div0|auto_generated|divider|divider|StageOut[24]~18_combout\);

-- Location: LABCELL_X36_Y18_N36
\inst|Div0|auto_generated|divider|divider|op_6~30\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|Div0|auto_generated|divider|divider|op_6~30_cout\ = CARRY(( VCC ) + ( VCC ) + ( !VCC ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000001111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	cin => GND,
	cout => \inst|Div0|auto_generated|divider|divider|op_6~30_cout\);

-- Location: LABCELL_X36_Y18_N39
\inst|Div0|auto_generated|divider|divider|op_6~25\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|Div0|auto_generated|divider|divider|op_6~25_sumout\ = SUM(( (!\inst14|SEL~combout\ & ((\inst4|Q\(2)))) # (\inst14|SEL~combout\ & (\inst5|Q\(2))) ) + ( !\inst3|Q[0]~_Duplicate_1_q\ ) + ( \inst|Div0|auto_generated|divider|divider|op_6~30_cout\ ))
-- \inst|Div0|auto_generated|divider|divider|op_6~26\ = CARRY(( (!\inst14|SEL~combout\ & ((\inst4|Q\(2)))) # (\inst14|SEL~combout\ & (\inst5|Q\(2))) ) + ( !\inst3|Q[0]~_Duplicate_1_q\ ) + ( \inst|Div0|auto_generated|divider|divider|op_6~30_cout\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000001100110011001100000000000000000000010110101111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst14|ALT_INV_SEL~combout\,
	datab => \inst3|ALT_INV_Q[0]~_Duplicate_1_q\,
	datac => \inst5|ALT_INV_Q\(2),
	datad => \inst4|ALT_INV_Q\(2),
	cin => \inst|Div0|auto_generated|divider|divider|op_6~30_cout\,
	sumout => \inst|Div0|auto_generated|divider|divider|op_6~25_sumout\,
	cout => \inst|Div0|auto_generated|divider|divider|op_6~26\);

-- Location: LABCELL_X36_Y18_N42
\inst|Div0|auto_generated|divider|divider|op_6~21\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|Div0|auto_generated|divider|divider|op_6~21_sumout\ = SUM(( !\inst3|Q[1]~_Duplicate_1_q\ ) + ( (!\inst|Div0|auto_generated|divider|divider|sel\(4) & ((!\inst|Div0|auto_generated|divider|divider|op_5~1_sumout\ & 
-- (\inst|Div0|auto_generated|divider|divider|op_5~21_sumout\)) # (\inst|Div0|auto_generated|divider|divider|op_5~1_sumout\ & ((\inst2|DATA_OUT[3]~4_combout\))))) # (\inst|Div0|auto_generated|divider|divider|sel\(4) & (((\inst2|DATA_OUT[3]~4_combout\)))) ) + 
-- ( \inst|Div0|auto_generated|divider|divider|op_6~26\ ))
-- \inst|Div0|auto_generated|divider|divider|op_6~22\ = CARRY(( !\inst3|Q[1]~_Duplicate_1_q\ ) + ( (!\inst|Div0|auto_generated|divider|divider|sel\(4) & ((!\inst|Div0|auto_generated|divider|divider|op_5~1_sumout\ & 
-- (\inst|Div0|auto_generated|divider|divider|op_5~21_sumout\)) # (\inst|Div0|auto_generated|divider|divider|op_5~1_sumout\ & ((\inst2|DATA_OUT[3]~4_combout\))))) # (\inst|Div0|auto_generated|divider|divider|sel\(4) & (((\inst2|DATA_OUT[3]~4_combout\)))) ) + 
-- ( \inst|Div0|auto_generated|divider|divider|op_6~26\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111101111000000000000000000000001111111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Div0|auto_generated|divider|divider|ALT_INV_sel\(4),
	datab => \inst|Div0|auto_generated|divider|divider|ALT_INV_op_5~1_sumout\,
	datac => \inst|Div0|auto_generated|divider|divider|ALT_INV_op_5~21_sumout\,
	datad => \inst3|ALT_INV_Q[1]~_Duplicate_1_q\,
	dataf => \inst2|ALT_INV_DATA_OUT[3]~4_combout\,
	cin => \inst|Div0|auto_generated|divider|divider|op_6~26\,
	sumout => \inst|Div0|auto_generated|divider|divider|op_6~21_sumout\,
	cout => \inst|Div0|auto_generated|divider|divider|op_6~22\);

-- Location: LABCELL_X36_Y18_N45
\inst|Div0|auto_generated|divider|divider|op_6~17\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|Div0|auto_generated|divider|divider|op_6~17_sumout\ = SUM(( (!\inst|Div0|auto_generated|divider|divider|sel\(4) & ((!\inst|Div0|auto_generated|divider|divider|op_5~1_sumout\ & (\inst|Div0|auto_generated|divider|divider|op_5~17_sumout\)) # 
-- (\inst|Div0|auto_generated|divider|divider|op_5~1_sumout\ & ((\inst|Div0|auto_generated|divider|divider|StageOut[24]~18_combout\))))) # (\inst|Div0|auto_generated|divider|divider|sel\(4) & 
-- (((\inst|Div0|auto_generated|divider|divider|StageOut[24]~18_combout\)))) ) + ( !\inst3|Q[2]~_Duplicate_1_q\ ) + ( \inst|Div0|auto_generated|divider|divider|op_6~22\ ))
-- \inst|Div0|auto_generated|divider|divider|op_6~18\ = CARRY(( (!\inst|Div0|auto_generated|divider|divider|sel\(4) & ((!\inst|Div0|auto_generated|divider|divider|op_5~1_sumout\ & (\inst|Div0|auto_generated|divider|divider|op_5~17_sumout\)) # 
-- (\inst|Div0|auto_generated|divider|divider|op_5~1_sumout\ & ((\inst|Div0|auto_generated|divider|divider|StageOut[24]~18_combout\))))) # (\inst|Div0|auto_generated|divider|divider|sel\(4) & 
-- (((\inst|Div0|auto_generated|divider|divider|StageOut[24]~18_combout\)))) ) + ( !\inst3|Q[2]~_Duplicate_1_q\ ) + ( \inst|Div0|auto_generated|divider|divider|op_6~22\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000001111111100000000000000000000100001111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Div0|auto_generated|divider|divider|ALT_INV_sel\(4),
	datab => \inst|Div0|auto_generated|divider|divider|ALT_INV_op_5~1_sumout\,
	datac => \inst|Div0|auto_generated|divider|divider|ALT_INV_op_5~17_sumout\,
	datad => \inst|Div0|auto_generated|divider|divider|ALT_INV_StageOut[24]~18_combout\,
	dataf => \inst3|ALT_INV_Q[2]~_Duplicate_1_q\,
	cin => \inst|Div0|auto_generated|divider|divider|op_6~22\,
	sumout => \inst|Div0|auto_generated|divider|divider|op_6~17_sumout\,
	cout => \inst|Div0|auto_generated|divider|divider|op_6~18\);

-- Location: LABCELL_X36_Y18_N48
\inst|Div0|auto_generated|divider|divider|op_6~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|Div0|auto_generated|divider|divider|op_6~13_sumout\ = SUM(( (!\inst|Div0|auto_generated|divider|divider|sel\(4) & ((!\inst|Div0|auto_generated|divider|divider|op_5~1_sumout\ & ((\inst|Div0|auto_generated|divider|divider|op_5~13_sumout\))) # 
-- (\inst|Div0|auto_generated|divider|divider|op_5~1_sumout\ & (\inst|Div0|auto_generated|divider|divider|StageOut[25]~15_combout\)))) # (\inst|Div0|auto_generated|divider|divider|sel\(4) & 
-- (((\inst|Div0|auto_generated|divider|divider|StageOut[25]~15_combout\)))) ) + ( !\inst3|Q[3]~_Duplicate_1_q\ ) + ( \inst|Div0|auto_generated|divider|divider|op_6~18\ ))
-- \inst|Div0|auto_generated|divider|divider|op_6~14\ = CARRY(( (!\inst|Div0|auto_generated|divider|divider|sel\(4) & ((!\inst|Div0|auto_generated|divider|divider|op_5~1_sumout\ & ((\inst|Div0|auto_generated|divider|divider|op_5~13_sumout\))) # 
-- (\inst|Div0|auto_generated|divider|divider|op_5~1_sumout\ & (\inst|Div0|auto_generated|divider|divider|StageOut[25]~15_combout\)))) # (\inst|Div0|auto_generated|divider|divider|sel\(4) & 
-- (((\inst|Div0|auto_generated|divider|divider|StageOut[25]~15_combout\)))) ) + ( !\inst3|Q[3]~_Duplicate_1_q\ ) + ( \inst|Div0|auto_generated|divider|divider|op_6~18\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000001111111100000000000000000000011110001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Div0|auto_generated|divider|divider|ALT_INV_sel\(4),
	datab => \inst|Div0|auto_generated|divider|divider|ALT_INV_op_5~1_sumout\,
	datac => \inst|Div0|auto_generated|divider|divider|ALT_INV_StageOut[25]~15_combout\,
	datad => \inst|Div0|auto_generated|divider|divider|ALT_INV_op_5~13_sumout\,
	dataf => \inst3|ALT_INV_Q[3]~_Duplicate_1_q\,
	cin => \inst|Div0|auto_generated|divider|divider|op_6~18\,
	sumout => \inst|Div0|auto_generated|divider|divider|op_6~13_sumout\,
	cout => \inst|Div0|auto_generated|divider|divider|op_6~14\);

-- Location: LABCELL_X36_Y18_N51
\inst|Div0|auto_generated|divider|divider|op_6~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|Div0|auto_generated|divider|divider|op_6~9_sumout\ = SUM(( !\inst3|Q[4]~_Duplicate_1_q\ ) + ( (!\inst|Div0|auto_generated|divider|divider|sel\(4) & ((!\inst|Div0|auto_generated|divider|divider|op_5~1_sumout\ & 
-- ((\inst|Div0|auto_generated|divider|divider|op_5~9_sumout\))) # (\inst|Div0|auto_generated|divider|divider|op_5~1_sumout\ & (\inst|Div0|auto_generated|divider|divider|StageOut[26]~11_combout\)))) # (\inst|Div0|auto_generated|divider|divider|sel\(4) & 
-- (((\inst|Div0|auto_generated|divider|divider|StageOut[26]~11_combout\)))) ) + ( \inst|Div0|auto_generated|divider|divider|op_6~14\ ))
-- \inst|Div0|auto_generated|divider|divider|op_6~10\ = CARRY(( !\inst3|Q[4]~_Duplicate_1_q\ ) + ( (!\inst|Div0|auto_generated|divider|divider|sel\(4) & ((!\inst|Div0|auto_generated|divider|divider|op_5~1_sumout\ & 
-- ((\inst|Div0|auto_generated|divider|divider|op_5~9_sumout\))) # (\inst|Div0|auto_generated|divider|divider|op_5~1_sumout\ & (\inst|Div0|auto_generated|divider|divider|StageOut[26]~11_combout\)))) # (\inst|Div0|auto_generated|divider|divider|sel\(4) & 
-- (((\inst|Div0|auto_generated|divider|divider|StageOut[26]~11_combout\)))) ) + ( \inst|Div0|auto_generated|divider|divider|op_6~14\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111110000111000000000000000000001111111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Div0|auto_generated|divider|divider|ALT_INV_sel\(4),
	datab => \inst|Div0|auto_generated|divider|divider|ALT_INV_op_5~1_sumout\,
	datac => \inst|Div0|auto_generated|divider|divider|ALT_INV_StageOut[26]~11_combout\,
	datad => \inst3|ALT_INV_Q[4]~_Duplicate_1_q\,
	dataf => \inst|Div0|auto_generated|divider|divider|ALT_INV_op_5~9_sumout\,
	cin => \inst|Div0|auto_generated|divider|divider|op_6~14\,
	sumout => \inst|Div0|auto_generated|divider|divider|op_6~9_sumout\,
	cout => \inst|Div0|auto_generated|divider|divider|op_6~10\);

-- Location: LABCELL_X36_Y18_N54
\inst|Div0|auto_generated|divider|divider|op_6~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|Div0|auto_generated|divider|divider|op_6~5_sumout\ = SUM(( (!\inst|Div0|auto_generated|divider|divider|selnose\(36) & (\inst|Div0|auto_generated|divider|divider|op_5~5_sumout\)) # (\inst|Div0|auto_generated|divider|divider|selnose\(36) & 
-- (((\inst|Div0|auto_generated|divider|divider|StageOut[27]~5_combout\) # (\inst|Div0|auto_generated|divider|divider|StageOut[27]~4_combout\)))) ) + ( !\inst3|Q[5]~_Duplicate_1_q\ ) + ( \inst|Div0|auto_generated|divider|divider|op_6~10\ ))
-- \inst|Div0|auto_generated|divider|divider|op_6~6\ = CARRY(( (!\inst|Div0|auto_generated|divider|divider|selnose\(36) & (\inst|Div0|auto_generated|divider|divider|op_5~5_sumout\)) # (\inst|Div0|auto_generated|divider|divider|selnose\(36) & 
-- (((\inst|Div0|auto_generated|divider|divider|StageOut[27]~5_combout\) # (\inst|Div0|auto_generated|divider|divider|StageOut[27]~4_combout\)))) ) + ( !\inst3|Q[5]~_Duplicate_1_q\ ) + ( \inst|Div0|auto_generated|divider|divider|op_6~10\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000001111111100000000000000000101001101011111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Div0|auto_generated|divider|divider|ALT_INV_op_5~5_sumout\,
	datab => \inst|Div0|auto_generated|divider|divider|ALT_INV_StageOut[27]~4_combout\,
	datac => \inst|Div0|auto_generated|divider|divider|ALT_INV_selnose\(36),
	datad => \inst|Div0|auto_generated|divider|divider|ALT_INV_StageOut[27]~5_combout\,
	dataf => \inst3|ALT_INV_Q[5]~_Duplicate_1_q\,
	cin => \inst|Div0|auto_generated|divider|divider|op_6~10\,
	sumout => \inst|Div0|auto_generated|divider|divider|op_6~5_sumout\,
	cout => \inst|Div0|auto_generated|divider|divider|op_6~6\);

-- Location: LABCELL_X36_Y18_N57
\inst|Div0|auto_generated|divider|divider|op_6~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|Div0|auto_generated|divider|divider|op_6~1_sumout\ = SUM(( VCC ) + ( GND ) + ( \inst|Div0|auto_generated|divider|divider|op_6~6\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000001111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	cin => \inst|Div0|auto_generated|divider|divider|op_6~6\,
	sumout => \inst|Div0|auto_generated|divider|divider|op_6~1_sumout\);

-- Location: LABCELL_X35_Y18_N12
\inst|Div0|auto_generated|divider|divider|StageOut[36]~6\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|Div0|auto_generated|divider|divider|StageOut[36]~6_combout\ = ( \inst|Div0|auto_generated|divider|divider|op_5~1_sumout\ & ( (\inst|Div0|auto_generated|divider|divider|StageOut[27]~4_combout\) # 
-- (\inst|Div0|auto_generated|divider|divider|StageOut[27]~5_combout\) ) ) # ( !\inst|Div0|auto_generated|divider|divider|op_5~1_sumout\ & ( (!\inst|Div0|auto_generated|divider|divider|sel\(4) & (((\inst|Div0|auto_generated|divider|divider|op_5~5_sumout\)))) 
-- # (\inst|Div0|auto_generated|divider|divider|sel\(4) & (((\inst|Div0|auto_generated|divider|divider|StageOut[27]~4_combout\)) # (\inst|Div0|auto_generated|divider|divider|StageOut[27]~5_combout\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001001111011111000100111101111101011111010111110101111101011111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Div0|auto_generated|divider|divider|ALT_INV_StageOut[27]~5_combout\,
	datab => \inst|Div0|auto_generated|divider|divider|ALT_INV_sel\(4),
	datac => \inst|Div0|auto_generated|divider|divider|ALT_INV_StageOut[27]~4_combout\,
	datad => \inst|Div0|auto_generated|divider|divider|ALT_INV_op_5~5_sumout\,
	dataf => \inst|Div0|auto_generated|divider|divider|ALT_INV_op_5~1_sumout\,
	combout => \inst|Div0|auto_generated|divider|divider|StageOut[36]~6_combout\);

-- Location: LABCELL_X35_Y18_N21
\inst|Div0|auto_generated|divider|divider|StageOut[35]~12\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|Div0|auto_generated|divider|divider|StageOut[35]~12_combout\ = ( \inst|Div0|auto_generated|divider|divider|op_5~1_sumout\ & ( \inst|Div0|auto_generated|divider|divider|StageOut[26]~11_combout\ ) ) # ( 
-- !\inst|Div0|auto_generated|divider|divider|op_5~1_sumout\ & ( (!\inst|Div0|auto_generated|divider|divider|sel\(4) & (\inst|Div0|auto_generated|divider|divider|op_5~9_sumout\)) # (\inst|Div0|auto_generated|divider|divider|sel\(4) & 
-- ((\inst|Div0|auto_generated|divider|divider|StageOut[26]~11_combout\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000101001011111000010100101111100000000111111110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Div0|auto_generated|divider|divider|ALT_INV_sel\(4),
	datac => \inst|Div0|auto_generated|divider|divider|ALT_INV_op_5~9_sumout\,
	datad => \inst|Div0|auto_generated|divider|divider|ALT_INV_StageOut[26]~11_combout\,
	dataf => \inst|Div0|auto_generated|divider|divider|ALT_INV_op_5~1_sumout\,
	combout => \inst|Div0|auto_generated|divider|divider|StageOut[35]~12_combout\);

-- Location: LABCELL_X36_Y18_N6
\inst|Div0|auto_generated|divider|divider|StageOut[34]~16\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|Div0|auto_generated|divider|divider|StageOut[34]~16_combout\ = ( \inst|Div0|auto_generated|divider|divider|op_5~1_sumout\ & ( \inst|Div0|auto_generated|divider|divider|StageOut[25]~15_combout\ ) ) # ( 
-- !\inst|Div0|auto_generated|divider|divider|op_5~1_sumout\ & ( (!\inst|Div0|auto_generated|divider|divider|sel\(4) & ((\inst|Div0|auto_generated|divider|divider|op_5~13_sumout\))) # (\inst|Div0|auto_generated|divider|divider|sel\(4) & 
-- (\inst|Div0|auto_generated|divider|divider|StageOut[25]~15_combout\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010110101111000001011010111100001111000011110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Div0|auto_generated|divider|divider|ALT_INV_sel\(4),
	datac => \inst|Div0|auto_generated|divider|divider|ALT_INV_StageOut[25]~15_combout\,
	datad => \inst|Div0|auto_generated|divider|divider|ALT_INV_op_5~13_sumout\,
	dataf => \inst|Div0|auto_generated|divider|divider|ALT_INV_op_5~1_sumout\,
	combout => \inst|Div0|auto_generated|divider|divider|StageOut[34]~16_combout\);

-- Location: LABCELL_X35_Y18_N9
\inst|Div0|auto_generated|divider|divider|StageOut[33]~19\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|Div0|auto_generated|divider|divider|StageOut[33]~19_combout\ = ( \inst|Div0|auto_generated|divider|divider|op_5~1_sumout\ & ( \inst|Div0|auto_generated|divider|divider|StageOut[24]~18_combout\ ) ) # ( 
-- !\inst|Div0|auto_generated|divider|divider|op_5~1_sumout\ & ( (!\inst|Div0|auto_generated|divider|divider|sel\(4) & ((\inst|Div0|auto_generated|divider|divider|op_5~17_sumout\))) # (\inst|Div0|auto_generated|divider|divider|sel\(4) & 
-- (\inst|Div0|auto_generated|divider|divider|StageOut[24]~18_combout\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010110101111000001011010111100001111000011110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Div0|auto_generated|divider|divider|ALT_INV_sel\(4),
	datac => \inst|Div0|auto_generated|divider|divider|ALT_INV_StageOut[24]~18_combout\,
	datad => \inst|Div0|auto_generated|divider|divider|ALT_INV_op_5~17_sumout\,
	dataf => \inst|Div0|auto_generated|divider|divider|ALT_INV_op_5~1_sumout\,
	combout => \inst|Div0|auto_generated|divider|divider|StageOut[33]~19_combout\);

-- Location: LABCELL_X35_Y18_N54
\inst|Div0|auto_generated|divider|divider|StageOut[32]~21\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|Div0|auto_generated|divider|divider|StageOut[32]~21_combout\ = ( \inst|Div0|auto_generated|divider|divider|op_5~1_sumout\ & ( \inst2|DATA_OUT[3]~4_combout\ ) ) # ( !\inst|Div0|auto_generated|divider|divider|op_5~1_sumout\ & ( 
-- (!\inst|Div0|auto_generated|divider|divider|sel\(4) & ((\inst|Div0|auto_generated|divider|divider|op_5~21_sumout\))) # (\inst|Div0|auto_generated|divider|divider|sel\(4) & (\inst2|DATA_OUT[3]~4_combout\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000001111110011000000111111001100110011001100110011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \inst2|ALT_INV_DATA_OUT[3]~4_combout\,
	datac => \inst|Div0|auto_generated|divider|divider|ALT_INV_sel\(4),
	datad => \inst|Div0|auto_generated|divider|divider|ALT_INV_op_5~21_sumout\,
	dataf => \inst|Div0|auto_generated|divider|divider|ALT_INV_op_5~1_sumout\,
	combout => \inst|Div0|auto_generated|divider|divider|StageOut[32]~21_combout\);

-- Location: LABCELL_X35_Y18_N24
\inst|Div0|auto_generated|divider|divider|op_7~34\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|Div0|auto_generated|divider|divider|op_7~34_cout\ = CARRY(( VCC ) + ( VCC ) + ( !VCC ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000001111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	cin => GND,
	cout => \inst|Div0|auto_generated|divider|divider|op_7~34_cout\);

-- Location: LABCELL_X35_Y18_N27
\inst|Div0|auto_generated|divider|divider|op_7~29\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|Div0|auto_generated|divider|divider|op_7~29_sumout\ = SUM(( !\inst3|Q[0]~_Duplicate_1_q\ ) + ( (!\inst14|SEL~combout\ & ((\inst4|Q\(1)))) # (\inst14|SEL~combout\ & (\inst5|Q\(1))) ) + ( \inst|Div0|auto_generated|divider|divider|op_7~34_cout\ ))
-- \inst|Div0|auto_generated|divider|divider|op_7~30\ = CARRY(( !\inst3|Q[0]~_Duplicate_1_q\ ) + ( (!\inst14|SEL~combout\ & ((\inst4|Q\(1)))) # (\inst14|SEL~combout\ & (\inst5|Q\(1))) ) + ( \inst|Div0|auto_generated|divider|divider|op_7~34_cout\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111011100010001000000000000000001111000011110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst5|ALT_INV_Q\(1),
	datab => \inst14|ALT_INV_SEL~combout\,
	datac => \inst3|ALT_INV_Q[0]~_Duplicate_1_q\,
	dataf => \inst4|ALT_INV_Q\(1),
	cin => \inst|Div0|auto_generated|divider|divider|op_7~34_cout\,
	sumout => \inst|Div0|auto_generated|divider|divider|op_7~29_sumout\,
	cout => \inst|Div0|auto_generated|divider|divider|op_7~30\);

-- Location: LABCELL_X35_Y18_N30
\inst|Div0|auto_generated|divider|divider|op_7~25\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|Div0|auto_generated|divider|divider|op_7~25_sumout\ = SUM(( (!\inst|Div0|auto_generated|divider|divider|sel\(5) & ((!\inst|Div0|auto_generated|divider|divider|op_6~1_sumout\ & (\inst|Div0|auto_generated|divider|divider|op_6~25_sumout\)) # 
-- (\inst|Div0|auto_generated|divider|divider|op_6~1_sumout\ & ((\inst2|DATA_OUT[2]~5_combout\))))) # (\inst|Div0|auto_generated|divider|divider|sel\(5) & (((\inst2|DATA_OUT[2]~5_combout\)))) ) + ( !\inst3|Q[1]~_Duplicate_1_q\ ) + ( 
-- \inst|Div0|auto_generated|divider|divider|op_7~30\ ))
-- \inst|Div0|auto_generated|divider|divider|op_7~26\ = CARRY(( (!\inst|Div0|auto_generated|divider|divider|sel\(5) & ((!\inst|Div0|auto_generated|divider|divider|op_6~1_sumout\ & (\inst|Div0|auto_generated|divider|divider|op_6~25_sumout\)) # 
-- (\inst|Div0|auto_generated|divider|divider|op_6~1_sumout\ & ((\inst2|DATA_OUT[2]~5_combout\))))) # (\inst|Div0|auto_generated|divider|divider|sel\(5) & (((\inst2|DATA_OUT[2]~5_combout\)))) ) + ( !\inst3|Q[1]~_Duplicate_1_q\ ) + ( 
-- \inst|Div0|auto_generated|divider|divider|op_7~30\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000001111111100000000000000000000100001111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Div0|auto_generated|divider|divider|ALT_INV_sel\(5),
	datab => \inst|Div0|auto_generated|divider|divider|ALT_INV_op_6~1_sumout\,
	datac => \inst|Div0|auto_generated|divider|divider|ALT_INV_op_6~25_sumout\,
	datad => \inst2|ALT_INV_DATA_OUT[2]~5_combout\,
	dataf => \inst3|ALT_INV_Q[1]~_Duplicate_1_q\,
	cin => \inst|Div0|auto_generated|divider|divider|op_7~30\,
	sumout => \inst|Div0|auto_generated|divider|divider|op_7~25_sumout\,
	cout => \inst|Div0|auto_generated|divider|divider|op_7~26\);

-- Location: LABCELL_X35_Y18_N33
\inst|Div0|auto_generated|divider|divider|op_7~21\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|Div0|auto_generated|divider|divider|op_7~21_sumout\ = SUM(( (!\inst|Div0|auto_generated|divider|divider|sel\(5) & ((!\inst|Div0|auto_generated|divider|divider|op_6~1_sumout\ & (\inst|Div0|auto_generated|divider|divider|op_6~21_sumout\)) # 
-- (\inst|Div0|auto_generated|divider|divider|op_6~1_sumout\ & ((\inst|Div0|auto_generated|divider|divider|StageOut[32]~21_combout\))))) # (\inst|Div0|auto_generated|divider|divider|sel\(5) & 
-- (((\inst|Div0|auto_generated|divider|divider|StageOut[32]~21_combout\)))) ) + ( !\inst3|Q[2]~_Duplicate_1_q\ ) + ( \inst|Div0|auto_generated|divider|divider|op_7~26\ ))
-- \inst|Div0|auto_generated|divider|divider|op_7~22\ = CARRY(( (!\inst|Div0|auto_generated|divider|divider|sel\(5) & ((!\inst|Div0|auto_generated|divider|divider|op_6~1_sumout\ & (\inst|Div0|auto_generated|divider|divider|op_6~21_sumout\)) # 
-- (\inst|Div0|auto_generated|divider|divider|op_6~1_sumout\ & ((\inst|Div0|auto_generated|divider|divider|StageOut[32]~21_combout\))))) # (\inst|Div0|auto_generated|divider|divider|sel\(5) & 
-- (((\inst|Div0|auto_generated|divider|divider|StageOut[32]~21_combout\)))) ) + ( !\inst3|Q[2]~_Duplicate_1_q\ ) + ( \inst|Div0|auto_generated|divider|divider|op_7~26\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000001111111100000000000000000000100001111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Div0|auto_generated|divider|divider|ALT_INV_sel\(5),
	datab => \inst|Div0|auto_generated|divider|divider|ALT_INV_op_6~1_sumout\,
	datac => \inst|Div0|auto_generated|divider|divider|ALT_INV_op_6~21_sumout\,
	datad => \inst|Div0|auto_generated|divider|divider|ALT_INV_StageOut[32]~21_combout\,
	dataf => \inst3|ALT_INV_Q[2]~_Duplicate_1_q\,
	cin => \inst|Div0|auto_generated|divider|divider|op_7~26\,
	sumout => \inst|Div0|auto_generated|divider|divider|op_7~21_sumout\,
	cout => \inst|Div0|auto_generated|divider|divider|op_7~22\);

-- Location: LABCELL_X35_Y18_N36
\inst|Div0|auto_generated|divider|divider|op_7~17\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|Div0|auto_generated|divider|divider|op_7~17_sumout\ = SUM(( (!\inst|Div0|auto_generated|divider|divider|sel\(5) & ((!\inst|Div0|auto_generated|divider|divider|op_6~1_sumout\ & ((\inst|Div0|auto_generated|divider|divider|op_6~17_sumout\))) # 
-- (\inst|Div0|auto_generated|divider|divider|op_6~1_sumout\ & (\inst|Div0|auto_generated|divider|divider|StageOut[33]~19_combout\)))) # (\inst|Div0|auto_generated|divider|divider|sel\(5) & 
-- (((\inst|Div0|auto_generated|divider|divider|StageOut[33]~19_combout\)))) ) + ( !\inst3|Q[3]~_Duplicate_1_q\ ) + ( \inst|Div0|auto_generated|divider|divider|op_7~22\ ))
-- \inst|Div0|auto_generated|divider|divider|op_7~18\ = CARRY(( (!\inst|Div0|auto_generated|divider|divider|sel\(5) & ((!\inst|Div0|auto_generated|divider|divider|op_6~1_sumout\ & ((\inst|Div0|auto_generated|divider|divider|op_6~17_sumout\))) # 
-- (\inst|Div0|auto_generated|divider|divider|op_6~1_sumout\ & (\inst|Div0|auto_generated|divider|divider|StageOut[33]~19_combout\)))) # (\inst|Div0|auto_generated|divider|divider|sel\(5) & 
-- (((\inst|Div0|auto_generated|divider|divider|StageOut[33]~19_combout\)))) ) + ( !\inst3|Q[3]~_Duplicate_1_q\ ) + ( \inst|Div0|auto_generated|divider|divider|op_7~22\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000001111111100000000000000000000011110001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Div0|auto_generated|divider|divider|ALT_INV_sel\(5),
	datab => \inst|Div0|auto_generated|divider|divider|ALT_INV_op_6~1_sumout\,
	datac => \inst|Div0|auto_generated|divider|divider|ALT_INV_StageOut[33]~19_combout\,
	datad => \inst|Div0|auto_generated|divider|divider|ALT_INV_op_6~17_sumout\,
	dataf => \inst3|ALT_INV_Q[3]~_Duplicate_1_q\,
	cin => \inst|Div0|auto_generated|divider|divider|op_7~22\,
	sumout => \inst|Div0|auto_generated|divider|divider|op_7~17_sumout\,
	cout => \inst|Div0|auto_generated|divider|divider|op_7~18\);

-- Location: LABCELL_X35_Y18_N39
\inst|Div0|auto_generated|divider|divider|op_7~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|Div0|auto_generated|divider|divider|op_7~13_sumout\ = SUM(( (!\inst|Div0|auto_generated|divider|divider|sel\(5) & ((!\inst|Div0|auto_generated|divider|divider|op_6~1_sumout\ & ((\inst|Div0|auto_generated|divider|divider|op_6~13_sumout\))) # 
-- (\inst|Div0|auto_generated|divider|divider|op_6~1_sumout\ & (\inst|Div0|auto_generated|divider|divider|StageOut[34]~16_combout\)))) # (\inst|Div0|auto_generated|divider|divider|sel\(5) & 
-- (((\inst|Div0|auto_generated|divider|divider|StageOut[34]~16_combout\)))) ) + ( !\inst3|Q[4]~_Duplicate_1_q\ ) + ( \inst|Div0|auto_generated|divider|divider|op_7~18\ ))
-- \inst|Div0|auto_generated|divider|divider|op_7~14\ = CARRY(( (!\inst|Div0|auto_generated|divider|divider|sel\(5) & ((!\inst|Div0|auto_generated|divider|divider|op_6~1_sumout\ & ((\inst|Div0|auto_generated|divider|divider|op_6~13_sumout\))) # 
-- (\inst|Div0|auto_generated|divider|divider|op_6~1_sumout\ & (\inst|Div0|auto_generated|divider|divider|StageOut[34]~16_combout\)))) # (\inst|Div0|auto_generated|divider|divider|sel\(5) & 
-- (((\inst|Div0|auto_generated|divider|divider|StageOut[34]~16_combout\)))) ) + ( !\inst3|Q[4]~_Duplicate_1_q\ ) + ( \inst|Div0|auto_generated|divider|divider|op_7~18\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000001111111100000000000000000000011110001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Div0|auto_generated|divider|divider|ALT_INV_sel\(5),
	datab => \inst|Div0|auto_generated|divider|divider|ALT_INV_op_6~1_sumout\,
	datac => \inst|Div0|auto_generated|divider|divider|ALT_INV_StageOut[34]~16_combout\,
	datad => \inst|Div0|auto_generated|divider|divider|ALT_INV_op_6~13_sumout\,
	dataf => \inst3|ALT_INV_Q[4]~_Duplicate_1_q\,
	cin => \inst|Div0|auto_generated|divider|divider|op_7~18\,
	sumout => \inst|Div0|auto_generated|divider|divider|op_7~13_sumout\,
	cout => \inst|Div0|auto_generated|divider|divider|op_7~14\);

-- Location: LABCELL_X35_Y18_N42
\inst|Div0|auto_generated|divider|divider|op_7~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|Div0|auto_generated|divider|divider|op_7~9_sumout\ = SUM(( (!\inst|Div0|auto_generated|divider|divider|sel\(5) & ((!\inst|Div0|auto_generated|divider|divider|op_6~1_sumout\ & ((\inst|Div0|auto_generated|divider|divider|op_6~9_sumout\))) # 
-- (\inst|Div0|auto_generated|divider|divider|op_6~1_sumout\ & (\inst|Div0|auto_generated|divider|divider|StageOut[35]~12_combout\)))) # (\inst|Div0|auto_generated|divider|divider|sel\(5) & 
-- (((\inst|Div0|auto_generated|divider|divider|StageOut[35]~12_combout\)))) ) + ( !\inst3|Q[5]~_Duplicate_1_q\ ) + ( \inst|Div0|auto_generated|divider|divider|op_7~14\ ))
-- \inst|Div0|auto_generated|divider|divider|op_7~10\ = CARRY(( (!\inst|Div0|auto_generated|divider|divider|sel\(5) & ((!\inst|Div0|auto_generated|divider|divider|op_6~1_sumout\ & ((\inst|Div0|auto_generated|divider|divider|op_6~9_sumout\))) # 
-- (\inst|Div0|auto_generated|divider|divider|op_6~1_sumout\ & (\inst|Div0|auto_generated|divider|divider|StageOut[35]~12_combout\)))) # (\inst|Div0|auto_generated|divider|divider|sel\(5) & 
-- (((\inst|Div0|auto_generated|divider|divider|StageOut[35]~12_combout\)))) ) + ( !\inst3|Q[5]~_Duplicate_1_q\ ) + ( \inst|Div0|auto_generated|divider|divider|op_7~14\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000001111111100000000000000000000011110001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Div0|auto_generated|divider|divider|ALT_INV_sel\(5),
	datab => \inst|Div0|auto_generated|divider|divider|ALT_INV_op_6~1_sumout\,
	datac => \inst|Div0|auto_generated|divider|divider|ALT_INV_StageOut[35]~12_combout\,
	datad => \inst|Div0|auto_generated|divider|divider|ALT_INV_op_6~9_sumout\,
	dataf => \inst3|ALT_INV_Q[5]~_Duplicate_1_q\,
	cin => \inst|Div0|auto_generated|divider|divider|op_7~14\,
	sumout => \inst|Div0|auto_generated|divider|divider|op_7~9_sumout\,
	cout => \inst|Div0|auto_generated|divider|divider|op_7~10\);

-- Location: LABCELL_X35_Y18_N45
\inst|Div0|auto_generated|divider|divider|op_7~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|Div0|auto_generated|divider|divider|op_7~5_sumout\ = SUM(( (!\inst|Div0|auto_generated|divider|divider|sel\(5) & ((!\inst|Div0|auto_generated|divider|divider|op_6~1_sumout\ & ((\inst|Div0|auto_generated|divider|divider|op_6~5_sumout\))) # 
-- (\inst|Div0|auto_generated|divider|divider|op_6~1_sumout\ & (\inst|Div0|auto_generated|divider|divider|StageOut[36]~6_combout\)))) # (\inst|Div0|auto_generated|divider|divider|sel\(5) & 
-- (((\inst|Div0|auto_generated|divider|divider|StageOut[36]~6_combout\)))) ) + ( !\inst3|Q[6]~_Duplicate_1_q\ ) + ( \inst|Div0|auto_generated|divider|divider|op_7~10\ ))
-- \inst|Div0|auto_generated|divider|divider|op_7~6\ = CARRY(( (!\inst|Div0|auto_generated|divider|divider|sel\(5) & ((!\inst|Div0|auto_generated|divider|divider|op_6~1_sumout\ & ((\inst|Div0|auto_generated|divider|divider|op_6~5_sumout\))) # 
-- (\inst|Div0|auto_generated|divider|divider|op_6~1_sumout\ & (\inst|Div0|auto_generated|divider|divider|StageOut[36]~6_combout\)))) # (\inst|Div0|auto_generated|divider|divider|sel\(5) & 
-- (((\inst|Div0|auto_generated|divider|divider|StageOut[36]~6_combout\)))) ) + ( !\inst3|Q[6]~_Duplicate_1_q\ ) + ( \inst|Div0|auto_generated|divider|divider|op_7~10\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000001111111100000000000000000000011110001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Div0|auto_generated|divider|divider|ALT_INV_sel\(5),
	datab => \inst|Div0|auto_generated|divider|divider|ALT_INV_op_6~1_sumout\,
	datac => \inst|Div0|auto_generated|divider|divider|ALT_INV_StageOut[36]~6_combout\,
	datad => \inst|Div0|auto_generated|divider|divider|ALT_INV_op_6~5_sumout\,
	dataf => \inst3|ALT_INV_Q[6]~_Duplicate_1_q\,
	cin => \inst|Div0|auto_generated|divider|divider|op_7~10\,
	sumout => \inst|Div0|auto_generated|divider|divider|op_7~5_sumout\,
	cout => \inst|Div0|auto_generated|divider|divider|op_7~6\);

-- Location: LABCELL_X35_Y18_N48
\inst|Div0|auto_generated|divider|divider|op_7~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|Div0|auto_generated|divider|divider|op_7~1_sumout\ = SUM(( VCC ) + ( GND ) + ( \inst|Div0|auto_generated|divider|divider|op_7~6\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000001111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	cin => \inst|Div0|auto_generated|divider|divider|op_7~6\,
	sumout => \inst|Div0|auto_generated|divider|divider|op_7~1_sumout\);

-- Location: LABCELL_X36_Y17_N42
\inst|Mux6~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|Mux6~0_combout\ = ( \OP[0]~input_o\ & ( \inst|Div0|auto_generated|divider|divider|op_7~1_sumout\ & ( (!\OP[1]~input_o\ & \inst|Mux6~1_combout\) ) ) ) # ( !\OP[0]~input_o\ & ( \inst|Div0|auto_generated|divider|divider|op_7~1_sumout\ & ( 
-- (\inst|Mux6~1_combout\ & ((!\OP[1]~input_o\) # (\inst|Mult0~9\))) ) ) ) # ( \OP[0]~input_o\ & ( !\inst|Div0|auto_generated|divider|divider|op_7~1_sumout\ & ( (\inst|Mux6~1_combout\ & ((!\OP[1]~input_o\) # (!\inst3|Q[7]~_Duplicate_1_q\))) ) ) ) # ( 
-- !\OP[0]~input_o\ & ( !\inst|Div0|auto_generated|divider|divider|op_7~1_sumout\ & ( (\inst|Mux6~1_combout\ & ((!\OP[1]~input_o\) # (\inst|Mult0~9\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010001100100011001100110010001000100011001000110010001000100010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_OP[1]~input_o\,
	datab => \inst|ALT_INV_Mux6~1_combout\,
	datac => \inst|ALT_INV_Mult0~9\,
	datad => \inst3|ALT_INV_Q[7]~_Duplicate_1_q\,
	datae => \ALT_INV_OP[0]~input_o\,
	dataf => \inst|Div0|auto_generated|divider|divider|ALT_INV_op_7~1_sumout\,
	combout => \inst|Mux6~0_combout\);

-- Location: FF_X36_Y17_N47
\inst5|Q[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst14|WRC~combout\,
	asdata => \inst|Mux6~0_combout\,
	clrn => \ALT_INV_RST_C~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst5|Q\(1));

-- Location: LABCELL_X36_Y17_N48
\inst2|DATA_OUT[1]~6\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst2|DATA_OUT[1]~6_combout\ = ( \inst4|Q\(1) & ( \inst14|SEL~combout\ & ( \inst5|Q\(1) ) ) ) # ( !\inst4|Q\(1) & ( \inst14|SEL~combout\ & ( \inst5|Q\(1) ) ) ) # ( \inst4|Q\(1) & ( !\inst14|SEL~combout\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100110011001100110011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \inst5|ALT_INV_Q\(1),
	datae => \inst4|ALT_INV_Q\(1),
	dataf => \inst14|ALT_INV_SEL~combout\,
	combout => \inst2|DATA_OUT[1]~6_combout\);

-- Location: LABCELL_X35_Y19_N36
\inst|Mux5~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|Mux5~0_combout\ = ( \inst|Div0|auto_generated|divider|divider|op_6~1_sumout\ & ( (!\OP[0]~input_o\ & \inst|Mult0~10\) ) ) # ( !\inst|Div0|auto_generated|divider|divider|op_6~1_sumout\ & ( (!\OP[0]~input_o\ & (\inst|Mult0~10\)) # (\OP[0]~input_o\ & 
-- ((!\inst|Div0|auto_generated|divider|divider|sel\(5)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011111100001100001111110000110000001100000011000000110000001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_OP[0]~input_o\,
	datac => \inst|ALT_INV_Mult0~10\,
	datad => \inst|Div0|auto_generated|divider|divider|ALT_INV_sel\(5),
	dataf => \inst|Div0|auto_generated|divider|divider|ALT_INV_op_6~1_sumout\,
	combout => \inst|Mux5~0_combout\);

-- Location: LABCELL_X36_Y19_N39
\inst|Add0~21\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|Add0~21_sumout\ = SUM(( !\OP[0]~input_o\ $ (!\inst3|Q[2]~_Duplicate_1_q\) ) + ( (!\inst14|SEL~combout\ & ((\inst4|Q\(2)))) # (\inst14|SEL~combout\ & (\inst5|Q\(2))) ) + ( \inst|Add0~26\ ))
-- \inst|Add0~22\ = CARRY(( !\OP[0]~input_o\ $ (!\inst3|Q[2]~_Duplicate_1_q\) ) + ( (!\inst14|SEL~combout\ & ((\inst4|Q\(2)))) # (\inst14|SEL~combout\ & (\inst5|Q\(2))) ) + ( \inst|Add0~26\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111000011000000000000000000000101010110101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_OP[0]~input_o\,
	datab => \inst14|ALT_INV_SEL~combout\,
	datac => \inst5|ALT_INV_Q\(2),
	datad => \inst3|ALT_INV_Q[2]~_Duplicate_1_q\,
	dataf => \inst4|ALT_INV_Q\(2),
	cin => \inst|Add0~26\,
	sumout => \inst|Add0~21_sumout\,
	cout => \inst|Add0~22\);

-- Location: LABCELL_X35_Y19_N30
\inst|Mux5~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|Mux5~1_combout\ = ( \inst|Mux5~0_combout\ & ( \inst|Add0~21_sumout\ & ( (!\OP[2]~input_o\) # ((!\OP[1]~input_o\ & (!\OP[0]~input_o\ $ (!\inst|ALU_RESULT~5_combout\)))) ) ) ) # ( !\inst|Mux5~0_combout\ & ( \inst|Add0~21_sumout\ & ( (!\OP[1]~input_o\ 
-- & ((!\OP[2]~input_o\) # (!\OP[0]~input_o\ $ (!\inst|ALU_RESULT~5_combout\)))) ) ) ) # ( \inst|Mux5~0_combout\ & ( !\inst|Add0~21_sumout\ & ( (!\OP[2]~input_o\ & (\OP[1]~input_o\)) # (\OP[2]~input_o\ & (!\OP[1]~input_o\ & (!\OP[0]~input_o\ $ 
-- (!\inst|ALU_RESULT~5_combout\)))) ) ) ) # ( !\inst|Mux5~0_combout\ & ( !\inst|Add0~21_sumout\ & ( (\OP[2]~input_o\ & (!\OP[1]~input_o\ & (!\OP[0]~input_o\ $ (!\inst|ALU_RESULT~5_combout\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010001000000001001100110001010001100110010001010111011101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_OP[2]~input_o\,
	datab => \ALT_INV_OP[1]~input_o\,
	datac => \ALT_INV_OP[0]~input_o\,
	datad => \inst|ALT_INV_ALU_RESULT~5_combout\,
	datae => \inst|ALT_INV_Mux5~0_combout\,
	dataf => \inst|ALT_INV_Add0~21_sumout\,
	combout => \inst|Mux5~1_combout\);

-- Location: FF_X36_Y19_N5
\inst5|Q[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst14|WRC~combout\,
	asdata => \inst|Mux5~1_combout\,
	clrn => \ALT_INV_RST_C~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst5|Q\(2));

-- Location: LABCELL_X36_Y19_N42
\inst|Add0~17\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|Add0~17_sumout\ = SUM(( !\OP[0]~input_o\ $ (!\inst3|Q[3]~_Duplicate_1_q\) ) + ( (!\inst14|SEL~combout\ & ((\inst4|Q\(3)))) # (\inst14|SEL~combout\ & (\inst5|Q\(3))) ) + ( \inst|Add0~22\ ))
-- \inst|Add0~18\ = CARRY(( !\OP[0]~input_o\ $ (!\inst3|Q[3]~_Duplicate_1_q\) ) + ( (!\inst14|SEL~combout\ & ((\inst4|Q\(3)))) # (\inst14|SEL~combout\ & (\inst5|Q\(3))) ) + ( \inst|Add0~22\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111000011000000000000000000000101010110101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_OP[0]~input_o\,
	datab => \inst14|ALT_INV_SEL~combout\,
	datac => \inst5|ALT_INV_Q\(3),
	datad => \inst3|ALT_INV_Q[3]~_Duplicate_1_q\,
	dataf => \inst4|ALT_INV_Q\(3),
	cin => \inst|Add0~22\,
	sumout => \inst|Add0~17_sumout\,
	cout => \inst|Add0~18\);

-- Location: LABCELL_X36_Y17_N57
\inst|ALU_RESULT~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|ALU_RESULT~4_combout\ = ( \inst2|DATA_OUT[3]~4_combout\ & ( !\inst3|Q[3]~_Duplicate_1_q\ ) ) # ( !\inst2|DATA_OUT[3]~4_combout\ & ( \inst3|Q[3]~_Duplicate_1_q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111000011110000111111110000111100001111000011110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \inst3|ALT_INV_Q[3]~_Duplicate_1_q\,
	dataf => \inst2|ALT_INV_DATA_OUT[3]~4_combout\,
	combout => \inst|ALU_RESULT~4_combout\);

-- Location: MLABCELL_X37_Y18_N3
\inst|Mux4~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|Mux4~0_combout\ = ( \inst|Div0|auto_generated|divider|divider|op_5~1_sumout\ & ( (!\OP[0]~input_o\ & \inst|Mult0~11\) ) ) # ( !\inst|Div0|auto_generated|divider|divider|op_5~1_sumout\ & ( (!\OP[0]~input_o\ & ((\inst|Mult0~11\))) # (\OP[0]~input_o\ & 
-- (!\inst|Div0|auto_generated|divider|divider|sel\(4))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000101011111010000010101111101000000000111100000000000011110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Div0|auto_generated|divider|divider|ALT_INV_sel\(4),
	datac => \ALT_INV_OP[0]~input_o\,
	datad => \inst|ALT_INV_Mult0~11\,
	dataf => \inst|Div0|auto_generated|divider|divider|ALT_INV_op_5~1_sumout\,
	combout => \inst|Mux4~0_combout\);

-- Location: LABCELL_X36_Y17_N36
\inst|Mux4~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|Mux4~1_combout\ = ( \inst|ALU_RESULT~4_combout\ & ( \inst|Mux4~0_combout\ & ( (!\OP[2]~input_o\ & (((\inst|Add0~17_sumout\) # (\OP[1]~input_o\)))) # (\OP[2]~input_o\ & (!\OP[0]~input_o\ & (!\OP[1]~input_o\))) ) ) ) # ( !\inst|ALU_RESULT~4_combout\ & 
-- ( \inst|Mux4~0_combout\ & ( (!\OP[2]~input_o\ & (((\inst|Add0~17_sumout\) # (\OP[1]~input_o\)))) # (\OP[2]~input_o\ & (\OP[0]~input_o\ & (!\OP[1]~input_o\))) ) ) ) # ( \inst|ALU_RESULT~4_combout\ & ( !\inst|Mux4~0_combout\ & ( (!\OP[1]~input_o\ & 
-- ((!\OP[2]~input_o\ & ((\inst|Add0~17_sumout\))) # (\OP[2]~input_o\ & (!\OP[0]~input_o\)))) ) ) ) # ( !\inst|ALU_RESULT~4_combout\ & ( !\inst|Mux4~0_combout\ & ( (!\OP[1]~input_o\ & ((!\OP[2]~input_o\ & ((\inst|Add0~17_sumout\))) # (\OP[2]~input_o\ & 
-- (\OP[0]~input_o\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000010110000010000001110000000011010101110100100101011101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_OP[2]~input_o\,
	datab => \ALT_INV_OP[0]~input_o\,
	datac => \ALT_INV_OP[1]~input_o\,
	datad => \inst|ALT_INV_Add0~17_sumout\,
	datae => \inst|ALT_INV_ALU_RESULT~4_combout\,
	dataf => \inst|ALT_INV_Mux4~0_combout\,
	combout => \inst|Mux4~1_combout\);

-- Location: FF_X36_Y19_N59
\inst5|Q[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst14|WRC~combout\,
	asdata => \inst|Mux4~1_combout\,
	clrn => \ALT_INV_RST_C~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst5|Q\(3));

-- Location: LABCELL_X36_Y19_N45
\inst|Add0~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|Add0~13_sumout\ = SUM(( (!\inst14|SEL~combout\ & ((\inst4|Q\(4)))) # (\inst14|SEL~combout\ & (\inst5|Q\(4))) ) + ( !\OP[0]~input_o\ $ (!\inst3|Q[4]~_Duplicate_1_q\) ) + ( \inst|Add0~18\ ))
-- \inst|Add0~14\ = CARRY(( (!\inst14|SEL~combout\ & ((\inst4|Q\(4)))) # (\inst14|SEL~combout\ & (\inst5|Q\(4))) ) + ( !\OP[0]~input_o\ $ (!\inst3|Q[4]~_Duplicate_1_q\) ) + ( \inst|Add0~18\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000101010100101010100000000000000000000001111001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_OP[0]~input_o\,
	datab => \inst14|ALT_INV_SEL~combout\,
	datac => \inst5|ALT_INV_Q\(4),
	datad => \inst4|ALT_INV_Q\(4),
	dataf => \inst3|ALT_INV_Q[4]~_Duplicate_1_q\,
	cin => \inst|Add0~18\,
	sumout => \inst|Add0~13_sumout\,
	cout => \inst|Add0~14\);

-- Location: MLABCELL_X37_Y18_N39
\inst|Mux3~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|Mux3~0_combout\ = ( \inst|Mult0~12\ & ( (!\OP[0]~input_o\) # ((!\inst|Div0|auto_generated|divider|divider|sel\(3) & !\inst|Div0|auto_generated|divider|divider|op_4~1_sumout\)) ) ) # ( !\inst|Mult0~12\ & ( 
-- (!\inst|Div0|auto_generated|divider|divider|sel\(3) & (!\inst|Div0|auto_generated|divider|divider|op_4~1_sumout\ & \OP[0]~input_o\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000100000001000000010000000100011111000111110001111100011111000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Div0|auto_generated|divider|divider|ALT_INV_sel\(3),
	datab => \inst|Div0|auto_generated|divider|divider|ALT_INV_op_4~1_sumout\,
	datac => \ALT_INV_OP[0]~input_o\,
	dataf => \inst|ALT_INV_Mult0~12\,
	combout => \inst|Mux3~0_combout\);

-- Location: LABCELL_X36_Y17_N0
\inst|Mux3~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|Mux3~1_combout\ = ( \OP[2]~input_o\ & ( \inst|Mux3~0_combout\ & ( (!\OP[1]~input_o\ & (!\inst|ALU_RESULT~3_combout\ $ (!\OP[0]~input_o\))) ) ) ) # ( !\OP[2]~input_o\ & ( \inst|Mux3~0_combout\ & ( (\OP[1]~input_o\) # (\inst|Add0~13_sumout\) ) ) ) # ( 
-- \OP[2]~input_o\ & ( !\inst|Mux3~0_combout\ & ( (!\OP[1]~input_o\ & (!\inst|ALU_RESULT~3_combout\ $ (!\OP[0]~input_o\))) ) ) ) # ( !\OP[2]~input_o\ & ( !\inst|Mux3~0_combout\ & ( (\inst|Add0~13_sumout\ & !\OP[1]~input_o\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011000000110000010100001010000000111111001111110101000010100000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst|ALT_INV_ALU_RESULT~3_combout\,
	datab => \inst|ALT_INV_Add0~13_sumout\,
	datac => \ALT_INV_OP[1]~input_o\,
	datad => \ALT_INV_OP[0]~input_o\,
	datae => \ALT_INV_OP[2]~input_o\,
	dataf => \inst|ALT_INV_Mux3~0_combout\,
	combout => \inst|Mux3~1_combout\);

-- Location: FF_X37_Y19_N47
\inst5|Q[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst14|WRC~combout\,
	asdata => \inst|Mux3~1_combout\,
	clrn => \ALT_INV_RST_C~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst5|Q\(4));

-- Location: MLABCELL_X34_Y19_N24
\inst2|DATA_OUT[4]~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst2|DATA_OUT[4]~3_combout\ = ( \inst14|SEL~combout\ & ( \inst5|Q\(4) ) ) # ( !\inst14|SEL~combout\ & ( \inst5|Q\(4) & ( \inst4|Q\(4) ) ) ) # ( !\inst14|SEL~combout\ & ( !\inst5|Q\(4) & ( \inst4|Q\(4) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111000000000000000000001111000011111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \inst4|ALT_INV_Q\(4),
	datae => \inst14|ALT_INV_SEL~combout\,
	dataf => \inst5|ALT_INV_Q\(4),
	combout => \inst2|DATA_OUT[4]~3_combout\);

-- Location: MLABCELL_X34_Y18_N51
\inst|LessThan0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|LessThan0~0_combout\ = ( \inst2|DATA_OUT[0]~7_combout\ & ( \inst3|Q[1]~_Duplicate_1_q\ & ( (\inst2|DATA_OUT[1]~6_combout\ & !\inst3|Q[0]~_Duplicate_1_q\) ) ) ) # ( \inst2|DATA_OUT[0]~7_combout\ & ( !\inst3|Q[1]~_Duplicate_1_q\ & ( 
-- (!\inst3|Q[0]~_Duplicate_1_q\) # (\inst2|DATA_OUT[1]~6_combout\) ) ) ) # ( !\inst2|DATA_OUT[0]~7_combout\ & ( !\inst3|Q[1]~_Duplicate_1_q\ & ( \inst2|DATA_OUT[1]~6_combout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101111111110101010100000000000000000101010100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|ALT_INV_DATA_OUT[1]~6_combout\,
	datad => \inst3|ALT_INV_Q[0]~_Duplicate_1_q\,
	datae => \inst2|ALT_INV_DATA_OUT[0]~7_combout\,
	dataf => \inst3|ALT_INV_Q[1]~_Duplicate_1_q\,
	combout => \inst|LessThan0~0_combout\);

-- Location: MLABCELL_X34_Y18_N42
\inst|LessThan0~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|LessThan0~1_combout\ = ( \inst3|Q[2]~_Duplicate_1_q\ & ( \inst2|DATA_OUT[3]~4_combout\ & ( (!\inst3|Q[3]~_Duplicate_1_q\) # ((\inst2|DATA_OUT[2]~5_combout\ & \inst|LessThan0~0_combout\)) ) ) ) # ( !\inst3|Q[2]~_Duplicate_1_q\ & ( 
-- \inst2|DATA_OUT[3]~4_combout\ & ( ((!\inst3|Q[3]~_Duplicate_1_q\) # (\inst|LessThan0~0_combout\)) # (\inst2|DATA_OUT[2]~5_combout\) ) ) ) # ( \inst3|Q[2]~_Duplicate_1_q\ & ( !\inst2|DATA_OUT[3]~4_combout\ & ( (\inst2|DATA_OUT[2]~5_combout\ & 
-- (\inst|LessThan0~0_combout\ & !\inst3|Q[3]~_Duplicate_1_q\)) ) ) ) # ( !\inst3|Q[2]~_Duplicate_1_q\ & ( !\inst2|DATA_OUT[3]~4_combout\ & ( (!\inst3|Q[3]~_Duplicate_1_q\ & ((\inst|LessThan0~0_combout\) # (\inst2|DATA_OUT[2]~5_combout\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011111100000000000000110000000011111111001111111111111100000011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \inst2|ALT_INV_DATA_OUT[2]~5_combout\,
	datac => \inst|ALT_INV_LessThan0~0_combout\,
	datad => \inst3|ALT_INV_Q[3]~_Duplicate_1_q\,
	datae => \inst3|ALT_INV_Q[2]~_Duplicate_1_q\,
	dataf => \inst2|ALT_INV_DATA_OUT[3]~4_combout\,
	combout => \inst|LessThan0~1_combout\);

-- Location: MLABCELL_X37_Y18_N42
\inst|LessThan0~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|LessThan0~2_combout\ = ( \inst|LessThan0~1_combout\ & ( (!\inst3|Q[5]~_Duplicate_1_q\ & (((!\inst3|Q[4]~_Duplicate_1_q\) # (\inst2|DATA_OUT[5]~2_combout\)) # (\inst2|DATA_OUT[4]~3_combout\))) # (\inst3|Q[5]~_Duplicate_1_q\ & 
-- (\inst2|DATA_OUT[5]~2_combout\ & ((!\inst3|Q[4]~_Duplicate_1_q\) # (\inst2|DATA_OUT[4]~3_combout\)))) ) ) # ( !\inst|LessThan0~1_combout\ & ( (!\inst3|Q[5]~_Duplicate_1_q\ & (((\inst2|DATA_OUT[4]~3_combout\ & !\inst3|Q[4]~_Duplicate_1_q\)) # 
-- (\inst2|DATA_OUT[5]~2_combout\))) # (\inst3|Q[5]~_Duplicate_1_q\ & (\inst2|DATA_OUT[4]~3_combout\ & (!\inst3|Q[4]~_Duplicate_1_q\ & \inst2|DATA_OUT[5]~2_combout\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0100000011110100010000001111010011010000111111011101000011111101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|ALT_INV_DATA_OUT[4]~3_combout\,
	datab => \inst3|ALT_INV_Q[4]~_Duplicate_1_q\,
	datac => \inst3|ALT_INV_Q[5]~_Duplicate_1_q\,
	datad => \inst2|ALT_INV_DATA_OUT[5]~2_combout\,
	dataf => \inst|ALT_INV_LessThan0~1_combout\,
	combout => \inst|LessThan0~2_combout\);

-- Location: MLABCELL_X37_Y18_N54
\inst|Mux7~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|Mux7~1_combout\ = ( \inst3|Q[6]~_Duplicate_1_q\ & ( \inst2|DATA_OUT[7]~0_combout\ & ( (\OP[0]~input_o\ & ((!\inst3|Q[7]~_Duplicate_1_q\) # ((\inst2|DATA_OUT[6]~1_combout\ & \inst|LessThan0~2_combout\)))) ) ) ) # ( !\inst3|Q[6]~_Duplicate_1_q\ & ( 
-- \inst2|DATA_OUT[7]~0_combout\ & ( (\OP[0]~input_o\ & (((!\inst3|Q[7]~_Duplicate_1_q\) # (\inst|LessThan0~2_combout\)) # (\inst2|DATA_OUT[6]~1_combout\))) ) ) ) # ( \inst3|Q[6]~_Duplicate_1_q\ & ( !\inst2|DATA_OUT[7]~0_combout\ & ( 
-- (\inst2|DATA_OUT[6]~1_combout\ & (\OP[0]~input_o\ & (!\inst3|Q[7]~_Duplicate_1_q\ & \inst|LessThan0~2_combout\))) ) ) ) # ( !\inst3|Q[6]~_Duplicate_1_q\ & ( !\inst2|DATA_OUT[7]~0_combout\ & ( (\OP[0]~input_o\ & (!\inst3|Q[7]~_Duplicate_1_q\ & 
-- ((\inst|LessThan0~2_combout\) # (\inst2|DATA_OUT[6]~1_combout\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000000110000000000000001000000110001001100110011000000110001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|ALT_INV_DATA_OUT[6]~1_combout\,
	datab => \ALT_INV_OP[0]~input_o\,
	datac => \inst3|ALT_INV_Q[7]~_Duplicate_1_q\,
	datad => \inst|ALT_INV_LessThan0~2_combout\,
	datae => \inst3|ALT_INV_Q[6]~_Duplicate_1_q\,
	dataf => \inst2|ALT_INV_DATA_OUT[7]~0_combout\,
	combout => \inst|Mux7~1_combout\);

-- Location: LABCELL_X36_Y17_N54
\inst|ALU_RESULT~7\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|ALU_RESULT~7_combout\ = ( \inst2|DATA_OUT[0]~7_combout\ & ( !\inst3|Q[0]~_Duplicate_1_q\ ) ) # ( !\inst2|DATA_OUT[0]~7_combout\ & ( \inst3|Q[0]~_Duplicate_1_q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111000011110000111111110000111100001111000011110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \inst3|ALT_INV_Q[0]~_Duplicate_1_q\,
	dataf => \inst2|ALT_INV_DATA_OUT[0]~7_combout\,
	combout => \inst|ALU_RESULT~7_combout\);

-- Location: LABCELL_X36_Y17_N30
\inst|ALU_RESULT~6\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|ALU_RESULT~6_combout\ = ( \inst2|DATA_OUT[1]~6_combout\ & ( !\inst3|Q[1]~_Duplicate_1_q\ ) ) # ( !\inst2|DATA_OUT[1]~6_combout\ & ( \inst3|Q[1]~_Duplicate_1_q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111000011110000111111110000111100001111000011110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \inst3|ALT_INV_Q[1]~_Duplicate_1_q\,
	dataf => \inst2|ALT_INV_DATA_OUT[1]~6_combout\,
	combout => \inst|ALU_RESULT~6_combout\);

-- Location: LABCELL_X36_Y17_N24
\inst|Mux7~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|Mux7~2_combout\ = ( !\inst|ALU_RESULT~7_combout\ & ( !\inst|ALU_RESULT~6_combout\ & ( (!\inst|ALU_RESULT~3_combout\ & (!\OP[0]~input_o\ & (!\inst|ALU_RESULT~5_combout\ & !\inst|ALU_RESULT~4_combout\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000000000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst|ALT_INV_ALU_RESULT~3_combout\,
	datab => \ALT_INV_OP[0]~input_o\,
	datac => \inst|ALT_INV_ALU_RESULT~5_combout\,
	datad => \inst|ALT_INV_ALU_RESULT~4_combout\,
	datae => \inst|ALT_INV_ALU_RESULT~7_combout\,
	dataf => \inst|ALT_INV_ALU_RESULT~6_combout\,
	combout => \inst|Mux7~2_combout\);

-- Location: LABCELL_X35_Y19_N24
\inst|ALU_RESULT~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|ALU_RESULT~1_combout\ = ( \inst2|DATA_OUT[6]~1_combout\ & ( !\inst3|Q[6]~_Duplicate_1_q\ ) ) # ( !\inst2|DATA_OUT[6]~1_combout\ & ( \inst3|Q[6]~_Duplicate_1_q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111000011110000111111110000111100001111000011110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \inst3|ALT_INV_Q[6]~_Duplicate_1_q\,
	dataf => \inst2|ALT_INV_DATA_OUT[6]~1_combout\,
	combout => \inst|ALU_RESULT~1_combout\);

-- Location: LABCELL_X35_Y19_N57
\inst|Mux7~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|Mux7~3_combout\ = ( !\inst|ALU_RESULT~1_combout\ & ( !\inst|ALU_RESULT~0_combout\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010101010101010101010101010101000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst|ALT_INV_ALU_RESULT~0_combout\,
	dataf => \inst|ALT_INV_ALU_RESULT~1_combout\,
	combout => \inst|Mux7~3_combout\);

-- Location: LABCELL_X36_Y17_N18
\inst|Mux7~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|Mux7~0_combout\ = ( \inst3|Q[0]~_Duplicate_1_q\ & ( !\OP[0]~input_o\ $ (((!\inst14|SEL~combout\ & ((\inst4|Q\(0)))) # (\inst14|SEL~combout\ & (\inst5|Q\(0))))) ) ) # ( !\inst3|Q[0]~_Duplicate_1_q\ & ( !\OP[0]~input_o\ $ (((!\inst14|SEL~combout\ & 
-- ((!\inst4|Q\(0)))) # (\inst14|SEL~combout\ & (!\inst5|Q\(0))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001110111100010000111011110001011100010000111011110001000011101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst5|ALT_INV_Q\(0),
	datab => \inst14|ALT_INV_SEL~combout\,
	datac => \inst4|ALT_INV_Q\(0),
	datad => \ALT_INV_OP[0]~input_o\,
	dataf => \inst3|ALT_INV_Q[0]~_Duplicate_1_q\,
	combout => \inst|Mux7~0_combout\);

-- Location: LABCELL_X35_Y17_N0
\inst|Mux7~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|Mux7~4_combout\ = ( \inst|Mux7~3_combout\ & ( \inst|Mux7~0_combout\ & ( (!\OP[1]~input_o\) # (((!\inst|ALU_RESULT~2_combout\ & \inst|Mux7~2_combout\)) # (\inst|Mux7~1_combout\)) ) ) ) # ( !\inst|Mux7~3_combout\ & ( \inst|Mux7~0_combout\ & ( 
-- (!\OP[1]~input_o\) # (\inst|Mux7~1_combout\) ) ) ) # ( \inst|Mux7~3_combout\ & ( !\inst|Mux7~0_combout\ & ( (\OP[1]~input_o\ & (((!\inst|ALU_RESULT~2_combout\ & \inst|Mux7~2_combout\)) # (\inst|Mux7~1_combout\))) ) ) ) # ( !\inst|Mux7~3_combout\ & ( 
-- !\inst|Mux7~0_combout\ & ( (\OP[1]~input_o\ & \inst|Mux7~1_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010100000101000001010100010110101111101011111010111111101111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_OP[1]~input_o\,
	datab => \inst|ALT_INV_ALU_RESULT~2_combout\,
	datac => \inst|ALT_INV_Mux7~1_combout\,
	datad => \inst|ALT_INV_Mux7~2_combout\,
	datae => \inst|ALT_INV_Mux7~3_combout\,
	dataf => \inst|ALT_INV_Mux7~0_combout\,
	combout => \inst|Mux7~4_combout\);

-- Location: LABCELL_X35_Y18_N6
\inst|Div0|auto_generated|divider|divider|StageOut[45]~7\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|Div0|auto_generated|divider|divider|StageOut[45]~7_combout\ = ( !\inst|Div0|auto_generated|divider|divider|sel\(5) & ( (!\inst|Div0|auto_generated|divider|divider|op_6~1_sumout\ & \inst|Div0|auto_generated|divider|divider|op_6~5_sumout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011001100000000001100110000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \inst|Div0|auto_generated|divider|divider|ALT_INV_op_6~1_sumout\,
	datad => \inst|Div0|auto_generated|divider|divider|ALT_INV_op_6~5_sumout\,
	dataf => \inst|Div0|auto_generated|divider|divider|ALT_INV_sel\(5),
	combout => \inst|Div0|auto_generated|divider|divider|StageOut[45]~7_combout\);

-- Location: MLABCELL_X34_Y18_N54
\inst|Div0|auto_generated|divider|divider|selnose[54]\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|Div0|auto_generated|divider|divider|selnose\(54) = ( \inst|Div0|auto_generated|divider|divider|op_7~1_sumout\ & ( \inst3|Q[7]~_Duplicate_1_q\ ) ) # ( !\inst|Div0|auto_generated|divider|divider|op_7~1_sumout\ & ( \inst3|Q[7]~_Duplicate_1_q\ ) ) # ( 
-- \inst|Div0|auto_generated|divider|divider|op_7~1_sumout\ & ( !\inst3|Q[7]~_Duplicate_1_q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111111111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datae => \inst|Div0|auto_generated|divider|divider|ALT_INV_op_7~1_sumout\,
	dataf => \inst3|ALT_INV_Q[7]~_Duplicate_1_q\,
	combout => \inst|Div0|auto_generated|divider|divider|selnose\(54));

-- Location: LABCELL_X35_Y18_N15
\inst|Div0|auto_generated|divider|divider|StageOut[45]~8\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|Div0|auto_generated|divider|divider|StageOut[45]~8_combout\ = ( \inst|Div0|auto_generated|divider|divider|StageOut[36]~6_combout\ & ( (\inst|Div0|auto_generated|divider|divider|op_6~1_sumout\) # (\inst|Div0|auto_generated|divider|divider|sel\(5)) ) 
-- )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000001111111111110000111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \inst|Div0|auto_generated|divider|divider|ALT_INV_sel\(5),
	datad => \inst|Div0|auto_generated|divider|divider|ALT_INV_op_6~1_sumout\,
	dataf => \inst|Div0|auto_generated|divider|divider|ALT_INV_StageOut[36]~6_combout\,
	combout => \inst|Div0|auto_generated|divider|divider|StageOut[45]~8_combout\);

-- Location: LABCELL_X35_Y18_N57
\inst|Div0|auto_generated|divider|divider|StageOut[44]~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|Div0|auto_generated|divider|divider|StageOut[44]~13_combout\ = ( \inst|Div0|auto_generated|divider|divider|op_6~9_sumout\ & ( ((!\inst|Div0|auto_generated|divider|divider|sel\(5) & !\inst|Div0|auto_generated|divider|divider|op_6~1_sumout\)) # 
-- (\inst|Div0|auto_generated|divider|divider|StageOut[35]~12_combout\) ) ) # ( !\inst|Div0|auto_generated|divider|divider|op_6~9_sumout\ & ( (\inst|Div0|auto_generated|divider|divider|StageOut[35]~12_combout\ & 
-- ((\inst|Div0|auto_generated|divider|divider|op_6~1_sumout\) # (\inst|Div0|auto_generated|divider|divider|sel\(5)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000001011111000000000101111110100000111111111010000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Div0|auto_generated|divider|divider|ALT_INV_sel\(5),
	datac => \inst|Div0|auto_generated|divider|divider|ALT_INV_op_6~1_sumout\,
	datad => \inst|Div0|auto_generated|divider|divider|ALT_INV_StageOut[35]~12_combout\,
	dataf => \inst|Div0|auto_generated|divider|divider|ALT_INV_op_6~9_sumout\,
	combout => \inst|Div0|auto_generated|divider|divider|StageOut[44]~13_combout\);

-- Location: LABCELL_X35_Y18_N0
\inst|Div0|auto_generated|divider|divider|StageOut[43]~17\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|Div0|auto_generated|divider|divider|StageOut[43]~17_combout\ = ( \inst|Div0|auto_generated|divider|divider|StageOut[34]~16_combout\ & ( ((\inst|Div0|auto_generated|divider|divider|op_6~13_sumout\) # 
-- (\inst|Div0|auto_generated|divider|divider|op_6~1_sumout\)) # (\inst|Div0|auto_generated|divider|divider|sel\(5)) ) ) # ( !\inst|Div0|auto_generated|divider|divider|StageOut[34]~16_combout\ & ( (!\inst|Div0|auto_generated|divider|divider|sel\(5) & 
-- (!\inst|Div0|auto_generated|divider|divider|op_6~1_sumout\ & \inst|Div0|auto_generated|divider|divider|op_6~13_sumout\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000010001000000000001000100001110111111111110111011111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Div0|auto_generated|divider|divider|ALT_INV_sel\(5),
	datab => \inst|Div0|auto_generated|divider|divider|ALT_INV_op_6~1_sumout\,
	datad => \inst|Div0|auto_generated|divider|divider|ALT_INV_op_6~13_sumout\,
	dataf => \inst|Div0|auto_generated|divider|divider|ALT_INV_StageOut[34]~16_combout\,
	combout => \inst|Div0|auto_generated|divider|divider|StageOut[43]~17_combout\);

-- Location: LABCELL_X35_Y18_N18
\inst|Div0|auto_generated|divider|divider|StageOut[42]~20\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|Div0|auto_generated|divider|divider|StageOut[42]~20_combout\ = ( \inst|Div0|auto_generated|divider|divider|op_6~17_sumout\ & ( ((!\inst|Div0|auto_generated|divider|divider|sel\(5) & !\inst|Div0|auto_generated|divider|divider|op_6~1_sumout\)) # 
-- (\inst|Div0|auto_generated|divider|divider|StageOut[33]~19_combout\) ) ) # ( !\inst|Div0|auto_generated|divider|divider|op_6~17_sumout\ & ( (\inst|Div0|auto_generated|divider|divider|StageOut[33]~19_combout\ & 
-- ((\inst|Div0|auto_generated|divider|divider|op_6~1_sumout\) # (\inst|Div0|auto_generated|divider|divider|sel\(5)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000001100110011000000110011001111110011001100111111001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \inst|Div0|auto_generated|divider|divider|ALT_INV_StageOut[33]~19_combout\,
	datac => \inst|Div0|auto_generated|divider|divider|ALT_INV_sel\(5),
	datad => \inst|Div0|auto_generated|divider|divider|ALT_INV_op_6~1_sumout\,
	dataf => \inst|Div0|auto_generated|divider|divider|ALT_INV_op_6~17_sumout\,
	combout => \inst|Div0|auto_generated|divider|divider|StageOut[42]~20_combout\);

-- Location: LABCELL_X35_Y18_N3
\inst|Div0|auto_generated|divider|divider|StageOut[41]~22\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|Div0|auto_generated|divider|divider|StageOut[41]~22_combout\ = ( \inst|Div0|auto_generated|divider|divider|op_6~21_sumout\ & ( ((!\inst|Div0|auto_generated|divider|divider|sel\(5) & !\inst|Div0|auto_generated|divider|divider|op_6~1_sumout\)) # 
-- (\inst|Div0|auto_generated|divider|divider|StageOut[32]~21_combout\) ) ) # ( !\inst|Div0|auto_generated|divider|divider|op_6~21_sumout\ & ( (\inst|Div0|auto_generated|divider|divider|StageOut[32]~21_combout\ & 
-- ((\inst|Div0|auto_generated|divider|divider|op_6~1_sumout\) # (\inst|Div0|auto_generated|divider|divider|sel\(5)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000001011111000000000101111110100000111111111010000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Div0|auto_generated|divider|divider|ALT_INV_sel\(5),
	datac => \inst|Div0|auto_generated|divider|divider|ALT_INV_op_6~1_sumout\,
	datad => \inst|Div0|auto_generated|divider|divider|ALT_INV_StageOut[32]~21_combout\,
	dataf => \inst|Div0|auto_generated|divider|divider|ALT_INV_op_6~21_sumout\,
	combout => \inst|Div0|auto_generated|divider|divider|StageOut[41]~22_combout\);

-- Location: MLABCELL_X37_Y18_N9
\inst|Div0|auto_generated|divider|divider|StageOut[40]~23\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|Div0|auto_generated|divider|divider|StageOut[40]~23_combout\ = ( \inst|Div0|auto_generated|divider|divider|op_6~1_sumout\ & ( \inst2|DATA_OUT[2]~5_combout\ ) ) # ( !\inst|Div0|auto_generated|divider|divider|op_6~1_sumout\ & ( 
-- (!\inst|Div0|auto_generated|divider|divider|sel\(5) & (\inst|Div0|auto_generated|divider|divider|op_6~25_sumout\)) # (\inst|Div0|auto_generated|divider|divider|sel\(5) & ((\inst2|DATA_OUT[2]~5_combout\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010011100100111001001110010011100001111000011110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Div0|auto_generated|divider|divider|ALT_INV_sel\(5),
	datab => \inst|Div0|auto_generated|divider|divider|ALT_INV_op_6~25_sumout\,
	datac => \inst2|ALT_INV_DATA_OUT[2]~5_combout\,
	dataf => \inst|Div0|auto_generated|divider|divider|ALT_INV_op_6~1_sumout\,
	combout => \inst|Div0|auto_generated|divider|divider|StageOut[40]~23_combout\);

-- Location: MLABCELL_X34_Y18_N0
\inst|Div0|auto_generated|divider|divider|op_8~38\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|Div0|auto_generated|divider|divider|op_8~38_cout\ = CARRY(( VCC ) + ( VCC ) + ( !VCC ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000001111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	cin => GND,
	cout => \inst|Div0|auto_generated|divider|divider|op_8~38_cout\);

-- Location: MLABCELL_X34_Y18_N3
\inst|Div0|auto_generated|divider|divider|op_8~34\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|Div0|auto_generated|divider|divider|op_8~34_cout\ = CARRY(( (!\inst14|SEL~combout\ & ((\inst4|Q\(0)))) # (\inst14|SEL~combout\ & (\inst5|Q\(0))) ) + ( !\inst3|Q[0]~_Duplicate_1_q\ ) + ( \inst|Div0|auto_generated|divider|divider|op_8~38_cout\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000001111111100000000000000000000010111110101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst5|ALT_INV_Q\(0),
	datac => \inst14|ALT_INV_SEL~combout\,
	datad => \inst4|ALT_INV_Q\(0),
	dataf => \inst3|ALT_INV_Q[0]~_Duplicate_1_q\,
	cin => \inst|Div0|auto_generated|divider|divider|op_8~38_cout\,
	cout => \inst|Div0|auto_generated|divider|divider|op_8~34_cout\);

-- Location: MLABCELL_X34_Y18_N6
\inst|Div0|auto_generated|divider|divider|op_8~30\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|Div0|auto_generated|divider|divider|op_8~30_cout\ = CARRY(( !\inst3|Q[1]~_Duplicate_1_q\ ) + ( (!\inst3|Q[7]~_Duplicate_1_q\ & ((!\inst|Div0|auto_generated|divider|divider|op_7~1_sumout\ & (\inst|Div0|auto_generated|divider|divider|op_7~29_sumout\)) 
-- # (\inst|Div0|auto_generated|divider|divider|op_7~1_sumout\ & ((\inst2|DATA_OUT[1]~6_combout\))))) # (\inst3|Q[7]~_Duplicate_1_q\ & (((\inst2|DATA_OUT[1]~6_combout\)))) ) + ( \inst|Div0|auto_generated|divider|divider|op_8~34_cout\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111101111000000000000000000000001111111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst3|ALT_INV_Q[7]~_Duplicate_1_q\,
	datab => \inst|Div0|auto_generated|divider|divider|ALT_INV_op_7~1_sumout\,
	datac => \inst|Div0|auto_generated|divider|divider|ALT_INV_op_7~29_sumout\,
	datad => \inst3|ALT_INV_Q[1]~_Duplicate_1_q\,
	dataf => \inst2|ALT_INV_DATA_OUT[1]~6_combout\,
	cin => \inst|Div0|auto_generated|divider|divider|op_8~34_cout\,
	cout => \inst|Div0|auto_generated|divider|divider|op_8~30_cout\);

-- Location: MLABCELL_X34_Y18_N9
\inst|Div0|auto_generated|divider|divider|op_8~26\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|Div0|auto_generated|divider|divider|op_8~26_cout\ = CARRY(( (!\inst3|Q[7]~_Duplicate_1_q\ & ((!\inst|Div0|auto_generated|divider|divider|op_7~1_sumout\ & (\inst|Div0|auto_generated|divider|divider|op_7~25_sumout\)) # 
-- (\inst|Div0|auto_generated|divider|divider|op_7~1_sumout\ & ((\inst|Div0|auto_generated|divider|divider|StageOut[40]~23_combout\))))) # (\inst3|Q[7]~_Duplicate_1_q\ & (((\inst|Div0|auto_generated|divider|divider|StageOut[40]~23_combout\)))) ) + ( 
-- !\inst3|Q[2]~_Duplicate_1_q\ ) + ( \inst|Div0|auto_generated|divider|divider|op_8~30_cout\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000001111111100000000000000000000100001111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst3|ALT_INV_Q[7]~_Duplicate_1_q\,
	datab => \inst|Div0|auto_generated|divider|divider|ALT_INV_op_7~1_sumout\,
	datac => \inst|Div0|auto_generated|divider|divider|ALT_INV_op_7~25_sumout\,
	datad => \inst|Div0|auto_generated|divider|divider|ALT_INV_StageOut[40]~23_combout\,
	dataf => \inst3|ALT_INV_Q[2]~_Duplicate_1_q\,
	cin => \inst|Div0|auto_generated|divider|divider|op_8~30_cout\,
	cout => \inst|Div0|auto_generated|divider|divider|op_8~26_cout\);

-- Location: MLABCELL_X34_Y18_N12
\inst|Div0|auto_generated|divider|divider|op_8~22\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|Div0|auto_generated|divider|divider|op_8~22_cout\ = CARRY(( !\inst3|Q[3]~_Duplicate_1_q\ ) + ( (!\inst3|Q[7]~_Duplicate_1_q\ & ((!\inst|Div0|auto_generated|divider|divider|op_7~1_sumout\ & 
-- ((\inst|Div0|auto_generated|divider|divider|op_7~21_sumout\))) # (\inst|Div0|auto_generated|divider|divider|op_7~1_sumout\ & (\inst|Div0|auto_generated|divider|divider|StageOut[41]~22_combout\)))) # (\inst3|Q[7]~_Duplicate_1_q\ & 
-- (((\inst|Div0|auto_generated|divider|divider|StageOut[41]~22_combout\)))) ) + ( \inst|Div0|auto_generated|divider|divider|op_8~26_cout\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111110000111000000000000000000001111111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst3|ALT_INV_Q[7]~_Duplicate_1_q\,
	datab => \inst|Div0|auto_generated|divider|divider|ALT_INV_op_7~1_sumout\,
	datac => \inst|Div0|auto_generated|divider|divider|ALT_INV_StageOut[41]~22_combout\,
	datad => \inst3|ALT_INV_Q[3]~_Duplicate_1_q\,
	dataf => \inst|Div0|auto_generated|divider|divider|ALT_INV_op_7~21_sumout\,
	cin => \inst|Div0|auto_generated|divider|divider|op_8~26_cout\,
	cout => \inst|Div0|auto_generated|divider|divider|op_8~22_cout\);

-- Location: MLABCELL_X34_Y18_N15
\inst|Div0|auto_generated|divider|divider|op_8~18\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|Div0|auto_generated|divider|divider|op_8~18_cout\ = CARRY(( (!\inst3|Q[7]~_Duplicate_1_q\ & ((!\inst|Div0|auto_generated|divider|divider|op_7~1_sumout\ & ((\inst|Div0|auto_generated|divider|divider|op_7~17_sumout\))) # 
-- (\inst|Div0|auto_generated|divider|divider|op_7~1_sumout\ & (\inst|Div0|auto_generated|divider|divider|StageOut[42]~20_combout\)))) # (\inst3|Q[7]~_Duplicate_1_q\ & (((\inst|Div0|auto_generated|divider|divider|StageOut[42]~20_combout\)))) ) + ( 
-- !\inst3|Q[4]~_Duplicate_1_q\ ) + ( \inst|Div0|auto_generated|divider|divider|op_8~22_cout\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000001111111100000000000000000000011110001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst3|ALT_INV_Q[7]~_Duplicate_1_q\,
	datab => \inst|Div0|auto_generated|divider|divider|ALT_INV_op_7~1_sumout\,
	datac => \inst|Div0|auto_generated|divider|divider|ALT_INV_StageOut[42]~20_combout\,
	datad => \inst|Div0|auto_generated|divider|divider|ALT_INV_op_7~17_sumout\,
	dataf => \inst3|ALT_INV_Q[4]~_Duplicate_1_q\,
	cin => \inst|Div0|auto_generated|divider|divider|op_8~22_cout\,
	cout => \inst|Div0|auto_generated|divider|divider|op_8~18_cout\);

-- Location: MLABCELL_X34_Y18_N18
\inst|Div0|auto_generated|divider|divider|op_8~14\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|Div0|auto_generated|divider|divider|op_8~14_cout\ = CARRY(( (!\inst3|Q[7]~_Duplicate_1_q\ & ((!\inst|Div0|auto_generated|divider|divider|op_7~1_sumout\ & ((\inst|Div0|auto_generated|divider|divider|op_7~13_sumout\))) # 
-- (\inst|Div0|auto_generated|divider|divider|op_7~1_sumout\ & (\inst|Div0|auto_generated|divider|divider|StageOut[43]~17_combout\)))) # (\inst3|Q[7]~_Duplicate_1_q\ & (((\inst|Div0|auto_generated|divider|divider|StageOut[43]~17_combout\)))) ) + ( 
-- !\inst3|Q[5]~_Duplicate_1_q\ ) + ( \inst|Div0|auto_generated|divider|divider|op_8~18_cout\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000001111111100000000000000000000011110001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst3|ALT_INV_Q[7]~_Duplicate_1_q\,
	datab => \inst|Div0|auto_generated|divider|divider|ALT_INV_op_7~1_sumout\,
	datac => \inst|Div0|auto_generated|divider|divider|ALT_INV_StageOut[43]~17_combout\,
	datad => \inst|Div0|auto_generated|divider|divider|ALT_INV_op_7~13_sumout\,
	dataf => \inst3|ALT_INV_Q[5]~_Duplicate_1_q\,
	cin => \inst|Div0|auto_generated|divider|divider|op_8~18_cout\,
	cout => \inst|Div0|auto_generated|divider|divider|op_8~14_cout\);

-- Location: MLABCELL_X34_Y18_N21
\inst|Div0|auto_generated|divider|divider|op_8~10\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|Div0|auto_generated|divider|divider|op_8~10_cout\ = CARRY(( (!\inst3|Q[7]~_Duplicate_1_q\ & ((!\inst|Div0|auto_generated|divider|divider|op_7~1_sumout\ & ((\inst|Div0|auto_generated|divider|divider|op_7~9_sumout\))) # 
-- (\inst|Div0|auto_generated|divider|divider|op_7~1_sumout\ & (\inst|Div0|auto_generated|divider|divider|StageOut[44]~13_combout\)))) # (\inst3|Q[7]~_Duplicate_1_q\ & (((\inst|Div0|auto_generated|divider|divider|StageOut[44]~13_combout\)))) ) + ( 
-- !\inst3|Q[6]~_Duplicate_1_q\ ) + ( \inst|Div0|auto_generated|divider|divider|op_8~14_cout\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000001111111100000000000000000000011110001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst3|ALT_INV_Q[7]~_Duplicate_1_q\,
	datab => \inst|Div0|auto_generated|divider|divider|ALT_INV_op_7~1_sumout\,
	datac => \inst|Div0|auto_generated|divider|divider|ALT_INV_StageOut[44]~13_combout\,
	datad => \inst|Div0|auto_generated|divider|divider|ALT_INV_op_7~9_sumout\,
	dataf => \inst3|ALT_INV_Q[6]~_Duplicate_1_q\,
	cin => \inst|Div0|auto_generated|divider|divider|op_8~14_cout\,
	cout => \inst|Div0|auto_generated|divider|divider|op_8~10_cout\);

-- Location: MLABCELL_X34_Y18_N24
\inst|Div0|auto_generated|divider|divider|op_8~6\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|Div0|auto_generated|divider|divider|op_8~6_cout\ = CARRY(( (!\inst|Div0|auto_generated|divider|divider|selnose\(54) & (\inst|Div0|auto_generated|divider|divider|op_7~5_sumout\)) # (\inst|Div0|auto_generated|divider|divider|selnose\(54) & 
-- (((\inst|Div0|auto_generated|divider|divider|StageOut[45]~8_combout\) # (\inst|Div0|auto_generated|divider|divider|StageOut[45]~7_combout\)))) ) + ( !\inst3|Q[7]~_Duplicate_1_q\ ) + ( \inst|Div0|auto_generated|divider|divider|op_8~10_cout\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000001111111100000000000000000101001101011111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Div0|auto_generated|divider|divider|ALT_INV_op_7~5_sumout\,
	datab => \inst|Div0|auto_generated|divider|divider|ALT_INV_StageOut[45]~7_combout\,
	datac => \inst|Div0|auto_generated|divider|divider|ALT_INV_selnose\(54),
	datad => \inst|Div0|auto_generated|divider|divider|ALT_INV_StageOut[45]~8_combout\,
	dataf => \inst3|ALT_INV_Q[7]~_Duplicate_1_q\,
	cin => \inst|Div0|auto_generated|divider|divider|op_8~10_cout\,
	cout => \inst|Div0|auto_generated|divider|divider|op_8~6_cout\);

-- Location: MLABCELL_X34_Y18_N27
\inst|Div0|auto_generated|divider|divider|op_8~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|Div0|auto_generated|divider|divider|op_8~1_sumout\ = SUM(( VCC ) + ( GND ) + ( \inst|Div0|auto_generated|divider|divider|op_8~6_cout\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000001111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	cin => \inst|Div0|auto_generated|divider|divider|op_8~6_cout\,
	sumout => \inst|Div0|auto_generated|divider|divider|op_8~1_sumout\);

-- Location: MLABCELL_X34_Y18_N30
\inst|Mux7~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|Mux7~5_combout\ = ( !\OP[0]~input_o\ & ( (!\OP[2]~input_o\ & (((!\OP[1]~input_o\ & ((\inst|Add0~29_sumout\))) # (\OP[1]~input_o\ & (\inst|Mult0~8_resulta\))))) # (\OP[2]~input_o\ & (\inst|Mux7~4_combout\)) ) ) # ( \OP[0]~input_o\ & ( 
-- (!\OP[2]~input_o\ & (((!\OP[1]~input_o\ & ((\inst|Add0~29_sumout\))) # (\OP[1]~input_o\ & (!\inst|Div0|auto_generated|divider|divider|op_8~1_sumout\))))) # (\OP[2]~input_o\ & (\inst|Mux7~4_combout\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "on",
	lut_mask => "0001000110111011000100011011101100011011000110111011000110110001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_OP[2]~input_o\,
	datab => \inst|ALT_INV_Mux7~4_combout\,
	datac => \inst|Div0|auto_generated|divider|divider|ALT_INV_op_8~1_sumout\,
	datad => \inst|ALT_INV_Add0~29_sumout\,
	datae => \ALT_INV_OP[0]~input_o\,
	dataf => \ALT_INV_OP[1]~input_o\,
	datag => \inst|ALT_INV_Mult0~8_resulta\,
	combout => \inst|Mux7~5_combout\);

-- Location: FF_X34_Y18_N56
\inst5|Q[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst14|WRC~combout\,
	asdata => \inst|Mux7~5_combout\,
	clrn => \ALT_INV_RST_C~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst5|Q\(0));

-- Location: LABCELL_X36_Y17_N15
\inst2|DATA_OUT[0]~7\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst2|DATA_OUT[0]~7_combout\ = ( \inst5|Q\(0) & ( \inst4|Q\(0) ) ) # ( !\inst5|Q\(0) & ( \inst4|Q\(0) & ( !\inst14|SEL~combout\ ) ) ) # ( \inst5|Q\(0) & ( !\inst4|Q\(0) & ( \inst14|SEL~combout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000011110000111111110000111100001111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \inst14|ALT_INV_SEL~combout\,
	datae => \inst5|ALT_INV_Q\(0),
	dataf => \inst4|ALT_INV_Q\(0),
	combout => \inst2|DATA_OUT[0]~7_combout\);

-- Location: LABCELL_X35_Y19_N45
\inst|Mux2~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|Mux2~0_combout\ = ( \inst|Div0|auto_generated|divider|divider|op_3~1_sumout\ & ( (\inst|Mult0~13\ & !\OP[0]~input_o\) ) ) # ( !\inst|Div0|auto_generated|divider|divider|op_3~1_sumout\ & ( (!\OP[0]~input_o\ & ((\inst|Mult0~13\))) # (\OP[0]~input_o\ & 
-- (!\inst|Div0|auto_generated|divider|divider|sel\(2))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111110101010000011111010101000001111000000000000111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Div0|auto_generated|divider|divider|ALT_INV_sel\(2),
	datac => \inst|ALT_INV_Mult0~13\,
	datad => \ALT_INV_OP[0]~input_o\,
	dataf => \inst|Div0|auto_generated|divider|divider|ALT_INV_op_3~1_sumout\,
	combout => \inst|Mux2~0_combout\);

-- Location: LABCELL_X36_Y19_N48
\inst|Add0~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|Add0~9_sumout\ = SUM(( (!\inst14|SEL~combout\ & ((\inst4|Q\(5)))) # (\inst14|SEL~combout\ & (\inst5|Q\(5))) ) + ( !\OP[0]~input_o\ $ (!\inst3|Q[5]~_Duplicate_1_q\) ) + ( \inst|Add0~14\ ))
-- \inst|Add0~10\ = CARRY(( (!\inst14|SEL~combout\ & ((\inst4|Q\(5)))) # (\inst14|SEL~combout\ & (\inst5|Q\(5))) ) + ( !\OP[0]~input_o\ $ (!\inst3|Q[5]~_Duplicate_1_q\) ) + ( \inst|Add0~14\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000101010100101010100000000000000000000001111001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_OP[0]~input_o\,
	datab => \inst14|ALT_INV_SEL~combout\,
	datac => \inst5|ALT_INV_Q\(5),
	datad => \inst4|ALT_INV_Q\(5),
	dataf => \inst3|ALT_INV_Q[5]~_Duplicate_1_q\,
	cin => \inst|Add0~14\,
	sumout => \inst|Add0~9_sumout\,
	cout => \inst|Add0~10\);

-- Location: LABCELL_X35_Y19_N48
\inst|Mux2~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|Mux2~1_combout\ = ( \inst|Add0~9_sumout\ & ( \inst|ALU_RESULT~2_combout\ & ( (!\OP[2]~input_o\ & ((!\OP[1]~input_o\) # ((\inst|Mux2~0_combout\)))) # (\OP[2]~input_o\ & (!\OP[1]~input_o\ & (!\OP[0]~input_o\))) ) ) ) # ( !\inst|Add0~9_sumout\ & ( 
-- \inst|ALU_RESULT~2_combout\ & ( (!\OP[2]~input_o\ & (\OP[1]~input_o\ & ((\inst|Mux2~0_combout\)))) # (\OP[2]~input_o\ & (!\OP[1]~input_o\ & (!\OP[0]~input_o\))) ) ) ) # ( \inst|Add0~9_sumout\ & ( !\inst|ALU_RESULT~2_combout\ & ( (!\OP[2]~input_o\ & 
-- ((!\OP[1]~input_o\) # ((\inst|Mux2~0_combout\)))) # (\OP[2]~input_o\ & (!\OP[1]~input_o\ & (\OP[0]~input_o\))) ) ) ) # ( !\inst|Add0~9_sumout\ & ( !\inst|ALU_RESULT~2_combout\ & ( (!\OP[2]~input_o\ & (\OP[1]~input_o\ & ((\inst|Mux2~0_combout\)))) # 
-- (\OP[2]~input_o\ & (!\OP[1]~input_o\ & (\OP[0]~input_o\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010000100110100011001010111001000000011000101100100011101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_OP[2]~input_o\,
	datab => \ALT_INV_OP[1]~input_o\,
	datac => \ALT_INV_OP[0]~input_o\,
	datad => \inst|ALT_INV_Mux2~0_combout\,
	datae => \inst|ALT_INV_Add0~9_sumout\,
	dataf => \inst|ALT_INV_ALU_RESULT~2_combout\,
	combout => \inst|Mux2~1_combout\);

-- Location: FF_X37_Y19_N5
\inst5|Q[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst14|WRC~combout\,
	asdata => \inst|Mux2~1_combout\,
	clrn => \ALT_INV_RST_C~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst5|Q\(5));

-- Location: LABCELL_X36_Y19_N51
\inst|Add0~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|Add0~5_sumout\ = SUM(( !\OP[0]~input_o\ $ (!\inst3|Q[6]~_Duplicate_1_q\) ) + ( (!\inst14|SEL~combout\ & ((\inst4|Q\(6)))) # (\inst14|SEL~combout\ & (\inst5|Q\(6))) ) + ( \inst|Add0~10\ ))
-- \inst|Add0~6\ = CARRY(( !\OP[0]~input_o\ $ (!\inst3|Q[6]~_Duplicate_1_q\) ) + ( (!\inst14|SEL~combout\ & ((\inst4|Q\(6)))) # (\inst14|SEL~combout\ & (\inst5|Q\(6))) ) + ( \inst|Add0~10\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111000011000000000000000000000101010110101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_OP[0]~input_o\,
	datab => \inst14|ALT_INV_SEL~combout\,
	datac => \inst5|ALT_INV_Q\(6),
	datad => \inst3|ALT_INV_Q[6]~_Duplicate_1_q\,
	dataf => \inst4|ALT_INV_Q\(6),
	cin => \inst|Add0~10\,
	sumout => \inst|Add0~5_sumout\,
	cout => \inst|Add0~6\);

-- Location: LABCELL_X35_Y19_N21
\inst|Mux1~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|Mux1~0_combout\ = (!\OP[0]~input_o\ & (\inst|Mult0~14\)) # (\OP[0]~input_o\ & (((!\inst|Div0|auto_generated|divider|divider|sel\(1) & !\inst|Div0|auto_generated|divider|divider|add_sub_1_result_int[2]~1_sumout\))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101110001010000010111000101000001011100010100000101110001010000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst|ALT_INV_Mult0~14\,
	datab => \inst|Div0|auto_generated|divider|divider|ALT_INV_sel\(1),
	datac => \ALT_INV_OP[0]~input_o\,
	datad => \inst|Div0|auto_generated|divider|divider|ALT_INV_add_sub_1_result_int[2]~1_sumout\,
	combout => \inst|Mux1~0_combout\);

-- Location: LABCELL_X35_Y19_N0
\inst|Mux1~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|Mux1~1_combout\ = ( \inst|Mux1~0_combout\ & ( \inst|ALU_RESULT~1_combout\ & ( (!\OP[2]~input_o\ & (((\OP[1]~input_o\) # (\inst|Add0~5_sumout\)))) # (\OP[2]~input_o\ & (!\OP[0]~input_o\ & ((!\OP[1]~input_o\)))) ) ) ) # ( !\inst|Mux1~0_combout\ & ( 
-- \inst|ALU_RESULT~1_combout\ & ( (!\OP[1]~input_o\ & ((!\OP[2]~input_o\ & ((\inst|Add0~5_sumout\))) # (\OP[2]~input_o\ & (!\OP[0]~input_o\)))) ) ) ) # ( \inst|Mux1~0_combout\ & ( !\inst|ALU_RESULT~1_combout\ & ( (!\OP[2]~input_o\ & (((\OP[1]~input_o\) # 
-- (\inst|Add0~5_sumout\)))) # (\OP[2]~input_o\ & (\OP[0]~input_o\ & ((!\OP[1]~input_o\)))) ) ) ) # ( !\inst|Mux1~0_combout\ & ( !\inst|ALU_RESULT~1_combout\ & ( (!\OP[1]~input_o\ & ((!\OP[2]~input_o\ & ((\inst|Add0~5_sumout\))) # (\OP[2]~input_o\ & 
-- (\OP[0]~input_o\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001101100000000000110111010101001001110000000000100111010101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_OP[2]~input_o\,
	datab => \ALT_INV_OP[0]~input_o\,
	datac => \inst|ALT_INV_Add0~5_sumout\,
	datad => \ALT_INV_OP[1]~input_o\,
	datae => \inst|ALT_INV_Mux1~0_combout\,
	dataf => \inst|ALT_INV_ALU_RESULT~1_combout\,
	combout => \inst|Mux1~1_combout\);

-- Location: FF_X36_Y19_N2
\inst5|Q[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst14|WRC~combout\,
	asdata => \inst|Mux1~1_combout\,
	clrn => \ALT_INV_RST_C~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst5|Q\(6));

-- Location: LABCELL_X36_Y19_N54
\inst|Add0~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|Add0~1_sumout\ = SUM(( !\OP[0]~input_o\ $ (!\inst3|Q[7]~_Duplicate_1_q\) ) + ( (!\inst14|SEL~combout\ & ((\inst4|Q\(7)))) # (\inst14|SEL~combout\ & (\inst5|Q\(7))) ) + ( \inst|Add0~6\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111011100100010000000000000000000000111111110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst14|ALT_INV_SEL~combout\,
	datab => \inst5|ALT_INV_Q\(7),
	datac => \ALT_INV_OP[0]~input_o\,
	datad => \inst3|ALT_INV_Q[7]~_Duplicate_1_q\,
	dataf => \inst4|ALT_INV_Q\(7),
	cin => \inst|Add0~6\,
	sumout => \inst|Add0~1_sumout\);

-- Location: LABCELL_X35_Y19_N6
\inst|Mux0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|Mux0~0_combout\ = ( \inst|Mult0~15\ & ( (!\OP[0]~input_o\) # ((!\inst3|Q[1]~_Duplicate_1_q\ & (!\inst|Div0|auto_generated|divider|divider|add_sub_0_result_int[1]~1_sumout\ & !\inst|Div0|auto_generated|divider|divider|sel\(1)))) ) ) # ( 
-- !\inst|Mult0~15\ & ( (!\inst3|Q[1]~_Duplicate_1_q\ & (!\inst|Div0|auto_generated|divider|divider|add_sub_0_result_int[1]~1_sumout\ & (\OP[0]~input_o\ & !\inst|Div0|auto_generated|divider|divider|sel\(1)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000100000000000000010000000000011111000111100001111100011110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst3|ALT_INV_Q[1]~_Duplicate_1_q\,
	datab => \inst|Div0|auto_generated|divider|divider|ALT_INV_add_sub_0_result_int[1]~1_sumout\,
	datac => \ALT_INV_OP[0]~input_o\,
	datad => \inst|Div0|auto_generated|divider|divider|ALT_INV_sel\(1),
	dataf => \inst|ALT_INV_Mult0~15\,
	combout => \inst|Mux0~0_combout\);

-- Location: LABCELL_X35_Y19_N12
\inst|Mux0~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|Mux0~1_combout\ = ( \OP[1]~input_o\ & ( \inst|Mux0~0_combout\ & ( !\OP[2]~input_o\ ) ) ) # ( !\OP[1]~input_o\ & ( \inst|Mux0~0_combout\ & ( (!\OP[2]~input_o\ & (((\inst|Add0~1_sumout\)))) # (\OP[2]~input_o\ & (!\inst|ALU_RESULT~0_combout\ $ 
-- (((!\OP[0]~input_o\))))) ) ) ) # ( !\OP[1]~input_o\ & ( !\inst|Mux0~0_combout\ & ( (!\OP[2]~input_o\ & (((\inst|Add0~1_sumout\)))) # (\OP[2]~input_o\ & (!\inst|ALU_RESULT~0_combout\ $ (((!\OP[0]~input_o\))))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011010100111010000000000000000000110101001110101111000011110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst|ALT_INV_ALU_RESULT~0_combout\,
	datab => \inst|ALT_INV_Add0~1_sumout\,
	datac => \ALT_INV_OP[2]~input_o\,
	datad => \ALT_INV_OP[0]~input_o\,
	datae => \ALT_INV_OP[1]~input_o\,
	dataf => \inst|ALT_INV_Mux0~0_combout\,
	combout => \inst|Mux0~1_combout\);

-- Location: LABCELL_X36_Y19_N24
\inst14|STATE_OUT[1]\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst14|STATE_OUT\(1) = ( \inst14|CUR_STATE.ACCUM~q\ ) # ( !\inst14|CUR_STATE.ACCUM~q\ & ( \inst14|CUR_STATE.PROC~q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011001100110011001111111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \inst14|ALT_INV_CUR_STATE.PROC~q\,
	dataf => \inst14|ALT_INV_CUR_STATE.ACCUM~q\,
	combout => \inst14|STATE_OUT\(1));

-- Location: LABCELL_X36_Y19_N18
\inst14|STATE_OUT[0]\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst14|STATE_OUT\(0) = ( \inst14|CUR_STATE.FETCH~q\ ) # ( !\inst14|CUR_STATE.FETCH~q\ & ( \inst14|CUR_STATE.PROC~q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011001100110011001111111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \inst14|ALT_INV_CUR_STATE.PROC~q\,
	dataf => \inst14|ALT_INV_CUR_STATE.FETCH~q\,
	combout => \inst14|STATE_OUT\(0));

-- Location: LABCELL_X48_Y7_N0
\~QUARTUS_CREATED_GND~I\ : cyclonev_lcell_comb
-- Equation(s):

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
;
END structure;


