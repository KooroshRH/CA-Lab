library ieee;
use ieee.std_logic_1164.all;

entity carry_select_tb is
end entity carry_select_tb;
architecture test of carry_select_tb is
component carry_select_adder is
port(
X : in STD_LOGIC_VECTOR (3 downto 0);
Y : in STD_LOGIC_VECTOR (3 downto 0);
CARRY_IN : in STD_LOGIC;
SUM : out STD_LOGIC_VECTOR (3 downto 0);
CARRY_OUT : out STD_LOGIC
);
end component;
signal a :std_logic_vector(3 downto 0);
signal b : std_logic_vector(3 downto 0);
signal cin : std_logic;
signal res : std_logic_vector(3 downto 0);
signal cout : std_logic;
begin
csa:carry_select_adder port map ( X => a, Y => b, CARRY_IN => cin, SUM => res, CARRY_OUT => cout);
a <= "0010";
b <= "0011";
cin <= '1';
end test;
