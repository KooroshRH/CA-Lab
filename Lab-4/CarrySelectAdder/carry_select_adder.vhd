library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
 
entity carry_select_adder is
Port ( X : in STD_LOGIC_VECTOR (3 downto 0);
Y : in STD_LOGIC_VECTOR (3 downto 0);
CARRY_IN : in STD_LOGIC;
SUM : out STD_LOGIC_VECTOR (3 downto 0);
CARRY_OUT : out STD_LOGIC);
end carry_select_adder;
 
architecture Behavioral of carry_select_adder is
 
component full_adder_vhdl_code
Port ( A : in STD_LOGIC;
B : in STD_LOGIC;
Cin : in STD_LOGIC;
S : out STD_LOGIC;
Cout : out STD_LOGIC);
end component;
 
component mux2_1
port(
A,B : in STD_LOGIC;
Sel: in STD_LOGIC;
Z: out STD_LOGIC
);
end component;
 
signal A,B,C0,C1: STD_LOGIC_VECTOR( 3 DOWNTO 0);
begin
 
FA1: full_adder_vhdl_code PORT MAP(X(0),Y(0),'0' ,A(0),C0(0));
FA2: full_adder_vhdl_code PORT MAP(X(1),Y(1),C0(0),A(1),C0(1));
FA3: full_adder_vhdl_code PORT MAP(X(2),Y(2),C0(1),A(2),C0(2));
FA4: full_adder_vhdl_code PORT MAP(X(3),Y(3),C0(2),A(3),C0(3));
 
FA5: full_adder_vhdl_code PORT MAP(X(0),Y(0),'1' ,B(0),C1(0));
FA6: full_adder_vhdl_code PORT MAP(X(1),Y(1),C1(0),B(1),C1(1));
FA7: full_adder_vhdl_code PORT MAP(X(2),Y(2),C1(1),B(2),C1(2));
FA8: full_adder_vhdl_code PORT MAP(X(3),Y(3),C1(2),B(3),C1(3));
 
MUX1: mux2_1 PORT MAP(A(0),B(0),CARRY_IN,SUM(0));
MUX2: mux2_1 PORT MAP(A(1),B(1),CARRY_IN,SUM(1));
MUX3: mux2_1 PORT MAP(A(2),B(2),CARRY_IN,SUM(2));
MUX4: mux2_1 PORT MAP(A(3),B(3),CARRY_IN,SUM(3));
 
MUX5: mux2_1 PORT MAP(C0(3),C1(3),CARRY_IN,CARRY_OUT);
 
end Behavioral;
