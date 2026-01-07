library ieee;
use ieee.std_logic_1164.all;

entity MariusMethod_6 is
  port (
    clk  : in  std_logic;
    rst  : in  std_logic;
    load : in  std_logic;
    en   : in  std_logic;
    a    : in  std_logic_vector(5 downto 0);
    s    : out std_logic_vector(5 downto 0)
  );
end MariusMethod_6;

architecture rtl of MariusMethod_6 is
  signal x_reg  : std_logic_vector(5 downto 0) := (others => '0');
  signal x_next : std_logic_vector(5 downto 0);

signal s_1_5_6 : std_logic;
signal s_1_4_6 : std_logic;
signal s_1_3_6 : std_logic;
signal s_1_2_6 : std_logic;
signal s_1_1_6 : std_logic;
signal s_1_1_5 : std_logic;
signal s_1_1_4 : std_logic;
signal s_1_1_3 : std_logic;
signal s_1_1_2 : std_logic;
signal s_1_4_5 : std_logic;
signal s_1_3_5 : std_logic;
signal s_1_2_5 : std_logic;
signal s_1_2_4 : std_logic;
signal s_1_2_3 : std_logic;
signal s_1_3_4 : std_logic;
signal s_2_3_6 : std_logic;
signal s_2_2_6 : std_logic;
signal s_2_1_6 : std_logic;
signal s_2_1_5 : std_logic;
signal s_2_1_4 : std_logic;
signal s_2_1_3 : std_logic;
signal s_2_4_5 : std_logic;
signal s_2_3_5 : std_logic;
signal s_2_2_5 : std_logic;
signal s_2_2_4 : std_logic;
signal s_2_2_3 : std_logic;
signal s_2_3_4 : std_logic;
signal s_3_1_6 : std_logic;
signal s_3_1_5 : std_logic;
signal s_3_1_4 : std_logic;
begin
    s_1_5_6 <= x_reg(1) xor x_reg(0);

    s_1_4_6 <= x_reg(2) xor x_reg(0);

    s_1_3_6 <= x_reg(3) xor x_reg(0);

    s_1_4_5 <= x_reg(2) xor x_reg(1);

    s_1_2_6 <= x_reg(4) xor x_reg(0);

    s_1_3_5 <= x_reg(3) xor x_reg(1);

   s_2_3_6 <=  (s_1_3_6) and ( (s_1_4_5)); 
   s_2_4_5 <=  '0';
    s_1_1_6 <= x_reg(5) xor x_reg(0);

    s_1_2_5 <= x_reg(4) xor x_reg(1);

    s_1_3_4 <= x_reg(3) xor x_reg(2);

   s_2_2_6 <=  (s_1_2_6) and ( (s_1_3_5) xor (s_2_3_6) xor (s_2_4_5)); 
   s_2_3_5 <=  (s_1_3_5) and ( (s_2_3_6) xor (s_2_4_5)); 
    s_1_1_5 <= x_reg(5) xor x_reg(1);

    s_1_2_4 <= x_reg(4) xor x_reg(2);

   s_2_1_6 <=  (s_1_1_6) and ( (s_1_2_5) xor (s_1_3_4) xor (s_2_2_6) xor (s_2_3_5));
   s_2_2_5 <=  (s_1_2_5) and ( (s_1_3_4) xor (s_2_2_6) xor (s_2_3_5));
   s_2_3_4 <=  (s_1_3_4) and ( (s_2_2_6) xor (s_2_3_5));
    s_1_1_4 <= x_reg(5) xor x_reg(2);

    s_1_2_3 <= x_reg(4) xor x_reg(3);

   s_2_1_5 <=  (s_1_1_5) and ( (s_1_2_4) xor (s_2_1_6) xor (s_2_2_5) xor (s_2_3_4));
   s_2_2_4 <=  (s_1_2_4) and ( (s_2_1_6) xor (s_2_2_5) xor (s_2_3_4));
   s_3_1_6 <=  (s_2_1_6) and ( (s_2_2_5) xor (s_2_3_4));
    s_1_1_3 <= x_reg(5) xor x_reg(3);

   s_2_1_4 <=  (s_1_1_4) and ( (s_1_2_3) xor (s_2_1_5) xor (s_2_2_4) xor (s_3_1_6));
   s_2_2_3 <=  (s_1_2_3) and ( (s_2_1_5) xor (s_2_2_4) xor (s_3_1_6));
   s_3_1_5 <=  (s_2_1_5) and ( (s_2_2_4) xor (s_3_1_6));
    s_1_1_2 <= x_reg(5) xor x_reg(4);

   s_2_1_3 <=  (s_1_1_3) and ( (s_2_1_4) xor (s_2_2_3) xor (s_3_1_5)); 
   s_3_1_4 <=  (s_2_1_4) and ( (s_2_2_3) xor (s_3_1_5)); 
    x_next(5)<= ((s_1_1_2) xor (s_2_1_3) xor (s_3_1_4)); 
    x_next(4)<= ((s_1_1_3) xor (s_2_1_4) xor (s_2_2_3) xor (s_3_1_5)); 
    x_next(3)<= ((s_1_1_4) xor (s_1_2_3) xor (s_2_1_5) xor (s_2_2_4) xor (s_3_1_6));
    x_next(2)<= ((s_1_1_5) xor (s_1_2_4) xor (s_2_1_6) xor (s_2_2_5) xor (s_2_3_4));
    x_next(1)<= ((s_1_1_6) xor (s_1_2_5) xor (s_1_3_4) xor (s_2_2_6) xor (s_2_3_5));
    x_next(0)<= ((s_1_2_6) xor (s_1_3_5) xor (s_2_3_6) xor (s_2_4_5)); 
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
