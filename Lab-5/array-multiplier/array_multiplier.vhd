library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity array_multiplier is
 port (
 	A : in STD_LOGIC_Vector(3 downto 0);
 	B : in STD_LOGIC_VECTOR(3 downto 0);
	C : out STD_LOGIC_VECTOR(7 downto 0)
 );
end array_multiplier;

architecture behavioral of array_multiplier is
component Ripple_adder
 port (
 	x : in STD_LOGIC_VECTOR(3 downto 0);
 	y : in STD_LOGIC_VECTOR(3 downto 0);
 	Cin : in STD_LOGIC;
 	S : out STD_LOGIC_VECTOR(3 downto 0);
	Cout : out STD_LOGIC
 );
end component;


component and_gate
 port (
 	in1 : in STD_LOGIC;
 	in2 : in STD_LOGIC;
 	outA : out STD_LOGIC
 );
end component;

signal out_and_1, out_and_2, out_and_3, out_and_4, out_and_5, out_and_6, out_and_7, out_and_8, out_and_9, 
	out_and_10, out_and_11, out_and_12, out_and_13, out_and_14, out_and_15 : STD_LOGIC;
signal co_RA_1, co_RA_2 : STD_LOGIC;
signal sum_RA_1, sum_RA_2 : STD_LOGIC_VECTOR(3 downto 0);



begin

C(0) <= A(0) and B(0);
and1 : and_gate port map(in1 => A(1), in2 => B(0), outA => out_and_1);
and2 : and_gate port map(in1 => A(2), in2 => B(0), outA => out_and_2);
and3 : and_gate port map(in1 => A(3), in2 => B(0), outA => out_and_3);

and4 : and_gate port map(in1 => A(0), in2 => B(1), outA => out_and_4);
and5 : and_gate port map(in1 => A(1), in2 => B(1), outA => out_and_5);
and6 : and_gate port map(in1 => A(2), in2 => B(1), outA => out_and_6);
and7 : and_gate port map(in1 => A(3), in2 => B(1), outA => out_and_7);

and8 : and_gate port map(in1 => A(0), in2 => B(2), outA => out_and_8);
and9 : and_gate port map(in1 => A(1), in2 => B(2), outA => out_and_9);
and10 : and_gate port map(in1 => A(2), in2 => B(2), outA => out_and_10);
and11 : and_gate port map(in1 => A(3), in2 => B(2), outA => out_and_11);

and12 : and_gate port map(in1 => A(0), in2 => B(3), outA => out_and_12);
and13 : and_gate port map(in1 => A(1), in2 => B(3), outA => out_and_13);
and14 : and_gate port map(in1 => A(2), in2 => B(3), outA => out_and_14);
and15 : and_gate port map(in1 => A(3), in2 => B(3), outA => out_and_15);

RAdder1 : Ripple_Adder port map(x => out_and_7 & out_and_6 & out_and_5 & out_and_4, y => '0' & out_and_3 & out_and_2 & out_and_1, Cin => '0', S => sum_RA_1, Cout => co_RA_1);
RAdder2 : Ripple_Adder port map(x => co_RA_1 & sum_RA_1(3) & sum_RA_1(2) & sum_RA_1(1), y => out_and_11 & out_and_10 & out_and_9 & out_and_8, Cin => '0', S => sum_RA_2, Cout => co_RA_2);
RAdder3 : Ripple_Adder port map(x => co_RA_2 & sum_RA_2(3) & sum_RA_2(2) & sum_RA_2(1), y => out_and_15 & out_and_14 & out_and_13 & out_and_12, Cin => '0', S => C(6 downto 3), Cout => C(7));
C(2) <= sum_RA_2(0);
C(1) <= sum_RA_1(0);

end behavioral;