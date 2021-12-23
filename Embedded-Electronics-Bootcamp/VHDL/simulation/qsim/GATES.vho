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

-- DATE "12/22/2021 17:02:57"

-- 
-- Device: Altera 5CEBA4F17C6 Package FBGA256
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY ALTERA_LNSIM;
LIBRARY CYCLONEV;
LIBRARY IEEE;
USE ALTERA_LNSIM.ALTERA_LNSIM_COMPONENTS.ALL;
USE CYCLONEV.CYCLONEV_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	ALU IS
    PORT (
	A : IN std_logic_vector(7 DOWNTO 0);
	B : IN std_logic_vector(7 DOWNTO 0);
	OP : IN std_logic_vector(2 DOWNTO 0);
	RESULT : OUT std_logic_vector(7 DOWNTO 0);
	CARRYOUT : OUT std_logic
	);
END ALU;

-- Design Ports Information
-- RESULT[0]	=>  Location: PIN_R10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RESULT[1]	=>  Location: PIN_T5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RESULT[2]	=>  Location: PIN_M10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RESULT[3]	=>  Location: PIN_T12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RESULT[4]	=>  Location: PIN_M12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RESULT[5]	=>  Location: PIN_M8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RESULT[6]	=>  Location: PIN_P14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RESULT[7]	=>  Location: PIN_R16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- CARRYOUT	=>  Location: PIN_L10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- A[0]	=>  Location: PIN_R15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- OP[1]	=>  Location: PIN_M11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- OP[2]	=>  Location: PIN_R7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- OP[0]	=>  Location: PIN_T3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- A[1]	=>  Location: PIN_T13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- A[2]	=>  Location: PIN_L9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- A[3]	=>  Location: PIN_T8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- A[4]	=>  Location: PIN_P16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- A[5]	=>  Location: PIN_T10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- A[6]	=>  Location: PIN_N11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- A[7]	=>  Location: PIN_R9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- B[0]	=>  Location: PIN_M13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- B[1]	=>  Location: PIN_R12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- B[2]	=>  Location: PIN_T4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- B[3]	=>  Location: PIN_P9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- B[4]	=>  Location: PIN_T7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- B[5]	=>  Location: PIN_N14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- B[6]	=>  Location: PIN_T15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- B[7]	=>  Location: PIN_R11,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF ALU IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_A : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_B : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_OP : std_logic_vector(2 DOWNTO 0);
SIGNAL ww_RESULT : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_CARRYOUT : std_logic;
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \B[0]~input_o\ : std_logic;
SIGNAL \A[0]~input_o\ : std_logic;
SIGNAL \Add0~1_sumout\ : std_logic;
SIGNAL \Add1~1_sumout\ : std_logic;
SIGNAL \OP[0]~input_o\ : std_logic;
SIGNAL \OP[2]~input_o\ : std_logic;
SIGNAL \OP[1]~input_o\ : std_logic;
SIGNAL \Mux7~0_combout\ : std_logic;
SIGNAL \Mux7~1_combout\ : std_logic;
SIGNAL \B[1]~input_o\ : std_logic;
SIGNAL \A[1]~input_o\ : std_logic;
SIGNAL \Add1~2\ : std_logic;
SIGNAL \Add1~3\ : std_logic;
SIGNAL \Add1~5_sumout\ : std_logic;
SIGNAL \Add0~2\ : std_logic;
SIGNAL \Add0~5_sumout\ : std_logic;
SIGNAL \Mux6~0_combout\ : std_logic;
SIGNAL \A[2]~input_o\ : std_logic;
SIGNAL \B[2]~input_o\ : std_logic;
SIGNAL \Add1~6\ : std_logic;
SIGNAL \Add1~7\ : std_logic;
SIGNAL \Add1~9_sumout\ : std_logic;
SIGNAL \Add0~6\ : std_logic;
SIGNAL \Add0~9_sumout\ : std_logic;
SIGNAL \Mux5~0_combout\ : std_logic;
SIGNAL \A[3]~input_o\ : std_logic;
SIGNAL \B[3]~input_o\ : std_logic;
SIGNAL \Add0~10\ : std_logic;
SIGNAL \Add0~13_sumout\ : std_logic;
SIGNAL \Add1~10\ : std_logic;
SIGNAL \Add1~11\ : std_logic;
SIGNAL \Add1~13_sumout\ : std_logic;
SIGNAL \Mux4~0_combout\ : std_logic;
SIGNAL \A[4]~input_o\ : std_logic;
SIGNAL \B[4]~input_o\ : std_logic;
SIGNAL \Add0~14\ : std_logic;
SIGNAL \Add0~17_sumout\ : std_logic;
SIGNAL \Add1~14\ : std_logic;
SIGNAL \Add1~15\ : std_logic;
SIGNAL \Add1~17_sumout\ : std_logic;
SIGNAL \Mux3~0_combout\ : std_logic;
SIGNAL \A[5]~input_o\ : std_logic;
SIGNAL \B[5]~input_o\ : std_logic;
SIGNAL \Add0~18\ : std_logic;
SIGNAL \Add0~21_sumout\ : std_logic;
SIGNAL \Add1~18\ : std_logic;
SIGNAL \Add1~19\ : std_logic;
SIGNAL \Add1~21_sumout\ : std_logic;
SIGNAL \Mux2~0_combout\ : std_logic;
SIGNAL \A[6]~input_o\ : std_logic;
SIGNAL \B[6]~input_o\ : std_logic;
SIGNAL \Add0~22\ : std_logic;
SIGNAL \Add0~25_sumout\ : std_logic;
SIGNAL \Add1~22\ : std_logic;
SIGNAL \Add1~23\ : std_logic;
SIGNAL \Add1~25_sumout\ : std_logic;
SIGNAL \Mux1~0_combout\ : std_logic;
SIGNAL \A[7]~input_o\ : std_logic;
SIGNAL \B[7]~input_o\ : std_logic;
SIGNAL \Add0~26\ : std_logic;
SIGNAL \Add0~29_sumout\ : std_logic;
SIGNAL \Add1~26\ : std_logic;
SIGNAL \Add1~27\ : std_logic;
SIGNAL \Add1~29_sumout\ : std_logic;
SIGNAL \Mux0~0_combout\ : std_logic;
SIGNAL \Add1~30\ : std_logic;
SIGNAL \Add1~31\ : std_logic;
SIGNAL \Add1~33_sumout\ : std_logic;
SIGNAL \Add0~30\ : std_logic;
SIGNAL \Add0~33_sumout\ : std_logic;
SIGNAL \Mux8~0_combout\ : std_logic;
SIGNAL \ALT_INV_B[7]~input_o\ : std_logic;
SIGNAL \ALT_INV_B[6]~input_o\ : std_logic;
SIGNAL \ALT_INV_B[5]~input_o\ : std_logic;
SIGNAL \ALT_INV_B[4]~input_o\ : std_logic;
SIGNAL \ALT_INV_B[3]~input_o\ : std_logic;
SIGNAL \ALT_INV_B[2]~input_o\ : std_logic;
SIGNAL \ALT_INV_B[1]~input_o\ : std_logic;
SIGNAL \ALT_INV_B[0]~input_o\ : std_logic;
SIGNAL \ALT_INV_A[7]~input_o\ : std_logic;
SIGNAL \ALT_INV_A[6]~input_o\ : std_logic;
SIGNAL \ALT_INV_A[5]~input_o\ : std_logic;
SIGNAL \ALT_INV_A[4]~input_o\ : std_logic;
SIGNAL \ALT_INV_A[3]~input_o\ : std_logic;
SIGNAL \ALT_INV_A[2]~input_o\ : std_logic;
SIGNAL \ALT_INV_A[1]~input_o\ : std_logic;
SIGNAL \ALT_INV_OP[0]~input_o\ : std_logic;
SIGNAL \ALT_INV_OP[2]~input_o\ : std_logic;
SIGNAL \ALT_INV_OP[1]~input_o\ : std_logic;
SIGNAL \ALT_INV_A[0]~input_o\ : std_logic;
SIGNAL \ALT_INV_Mux7~0_combout\ : std_logic;
SIGNAL \ALT_INV_Add0~33_sumout\ : std_logic;
SIGNAL \ALT_INV_Add1~33_sumout\ : std_logic;
SIGNAL \ALT_INV_Add0~29_sumout\ : std_logic;
SIGNAL \ALT_INV_Add1~29_sumout\ : std_logic;
SIGNAL \ALT_INV_Add0~25_sumout\ : std_logic;
SIGNAL \ALT_INV_Add1~25_sumout\ : std_logic;
SIGNAL \ALT_INV_Add0~21_sumout\ : std_logic;
SIGNAL \ALT_INV_Add1~21_sumout\ : std_logic;
SIGNAL \ALT_INV_Add0~17_sumout\ : std_logic;
SIGNAL \ALT_INV_Add1~17_sumout\ : std_logic;
SIGNAL \ALT_INV_Add0~13_sumout\ : std_logic;
SIGNAL \ALT_INV_Add1~13_sumout\ : std_logic;
SIGNAL \ALT_INV_Add0~9_sumout\ : std_logic;
SIGNAL \ALT_INV_Add1~9_sumout\ : std_logic;
SIGNAL \ALT_INV_Add0~5_sumout\ : std_logic;
SIGNAL \ALT_INV_Add1~5_sumout\ : std_logic;
SIGNAL \ALT_INV_Add0~1_sumout\ : std_logic;
SIGNAL \ALT_INV_Add1~1_sumout\ : std_logic;

BEGIN

ww_A <= A;
ww_B <= B;
ww_OP <= OP;
RESULT <= ww_RESULT;
CARRYOUT <= ww_CARRYOUT;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\ALT_INV_B[7]~input_o\ <= NOT \B[7]~input_o\;
\ALT_INV_B[6]~input_o\ <= NOT \B[6]~input_o\;
\ALT_INV_B[5]~input_o\ <= NOT \B[5]~input_o\;
\ALT_INV_B[4]~input_o\ <= NOT \B[4]~input_o\;
\ALT_INV_B[3]~input_o\ <= NOT \B[3]~input_o\;
\ALT_INV_B[2]~input_o\ <= NOT \B[2]~input_o\;
\ALT_INV_B[1]~input_o\ <= NOT \B[1]~input_o\;
\ALT_INV_B[0]~input_o\ <= NOT \B[0]~input_o\;
\ALT_INV_A[7]~input_o\ <= NOT \A[7]~input_o\;
\ALT_INV_A[6]~input_o\ <= NOT \A[6]~input_o\;
\ALT_INV_A[5]~input_o\ <= NOT \A[5]~input_o\;
\ALT_INV_A[4]~input_o\ <= NOT \A[4]~input_o\;
\ALT_INV_A[3]~input_o\ <= NOT \A[3]~input_o\;
\ALT_INV_A[2]~input_o\ <= NOT \A[2]~input_o\;
\ALT_INV_A[1]~input_o\ <= NOT \A[1]~input_o\;
\ALT_INV_OP[0]~input_o\ <= NOT \OP[0]~input_o\;
\ALT_INV_OP[2]~input_o\ <= NOT \OP[2]~input_o\;
\ALT_INV_OP[1]~input_o\ <= NOT \OP[1]~input_o\;
\ALT_INV_A[0]~input_o\ <= NOT \A[0]~input_o\;
\ALT_INV_Mux7~0_combout\ <= NOT \Mux7~0_combout\;
\ALT_INV_Add0~33_sumout\ <= NOT \Add0~33_sumout\;
\ALT_INV_Add1~33_sumout\ <= NOT \Add1~33_sumout\;
\ALT_INV_Add0~29_sumout\ <= NOT \Add0~29_sumout\;
\ALT_INV_Add1~29_sumout\ <= NOT \Add1~29_sumout\;
\ALT_INV_Add0~25_sumout\ <= NOT \Add0~25_sumout\;
\ALT_INV_Add1~25_sumout\ <= NOT \Add1~25_sumout\;
\ALT_INV_Add0~21_sumout\ <= NOT \Add0~21_sumout\;
\ALT_INV_Add1~21_sumout\ <= NOT \Add1~21_sumout\;
\ALT_INV_Add0~17_sumout\ <= NOT \Add0~17_sumout\;
\ALT_INV_Add1~17_sumout\ <= NOT \Add1~17_sumout\;
\ALT_INV_Add0~13_sumout\ <= NOT \Add0~13_sumout\;
\ALT_INV_Add1~13_sumout\ <= NOT \Add1~13_sumout\;
\ALT_INV_Add0~9_sumout\ <= NOT \Add0~9_sumout\;
\ALT_INV_Add1~9_sumout\ <= NOT \Add1~9_sumout\;
\ALT_INV_Add0~5_sumout\ <= NOT \Add0~5_sumout\;
\ALT_INV_Add1~5_sumout\ <= NOT \Add1~5_sumout\;
\ALT_INV_Add0~1_sumout\ <= NOT \Add0~1_sumout\;
\ALT_INV_Add1~1_sumout\ <= NOT \Add1~1_sumout\;

-- Location: IOOBUF_X29_Y0_N36
\RESULT[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux7~1_combout\,
	devoe => ww_devoe,
	o => ww_RESULT(0));

-- Location: IOOBUF_X23_Y0_N93
\RESULT[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux6~0_combout\,
	devoe => ww_devoe,
	o => ww_RESULT(1));

-- Location: IOOBUF_X34_Y0_N19
\RESULT[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux5~0_combout\,
	devoe => ww_devoe,
	o => ww_RESULT(2));

-- Location: IOOBUF_X25_Y0_N19
\RESULT[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux4~0_combout\,
	devoe => ww_devoe,
	o => ww_RESULT(3));

-- Location: IOOBUF_X36_Y0_N19
\RESULT[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux3~0_combout\,
	devoe => ww_devoe,
	o => ww_RESULT(4));

-- Location: IOOBUF_X24_Y0_N19
\RESULT[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux2~0_combout\,
	devoe => ww_devoe,
	o => ww_RESULT(5));

-- Location: IOOBUF_X36_Y0_N53
\RESULT[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux1~0_combout\,
	devoe => ww_devoe,
	o => ww_RESULT(6));

-- Location: IOOBUF_X33_Y0_N42
\RESULT[7]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux0~0_combout\,
	devoe => ww_devoe,
	o => ww_RESULT(7));

-- Location: IOOBUF_X34_Y0_N2
\CARRYOUT~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux8~0_combout\,
	devoe => ww_devoe,
	o => ww_CARRYOUT);

-- Location: IOIBUF_X34_Y0_N52
\B[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_B(0),
	o => \B[0]~input_o\);

-- Location: IOIBUF_X33_Y0_N92
\A[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_A(0),
	o => \A[0]~input_o\);

-- Location: MLABCELL_X28_Y3_N30
\Add0~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~1_sumout\ = SUM(( \B[0]~input_o\ ) + ( \A[0]~input_o\ ) + ( !VCC ))
-- \Add0~2\ = CARRY(( \B[0]~input_o\ ) + ( \A[0]~input_o\ ) + ( !VCC ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111110000000000000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_B[0]~input_o\,
	dataf => \ALT_INV_A[0]~input_o\,
	cin => GND,
	sumout => \Add0~1_sumout\,
	cout => \Add0~2\);

-- Location: LABCELL_X29_Y3_N30
\Add1~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add1~1_sumout\ = SUM(( !\B[0]~input_o\ $ (!\A[0]~input_o\) ) + ( !VCC ) + ( !VCC ))
-- \Add1~2\ = CARRY(( !\B[0]~input_o\ $ (!\A[0]~input_o\) ) + ( !VCC ) + ( !VCC ))
-- \Add1~3\ = SHARE((!\B[0]~input_o\) # (\A[0]~input_o\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000101011111010111100000000000000000101101001011010",
	shared_arith => "on")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_B[0]~input_o\,
	datac => \ALT_INV_A[0]~input_o\,
	cin => GND,
	sharein => GND,
	sumout => \Add1~1_sumout\,
	cout => \Add1~2\,
	shareout => \Add1~3\);

-- Location: IOIBUF_X14_Y0_N52
\OP[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_OP(0),
	o => \OP[0]~input_o\);

-- Location: IOIBUF_X23_Y0_N58
\OP[2]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_OP(2),
	o => \OP[2]~input_o\);

-- Location: IOIBUF_X36_Y0_N1
\OP[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_OP(1),
	o => \OP[1]~input_o\);

-- Location: LABCELL_X29_Y3_N3
\Mux7~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux7~0_combout\ = ( !\OP[1]~input_o\ & ( !\OP[2]~input_o\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010101010101010101010101010101000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_OP[2]~input_o\,
	dataf => \ALT_INV_OP[1]~input_o\,
	combout => \Mux7~0_combout\);

-- Location: LABCELL_X29_Y3_N9
\Mux7~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux7~1_combout\ = ( \A[0]~input_o\ & ( (!\Mux7~0_combout\) # ((!\OP[0]~input_o\ & (\Add0~1_sumout\)) # (\OP[0]~input_o\ & ((\Add1~1_sumout\)))) ) ) # ( !\A[0]~input_o\ & ( (\Mux7~0_combout\ & ((!\OP[0]~input_o\ & (\Add0~1_sumout\)) # (\OP[0]~input_o\ & 
-- ((\Add1~1_sumout\))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000001010011111111110101001100000000010100111111111101010011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Add0~1_sumout\,
	datab => \ALT_INV_Add1~1_sumout\,
	datac => \ALT_INV_OP[0]~input_o\,
	datad => \ALT_INV_Mux7~0_combout\,
	datae => \ALT_INV_A[0]~input_o\,
	combout => \Mux7~1_combout\);

-- Location: IOIBUF_X25_Y0_N35
\B[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_B(1),
	o => \B[1]~input_o\);

-- Location: IOIBUF_X25_Y0_N1
\A[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_A(1),
	o => \A[1]~input_o\);

-- Location: LABCELL_X29_Y3_N33
\Add1~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add1~5_sumout\ = SUM(( !\B[1]~input_o\ $ (\A[1]~input_o\) ) + ( \Add1~3\ ) + ( \Add1~2\ ))
-- \Add1~6\ = CARRY(( !\B[1]~input_o\ $ (\A[1]~input_o\) ) + ( \Add1~3\ ) + ( \Add1~2\ ))
-- \Add1~7\ = SHARE((!\B[1]~input_o\ & \A[1]~input_o\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000011000000110000000000000000001100001111000011",
	shared_arith => "on")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_B[1]~input_o\,
	datac => \ALT_INV_A[1]~input_o\,
	cin => \Add1~2\,
	sharein => \Add1~3\,
	sumout => \Add1~5_sumout\,
	cout => \Add1~6\,
	shareout => \Add1~7\);

-- Location: MLABCELL_X28_Y3_N33
\Add0~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~5_sumout\ = SUM(( \B[1]~input_o\ ) + ( \A[1]~input_o\ ) + ( \Add0~2\ ))
-- \Add0~6\ = CARRY(( \B[1]~input_o\ ) + ( \A[1]~input_o\ ) + ( \Add0~2\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_B[1]~input_o\,
	datac => \ALT_INV_A[1]~input_o\,
	cin => \Add0~2\,
	sumout => \Add0~5_sumout\,
	cout => \Add0~6\);

-- Location: MLABCELL_X28_Y3_N0
\Mux6~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux6~0_combout\ = ( \A[1]~input_o\ & ( (!\Mux7~0_combout\) # ((!\OP[0]~input_o\ & ((\Add0~5_sumout\))) # (\OP[0]~input_o\ & (\Add1~5_sumout\))) ) ) # ( !\A[1]~input_o\ & ( (\Mux7~0_combout\ & ((!\OP[0]~input_o\ & ((\Add0~5_sumout\))) # (\OP[0]~input_o\ & 
-- (\Add1~5_sumout\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000101000101000000010100010110101011111011111010101111101111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Mux7~0_combout\,
	datab => \ALT_INV_OP[0]~input_o\,
	datac => \ALT_INV_Add1~5_sumout\,
	datad => \ALT_INV_Add0~5_sumout\,
	dataf => \ALT_INV_A[1]~input_o\,
	combout => \Mux6~0_combout\);

-- Location: IOIBUF_X24_Y0_N1
\A[2]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_A(2),
	o => \A[2]~input_o\);

-- Location: IOIBUF_X23_Y0_N75
\B[2]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_B(2),
	o => \B[2]~input_o\);

-- Location: LABCELL_X29_Y3_N36
\Add1~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add1~9_sumout\ = SUM(( !\B[2]~input_o\ $ (\A[2]~input_o\) ) + ( \Add1~7\ ) + ( \Add1~6\ ))
-- \Add1~10\ = CARRY(( !\B[2]~input_o\ $ (\A[2]~input_o\) ) + ( \Add1~7\ ) + ( \Add1~6\ ))
-- \Add1~11\ = SHARE((!\B[2]~input_o\ & \A[2]~input_o\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000011000000110000000000000000001100001111000011",
	shared_arith => "on")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_B[2]~input_o\,
	datac => \ALT_INV_A[2]~input_o\,
	cin => \Add1~6\,
	sharein => \Add1~7\,
	sumout => \Add1~9_sumout\,
	cout => \Add1~10\,
	shareout => \Add1~11\);

-- Location: MLABCELL_X28_Y3_N36
\Add0~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~9_sumout\ = SUM(( \B[2]~input_o\ ) + ( \A[2]~input_o\ ) + ( \Add0~6\ ))
-- \Add0~10\ = CARRY(( \B[2]~input_o\ ) + ( \A[2]~input_o\ ) + ( \Add0~6\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000101010101010101000000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_A[2]~input_o\,
	datac => \ALT_INV_B[2]~input_o\,
	cin => \Add0~6\,
	sumout => \Add0~9_sumout\,
	cout => \Add0~10\);

-- Location: LABCELL_X29_Y3_N15
\Mux5~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux5~0_combout\ = ( \Add0~9_sumout\ & ( (!\Mux7~0_combout\ & (((\A[2]~input_o\)))) # (\Mux7~0_combout\ & ((!\OP[0]~input_o\) # ((\Add1~9_sumout\)))) ) ) # ( !\Add0~9_sumout\ & ( (!\Mux7~0_combout\ & (((\A[2]~input_o\)))) # (\Mux7~0_combout\ & 
-- (\OP[0]~input_o\ & ((\Add1~9_sumout\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000101000011011000010100001101101001110010111110100111001011111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Mux7~0_combout\,
	datab => \ALT_INV_OP[0]~input_o\,
	datac => \ALT_INV_A[2]~input_o\,
	datad => \ALT_INV_Add1~9_sumout\,
	dataf => \ALT_INV_Add0~9_sumout\,
	combout => \Mux5~0_combout\);

-- Location: IOIBUF_X24_Y0_N35
\A[3]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_A(3),
	o => \A[3]~input_o\);

-- Location: IOIBUF_X29_Y0_N1
\B[3]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_B(3),
	o => \B[3]~input_o\);

-- Location: MLABCELL_X28_Y3_N39
\Add0~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~13_sumout\ = SUM(( \A[3]~input_o\ ) + ( \B[3]~input_o\ ) + ( \Add0~10\ ))
-- \Add0~14\ = CARRY(( \A[3]~input_o\ ) + ( \B[3]~input_o\ ) + ( \Add0~10\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111110000000000000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_A[3]~input_o\,
	dataf => \ALT_INV_B[3]~input_o\,
	cin => \Add0~10\,
	sumout => \Add0~13_sumout\,
	cout => \Add0~14\);

-- Location: LABCELL_X29_Y3_N39
\Add1~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add1~13_sumout\ = SUM(( !\A[3]~input_o\ $ (\B[3]~input_o\) ) + ( \Add1~11\ ) + ( \Add1~10\ ))
-- \Add1~14\ = CARRY(( !\A[3]~input_o\ $ (\B[3]~input_o\) ) + ( \Add1~11\ ) + ( \Add1~10\ ))
-- \Add1~15\ = SHARE((\A[3]~input_o\ & !\B[3]~input_o\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000010100000101000000000000000000001010010110100101",
	shared_arith => "on")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_A[3]~input_o\,
	datac => \ALT_INV_B[3]~input_o\,
	cin => \Add1~10\,
	sharein => \Add1~11\,
	sumout => \Add1~13_sumout\,
	cout => \Add1~14\,
	shareout => \Add1~15\);

-- Location: MLABCELL_X28_Y3_N6
\Mux4~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux4~0_combout\ = ( \OP[0]~input_o\ & ( \Add1~13_sumout\ & ( (\A[3]~input_o\) # (\Mux7~0_combout\) ) ) ) # ( !\OP[0]~input_o\ & ( \Add1~13_sumout\ & ( (!\Mux7~0_combout\ & ((\A[3]~input_o\))) # (\Mux7~0_combout\ & (\Add0~13_sumout\)) ) ) ) # ( 
-- \OP[0]~input_o\ & ( !\Add1~13_sumout\ & ( (!\Mux7~0_combout\ & \A[3]~input_o\) ) ) ) # ( !\OP[0]~input_o\ & ( !\Add1~13_sumout\ & ( (!\Mux7~0_combout\ & ((\A[3]~input_o\))) # (\Mux7~0_combout\ & (\Add0~13_sumout\)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000001111110011000000001111000000000011111100110000111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_Add0~13_sumout\,
	datac => \ALT_INV_Mux7~0_combout\,
	datad => \ALT_INV_A[3]~input_o\,
	datae => \ALT_INV_OP[0]~input_o\,
	dataf => \ALT_INV_Add1~13_sumout\,
	combout => \Mux4~0_combout\);

-- Location: IOIBUF_X33_Y0_N75
\A[4]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_A(4),
	o => \A[4]~input_o\);

-- Location: IOIBUF_X24_Y0_N52
\B[4]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_B(4),
	o => \B[4]~input_o\);

-- Location: MLABCELL_X28_Y3_N42
\Add0~17\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~17_sumout\ = SUM(( \B[4]~input_o\ ) + ( \A[4]~input_o\ ) + ( \Add0~14\ ))
-- \Add0~18\ = CARRY(( \B[4]~input_o\ ) + ( \A[4]~input_o\ ) + ( \Add0~14\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_B[4]~input_o\,
	datac => \ALT_INV_A[4]~input_o\,
	cin => \Add0~14\,
	sumout => \Add0~17_sumout\,
	cout => \Add0~18\);

-- Location: LABCELL_X29_Y3_N42
\Add1~17\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add1~17_sumout\ = SUM(( !\B[4]~input_o\ $ (\A[4]~input_o\) ) + ( \Add1~15\ ) + ( \Add1~14\ ))
-- \Add1~18\ = CARRY(( !\B[4]~input_o\ $ (\A[4]~input_o\) ) + ( \Add1~15\ ) + ( \Add1~14\ ))
-- \Add1~19\ = SHARE((!\B[4]~input_o\ & \A[4]~input_o\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000011000000110000000000000000001100001111000011",
	shared_arith => "on")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_B[4]~input_o\,
	datac => \ALT_INV_A[4]~input_o\,
	cin => \Add1~14\,
	sharein => \Add1~15\,
	sumout => \Add1~17_sumout\,
	cout => \Add1~18\,
	shareout => \Add1~19\);

-- Location: LABCELL_X29_Y3_N12
\Mux3~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux3~0_combout\ = ( \Add1~17_sumout\ & ( (!\Mux7~0_combout\ & (((\A[4]~input_o\)))) # (\Mux7~0_combout\ & (((\Add0~17_sumout\)) # (\OP[0]~input_o\))) ) ) # ( !\Add1~17_sumout\ & ( (!\Mux7~0_combout\ & (((\A[4]~input_o\)))) # (\Mux7~0_combout\ & 
-- (!\OP[0]~input_o\ & ((\Add0~17_sumout\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000101001001110000010100100111000011011010111110001101101011111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Mux7~0_combout\,
	datab => \ALT_INV_OP[0]~input_o\,
	datac => \ALT_INV_A[4]~input_o\,
	datad => \ALT_INV_Add0~17_sumout\,
	dataf => \ALT_INV_Add1~17_sumout\,
	combout => \Mux3~0_combout\);

-- Location: IOIBUF_X29_Y0_N52
\A[5]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_A(5),
	o => \A[5]~input_o\);

-- Location: IOIBUF_X34_Y0_N35
\B[5]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_B(5),
	o => \B[5]~input_o\);

-- Location: MLABCELL_X28_Y3_N45
\Add0~21\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~21_sumout\ = SUM(( \B[5]~input_o\ ) + ( \A[5]~input_o\ ) + ( \Add0~18\ ))
-- \Add0~22\ = CARRY(( \B[5]~input_o\ ) + ( \A[5]~input_o\ ) + ( \Add0~18\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_B[5]~input_o\,
	datac => \ALT_INV_A[5]~input_o\,
	cin => \Add0~18\,
	sumout => \Add0~21_sumout\,
	cout => \Add0~22\);

-- Location: LABCELL_X29_Y3_N45
\Add1~21\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add1~21_sumout\ = SUM(( !\A[5]~input_o\ $ (\B[5]~input_o\) ) + ( \Add1~19\ ) + ( \Add1~18\ ))
-- \Add1~22\ = CARRY(( !\A[5]~input_o\ $ (\B[5]~input_o\) ) + ( \Add1~19\ ) + ( \Add1~18\ ))
-- \Add1~23\ = SHARE((\A[5]~input_o\ & !\B[5]~input_o\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000010100000101000000000000000000001010010110100101",
	shared_arith => "on")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_A[5]~input_o\,
	datac => \ALT_INV_B[5]~input_o\,
	cin => \Add1~18\,
	sharein => \Add1~19\,
	sumout => \Add1~21_sumout\,
	cout => \Add1~22\,
	shareout => \Add1~23\);

-- Location: MLABCELL_X28_Y3_N3
\Mux2~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux2~0_combout\ = ( \Add1~21_sumout\ & ( (!\Mux7~0_combout\ & (((\A[5]~input_o\)))) # (\Mux7~0_combout\ & (((\Add0~21_sumout\)) # (\OP[0]~input_o\))) ) ) # ( !\Add1~21_sumout\ & ( (!\Mux7~0_combout\ & (((\A[5]~input_o\)))) # (\Mux7~0_combout\ & 
-- (!\OP[0]~input_o\ & ((\Add0~21_sumout\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000101001001110000010100100111000011011010111110001101101011111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Mux7~0_combout\,
	datab => \ALT_INV_OP[0]~input_o\,
	datac => \ALT_INV_A[5]~input_o\,
	datad => \ALT_INV_Add0~21_sumout\,
	dataf => \ALT_INV_Add1~21_sumout\,
	combout => \Mux2~0_combout\);

-- Location: IOIBUF_X38_Y0_N1
\A[6]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_A(6),
	o => \A[6]~input_o\);

-- Location: IOIBUF_X33_Y0_N58
\B[6]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_B(6),
	o => \B[6]~input_o\);

-- Location: MLABCELL_X28_Y3_N48
\Add0~25\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~25_sumout\ = SUM(( \B[6]~input_o\ ) + ( \A[6]~input_o\ ) + ( \Add0~22\ ))
-- \Add0~26\ = CARRY(( \B[6]~input_o\ ) + ( \A[6]~input_o\ ) + ( \Add0~22\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000110011001100110000000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_A[6]~input_o\,
	datac => \ALT_INV_B[6]~input_o\,
	cin => \Add0~22\,
	sumout => \Add0~25_sumout\,
	cout => \Add0~26\);

-- Location: LABCELL_X29_Y3_N48
\Add1~25\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add1~25_sumout\ = SUM(( !\B[6]~input_o\ $ (\A[6]~input_o\) ) + ( \Add1~23\ ) + ( \Add1~22\ ))
-- \Add1~26\ = CARRY(( !\B[6]~input_o\ $ (\A[6]~input_o\) ) + ( \Add1~23\ ) + ( \Add1~22\ ))
-- \Add1~27\ = SHARE((!\B[6]~input_o\ & \A[6]~input_o\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000001100110000000000000000001100110000110011",
	shared_arith => "on")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_B[6]~input_o\,
	datad => \ALT_INV_A[6]~input_o\,
	cin => \Add1~22\,
	sharein => \Add1~23\,
	sumout => \Add1~25_sumout\,
	cout => \Add1~26\,
	shareout => \Add1~27\);

-- Location: LABCELL_X29_Y3_N21
\Mux1~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux1~0_combout\ = ( \Mux7~0_combout\ & ( (!\OP[0]~input_o\ & (\Add0~25_sumout\)) # (\OP[0]~input_o\ & ((\Add1~25_sumout\))) ) ) # ( !\Mux7~0_combout\ & ( \A[6]~input_o\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011010100000101111100110011001100110101000001011111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Add0~25_sumout\,
	datab => \ALT_INV_A[6]~input_o\,
	datac => \ALT_INV_OP[0]~input_o\,
	datad => \ALT_INV_Add1~25_sumout\,
	datae => \ALT_INV_Mux7~0_combout\,
	combout => \Mux1~0_combout\);

-- Location: IOIBUF_X29_Y0_N18
\A[7]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_A(7),
	o => \A[7]~input_o\);

-- Location: IOIBUF_X25_Y0_N52
\B[7]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_B(7),
	o => \B[7]~input_o\);

-- Location: MLABCELL_X28_Y3_N51
\Add0~29\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~29_sumout\ = SUM(( \B[7]~input_o\ ) + ( \A[7]~input_o\ ) + ( \Add0~26\ ))
-- \Add0~30\ = CARRY(( \B[7]~input_o\ ) + ( \A[7]~input_o\ ) + ( \Add0~26\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000101010101010101000000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_A[7]~input_o\,
	datac => \ALT_INV_B[7]~input_o\,
	cin => \Add0~26\,
	sumout => \Add0~29_sumout\,
	cout => \Add0~30\);

-- Location: LABCELL_X29_Y3_N51
\Add1~29\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add1~29_sumout\ = SUM(( !\B[7]~input_o\ $ (\A[7]~input_o\) ) + ( \Add1~27\ ) + ( \Add1~26\ ))
-- \Add1~30\ = CARRY(( !\B[7]~input_o\ $ (\A[7]~input_o\) ) + ( \Add1~27\ ) + ( \Add1~26\ ))
-- \Add1~31\ = SHARE((!\B[7]~input_o\ & \A[7]~input_o\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000010100000101000000000000000001010010110100101",
	shared_arith => "on")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_B[7]~input_o\,
	datac => \ALT_INV_A[7]~input_o\,
	cin => \Add1~26\,
	sharein => \Add1~27\,
	sumout => \Add1~29_sumout\,
	cout => \Add1~30\,
	shareout => \Add1~31\);

-- Location: LABCELL_X29_Y3_N24
\Mux0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux0~0_combout\ = ( \Add1~29_sumout\ & ( (!\Mux7~0_combout\ & (((\A[7]~input_o\)))) # (\Mux7~0_combout\ & (((\Add0~29_sumout\)) # (\OP[0]~input_o\))) ) ) # ( !\Add1~29_sumout\ & ( (!\Mux7~0_combout\ & (((\A[7]~input_o\)))) # (\Mux7~0_combout\ & 
-- (!\OP[0]~input_o\ & (\Add0~29_sumout\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010010101110000001001010111000010101101111110001010110111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Mux7~0_combout\,
	datab => \ALT_INV_OP[0]~input_o\,
	datac => \ALT_INV_Add0~29_sumout\,
	datad => \ALT_INV_A[7]~input_o\,
	dataf => \ALT_INV_Add1~29_sumout\,
	combout => \Mux0~0_combout\);

-- Location: LABCELL_X29_Y3_N54
\Add1~33\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add1~33_sumout\ = SUM(( VCC ) + ( \Add1~31\ ) + ( \Add1~30\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000001111111111111111",
	shared_arith => "on")
-- pragma translate_on
PORT MAP (
	cin => \Add1~30\,
	sharein => \Add1~31\,
	sumout => \Add1~33_sumout\);

-- Location: MLABCELL_X28_Y3_N54
\Add0~33\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~33_sumout\ = SUM(( GND ) + ( GND ) + ( \Add0~30\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	cin => \Add0~30\,
	sumout => \Add0~33_sumout\);

-- Location: LABCELL_X29_Y3_N27
\Mux8~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux8~0_combout\ = ( \Add0~33_sumout\ & ( (!\Mux7~0_combout\) # ((!\OP[0]~input_o\) # (\Add1~33_sumout\)) ) ) # ( !\Add0~33_sumout\ & ( (\Mux7~0_combout\ & (\OP[0]~input_o\ & \Add1~33_sumout\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000010001000000000001000111101110111111111110111011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Mux7~0_combout\,
	datab => \ALT_INV_OP[0]~input_o\,
	datad => \ALT_INV_Add1~33_sumout\,
	dataf => \ALT_INV_Add0~33_sumout\,
	combout => \Mux8~0_combout\);

-- Location: LABCELL_X35_Y35_N0
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


