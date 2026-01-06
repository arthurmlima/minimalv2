library ieee;
use ieee.std_logic_1164.all;

entity tb_example is
end entity;

architecture sim of tb_example is
  -- DUT ports
  signal a_tb : std_logic_vector(7 downto 0) := (others => '0');
  signal s_tb : std_logic_vector(7 downto 0);

begin
  -- Instantiate DUT
  dut: entity work.example
    port map (
      a => a_tb,
      s => s_tb
    );

  -- Stimulus
  stim: process
  begin
    -- 1st value
    a_tb <= "01011100";
    wait for 20 ns;

    -- 2nd value
    a_tb <= "10101010";
    wait for 20 ns;

    -- 3rd value
    a_tb <= "11110000";
    wait for 20 ns;

    -- stop simulation
    wait;
  end process;

end architecture;
