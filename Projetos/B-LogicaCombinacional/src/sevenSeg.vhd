library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity sevenSeg is
	port (
			bcd : in  STD_LOGIC_VECTOR(3 downto 0);
			leds: out STD_LOGIC_VECTOR(6 downto 0));
end entity;

architecture arch of sevenSeg is
begin
	WITH bcd SELECT
    leds <= "0000001" WHEN "0000",
                 "1001111" WHEN "0001",
                 "0010010" WHEN "0010",
                 "0000110" WHEN "0011",
                 "1001100" WHEN "0100",
                 "0100100" WHEN "0101",
                 "0100000" WHEN "0110",
                 "0001111" WHEN "0111",
                 "0000000" WHEN "1000",
                 "0000100" WHEN "1001",
                 "0000001" WHEN OTHERS;
	
end architecture;
