library IEEE; 
use IEEE.STD_LOGIC_1164.all;  

entity T_FF is 
   port( 
      T : in STD_LOGIC; 
      Clock : in STD_LOGIC; 
      reset : in STD_LOGIC; 
      Q : out STD_LOGIC;
	Qn : out STD_Logic
   ); 
end T_FF;  

architecture behavioral of T_FF is 
begin 
   tff : process (T,Clock,reset) is 
   variable m : std_logic := '0'; 
   
   begin 
      if (reset = '1') then 
         m := '0'; 
      elsif (rising_edge (Clock)) then 
         if (T = '1') then 
            m := not m;        
         end if; 
      end if; 
      Q <= m;
      Qn <= not m; 
   end process tff; 
end behavioral;