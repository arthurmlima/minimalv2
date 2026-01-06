library ieee;
use ieee.std_logic_1164.ALL;

entity example is
    Port ( a : in std_logic_vector(7 downto 0);
           a_out : out std_logic_vector(7 downto 0));
end example;

architecture Behavioral of example is
begin
signal s_1_1_2 : std_logic;
signal s_1_1_3 : std_logic;
signal s_1_1_4 : std_logic;
signal s_1_1_5 : std_logic;
signal s_1_1_6 : std_logic;
signal s_1_1_7 : std_logic;
signal s_1_1_8 : std_logic;
signal s_1_2_3 : std_logic;
signal s_1_2_4 : std_logic;
signal s_1_2_5 : std_logic;
signal s_1_2_6 : std_logic;
signal s_1_2_7 : std_logic;
signal s_1_2_8 : std_logic;
signal s_1_3_4 : std_logic;
signal s_1_3_5 : std_logic;
signal s_1_3_6 : std_logic;
signal s_1_3_7 : std_logic;
signal s_1_3_8 : std_logic;
signal s_1_4_5 : std_logic;
signal s_1_4_6 : std_logic;
signal s_1_4_7 : std_logic;
signal s_1_4_8 : std_logic;
signal s_1_5_6 : std_logic;
signal s_1_5_7 : std_logic;
signal s_1_5_8 : std_logic;
signal s_1_6_7 : std_logic;
signal s_1_6_8 : std_logic;
signal s_1_7_8 : std_logic;
    s_1_7_8 <= a(7) xor (not a(8));

    s_1_6_8 <= a(6) xor (not a(8));

    s_1_5_8 <= a(5) xor (not a(8));

    s_1_6_7 <= a(6) xor (not a(7));

    s_1_4_8 <= a(4) xor (not a(8));

    s_1_5_7 <= a(5) xor (not a(7));


    s_2_5_8 <=  (s_1_5_8) and ((s_1_5_8) xor (s_1_6_7)); 

    s_2_6_7 <=  (s_1_6_7) and ((s_1_6_7));
     s_1_3_8 <= a(3) xor (not a(8));

    s_1_4_7 <= a(4) xor (not a(7));

    s_1_5_6 <= a(5) xor (not a(6));


    s_2_4_8 <=  (s_1_4_8) and ((s_1_4_8) xor (s_1_5_7) xor (s_2_5_8) xor (s_2_6_7)); 

    s_2_5_7 <=  (s_1_5_7) and ((s_1_5_7) xor (s_2_5_8) xor (s_2_6_7)); 
    s_1_2_8 <= a(2) xor (not a(8));

    s_1_3_7 <= a(3) xor (not a(7));

    s_1_4_6 <= a(4) xor (not a(6));


    s_2_3_8 <=  (s_1_3_8) and ((s_1_3_8) xor (s_1_4_7) xor (s_1_5_6) xor (s_2_4_8) xor (s_2_5_7)); 

    s_2_4_7 <=  (s_1_4_7) and ((s_1_4_7) xor (s_1_5_6) xor (s_2_4_8) xor (s_2_5_7)); 

    s_2_5_6 <=  (s_1_5_6) and ((s_1_5_6) xor (s_2_4_8) xor (s_2_5_7)); 
    s_1_1_8 <= a(1) xor (not a(8));

    s_1_2_7 <= a(2) xor (not a(7));

    s_1_3_6 <= a(3) xor (not a(6));

    s_1_4_5 <= a(4) xor (not a(5));


    s_2_2_8 <=  (s_1_2_8) and ((s_1_2_8) xor (s_1_3_7) xor (s_1_4_6) xor (s_2_3_8) xor (s_2_4_7) xor (s_2_5_6)); 

    s_2_3_7 <=  (s_1_3_7) and ((s_1_3_7) xor (s_1_4_6) xor (s_2_3_8) xor (s_2_4_7) xor (s_2_5_6)); 

    s_2_4_6 <=  (s_1_4_6) and ((s_1_4_6) xor (s_2_3_8) xor (s_2_4_7) xor (s_2_5_6)); 

    s_3_3_8 <=  (s_2_3_8) and ((s_2_3_8) xor (s_2_4_7) xor (s_2_5_6)); 
    s_1_1_7 <= a(1) xor (not a(7));

    s_1_2_6 <= a(2) xor (not a(6));

    s_1_3_5 <= a(3) xor (not a(5));


    s_2_1_8 <=  (s_1_1_8) and ((s_1_1_8) xor (s_1_2_7) xor (s_1_3_6) xor (s_1_4_5) xor (s_2_2_8) xor (s_2_3_7) xor (s_2_4_6) xor (s_3_3_8)); 

    s_2_2_7 <=  (s_1_2_7) and ((s_1_2_7) xor (s_1_3_6) xor (s_1_4_5) xor (s_2_2_8) xor (s_2_3_7) xor (s_2_4_6) xor (s_3_3_8)); 

    s_2_3_6 <=  (s_1_3_6) and ((s_1_3_6) xor (s_1_4_5) xor (s_2_2_8) xor (s_2_3_7) xor (s_2_4_6) xor (s_3_3_8)); 

    s_2_4_5 <=  (s_1_4_5) and ((s_1_4_5) xor (s_2_2_8) xor (s_2_3_7) xor (s_2_4_6) xor (s_3_3_8)); 

    s_3_2_8 <=  (s_2_2_8) and ((s_2_2_8) xor (s_2_3_7) xor (s_2_4_6) xor (s_3_3_8)); 

    s_3_3_7 <=  (s_2_3_7) and ((s_2_3_7) xor (s_2_4_6) xor (s_3_3_8)); 
    s_1_1_6 <= a(1) xor (not a(6));

    s_1_2_5 <= a(2) xor (not a(5));

    s_1_3_4 <= a(3) xor (not a(4));


    s_2_1_7 <=  (s_1_1_7) and ((s_1_1_7) xor (s_1_2_6) xor (s_1_3_5) xor (s_2_1_8) xor (s_2_2_7) xor (s_2_3_6) xor (s_2_4_5) xor (s_3_2_8) xor (s_3_3_7)); 

    s_2_2_6 <=  (s_1_2_6) and ((s_1_2_6) xor (s_1_3_5) xor (s_2_1_8) xor (s_2_2_7) xor (s_2_3_6) xor (s_2_4_5) xor (s_3_2_8) xor (s_3_3_7)); 

    s_2_3_5 <=  (s_1_3_5) and ((s_1_3_5) xor (s_2_1_8) xor (s_2_2_7) xor (s_2_3_6) xor (s_2_4_5) xor (s_3_2_8) xor (s_3_3_7)); 

    s_3_1_8 <=  (s_2_1_8) and ((s_2_1_8) xor (s_2_2_7) xor (s_2_3_6) xor (s_2_4_5) xor (s_3_2_8) xor (s_3_3_7)); 

    s_3_2_7 <=  (s_2_2_7) and ((s_2_2_7) xor (s_2_3_6) xor (s_2_4_5) xor (s_3_2_8) xor (s_3_3_7)); 

    s_3_3_6 <=  (s_2_3_6) and ((s_2_3_6) xor (s_2_4_5) xor (s_3_2_8) xor (s_3_3_7)); 

    s_3_4_5 <=  (s_2_4_5) and ((s_2_4_5) xor (s_3_2_8) xor (s_3_3_7)); 
    s_1_1_5 <= a(1) xor (not a(5));

    s_1_2_4 <= a(2) xor (not a(4));


    s_2_1_6 <=  (s_1_1_6) and ((s_1_1_6) xor (s_1_2_5) xor (s_1_3_4) xor (s_2_1_7) xor (s_2_2_6) xor (s_2_3_5) xor (s_3_1_8) xor (s_3_2_7) xor (s_3_3_6) xor (s_3_4_5));

    s_2_2_5 <=  (s_1_2_5) and ((s_1_2_5) xor (s_1_3_4) xor (s_2_1_7) xor (s_2_2_6) xor (s_2_3_5) xor (s_3_1_8) xor (s_3_2_7) xor (s_3_3_6) xor (s_3_4_5));

    s_2_3_4 <=  (s_1_3_4) and ((s_1_3_4) xor (s_2_1_7) xor (s_2_2_6) xor (s_2_3_5) xor (s_3_1_8) xor (s_3_2_7) xor (s_3_3_6) xor (s_3_4_5));

    s_3_1_7 <=  (s_2_1_7) and ((s_2_1_7) xor (s_2_2_6) xor (s_2_3_5) xor (s_3_1_8) xor (s_3_2_7) xor (s_3_3_6) xor (s_3_4_5));

    s_3_2_6 <=  (s_2_2_6) and ((s_2_2_6) xor (s_2_3_5) xor (s_3_1_8) xor (s_3_2_7) xor (s_3_3_6) xor (s_3_4_5));

    s_3_3_5 <=  (s_2_3_5) and ((s_2_3_5) xor (s_3_1_8) xor (s_3_2_7) xor (s_3_3_6) xor (s_3_4_5));

    s_4_1_8 <=  (s_3_1_8) and ((s_3_1_8) xor (s_3_2_7) xor (s_3_3_6) xor (s_3_4_5));

    s_4_2_7 <=  (s_3_2_7) and ((s_3_2_7) xor (s_3_3_6) xor (s_3_4_5));
    s_1_1_4 <= a(1) xor (not a(4));

    s_1_2_3 <= a(2) xor (not a(3));


    s_2_1_5 <=  (s_1_1_5) and ((s_1_1_5) xor (s_1_2_4) xor (s_2_1_6) xor (s_2_2_5) xor (s_2_3_4) xor (s_3_1_7) xor (s_3_2_6) xor (s_3_3_5) xor (s_4_1_8) xor (s_4_2_7));

    s_2_2_4 <=  (s_1_2_4) and ((s_1_2_4) xor (s_2_1_6) xor (s_2_2_5) xor (s_2_3_4) xor (s_3_1_7) xor (s_3_2_6) xor (s_3_3_5) xor (s_4_1_8) xor (s_4_2_7));

    s_3_1_6 <=  (s_2_1_6) and ((s_2_1_6) xor (s_2_2_5) xor (s_2_3_4) xor (s_3_1_7) xor (s_3_2_6) xor (s_3_3_5) xor (s_4_1_8) xor (s_4_2_7));

    s_3_2_5 <=  (s_2_2_5) and ((s_2_2_5) xor (s_2_3_4) xor (s_3_1_7) xor (s_3_2_6) xor (s_3_3_5) xor (s_4_1_8) xor (s_4_2_7));

    s_3_3_4 <=  (s_2_3_4) and ((s_2_3_4) xor (s_3_1_7) xor (s_3_2_6) xor (s_3_3_5) xor (s_4_1_8) xor (s_4_2_7));

    s_4_1_7 <=  (s_3_1_7) and ((s_3_1_7) xor (s_3_2_6) xor (s_3_3_5) xor (s_4_1_8) xor (s_4_2_7));

    s_4_2_6 <=  (s_3_2_6) and ((s_3_2_6) xor (s_3_3_5) xor (s_4_1_8) xor (s_4_2_7));

    s_4_3_5 <=  (s_3_3_5) and ((s_3_3_5) xor (s_4_1_8) xor (s_4_2_7));
    s_1_1_3 <= a(1) xor (not a(3));


    s_2_1_4 <=  (s_1_1_4) and ((s_1_1_4) xor (s_1_2_3) xor (s_2_1_5) xor (s_2_2_4) xor (s_3_1_6) xor (s_3_2_5) xor (s_3_3_4) xor (s_4_1_7) xor (s_4_2_6) xor (s_4_3_5));

    s_2_2_3 <=  (s_1_2_3) and ((s_1_2_3) xor (s_2_1_5) xor (s_2_2_4) xor (s_3_1_6) xor (s_3_2_5) xor (s_3_3_4) xor (s_4_1_7) xor (s_4_2_6) xor (s_4_3_5));

    s_3_1_5 <=  (s_2_1_5) and ((s_2_1_5) xor (s_2_2_4) xor (s_3_1_6) xor (s_3_2_5) xor (s_3_3_4) xor (s_4_1_7) xor (s_4_2_6) xor (s_4_3_5));

    s_3_2_4 <=  (s_2_2_4) and ((s_2_2_4) xor (s_3_1_6) xor (s_3_2_5) xor (s_3_3_4) xor (s_4_1_7) xor (s_4_2_6) xor (s_4_3_5));

    s_4_1_6 <=  (s_3_1_6) and ((s_3_1_6) xor (s_3_2_5) xor (s_3_3_4) xor (s_4_1_7) xor (s_4_2_6) xor (s_4_3_5));

    s_4_2_5 <=  (s_3_2_5) and ((s_3_2_5) xor (s_3_3_4) xor (s_4_1_7) xor (s_4_2_6) xor (s_4_3_5));

    s_4_3_4 <=  (s_3_3_4) and ((s_3_3_4) xor (s_4_1_7) xor (s_4_2_6) xor (s_4_3_5));

    s_5_1_7 <=  (s_4_1_7) and ((s_4_1_7) xor (s_4_2_6) xor (s_4_3_5));
    s_1_1_2 <= a(1) xor (not a(2));


    s_2_1_3 <=  (s_1_1_3) and ((s_1_1_3) xor (s_2_1_4) xor (s_2_2_3) xor (s_3_1_5) xor (s_3_2_4) xor (s_4_1_6) xor (s_4_2_5) xor (s_4_3_4) xor (s_5_1_7)); 

    s_3_1_4 <=  (s_2_1_4) and ((s_2_1_4) xor (s_2_2_3) xor (s_3_1_5) xor (s_3_2_4) xor (s_4_1_6) xor (s_4_2_5) xor (s_4_3_4) xor (s_5_1_7)); 

    s_3_2_3 <=  (s_2_2_3) and ((s_2_2_3) xor (s_3_1_5) xor (s_3_2_4) xor (s_4_1_6) xor (s_4_2_5) xor (s_4_3_4) xor (s_5_1_7)); 

    s_4_1_5 <=  (s_3_1_5) and ((s_3_1_5) xor (s_3_2_4) xor (s_4_1_6) xor (s_4_2_5) xor (s_4_3_4) xor (s_5_1_7)); 

    s_4_2_4 <=  (s_3_2_4) and ((s_3_2_4) xor (s_4_1_6) xor (s_4_2_5) xor (s_4_3_4) xor (s_5_1_7)); 

    s_5_1_6 <=  (s_4_1_6) and ((s_4_1_6) xor (s_4_2_5) xor (s_4_3_4) xor (s_5_1_7)); 

    s_5_2_5 <=  (s_4_2_5) and ((s_4_2_5) xor (s_4_3_4) xor (s_5_1_7)); 
    s_(14)<= ((s_1_1_2) xor (s_2_1_3) xor (s_3_1_4) xor (s_3_2_3) xor (s_4_1_5) xor (s_4_2_4) xor (s_5_1_6) xor (s_5_2_5)); 
    s_(13)<= ((s_1_1_3) xor (s_2_1_4) xor (s_2_2_3) xor (s_3_1_5) xor (s_3_2_4) xor (s_4_1_6) xor (s_4_2_5) xor (s_4_3_4) xor (s_5_1_7)); 
    s_(12)<= ((s_1_1_4) xor (s_1_2_3) xor (s_2_1_5) xor (s_2_2_4) xor (s_3_1_6) xor (s_3_2_5) xor (s_3_3_4) xor (s_4_1_7) xor (s_4_2_6) xor (s_4_3_5));
    s_(11)<= ((s_1_1_5) xor (s_1_2_4) xor (s_2_1_6) xor (s_2_2_5) xor (s_2_3_4) xor (s_3_1_7) xor (s_3_2_6) xor (s_3_3_5) xor (s_4_1_8) xor (s_4_2_7));
    s_(10)<= ((s_1_1_6) xor (s_1_2_5) xor (s_1_3_4) xor (s_2_1_7) xor (s_2_2_6) xor (s_2_3_5) xor (s_3_1_8) xor (s_3_2_7) xor (s_3_3_6) xor (s_3_4_5));
    s_(9)<= ((s_1_1_7) xor (s_1_2_6) xor (s_1_3_5) xor (s_2_1_8) xor (s_2_2_7) xor (s_2_3_6) xor (s_2_4_5) xor (s_3_2_8) xor (s_3_3_7)); 
    s_(8)<= ((s_1_1_8) xor (s_1_2_7) xor (s_1_3_6) xor (s_1_4_5) xor (s_2_2_8) xor (s_2_3_7) xor (s_2_4_6) xor (s_3_3_8)); 
    s_(7)<= ((s_1_2_8) xor (s_1_3_7) xor (s_1_4_6) xor (s_2_3_8) xor (s_2_4_7) xor (s_2_5_6)); 
end Behavioral;
