LIBRARY ieee;
USE ieee.std_logic_1164.ALL;


ENTITY adder2bit IS
    PORT( a, b  : IN  STD_LOGIC_VECTOR(1 DOWNTO 0);
          cin   : IN  STD_LOGIC;
          ans   : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
          cout  : OUT STD_LOGIC
    );
END adder2bit;

ARCHITECTURE STRUCTURE OF adder2bit IS

    COMPONENT BIT_ADDER
        PORT( a, b, cin  : IN  STD_LOGIC;
                sum, cout  : OUT STD_LOGIC
        );
    END COMPONENT;

    SIGNAL c1 : STD_LOGIC := '0';

BEGIN

    b_adder0: BIT_ADDER PORT MAP (a(0), b(0), cin, ans(0), c1);
    b_adder1: BIT_ADDER PORT MAP (a(1), b(1), c1, ans(1), cout);

END STRUCTURE;