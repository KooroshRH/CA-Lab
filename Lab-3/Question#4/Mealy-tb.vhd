library ieee;
use ieee.std_logic_1164.all;
entity mealy_tb is
end entity mealy_tb;
architecture test of mealy_tb is
component mealy_machine is
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
machine:mealy_machine port map ( input => i, output => o, clk => c);
c <= '0', '1' after 25 ns, '0' after 50 ns, '1' after 75 ns, '0' after 100 ns, '1' after 125 ns, '0' after 150 ns, '1' after 175 ns;
i <= '1', '1' after 50 ns, '0' after 100 ns, '1' after 150 ns, '1' after 200 ns;
end test;