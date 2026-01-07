library ieee;
use ieee.std_logic_1164.all;

entity MariusMethod_9 is
  port (
    clk  : in  std_logic;
    rst  : in  std_logic;
    load : in  std_logic;
    en   : in  std_logic;
    a    : in  std_logic_vector(8 downto 0);
    s    : out std_logic_vector(8 downto 0)
  );
end MariusMethod_9;

architecture rtl of MariusMethod_9 is
  signal x_reg  : std_logic_vector(8 downto 0) := (others => '0');
  signal x_next : std_logic_vector(8 downto 0);

signal s_1_8_9 : std_logic;
signal s_1_7_9 : std_logic;
signal s_1_6_9 : std_logic;
signal s_1_5_9 : std_logic;
signal s_1_4_9 : std_logic;
signal s_1_3_9 : std_logic;
signal s_1_2_9 : std_logic;
signal s_1_1_9 : std_logic;
signal s_1_1_8 : std_logic;
signal s_1_1_7 : std_logic;
signal s_1_1_6 : std_logic;
signal s_1_1_5 : std_logic;
signal s_1_1_4 : std_logic;
signal s_1_1_3 : std_logic;
signal s_1_1_2 : std_logic;
signal s_1_7_8 : std_logic;
signal s_1_6_8 : std_logic;
signal s_1_5_8 : std_logic;
signal s_1_4_8 : std_logic;
signal s_1_3_8 : std_logic;
signal s_1_2_8 : std_logic;
signal s_1_2_7 : std_logic;
signal s_1_2_6 : std_logic;
signal s_1_2_5 : std_logic;
signal s_1_2_4 : std_logic;
signal s_1_2_3 : std_logic;
signal s_1_6_7 : std_logic;
signal s_1_5_7 : std_logic;
signal s_1_4_7 : std_logic;
signal s_1_3_7 : std_logic;
signal s_1_3_6 : std_logic;
signal s_1_3_5 : std_logic;
signal s_1_3_4 : std_logic;
signal s_1_5_6 : std_logic;
signal s_1_4_6 : std_logic;
signal s_1_4_5 : std_logic;
signal s_2_6_9 : std_logic;
signal s_2_5_9 : std_logic;
signal s_2_4_9 : std_logic;
signal s_2_3_9 : std_logic;
signal s_2_2_9 : std_logic;
signal s_2_1_9 : std_logic;
signal s_2_1_8 : std_logic;
signal s_2_1_7 : std_logic;
signal s_2_1_6 : std_logic;
signal s_2_1_5 : std_logic;
signal s_2_1_4 : std_logic;
signal s_2_1_3 : std_logic;
signal s_2_7_8 : std_logic;
signal s_2_6_8 : std_logic;
signal s_2_5_8 : std_logic;
signal s_2_4_8 : std_logic;
signal s_2_3_8 : std_logic;
signal s_2_2_8 : std_logic;
signal s_2_2_7 : std_logic;
signal s_2_2_6 : std_logic;
signal s_2_2_5 : std_logic;
signal s_2_2_4 : std_logic;
signal s_2_2_3 : std_logic;
signal s_2_6_7 : std_logic;
signal s_2_5_7 : std_logic;
signal s_2_4_7 : std_logic;
signal s_2_3_7 : std_logic;
signal s_2_3_6 : std_logic;
signal s_2_3_5 : std_logic;
signal s_2_3_4 : std_logic;
signal s_2_5_6 : std_logic;
signal s_2_4_6 : std_logic;
signal s_2_4_5 : std_logic;
signal s_3_4_9 : std_logic;
signal s_3_3_9 : std_logic;
signal s_3_2_9 : std_logic;
signal s_3_1_9 : std_logic;
signal s_3_1_8 : std_logic;
signal s_3_1_7 : std_logic;
signal s_3_1_6 : std_logic;
signal s_3_1_5 : std_logic;
signal s_3_1_4 : std_logic;
signal s_3_4_8 : std_logic;
signal s_3_3_8 : std_logic;
signal s_3_2_8 : std_logic;
signal s_3_2_7 : std_logic;
signal s_3_2_6 : std_logic;
signal s_3_2_5 : std_logic;
signal s_3_2_4 : std_logic;
signal s_3_2_3 : std_logic;
signal s_3_4_7 : std_logic;
signal s_3_3_7 : std_logic;
signal s_3_3_6 : std_logic;
signal s_3_3_5 : std_logic;
signal s_3_3_4 : std_logic;
signal s_4_1_6 : std_logic;
signal s_4_1_5 : std_logic;
signal s_3_5_6 : std_logic;
signal s_3_4_6 : std_logic;
signal s_3_4_5 : std_logic;
signal s_4_1_8 : std_logic;
signal s_4_1_7 : std_logic;
signal s_4_2_5 : std_logic;
signal s_4_2_4 : std_logic;
signal s_4_2_9 : std_logic;
signal s_4_1_9 : std_logic;
signal s_4_2_7 : std_logic;
signal s_4_2_6 : std_logic;
signal s_4_3_4 : std_logic;
signal s_5_1_6 : std_logic;
signal s_4_3_8 : std_logic;
signal s_4_2_8 : std_logic;
signal s_4_3_6 : std_logic;
signal s_4_3_5 : std_logic;
signal s_5_1_7 : std_logic;
signal s_5_2_5 : std_logic;
signal s_4_3_7 : std_logic;
signal s_4_4_5 : std_logic;
signal s_5_1_8 : std_logic;
signal s_5_2_6 : std_logic;
signal s_5_3_4 : std_logic;
signal s_4_4_6 : std_logic;
signal s_5_1_9 : std_logic;
signal s_5_2_7 : std_logic;
signal s_5_3_5 : std_logic;
signal s_6_1_7 : std_logic;
signal s_5_2_8 : std_logic;
signal s_5_3_6 : std_logic;
signal s_6_1_8 : std_logic;
signal s_6_2_6 : std_logic;
signal s_5_4_5 : std_logic;
signal s_6_2_7 : std_logic;
signal s_6_3_5 : std_logic;
begin
    s_1_8_9 <= x_reg(1) xor x_reg(0);

    s_1_7_9 <= x_reg(2) xor x_reg(0);

    s_1_6_9 <= x_reg(3) xor x_reg(0);

    s_1_7_8 <= x_reg(2) xor x_reg(1);

    s_1_5_9 <= x_reg(4) xor x_reg(0);

    s_1_6_8 <= x_reg(3) xor x_reg(1);

   s_2_6_9 <=  (s_1_6_9) and ( (s_1_7_8)); 
   s_2_7_8 <=  '0';
    s_1_4_9 <= x_reg(5) xor x_reg(0);

    s_1_5_8 <= x_reg(4) xor x_reg(1);

    s_1_6_7 <= x_reg(3) xor x_reg(2);

   s_2_5_9 <=  (s_1_5_9) and ( (s_1_6_8) xor (s_2_6_9) xor (s_2_7_8)); 
   s_2_6_8 <=  (s_1_6_8) and ( (s_2_6_9) xor (s_2_7_8)); 
    s_1_3_9 <= x_reg(6) xor x_reg(0);

    s_1_4_8 <= x_reg(5) xor x_reg(1);

    s_1_5_7 <= x_reg(4) xor x_reg(2);

   s_2_4_9 <=  (s_1_4_9) and ( (s_1_5_8) xor (s_1_6_7) xor (s_2_5_9) xor (s_2_6_8)); 
   s_2_5_8 <=  (s_1_5_8) and ( (s_1_6_7) xor (s_2_5_9) xor (s_2_6_8)); 
   s_2_6_7 <=  (s_1_6_7) and ( (s_2_5_9) xor (s_2_6_8)); 
    s_1_2_9 <= x_reg(7) xor x_reg(0);

    s_1_3_8 <= x_reg(6) xor x_reg(1);

    s_1_4_7 <= x_reg(5) xor x_reg(2);

    s_1_5_6 <= x_reg(4) xor x_reg(3);

   s_2_3_9 <=  (s_1_3_9) and ( (s_1_4_8) xor (s_1_5_7) xor (s_2_4_9) xor (s_2_5_8) xor (s_2_6_7)); 
   s_2_4_8 <=  (s_1_4_8) and ( (s_1_5_7) xor (s_2_4_9) xor (s_2_5_8) xor (s_2_6_7)); 
   s_2_5_7 <=  (s_1_5_7) and ( (s_2_4_9) xor (s_2_5_8) xor (s_2_6_7)); 
   s_3_4_9 <=  (s_2_4_9) and ( (s_2_5_8) xor (s_2_6_7)); 
    s_1_1_9 <= x_reg(8) xor x_reg(0);

    s_1_2_8 <= x_reg(7) xor x_reg(1);

    s_1_3_7 <= x_reg(6) xor x_reg(2);

    s_1_4_6 <= x_reg(5) xor x_reg(3);

   s_2_2_9 <=  (s_1_2_9) and ( (s_1_3_8) xor (s_1_4_7) xor (s_1_5_6) xor (s_2_3_9) xor (s_2_4_8) xor (s_2_5_7) xor (s_3_4_9)); 
   s_2_3_8 <=  (s_1_3_8) and ( (s_1_4_7) xor (s_1_5_6) xor (s_2_3_9) xor (s_2_4_8) xor (s_2_5_7) xor (s_3_4_9)); 
   s_2_4_7 <=  (s_1_4_7) and ( (s_1_5_6) xor (s_2_3_9) xor (s_2_4_8) xor (s_2_5_7) xor (s_3_4_9)); 
   s_2_5_6 <=  (s_1_5_6) and ( (s_2_3_9) xor (s_2_4_8) xor (s_2_5_7) xor (s_3_4_9)); 
   s_3_3_9 <=  (s_2_3_9) and ( (s_2_4_8) xor (s_2_5_7) xor (s_3_4_9)); 
   s_3_4_8 <=  (s_2_4_8) and ( (s_2_5_7) xor (s_3_4_9)); 
    s_1_1_8 <= x_reg(8) xor x_reg(1);

    s_1_2_7 <= x_reg(7) xor x_reg(2);

    s_1_3_6 <= x_reg(6) xor x_reg(3);

    s_1_4_5 <= x_reg(5) xor x_reg(4);

   s_2_1_9 <=  (s_1_1_9) and ( (s_1_2_8) xor (s_1_3_7) xor (s_1_4_6) xor (s_2_2_9) xor (s_2_3_8) xor (s_2_4_7) xor (s_2_5_6) xor (s_3_3_9) xor (s_3_4_8)); 
   s_2_2_8 <=  (s_1_2_8) and ( (s_1_3_7) xor (s_1_4_6) xor (s_2_2_9) xor (s_2_3_8) xor (s_2_4_7) xor (s_2_5_6) xor (s_3_3_9) xor (s_3_4_8)); 
   s_2_3_7 <=  (s_1_3_7) and ( (s_1_4_6) xor (s_2_2_9) xor (s_2_3_8) xor (s_2_4_7) xor (s_2_5_6) xor (s_3_3_9) xor (s_3_4_8)); 
   s_2_4_6 <=  (s_1_4_6) and ( (s_2_2_9) xor (s_2_3_8) xor (s_2_4_7) xor (s_2_5_6) xor (s_3_3_9) xor (s_3_4_8)); 
   s_3_2_9 <=  (s_2_2_9) and ( (s_2_3_8) xor (s_2_4_7) xor (s_2_5_6) xor (s_3_3_9) xor (s_3_4_8)); 
   s_3_3_8 <=  (s_2_3_8) and ( (s_2_4_7) xor (s_2_5_6) xor (s_3_3_9) xor (s_3_4_8)); 
   s_3_4_7 <=  (s_2_4_7) and ( (s_2_5_6) xor (s_3_3_9) xor (s_3_4_8)); 
   s_3_5_6 <=  (s_2_5_6) and ( (s_3_3_9) xor (s_3_4_8)); 
    s_1_1_7 <= x_reg(8) xor x_reg(2);

    s_1_2_6 <= x_reg(7) xor x_reg(3);

    s_1_3_5 <= x_reg(6) xor x_reg(4);

   s_2_1_8 <=  (s_1_1_8) and ( (s_1_2_7) xor (s_1_3_6) xor (s_1_4_5) xor (s_2_1_9) xor (s_2_2_8) xor (s_2_3_7) xor (s_2_4_6) xor (s_3_2_9) xor (s_3_3_8) xor (s_3_4_7) xor (s_3_5_6)); 
   s_2_2_7 <=  (s_1_2_7) and ( (s_1_3_6) xor (s_1_4_5) xor (s_2_1_9) xor (s_2_2_8) xor (s_2_3_7) xor (s_2_4_6) xor (s_3_2_9) xor (s_3_3_8) xor (s_3_4_7) xor (s_3_5_6)); 
   s_2_3_6 <=  (s_1_3_6) and ( (s_1_4_5) xor (s_2_1_9) xor (s_2_2_8) xor (s_2_3_7) xor (s_2_4_6) xor (s_3_2_9) xor (s_3_3_8) xor (s_3_4_7) xor (s_3_5_6)); 
   s_2_4_5 <=  (s_1_4_5) and ( (s_2_1_9) xor (s_2_2_8) xor (s_2_3_7) xor (s_2_4_6) xor (s_3_2_9) xor (s_3_3_8) xor (s_3_4_7) xor (s_3_5_6)); 
   s_3_1_9 <=  (s_2_1_9) and ( (s_2_2_8) xor (s_2_3_7) xor (s_2_4_6) xor (s_3_2_9) xor (s_3_3_8) xor (s_3_4_7) xor (s_3_5_6)); 
   s_3_2_8 <=  (s_2_2_8) and ( (s_2_3_7) xor (s_2_4_6) xor (s_3_2_9) xor (s_3_3_8) xor (s_3_4_7) xor (s_3_5_6)); 
   s_3_3_7 <=  (s_2_3_7) and ( (s_2_4_6) xor (s_3_2_9) xor (s_3_3_8) xor (s_3_4_7) xor (s_3_5_6)); 
   s_3_4_6 <=  (s_2_4_6) and ( (s_3_2_9) xor (s_3_3_8) xor (s_3_4_7) xor (s_3_5_6)); 
   s_4_2_9 <=  (s_3_2_9) and ( (s_3_3_8) xor (s_3_4_7) xor (s_3_5_6)); 
   s_4_3_8 <=  (s_3_3_8) and ( (s_3_4_7) xor (s_3_5_6)); 
    s_1_1_6 <= x_reg(8) xor x_reg(3);

    s_1_2_5 <= x_reg(7) xor x_reg(4);

    s_1_3_4 <= x_reg(6) xor x_reg(5);

   s_2_1_7 <=  (s_1_1_7) and ( (s_1_2_6) xor (s_1_3_5) xor (s_2_1_8) xor (s_2_2_7) xor (s_2_3_6) xor (s_2_4_5) xor (s_3_1_9) xor (s_3_2_8) xor (s_3_3_7) xor (s_3_4_6) xor (s_4_2_9) xor (s_4_3_8)); 
   s_2_2_6 <=  (s_1_2_6) and ( (s_1_3_5) xor (s_2_1_8) xor (s_2_2_7) xor (s_2_3_6) xor (s_2_4_5) xor (s_3_1_9) xor (s_3_2_8) xor (s_3_3_7) xor (s_3_4_6) xor (s_4_2_9) xor (s_4_3_8)); 
   s_2_3_5 <=  (s_1_3_5) and ( (s_2_1_8) xor (s_2_2_7) xor (s_2_3_6) xor (s_2_4_5) xor (s_3_1_9) xor (s_3_2_8) xor (s_3_3_7) xor (s_3_4_6) xor (s_4_2_9) xor (s_4_3_8)); 
   s_3_1_8 <=  (s_2_1_8) and ( (s_2_2_7) xor (s_2_3_6) xor (s_2_4_5) xor (s_3_1_9) xor (s_3_2_8) xor (s_3_3_7) xor (s_3_4_6) xor (s_4_2_9) xor (s_4_3_8)); 
   s_3_2_7 <=  (s_2_2_7) and ( (s_2_3_6) xor (s_2_4_5) xor (s_3_1_9) xor (s_3_2_8) xor (s_3_3_7) xor (s_3_4_6) xor (s_4_2_9) xor (s_4_3_8)); 
   s_3_3_6 <=  (s_2_3_6) and ( (s_2_4_5) xor (s_3_1_9) xor (s_3_2_8) xor (s_3_3_7) xor (s_3_4_6) xor (s_4_2_9) xor (s_4_3_8)); 
   s_3_4_5 <=  (s_2_4_5) and ( (s_3_1_9) xor (s_3_2_8) xor (s_3_3_7) xor (s_3_4_6) xor (s_4_2_9) xor (s_4_3_8)); 
   s_4_1_9 <=  (s_3_1_9) and ( (s_3_2_8) xor (s_3_3_7) xor (s_3_4_6) xor (s_4_2_9) xor (s_4_3_8)); 
   s_4_2_8 <=  (s_3_2_8) and ( (s_3_3_7) xor (s_3_4_6) xor (s_4_2_9) xor (s_4_3_8)); 
   s_4_3_7 <=  (s_3_3_7) and ( (s_3_4_6) xor (s_4_2_9) xor (s_4_3_8)); 
   s_4_4_6 <=  (s_3_4_6) and ( (s_4_2_9) xor (s_4_3_8)); 
    s_1_1_5 <= x_reg(8) xor x_reg(4);

    s_1_2_4 <= x_reg(7) xor x_reg(5);

   s_2_1_6 <=  (s_1_1_6) and ( (s_1_2_5) xor (s_1_3_4) xor (s_2_1_7) xor (s_2_2_6) xor (s_2_3_5) xor (s_3_1_8) xor (s_3_2_7) xor (s_3_3_6) xor (s_3_4_5) xor (s_4_1_9) xor (s_4_2_8) xor (s_4_3_7) xor (s_4_4_6));
   s_2_2_5 <=  (s_1_2_5) and ( (s_1_3_4) xor (s_2_1_7) xor (s_2_2_6) xor (s_2_3_5) xor (s_3_1_8) xor (s_3_2_7) xor (s_3_3_6) xor (s_3_4_5) xor (s_4_1_9) xor (s_4_2_8) xor (s_4_3_7) xor (s_4_4_6));
   s_2_3_4 <=  (s_1_3_4) and ( (s_2_1_7) xor (s_2_2_6) xor (s_2_3_5) xor (s_3_1_8) xor (s_3_2_7) xor (s_3_3_6) xor (s_3_4_5) xor (s_4_1_9) xor (s_4_2_8) xor (s_4_3_7) xor (s_4_4_6));
   s_3_1_7 <=  (s_2_1_7) and ( (s_2_2_6) xor (s_2_3_5) xor (s_3_1_8) xor (s_3_2_7) xor (s_3_3_6) xor (s_3_4_5) xor (s_4_1_9) xor (s_4_2_8) xor (s_4_3_7) xor (s_4_4_6));
   s_3_2_6 <=  (s_2_2_6) and ( (s_2_3_5) xor (s_3_1_8) xor (s_3_2_7) xor (s_3_3_6) xor (s_3_4_5) xor (s_4_1_9) xor (s_4_2_8) xor (s_4_3_7) xor (s_4_4_6));
   s_3_3_5 <=  (s_2_3_5) and ( (s_3_1_8) xor (s_3_2_7) xor (s_3_3_6) xor (s_3_4_5) xor (s_4_1_9) xor (s_4_2_8) xor (s_4_3_7) xor (s_4_4_6));
   s_4_1_8 <=  (s_3_1_8) and ( (s_3_2_7) xor (s_3_3_6) xor (s_3_4_5) xor (s_4_1_9) xor (s_4_2_8) xor (s_4_3_7) xor (s_4_4_6));
   s_4_2_7 <=  (s_3_2_7) and ( (s_3_3_6) xor (s_3_4_5) xor (s_4_1_9) xor (s_4_2_8) xor (s_4_3_7) xor (s_4_4_6));
   s_4_3_6 <=  (s_3_3_6) and ( (s_3_4_5) xor (s_4_1_9) xor (s_4_2_8) xor (s_4_3_7) xor (s_4_4_6));
   s_4_4_5 <=  (s_3_4_5) and ( (s_4_1_9) xor (s_4_2_8) xor (s_4_3_7) xor (s_4_4_6));
   s_5_1_9 <=  (s_4_1_9) and ( (s_4_2_8) xor (s_4_3_7) xor (s_4_4_6));
   s_5_2_8 <=  (s_4_2_8) and ( (s_4_3_7) xor (s_4_4_6));
    s_1_1_4 <= x_reg(8) xor x_reg(5);

    s_1_2_3 <= x_reg(7) xor x_reg(6);

   s_2_1_5 <=  (s_1_1_5) and ( (s_1_2_4) xor (s_2_1_6) xor (s_2_2_5) xor (s_2_3_4) xor (s_3_1_7) xor (s_3_2_6) xor (s_3_3_5) xor (s_4_1_8) xor (s_4_2_7) xor (s_4_3_6) xor (s_4_4_5) xor (s_5_1_9) xor (s_5_2_8));
   s_2_2_4 <=  (s_1_2_4) and ( (s_2_1_6) xor (s_2_2_5) xor (s_2_3_4) xor (s_3_1_7) xor (s_3_2_6) xor (s_3_3_5) xor (s_4_1_8) xor (s_4_2_7) xor (s_4_3_6) xor (s_4_4_5) xor (s_5_1_9) xor (s_5_2_8));
   s_3_1_6 <=  (s_2_1_6) and ( (s_2_2_5) xor (s_2_3_4) xor (s_3_1_7) xor (s_3_2_6) xor (s_3_3_5) xor (s_4_1_8) xor (s_4_2_7) xor (s_4_3_6) xor (s_4_4_5) xor (s_5_1_9) xor (s_5_2_8));
   s_3_2_5 <=  (s_2_2_5) and ( (s_2_3_4) xor (s_3_1_7) xor (s_3_2_6) xor (s_3_3_5) xor (s_4_1_8) xor (s_4_2_7) xor (s_4_3_6) xor (s_4_4_5) xor (s_5_1_9) xor (s_5_2_8));
   s_3_3_4 <=  (s_2_3_4) and ( (s_3_1_7) xor (s_3_2_6) xor (s_3_3_5) xor (s_4_1_8) xor (s_4_2_7) xor (s_4_3_6) xor (s_4_4_5) xor (s_5_1_9) xor (s_5_2_8));
   s_4_1_7 <=  (s_3_1_7) and ( (s_3_2_6) xor (s_3_3_5) xor (s_4_1_8) xor (s_4_2_7) xor (s_4_3_6) xor (s_4_4_5) xor (s_5_1_9) xor (s_5_2_8));
   s_4_2_6 <=  (s_3_2_6) and ( (s_3_3_5) xor (s_4_1_8) xor (s_4_2_7) xor (s_4_3_6) xor (s_4_4_5) xor (s_5_1_9) xor (s_5_2_8));
   s_4_3_5 <=  (s_3_3_5) and ( (s_4_1_8) xor (s_4_2_7) xor (s_4_3_6) xor (s_4_4_5) xor (s_5_1_9) xor (s_5_2_8));
   s_5_1_8 <=  (s_4_1_8) and ( (s_4_2_7) xor (s_4_3_6) xor (s_4_4_5) xor (s_5_1_9) xor (s_5_2_8));
   s_5_2_7 <=  (s_4_2_7) and ( (s_4_3_6) xor (s_4_4_5) xor (s_5_1_9) xor (s_5_2_8));
   s_5_3_6 <=  (s_4_3_6) and ( (s_4_4_5) xor (s_5_1_9) xor (s_5_2_8));
   s_5_4_5 <=  (s_4_4_5) and ( (s_5_1_9) xor (s_5_2_8));
    s_1_1_3 <= x_reg(8) xor x_reg(6);

   s_2_1_4 <=  (s_1_1_4) and ( (s_1_2_3) xor (s_2_1_5) xor (s_2_2_4) xor (s_3_1_6) xor (s_3_2_5) xor (s_3_3_4) xor (s_4_1_7) xor (s_4_2_6) xor (s_4_3_5) xor (s_5_1_8) xor (s_5_2_7) xor (s_5_3_6) xor (s_5_4_5));
   s_2_2_3 <=  (s_1_2_3) and ( (s_2_1_5) xor (s_2_2_4) xor (s_3_1_6) xor (s_3_2_5) xor (s_3_3_4) xor (s_4_1_7) xor (s_4_2_6) xor (s_4_3_5) xor (s_5_1_8) xor (s_5_2_7) xor (s_5_3_6) xor (s_5_4_5));
   s_3_1_5 <=  (s_2_1_5) and ( (s_2_2_4) xor (s_3_1_6) xor (s_3_2_5) xor (s_3_3_4) xor (s_4_1_7) xor (s_4_2_6) xor (s_4_3_5) xor (s_5_1_8) xor (s_5_2_7) xor (s_5_3_6) xor (s_5_4_5));
   s_3_2_4 <=  (s_2_2_4) and ( (s_3_1_6) xor (s_3_2_5) xor (s_3_3_4) xor (s_4_1_7) xor (s_4_2_6) xor (s_4_3_5) xor (s_5_1_8) xor (s_5_2_7) xor (s_5_3_6) xor (s_5_4_5));
   s_4_1_6 <=  (s_3_1_6) and ( (s_3_2_5) xor (s_3_3_4) xor (s_4_1_7) xor (s_4_2_6) xor (s_4_3_5) xor (s_5_1_8) xor (s_5_2_7) xor (s_5_3_6) xor (s_5_4_5));
   s_4_2_5 <=  (s_3_2_5) and ( (s_3_3_4) xor (s_4_1_7) xor (s_4_2_6) xor (s_4_3_5) xor (s_5_1_8) xor (s_5_2_7) xor (s_5_3_6) xor (s_5_4_5));
   s_4_3_4 <=  (s_3_3_4) and ( (s_4_1_7) xor (s_4_2_6) xor (s_4_3_5) xor (s_5_1_8) xor (s_5_2_7) xor (s_5_3_6) xor (s_5_4_5));
   s_5_1_7 <=  (s_4_1_7) and ( (s_4_2_6) xor (s_4_3_5) xor (s_5_1_8) xor (s_5_2_7) xor (s_5_3_6) xor (s_5_4_5));
   s_5_2_6 <=  (s_4_2_6) and ( (s_4_3_5) xor (s_5_1_8) xor (s_5_2_7) xor (s_5_3_6) xor (s_5_4_5));
   s_5_3_5 <=  (s_4_3_5) and ( (s_5_1_8) xor (s_5_2_7) xor (s_5_3_6) xor (s_5_4_5));
   s_6_1_8 <=  (s_5_1_8) and ( (s_5_2_7) xor (s_5_3_6) xor (s_5_4_5));
   s_6_2_7 <=  (s_5_2_7) and ( (s_5_3_6) xor (s_5_4_5));
    s_1_1_2 <= x_reg(8) xor x_reg(7);

   s_2_1_3 <=  (s_1_1_3) and ( (s_2_1_4) xor (s_2_2_3) xor (s_3_1_5) xor (s_3_2_4) xor (s_4_1_6) xor (s_4_2_5) xor (s_4_3_4) xor (s_5_1_7) xor (s_5_2_6) xor (s_5_3_5) xor (s_6_1_8) xor (s_6_2_7)); 
   s_3_1_4 <=  (s_2_1_4) and ( (s_2_2_3) xor (s_3_1_5) xor (s_3_2_4) xor (s_4_1_6) xor (s_4_2_5) xor (s_4_3_4) xor (s_5_1_7) xor (s_5_2_6) xor (s_5_3_5) xor (s_6_1_8) xor (s_6_2_7)); 
   s_3_2_3 <=  (s_2_2_3) and ( (s_3_1_5) xor (s_3_2_4) xor (s_4_1_6) xor (s_4_2_5) xor (s_4_3_4) xor (s_5_1_7) xor (s_5_2_6) xor (s_5_3_5) xor (s_6_1_8) xor (s_6_2_7)); 
   s_4_1_5 <=  (s_3_1_5) and ( (s_3_2_4) xor (s_4_1_6) xor (s_4_2_5) xor (s_4_3_4) xor (s_5_1_7) xor (s_5_2_6) xor (s_5_3_5) xor (s_6_1_8) xor (s_6_2_7)); 
   s_4_2_4 <=  (s_3_2_4) and ( (s_4_1_6) xor (s_4_2_5) xor (s_4_3_4) xor (s_5_1_7) xor (s_5_2_6) xor (s_5_3_5) xor (s_6_1_8) xor (s_6_2_7)); 
   s_5_1_6 <=  (s_4_1_6) and ( (s_4_2_5) xor (s_4_3_4) xor (s_5_1_7) xor (s_5_2_6) xor (s_5_3_5) xor (s_6_1_8) xor (s_6_2_7)); 
   s_5_2_5 <=  (s_4_2_5) and ( (s_4_3_4) xor (s_5_1_7) xor (s_5_2_6) xor (s_5_3_5) xor (s_6_1_8) xor (s_6_2_7)); 
   s_5_3_4 <=  (s_4_3_4) and ( (s_5_1_7) xor (s_5_2_6) xor (s_5_3_5) xor (s_6_1_8) xor (s_6_2_7)); 
   s_6_1_7 <=  (s_5_1_7) and ( (s_5_2_6) xor (s_5_3_5) xor (s_6_1_8) xor (s_6_2_7)); 
   s_6_2_6 <=  (s_5_2_6) and ( (s_5_3_5) xor (s_6_1_8) xor (s_6_2_7)); 
   s_6_3_5 <=  (s_5_3_5) and ( (s_6_1_8) xor (s_6_2_7)); 
    x_next(8)<= ((s_1_1_2) xor (s_2_1_3) xor (s_3_1_4) xor (s_3_2_3) xor (s_4_1_5) xor (s_4_2_4) xor (s_5_1_6) xor (s_5_2_5) xor (s_5_3_4) xor (s_6_1_7) xor (s_6_2_6) xor (s_6_3_5)); 
    x_next(7)<= ((s_1_1_3) xor (s_2_1_4) xor (s_2_2_3) xor (s_3_1_5) xor (s_3_2_4) xor (s_4_1_6) xor (s_4_2_5) xor (s_4_3_4) xor (s_5_1_7) xor (s_5_2_6) xor (s_5_3_5) xor (s_6_1_8) xor (s_6_2_7)); 
    x_next(6)<= ((s_1_1_4) xor (s_1_2_3) xor (s_2_1_5) xor (s_2_2_4) xor (s_3_1_6) xor (s_3_2_5) xor (s_3_3_4) xor (s_4_1_7) xor (s_4_2_6) xor (s_4_3_5) xor (s_5_1_8) xor (s_5_2_7) xor (s_5_3_6) xor (s_5_4_5));
    x_next(5)<= ((s_1_1_5) xor (s_1_2_4) xor (s_2_1_6) xor (s_2_2_5) xor (s_2_3_4) xor (s_3_1_7) xor (s_3_2_6) xor (s_3_3_5) xor (s_4_1_8) xor (s_4_2_7) xor (s_4_3_6) xor (s_4_4_5) xor (s_5_1_9) xor (s_5_2_8));
    x_next(4)<= ((s_1_1_6) xor (s_1_2_5) xor (s_1_3_4) xor (s_2_1_7) xor (s_2_2_6) xor (s_2_3_5) xor (s_3_1_8) xor (s_3_2_7) xor (s_3_3_6) xor (s_3_4_5) xor (s_4_1_9) xor (s_4_2_8) xor (s_4_3_7) xor (s_4_4_6));
    x_next(3)<= ((s_1_1_7) xor (s_1_2_6) xor (s_1_3_5) xor (s_2_1_8) xor (s_2_2_7) xor (s_2_3_6) xor (s_2_4_5) xor (s_3_1_9) xor (s_3_2_8) xor (s_3_3_7) xor (s_3_4_6) xor (s_4_2_9) xor (s_4_3_8)); 
    x_next(2)<= ((s_1_1_8) xor (s_1_2_7) xor (s_1_3_6) xor (s_1_4_5) xor (s_2_1_9) xor (s_2_2_8) xor (s_2_3_7) xor (s_2_4_6) xor (s_3_2_9) xor (s_3_3_8) xor (s_3_4_7) xor (s_3_5_6)); 
    x_next(1)<= ((s_1_1_9) xor (s_1_2_8) xor (s_1_3_7) xor (s_1_4_6) xor (s_2_2_9) xor (s_2_3_8) xor (s_2_4_7) xor (s_2_5_6) xor (s_3_3_9) xor (s_3_4_8)); 
    x_next(0)<= ((s_1_2_9) xor (s_1_3_8) xor (s_1_4_7) xor (s_1_5_6) xor (s_2_3_9) xor (s_2_4_8) xor (s_2_5_7) xor (s_3_4_9)); 
  process(clk)
  begin
    if rising_edge(clk) then
      if rst = '1' then
        x_reg <= (others => '0');
      elsif load = '1' then
        x_reg <= a;
      elsif en = '1' then
        x_reg <= x_next;
      end if;
    end if;
  end process;

  s <= x_reg;
end rtl;
