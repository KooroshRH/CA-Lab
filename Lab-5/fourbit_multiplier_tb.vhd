library ieee;
use ieee.std_logic_1164.all;

entity fourbit_multiplier_tb is
end entity fourbit_multiplier_tb;
architecture test of fourbit_multiplier_tb is

component fourbit_multiplier is
port(
	A, B : in std_logic_vector(3 downto 0);
	C : out std_logic_vector(7 downto 0)
);
end component;

signal x, y : std_logic_vector(3 downto 0);
signal sum : std_logic_vector(7 downto 0);

begin
mult : fourbit_multiplier port map ( A => x, B => y, C => sum);
x <= "0010", "0011" after 100ns;
y <= "0110", "1011" after 100ns;
end test;