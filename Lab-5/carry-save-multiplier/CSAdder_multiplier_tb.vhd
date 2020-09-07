library ieee;
use ieee.std_logic_1164.all;

entity CSAdder_multiplier_tb is
end entity CSAdder_multiplier_tb;
architecture test of CSAdder_multiplier_tb is

component CSAdder_multiplier is
port(
	A, B : in std_logic_vector(3 downto 0);
	C : out std_logic_vector(7 downto 0)
);
end component;

signal x, y : std_logic_vector(3 downto 0);
signal sum : std_logic_vector(7 downto 0);

begin
mult : CSAdder_multiplier port map ( A => x, B => y, C => sum);
x <= "0010", "0011" after 100 ns;
y <= "0010", "1010" after 100 ns;
end test;