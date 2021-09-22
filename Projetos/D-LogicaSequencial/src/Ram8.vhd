-- Elementos de Sistemas
-- by Luciano Soares
-- Ram8.vhd

Library ieee;
use ieee.std_logic_1164.all;

entity Ram8 is
	port(
		clock:   in  STD_LOGIC;
		input:   in  STD_LOGIC_VECTOR(15 downto 0);
		load:    in  STD_LOGIC;
		address: in  STD_LOGIC_VECTOR( 2 downto 0);
		output:  out STD_LOGIC_VECTOR(15 downto 0)
	);
end entity;

architecture arch of Ram8 is

	component Register16 is
		port(
			clock:   in  STD_LOGIC;
			input:   in  STD_LOGIC_VECTOR(15 downto 0);
			load:    in  STD_LOGIC;
			output:  out STD_LOGIC_VECTOR(15 downto 0)
		);
	end component;

	component Mux8Way16 is
		port (
				a:   in  STD_LOGIC_VECTOR(15 downto 0);
				b:   in  STD_LOGIC_VECTOR(15 downto 0);
				c:   in  STD_LOGIC_VECTOR(15 downto 0);
				d:   in  STD_LOGIC_VECTOR(15 downto 0);
				e:   in  STD_LOGIC_VECTOR(15 downto 0);
				f:   in  STD_LOGIC_VECTOR(15 downto 0);
				g:   in  STD_LOGIC_VECTOR(15 downto 0);
				h:   in  STD_LOGIC_VECTOR(15 downto 0);
				sel: in  STD_LOGIC_VECTOR(2 downto 0);
				q:   out STD_LOGIC_VECTOR(15 downto 0));
	end component;

	component DMux8Way16 is
		port (
			a:   in  STD_LOGIC_VECTOR(15 downto 0);
			sel: in  STD_LOGIC_VECTOR(2 downto 0);
			q0:  out STD_LOGIC_VECTOR(15 downto 0);
			q1:  out STD_LOGIC_VECTOR(15 downto 0);
			q2:  out STD_LOGIC_VECTOR(15 downto 0);
			q3:  out STD_LOGIC_VECTOR(15 downto 0);
			q4:  out STD_LOGIC_VECTOR(15 downto 0);
			q5:  out STD_LOGIC_VECTOR(15 downto 0);
			q6:  out STD_LOGIC_VECTOR(15 downto 0);
			q7:  out STD_LOGIC_VECTOR(15 downto 0));
	end component;

	signal load0, load1, load2, load3, load4, load5, load6, load7 : STD_LOGIC;
	signal output0, output1, output2, output3, output4, output5, output6, output7 : STD_LOGIC_VECTOR(15 downto 0);
	signal outreg0, outreg1, outreg2, outreg3, outreg4, outreg5, outreg6, outreg7 : STD_LOGIC_VECTOR(15 downto 0);
begin
	

	DM0 : DMux8Way16 port map(
		a => input,
		sel => address,
		q0 => output0,
		q1 => output1, 
		q2 => output2,
		q3 => output3,
		q4 => output4,
		q5 => output5,
		q6 => output6,
		q7 => output7);
		
load0 <= load when (address = "000") else '0';
load1 <= load when (address = "001") else '0';
load2 <= load when (address = "010") else '0';
load3 <= load when (address = "011") else '0';
load4 <= load when (address = "100") else '0';
load5 <= load when (address = "101") else '0';
load6 <= load when (address = "110") else '0';
load7 <= load when (address = "111") else '0';
	
	R0 : Register16 port map(
		clock => clock,
		input => output0,
		load => load0,
		output => outreg0);
	R1 : Register16 port map(
		clock => clock,
		input => output1,
		load => load1,
		output => outreg1);
	R2 : Register16 port map(
		clock => clock,
		input => output2,
		load => load2,
		output => outreg2);
	R3 : Register16 port map(
		clock => clock,
		input => output3,
		load => load3,
		output => outreg3);
	R4 : Register16 port map(
		clock => clock,
		input => output4,
		load => load4,
		output => outreg4);
	R5 : Register16 port map(
		clock => clock,
		input => output5,
		load => load5,
		output => outreg5);
	R6 : Register16 port map(
		clock => clock,
		input => output6,
		load => load6,
		output => outreg6);
	R7 : Register16 port map(
		clock => clock,
		input => output7,
		load => load7,
		output => outreg7);
	M0 : Mux8Way16 port map(
		a => outreg0,
		b => outreg1,
		c => outreg2,
		d => outreg3,
		e => outreg4,
		f => outreg5,
		g => outreg6,
		h => outreg7,
		sel => address,
		q => output);
end architecture;
