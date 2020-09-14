library ieee;
use ieee.std_logic_1164.all;

entity single_port_ram_tb is
end entity single_port_ram_tb;
architecture test of single_port_ram_tb is

component single_port_ram is
	generic
	(
		W : integer;
		C : integer
	);
	port
	(
		data	: inout std_logic_vector(W-1 downto 0);
		address	: in std_logic_vector(C-1 downto 0);
		wr		: in std_logic;
		rd		: in std_logic;
		reset		: in std_logic;
		clk		: in std_logic
	);
end component;

signal clock, clear, wrt, red :std_logic;
signal data_sig : std_logic_vector(4-1 downto 0);
signal addr : std_logic_vector(4-1 downto 0);

begin
ram : single_port_ram
generic map (W => 4, C => 4)
port map ( clk => clock, reset => clear, wr => wrt, rd => red, address => addr, data => data_sig);
clock <= '0', '1' after 25 ns, '0' after 50 ns, '1' after 75 ns, '0' after 100 ns, '1' after 125 ns, '0' after 150 ns, '1' after 175 ns, '0' after 200 ns, '1' after 225 ns;
clear <= '0', '1' after 10 ns;
wrt <= '0', '1' after 40ns, '0' after 60 ns;
red <= '1', '0' after 40ns, '1' after 80 ns;
addr <= "1100", "0010" after 50 ns;
end test;