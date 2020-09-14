library ieee;
use ieee.std_logic_1164.all;

entity ROM_tb is
end entity ROM_tb;
architecture test of ROM_tb is

component ROM is
	generic
	(
		W : integer;
		C : integer
	);
	port
	(
		data	: out std_logic_vector(W-1 downto 0);
		address	: in std_logic_vector(C-1 downto 0);
		rd		: in std_logic;
		reset		: in std_logic;
		clk		: in std_logic
	);
end component;

signal clock, clear, red :std_logic;
signal data_sig : std_logic_vector(4-1 downto 0);
signal addr : std_logic_vector(4-1 downto 0);

begin
rom1 : ROM
generic map (W => 4, C => 4)
port map ( clk => clock, reset => clear, rd => red, address => addr, data => data_sig);
clock <= '0', '1' after 25ns, '0' after 50ns, '1' after 75ns, '0' after 100ns, '1' after 125ns, '0' after 150ns, '1' after 175ns, '0' after 200ns, '1' after 225ns;
clear <= '1', '0' after 10ns;
red <= '1', '0' after 40ns, '1' after 80ns;
addr <= "1100", "0010" after 50ns, "1110" after 100ns;
end test;