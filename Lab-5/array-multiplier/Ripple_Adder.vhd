library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
 
entity Ripple_Adder is
Port ( 
	x : in STD_LOGIC_VECTOR (3 downto 0);
	y : in STD_LOGIC_VECTOR (3 downto 0);
	Cin : in STD_LOGIC;
	S : out STD_LOGIC_VECTOR (3 downto 0);
	Cout : out STD_LOGIC);
end Ripple_Adder;
 
architecture Behavioral of Ripple_Adder is
 
component full_adder
Port ( 
	A : in STD_LOGIC;
	B : in STD_LOGIC;
	Cin : in STD_LOGIC;
	S : out STD_LOGIC;
	Cout : out STD_LOGIC);
end component;
 

signal c1,c2,c3: STD_LOGIC;
 
begin
 

FA1: full_adder port map( x(0), y(0), Cin, S(0), c1);
FA2: full_adder port map( x(1), y(1), c1, S(1), c2);
FA3: full_adder port map( x(2), y(2), c2, S(2), c3);
FA4: full_adder port map( x(3), y(3), c3, S(3), Cout);
 
end Behavioral;
