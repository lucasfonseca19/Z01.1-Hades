--
-- Elementos de Sistemas - Aula 5 - Logica Combinacional
-- Rafael . Corsi @ insper . edu . br
--
-- Arquivo exemplo para acionar os LEDs e ler os bottoes
-- da placa DE0-CV utilizada no curso de elementos de
-- sistemas do 3s da eng. da computacao

----------------------------
-- Bibliotecas ieee       --
----------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

----------------------------
-- Entrada e saidas do bloco
----------------------------
entity TopLevel is
	port(
		SW      : in  std_logic_vector(31 downto 0);
		LEDR    : out std_logic_vector(15 downto 0)
	);
end entity;

----------------------------
-- Implementacao do bloco --
----------------------------
architecture rtl of TopLevel is

--------------
-- signals
--------------

  signal x : std_logic_vector(15 downto 0) := x"0073"; -- 115
  signal y : std_logic_vector(15 downto 0) := x"005F"; -- 95

--------------
-- component
--------------
  component HalfAdder is
    port(
      a,b:         in STD_LOGIC;   -- entradas
      soma,vaium: out STD_LOGIC   -- sum e carry
      );
  end component;

  component FullAdder is
      port(
          a,b,c:      in STD_LOGIC;   -- entradas
          soma,vaium: out STD_LOGIC   -- sum e carry
          );
    end component;
	 
	component Add16 is
		port(
			a   :  in STD_LOGIC_VECTOR(15 downto 0);
			b   :  in STD_LOGIC_VECTOR(15 downto 0);
			q   : out STD_LOGIC_VECTOR(15 downto 0)
		);
	end component;

	component Inc16 is
		port(
			a   :  in STD_LOGIC_VECTOR(15 downto 0);
			q   : out STD_LOGIC_VECTOR(15 downto 0)
	);
	end component;
---------------
-- implementacao
---------------
begin
  -- u0 : HalfAdder port map(a => SW(0), b=> SW(1), soma => LEDR(0), vaium => LEDR(1));
  -- u1 : FullAdder port map(a => SW(0), b=> SW(1), c=> SW(2), soma => LEDR(0), vaium => LEDR(1));
  --u1 : Add16 port map(a => SW(15 downto 0), b=> SW(31 downto 16), q=> LEDR(15 downto 0));
  --u1 : Inc16 port map(a => SW(15 downto 0), q=> LEDR(15 downto 0));
end rtl;
