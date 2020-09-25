LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY decoder4to16_tb IS
END decoder4to16_tb;
 
ARCHITECTURE behavior OF decoder4to16_tb IS
 
 
 
 COMPONENT decoder4to16
 port (
 	I : in std_logic_vector(3 downto 0);
	J : out std_logic_vector(15 downto 0)
 );
 END COMPONENT;
 
 
 signal a : std_logic_vector(3 downto 0) := (others => '0');
 
 
 signal b : std_logic_vector(15 downto 0);
 
 
BEGIN
 
 
 uut: decoder4to16 PORT MAP (
 I => a,
 J => b
 );
 a <= "0000", "0001" after 10 ns, "0010" after 20 ns, "0011" after 30 ns, "0100" after 40 ns, "0101" after 50 ns, "0110" after 60 ns, "0111" after 70 ns, "1000" after 80 ns, "1001" after 90 ns, "1010" after 100ns, "1011" after 110 ns;
 
END;
