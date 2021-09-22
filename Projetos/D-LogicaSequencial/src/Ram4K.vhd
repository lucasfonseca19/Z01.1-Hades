-- Elementos de Sistemas
-- by Luciano Soares
-- Ram4K.vhd

Library ieee;
use ieee.std_logic_1164.all;

entity Ram4K is
	port(
		clock:   in  STD_LOGIC;
		input:   in  STD_LOGIC_VECTOR(15 downto 0);
		load:    in  STD_LOGIC;
		address: in  STD_LOGIC_VECTOR(11 downto 0);
		output:  out STD_LOGIC_VECTOR(15 downto 0)
	);
end entity;

architecture arch of Ram4K is

	component Ram512 is
		port(
			clock:   in  STD_LOGIC;
			input:   in  STD_LOGIC_VECTOR(15 downto 0);
			load:    in  STD_LOGIC;
			address: in  STD_LOGIC_VECTOR( 8 downto 0);
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
				sel: in  STD_LOGIC_VECTOR( 2 downto 0);
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
	signal address0 : STD_LOGIC_VECTOR(8 downto 0);
	signal address1 : STD_LOGIC_VECTOR(2 downto 0);
	signal output0, output1, output2, output3, output4, output5, output6, output7 : STD_LOGIC_VECTOR(15 downto 0);
	signal outram0, outram1, outram2, outram3, outram4, outram5, outram6, outram7 : STD_LOGIC_VECTOR(15 downto 0);
begin

	address0 <= address(8 downto 0);
	address1 <= address(11 downto 9);
	
	DM0 : DMux8Way16 port map(
		a => input,
		sel => address1,
		q0 => output0,
		q1 => output1, 
		q2 => output2,
		q3 => output3,
		q4 => output4,
		q5 => output5,
		q6 => output6,
		q7 => output7);
		
load0 <= load when (address1 = "000") else '0';
load1 <= load when (address1 = "001") else '0';
load2 <= load when (address1 = "010") else '0';
load3 <= load when (address1 = "011") else '0';
load4 <= load when (address1 = "100") else '0';
load5 <= load when (address1 = "101") else '0';
load6 <= load when (address1 = "110") else '0';
load7 <= load when (address1 = "111") else '0';
	
	R0 : Ram512 port map(
		clock => clock,
		input => output0,
		load => load0,
		address => address0,
		output => outram0);
	R1 : Ram512 port map(
		clock => clock,
		input => output1,
		load => load1,
		address => address0,
		output => outram1);
	R2 : Ram512 port map(
		clock => clock,
		input => output2,
		load => load2,
		address => address0,
		output => outram2);
	R3 : Ram512 port map(
		clock => clock,
		input => output3,
		load => load3,
		address => address0,
		output => outram3);
	R4 : Ram512 port map(
		clock => clock,
		input => output4,
		load => load4,
		address => address0,
		output => outram4);
	R5 : Ram512 port map(
		clock => clock,
		input => output5,
		load => load5,
		address => address0,
		output => outram5);
	R6 : Ram512 port map(
		clock => clock,
		input => output6,
		load => load6,
		address => address0,
		output => outram6);
	R7 : Ram512 port map(
		clock => clock,
		input => output7,
		load => load7,
		address => address0,
		output => outram7);
	M0 : Mux8Way16 port map(
		a => outram0,
		b => outram1,
		c => outram2,
		d => outram3,
		e => outram4,
		f => outram5,
		g => outram6,
		h => outram7,
		sel => address1,
		q => output);

end architecture;
