library ieee;
use ieee.std_logic_1164.all;
entity sequence_detector_tb is
end entity sequence_detector_tb;
architecture test of sequence_detector_tb is
component sequence_detector is
port(
input: in std_logic;
clk: in std_logic;
output: out std_logic
);
end component;
signal i :std_logic;
signal o : std_logic;
signal c : std_logic;
begin
machine:sequence_detector port map ( input => i, output => o, clk => c);
c <= '0', '1' after 25 ns, '0' after 50 ns, '1' after 75 ns, '0' after 100 ns, '1' after 125 ns, '0' after 150 ns, '1' after 175 ns, '0' after 200 ns, '1' after 225 ns, '0' after 250 ns, '1' after 275 ns;
i <= '0', '1' after 50 ns, '0' after 100 ns, '1' after 150 ns, '0' after 200 ns, '1' after 250 ns;
end test;