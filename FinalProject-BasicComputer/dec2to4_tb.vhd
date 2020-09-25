LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY decoder2to4_tb IS
END decoder2to4_tb;
 
ARCHITECTURE behavior OF decoder2to4_tb IS
 
 
 
 COMPONENT decoder2to4
 PORT(
 A : IN std_logic_vector(1 downto 0);
 X : OUT std_logic_vector(3 downto 0);
En : std_logic
 );
 END COMPONENT;
 
 
 signal a : std_logic_vector(1 downto 0) := (others => '0');
 
 
 signal b : std_logic_vector(3 downto 0);
 
 
BEGIN
 
 
 uut: decoder2to4 PORT MAP (
 A => a,
 X => b,
En => '1'
 );
 
 
 stim_proc: process
 begin
 
 wait for 100 ns;
 
 a <= "00";
 
 wait for 100 ns;
 
 a <= "11";
 
 wait for 100 ns;
 
 a <= "10";
 
 wait for 100 ns;
 
 a <= "01";
 
 wait;
 end process;
 
END;
