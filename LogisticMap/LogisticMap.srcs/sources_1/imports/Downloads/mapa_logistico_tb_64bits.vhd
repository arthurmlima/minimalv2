
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
entity mapa_logistico_tb_64_bits is 
	port(
	a: in std_logic_vector(63 downto 0);
	clk,rst : in std_logic;
	strt, en : std_logic;
	prod: out std_logic_vector(63 downto 0)		
	);
	end mapa_logistico_tb_64_bits;
architecture arch of mapa_logistico_tb_64_bits is 

signal  r_reg,r_next : std_logic_vector(63 downto 0);
------------------------------------------------------------------------------------------------------------------------
function mult_bb (io : std_logic_vector(63 downto 0) ) return std_logic_vector is

variable pv,pc : std_logic_vector(127 downto 0);
variable s :std_logic_vector(63 downto 0);

	
		begin 
			pv:=(others=>'0');
			pc:=(others=>'0');
			-- logica observada no algortimo multiplicativo 
			for n in 0 to 63 loop
				for m in 0 to 63 loop 
					if m > n then
					pc(m+n) := (io(m) xor io(n));
					else 
					pc(m+n):= '0';
				end if; 				
			 pv :=pv+pc;
			 pc:=(others=>'0');
			 end loop;
			end loop;
			s:=pv(125 downto 62);
			return s;	
			
			end mult_bb;
			begin
			
--------------------------------------------------------------------------------------------------------------------------
process(clk,rst)
begin
if (rst='1')then 
r_reg <=(others=>'0');
elsif(clk'event and clk='1') then 
r_reg<=r_next;
end if;
end process;  
---------------------------------------------------------------------------------------------------------------------------
r_next <= a when en = '1' else 
		 mult_bb(r_reg) when en = '0' and strt='1' ; 
---------------------------------------------------------------------------------------------------------------------------
prod <= r_reg;
--------------------------------------------------------------------------------------------------------------------------

end arch;






