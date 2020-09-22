LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY adder16bit is
    PORT (  a, b : IN  std_logic_vector(15 DOWNTO 0);
            cin  : IN  STD_LOGIC;
            sum1 : OUT std_logic_vector(15 DOWNTO 0);
            cout : OUT std_logic);
END adder16bit;

ARCHITECTURE arch16 OF adder16bit IS

    COMPONENT adder2bit
        PORT(  a, b      : IN    STD_LOGIC_VECTOR(1 DOWNTO 0);
               cin       : IN    STD_LOGIC;
               ans       : OUT   STD_LOGIC_VECTOR(1 DOWNTO 0);
               cout      : OUT   STD_LOGIC);
    END COMPONENT;

    SIGNAL c1, c2, c3, c4, c5, c6, c7  : std_LOGIC := '0';

BEGIN

    D_adder0: adder2bit PORT MAP ( a(1  DOWNTO 0)  , b(1 DOWNTO 0)  , cin, sum1(1 DOWNTO 0)   , c1  );
    D_adder1: adder2bit PORT MAP ( a(3  DOWNTO 2)  , b(3 DOWNTO 2)  , c1 , sum1(3 DOWNTO 2)   , c2  );
    D_adder2: adder2bit PORT MAP ( a(5  DOWNTO 4)  , b(5 DOWNTO 4)  , c2 , sum1(5 DOWNTO 4)   , c3  );
    D_adder3: adder2bit PORT MAP ( a(7  DOWNTO 6)  , b(7 DOWNTO 6)  , c3 , sum1(7 DOWNTO 6)   , c4  );
    D_adder4: adder2bit PORT MAP ( a(9  DOWNTO 8)  , b(9 DOWNTO 8)  , c4 , sum1(9 DOWNTO 8)   , c5  );
    D_adder5: adder2bit PORT MAP ( a(11 DOWNTO 10) , b(11 DOWNTO 10), c5 , sum1(11 DOWNTO 10) , c6  );
    D_adder6: adder2bit PORT MAP ( a(13 DOWNTO 12) , b(13 DOWNTO 12), c6 , sum1(13 DOWNTO 12) , c7  );
    D_adder7: adder2bit PORT MAP ( a(15 DOWNTO 14) , b(15 DOWNTO 14), c7 , sum1(15 DOWNTO 14) , cout);

END arch16;