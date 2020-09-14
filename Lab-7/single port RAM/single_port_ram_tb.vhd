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
clock <= '0', '1' after 25ns, '0' after 50ns, '1' after 75ns, '0' after 100ns, '1' after 125ns, '0' after 150ns, '1' after 175ns, '0' after 200ns, '1' after 225ns;
clear <= '1', '0' after 10ns;
wrt <= '0', '1' after 40ns, '0' after 60ns;
red <= '1', '0' after 40ns, '1' after 80ns;
addr <= "1100", "0010" after 50ns;
end test;