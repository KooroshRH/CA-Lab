library ieee;
use ieee.std_logic_1164.all;
entity TestBench is
end entity TestBench;

architecture test of TestBench is
component basic_computer
   port( 
      	clk: in std_logic;
	res: out std_logic_vector(15 downto 0)
   ); 
end component; 
signal clock : std_logic ;
signal  result : std_Logic_vector(15 downto 0);
begin
bc : basic_computer port map (clk => clock, res => result);
clock <=  '1' after 0.5 ns when clock = '0' else
        '0' after 0.5 ns when clock = '1';
end test;