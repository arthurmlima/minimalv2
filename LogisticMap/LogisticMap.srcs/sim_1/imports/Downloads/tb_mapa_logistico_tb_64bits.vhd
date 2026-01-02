library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_textio.all;
use std.textio.all;
use ieee.numeric_std.all;
 
ENTITY tb_mapa_logistico_tb_64_bits IS
END tb_mapa_logistico_tb_64_bits;
 
ARCHITECTURE behavior OF tb_mapa_logistico_tb_64_bits IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
component mapa_logistico_tb_64_bits 
port(
	a: in std_logic_vector(63 downto 0);
	clk,rst : in std_logic;
	strt, en : std_logic;
	prod: out std_logic_vector(63 downto 0)		
	);
end component;
    
	signal clk_tb           :  std_logic;
    signal rst_tb           :  std_logic;
    signal en_tb           :   std_logic;
	signal strt_tb           : std_logic;
    signal a_tb : std_logic_vector(63 downto 0);
    signal prod_tb : std_logic_vector(63 downto 0);



  --  signal read_data_in1   : std_logic:='0'; 
  --  file   inputs_data_in1 : text open read_mode  is "Data_A.txt";
   

   -- Clock period definitions
   constant PERIOD     : time := 20 ns;
   constant DUTY_CYCLE : real := 0.5;
   constant OFFSET     : time := 5 ns;
 
BEGIN
	-- Instantiate the Unit Under Test (UUT) or Design Under Test (DUT)
DUT: mapa_logistico_tb_64_bits 
    port map(clk           => clk_tb,
            rst        => rst_tb,
		    a          => a_tb,
            en        => en_tb,
            strt      => strt_tb,
            prod     => prod_tb
                   
            );
		  
------------------------------------------------------------------------------------
----------------- proceso generador de la senal de clock 
------------------------------------------------------------------------------------		
        PROCESS    -- clock process for clock
        BEGIN
            clk_tb <= '0';
            WAIT for OFFSET;
            CLOCK_LOOP : LOOP
                clk_tb <= '0';
                WAIT FOR (PERIOD - (PERIOD * DUTY_CYCLE));
                clk_tb <= '1';
                WAIT FOR (PERIOD * DUTY_CYCLE);
            END LOOP CLOCK_LOOP;
        END PROCESS;
-------------------------------------------------------------------------------------
---------------------------PROCESSO GERADOR DO X0------------------------------------

xo :  PROCESS
BEGIN
     a_tb <= "0011110000000000111111111111000000111100000000001111111111110000";
     wait;
END PROCESS xo;

	
------------------------------------------------------------------------------------
----------------- proceso para generar los estimulos de entrada enable
------------------------------------------------------------------------------------
	
   enable :  PROCESS
   BEGIN
        en_tb <= '1';
        wait for 20 ns;
        en_tb<='0';
        wait;
   END PROCESS enable;	
   
-------------------------------------------------------------------------------------------
---------------------------PROCESSO PARA GERAR O START-------------------------------------
-------------------------------------------------------------------------------------------

strt :  PROCESS
BEGIN
     strt_tb <= '0';
     wait for 20 ns;
     strt_tb<='1';
     wait;
END PROCESS strt;

----------------------------------------------------RST-------------------------------
rst :  PROCESS
BEGIN
     rst_tb <= '0';
     wait;
END PROCESS rst;


writing : process(prod_tb)
    
    file      outfile  : text is out "2.txt";  --declare output file
    variable  outline  : line;   --line number declaration  

begin
--write(linenumber,value(real type),justified(side),field(width),digits(natural));
write(outline,prod_tb);
-- write line to external file.
writeline(outfile, outline);

end process writing;


END;
