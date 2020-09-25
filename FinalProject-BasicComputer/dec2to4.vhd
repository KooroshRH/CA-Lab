library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity decoder2to4 is
    Port ( A  : in  STD_LOGIC_VECTOR (1 downto 0);  -- 2-bit input
           X  : out STD_LOGIC_VECTOR (3 downto 0);  -- 4-bit output
           EN : in  STD_LOGIC);                     -- enable input
end decoder2to4;

architecture Behavioral of decoder2to4 is
begin
X(3) <= A(0) and A(1) and EN;
X(2) <= not A(0) and A(1) and EN;
X(1) <= A(0) and not A(1) and EN;
X(0) <= not A(0) and not A(1) and EN;
end Behavioral;
 
