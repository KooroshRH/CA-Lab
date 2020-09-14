library ieee;
use ieee.std_logic_1164.all;

entity dual_port_ram_tb is
end entity dual_port_ram_tb;
architecture test of dual_port_ram_tb is

component dual_port_ram is
	generic
	(
		W : integer;
		C : integer
	);
	port
	(
		data_a	: inout std_logic_vector(W-1 downto 0);
		data_b	: inout std_logic_vector(W-1 downto 0);
		address_a	: in std_logic_vector(C-1 downto 0);
		address_b	: in std_logic_vector(C-1 downto 0);
		wr_a		: in std_logic;
		wr_b		: in std_logic;
		rd_a		: in std_logic;
		rd_b		: in std_logic;
		reset		: in std_logic;
		clk		: in std_logic
	);
end component;

signal clock, clear, wrt_a, wrt_b, red_a, red_b :std_logic;
signal data_sig_a, data_sig_b : std_logic_vector(4-1 downto 0);
signal addr_a, addr_b : std_logic_vector(4-1 downto 0);

begin
ram : dual_port_ram
generic map (W => 4, C => 4)
port map ( clk => clock, reset => clear, wr_a => wrt_a, wr_b => wrt_b, rd_a => red_a, rd_b => red_b, address_a => addr_a, address_b => addr_b, data_a => data_sig_a, data_b => data_sig_b);
clock <= '0', '1' after 25ns, '0' after 50ns, '1' after 75ns, '0' after 100ns, '1' after 125ns, '0' after 150ns, '1' after 175ns, '0' after 200ns, '1' after 225ns;
clear <= '1', '0' after 10ns;
wrt_a <= '0', '1' after 40ns, '0' after 60ns;
red_a <= '1', '0' after 40ns, '1' after 80ns;
addr_a <= "1100", "0010" after 50ns;
wrt_b <= '0', '1' after 40ns, '0' after 90ns;
red_b <= '1', '0' after 40ns, '1' after 110ns;
addr_b <= "0011", "1111" after 50ns;
end test;