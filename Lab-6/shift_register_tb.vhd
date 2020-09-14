library ieee;
use ieee.std_logic_1164.all;

entity shift_register_tb is
end entity shift_register_tb;
architecture test of shift_register_tb is

component shift_register is
port(
clk, reset, load : in std_logic;
 parallel_in : in std_logic_vector(3 downto 0);
 lr: in std_logic_vector(1 downto 0);
 reg_out : out std_logic_vector(3 downto 0)
);
end component;

signal clock, clear, insert :std_logic;
signal input : std_logic_vector(3 downto 0);
signal left_right : std_logic_vector(1 downto 0);
signal output : std_logic_vector(3 downto 0);

begin
reg : shift_register port map ( clk => clock, reset => clear, load => insert, parallel_in => input, lr => left_right, reg_out => output);
clock <= '0', '1' after 25ns, '0' after 50ns, '1' after 75ns, '0' after 100ns, '1' after 125ns, '0' after 150ns, '1' after 175ns, '0' after 200ns, '1' after 225ns;
input <= "0100";
insert <= '1', '0' after 200ns;
clear <= '0';
left_right <= "00", "10" after 50ns, "11" after 110ns;
end test;