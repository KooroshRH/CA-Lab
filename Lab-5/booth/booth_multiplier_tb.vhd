library ieee;
use ieee.std_logic_1164.all;

entity booth_multiplier_tb is
end entity booth_multiplier_tb;
architecture test of booth_multiplier_tb is

component booth_multiplier is
port(
	x, y : in std_logic_vector(3 downto 0);
	O : out std_logic_vector(7 downto 0)
);
end component;

signal a, b : std_logic_vector(3 downto 0);
signal sum : std_logic_vector(7 downto 0);

begin
mult : booth_multiplier port map ( x => a, y => b, O => sum);
a <= "0010", "0011" after 100 ns;
b <= "0010", "1010" after 100 ns;
end test;