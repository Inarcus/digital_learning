
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;
USE work.package_lab6.all;

ENTITY ram_tb IS
END ram_tb;

ARCHITECTURE tb OF ram_tb IS


  SIGNAL signals : my_signal := (
    clk => '0',
    enable => '0',
    WR => '0',
    RD => '0',
    A => (others => '0'),
    data_in => (others => '0'),
    data_out => (others => '0')
  );


  CONSTANT clk_period : time := 10 ns;

BEGIN


  uut: ENTITY work.RAM
    PORT MAP (
      signals => signals
    );


  clk_process : PROCESS
  BEGIN
    signals.clk <= '0';
    WAIT FOR clk_period / 2;
    signals.clk <= '1';
    WAIT FOR clk_period / 2;
  END PROCESS;


  stimulus_process: PROCESS
  BEGIN

    WAIT FOR 20 ns;
    signals.enable <= '0';
    signals.WR <= '0';
    signals.RD <= '0';
    signals.A <= "00000000";
    signals.data_in <= "00000000";
    WAIT FOR clk_period;


    signals.enable <= '1';
    signals.WR <= '1';
    signals.RD <= '0';
    signals.A <= "00000001";
    signals.data_in <= "10101010"; 
    WAIT FOR clk_period;

   
    signals.WR <= '0';
    signals.RD <= '1'; 
    WAIT FOR clk_period;


    signals.WR <= '1';
    signals.RD <= '1';
    signals.A <= "00000010";
    signals.data_in <= "01010101"; 
    WAIT FOR clk_period;

 
    signals.WR <= '1';
    signals.RD <= '0';
    signals.A <= "00000011";
    signals.data_in <= "11110000"; 
    WAIT FOR clk_period;

  
    signals.WR <= '0';
    signals.RD <= '1';
    signals.A <= "00000011"; 
    WAIT FOR clk_period;


    FOR i IN 0 TO 255 LOOP
      signals.WR <= '1';
      signals.RD <= '0';
      signals.A <= std_logic_vector(to_unsigned(i, 8));
      signals.data_in <= std_logic_vector(to_unsigned(i, 8)); 
      WAIT FOR clk_period;
    END LOOP;

 
    FOR i IN 0 TO 255 LOOP
      signals.WR <= '0';
      signals.RD <= '1';
      signals.A <= std_logic_vector(to_unsigned(i, 8));
      WAIT FOR clk_period;
    END LOOP;

    WAIT;
  END PROCESS stimulus_process;

END ARCHITECTURE tb;
