library ieee;
use ieee.std_logic_1164.all;

entity memory_tb is
end entity memory_tb;
architecture test of memory_tb is

component memory is
	port
	(
		input	: in std_logic_vector(15 downto 0);
		ram0 : in std_logic_vector(15 downto 0);
		ram1 : in std_logic_vector(15 downto 0);
		ram2 : in std_logic_vector(15 downto 0);
		ram10 : in std_logic_vector(15 downto 0);
		ram11 : in std_logic_vector(15 downto 0);
		output  : out std_logic_vector(15 downto 0);
		res     : out std_logic_vector(15 downto 0);
		address	: in std_logic_vector(15 downto 0);
		wr		: in std_logic;
		rd		: in std_logic;
		Clk		: in std_logic
	);
end component;

signal clock, clear, wrt, red :std_logic := '0';
signal data_sig, result, inp, addr : std_logic_vector(15 downto 0) := (others => '0');

begin

mem : Memory port map (input => inp, ram0 => "0010000000001010" , ram1 => "0001000000001011", ram2 => "0011000000001100", ram10 => "0000000000001111", ram11 => "0000000000001001",  output => data_sig, res => result, address => addr, wr => wrt, rd => red, Clk => clock);

clock <=  '1' after 0.5 ns when clock = '0' else
        '0' after 0.5 ns when clock = '1';

addr <= "0000000000000000", "0000000000001010" after 0.5 ns;
red <= '1';
wrt <= '0';
end test;