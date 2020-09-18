library IEEE;
use IEEE.std_logic_1164.all;
Entity or_gate is
Port(
A, B: in std_logic;
C : out std_logic
);
End entity or_gate;
Architecture gatelevel of or_gate is
Begin
C <= A or B;
End gatelevel;