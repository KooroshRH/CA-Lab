library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity fourbit_multiplier is
 port (
 	A : in STD_LOGIC_Vector(3 downto 0);
 	B : in STD_LOGIC_VECTOR(3 downto 0);
	C : out STD_LOGIC_VECTOR(7 downto 0)
 );
end fourbit_multiplier;

architecture behavioral of fourbit_multiplier is
component full_adder
 port (
 	A : in STD_LOGIC;
 	B : in STD_LOGIC;
 	Cin : in STD_LOGIC;
 	Sum : out STD_LOGIC;
	Cout : out STD_LOGIC
 );
end component;

component half_adder
 port (
 	i : in STD_LOGIC;
 	j : in STD_LOGIC;
 	s : out STD_LOGIC;
 	co : out STD_LOGIC
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
signal co_HA_11, co_HA_12, co_HA_21, co_HA_31 : STD_LOGIC;
signal sum_FA_11, sum_FA_12, sum_FA_21, sum_FA_22, sum_FA_23 : STD_LOGIC;
signal co_FA_11, co_FA_12, co_FA_21, co_FA_22, co_FA_23, co_FA_31, co_FA_32 : STD_LOGIC;
signal sum_HA_12 : STD_LOGIC;

begin

C(0) <= A(0) and B(0);
and1 : and_gate port map(in1 => A(0), in2 => B(1), outA => out_and_1);
and2 : and_gate port map(in1 => A(1), in2 => B(0), outA => out_and_2);
and3 : and_gate port map(in1 => A(0), in2 => B(2), outA => out_and_3);
and4 : and_gate port map(in1 => A(1), in2 => B(1), outA => out_and_4);
and5 : and_gate port map(in1 => A(0), in2 => B(3), outA => out_and_5);
and6 : and_gate port map(in1 => A(1), in2 => B(2), outA => out_and_6);
and7 : and_gate port map(in1 => A(1), in2 => B(3), outA => out_and_7);
and8 : and_gate port map(in1 => A(2), in2 => B(0), outA => out_and_8);
and9 : and_gate port map(in1 => A(2), in2 => B(1), outA => out_and_9);
and10 : and_gate port map(in1 => A(2), in2 => B(2), outA => out_and_10);
and11 : and_gate port map(in1 => A(2), in2 => B(3), outA => out_and_11);

and12 : and_gate port map(in1 => A(3), in2 => B(0), outA => out_and_12);
and13 : and_gate port map(in1 => A(3), in2 => B(1), outA => out_and_13);
and14 : and_gate port map(in1 => A(3), in2 => B(2), outA => out_and_14);
and15 : and_gate port map(in1 => A(3), in2 => B(3), outA => out_and_15);

HA11 : half_adder port map(i => out_and_1, j => out_and_2, s => C(1), co => co_HA_11);
FA11 : full_adder port map(A => out_and_3, B => out_and_4, Cin => co_HA_11, Sum => sum_FA_11, Cout => co_FA_11);
FA12 : full_adder port map(A => out_and_5, B => out_and_6, Cin => co_FA_11, Sum => sum_FA_12, Cout => co_FA_12);
HA12 : half_adder port map(i => out_and_7, j => co_FA_12, s => sum_HA_12, co => co_HA_12);

HA21 : half_adder port map(i => out_and_8, j => sum_FA_11, s => C(2), co => co_HA_21);
FA21 : full_adder port map(A => out_and_9, B => sum_FA_12, Cin => co_HA_21, Sum => sum_FA_21, Cout => co_FA_21);
FA22 : full_adder port map(A => out_and_10, B => sum_HA_12, Cin => co_FA_21, Sum => sum_FA_22, Cout => co_FA_22);
FA23 : full_adder port map(A => out_and_11, B => co_HA_12, Cin => co_FA_22, Sum => sum_FA_23, Cout => co_FA_23);


HA31 : half_adder port map(i => out_and_12, j=> sum_FA_21, s => C(3), co => co_HA_31);
FA31 : full_adder port map(A => out_and_13, B => sum_FA_22, Cin => co_HA_31, Sum => C(4), Cout => co_FA_31);
FA32 : full_adder port map(A => out_and_14, B => sum_FA_23, Cin => co_FA_31, Sum => C(5), Cout => co_FA_32);
FA33 : full_adder port map(A => out_and_15, B => co_FA_23, Cin => co_FA_32, Sum => C(6), Cout => C(7));


end behavioral;