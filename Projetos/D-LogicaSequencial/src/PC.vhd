-- Elementos de Sistemas
-- developed by Luciano Soares
-- file: PC.vhd
-- date: 4/4/2017

-- Contador de 16bits
-- if (reset[t] == 1) out[t+1] = 0
-- else if (load[t] == 1)  out[t+1] = in[t]
-- else if (inc[t] == 1) out[t+1] = out[t] + 1
-- else out[t+1] = out[t]

library ieee;
use ieee.std_logic_1164.all;
use IEEE.NUMERIC_STD.ALL;

entity PC is
    port(
        clock     : in  STD_LOGIC;
        increment : in  STD_LOGIC;
        load      : in  STD_LOGIC;
        reset     : in  STD_LOGIC;
        input     : in  STD_LOGIC_VECTOR(15 downto 0);
        output    : out STD_LOGIC_VECTOR(15 downto 0)
    );
end entity;

architecture arch of PC is

 signal muxOut : std_logic_vector(15 downto 0);
 component Inc16 is
    port(
        a:  in STD_LOGIC_VECTOR(15 downto 0);
        q: out STD_LOGIC_VECTOR(15 downto 0)
        );
  end component;

  component Register16 is
    port(
        clock:   in STD_LOGIC;
        input:   in STD_LOGIC_VECTOR(15 downto 0);
        load:    in STD_LOGIC;
        output: out STD_LOGIC_VECTOR(15 downto 0)
      );
  end component;
  
  component Mux16 is
      port(
          a: in STD_LOGIC_VECTOR(15 downto 0);
          b: in STD_LOGIC_VECTOR(15 downto 0);
          sel: in  STD_LOGIC;
          q:   out STD_LOGIC_VECTOR(15 downto 0));
  end component;
  
signal outInc, outMuxInc, outMuxLoad, outMuxReset,outRegister: STD_LOGIC_VECTOR(15 downto 0);

begin

    INC: Inc16 port map (         
        a => outRegister,             
        q => outInc          
    );
	 
	 
    REG: Register16 port map (     
        clock => clock,
        input => outMuxReset,
        load  => '1',                       
        output => outRegister
    );

    MuxInc: Mux16 port map (    
        a => outRegister,             
        b => outInc,         
        sel => increment,     
        q => outMuxInc
    );

    MuxLoad: Mux16 port map(
        a => outMuxInc,                
        b => input,              
        sel => load,
        q => outMuxLoad 
    );

    MuxReset: Mux16 port map(
        a => outMuxLoad,          
        b =>  "0000000000000000",   
        sel => reset,
        q => outMuxReset 
    );    

    output <= outRegister;                         

end architecture;