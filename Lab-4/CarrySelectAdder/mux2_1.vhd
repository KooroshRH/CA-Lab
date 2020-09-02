library IEEE;
use IEEE.STD_LOGIC_1164.all;
 
entity mux2_1 is
port(
 
A,B : in STD_LOGIC;
Sel: in STD_LOGIC;
Z: out STD_LOGIC
);
end mux2_1;
 
architecture bhv of mux2_1 is
begin
process(A,B,Sel)
begin
if Sel = '0' then
Z <= A;
else
Z <= B;
end if;
end process;
end bhv;
