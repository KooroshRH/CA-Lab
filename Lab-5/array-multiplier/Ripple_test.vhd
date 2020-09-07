library ieee;
use ieee.std_logic_1164.all;

entity Ripple_test is
end entity Ripple_test;

architecture test of Ripple_test is
component Ripple_Adder is
port(
	x : in STD_LOGIC_VECTOR (3 downto 0);
	y : in STD_LOGIC_VECTOR (3 downto 0);
	Cin : in STD_LOGIC;
	S : out STD_LOGIC_VECTOR (3 downto 0);
	Cout : out STD_LOGIC
);
end component;

signal a : std_logic_vector(3 downto 0);
signal b : std_logic_vector(3 downto 0);
signal cin : std_logic;
signal res : std_logic_vector(3 downto 0);
signal cout : std_logic;

begin
Ra : Ripple_Adder port map ( x => a, y => b, Cin => cin, S => res, Cout => cout);
a <= "0011";
b <= "1000";
cin <= '1';

end test;