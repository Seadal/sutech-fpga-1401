library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;
--...................................................................................--	
entity tb is

end entity;
--...................................................................................--	

architecture test of tb is

  component WS

	Port 
		(
		temp, light, clock, reset : in std_logic;
	        moist : in std_logic_vector (2 downto 0);
		myState : out std_logic_vector(1 downto 0);
		mySeg : out std_logic_vector(6 downto 0);
		moistOut : out std_logic_vector (2 downto 0);
		tempOut : out std_logic;
		lightOut : out std_logic
		);
 end component;
--...................................................................................--	
	 signal temp, light, clock, reset : std_logic := '0';
	 signal moist : std_logic_vector (2 downto 0) :="000";
	 signal myState : std_logic_vector(1 downto 0) :="00";
	 signal mySeg : std_logic_vector(6 downto 0) :="0000000";
	 signal moistOut : std_logic_vector (2 downto 0) :="000";
	 signal tempOut : std_logic :='0';
	 signal lightOut : std_logic  :='0';
--...................................................................................--	

begin

 porting : WS port map 	
	(
		temp => temp,
		light => light,
		clock => clock,
		reset => reset,
		moist => moist,
		myState => myState,
		mySeg => mySeg,
		moistOut => moistOut,
		tempOut=> tempOut,
		lightOut => lightOut
	);
--...................................................................................--	
process 
  begin
	clock <= '1';
	wait for 5 ns;

	clock <= '0'; 
	wait for 20 ns;
end process;
--...................................................................................--	
process

  begin

		wait for 10 ns;
		temp <= '0';
		light <= '0';
		moist <= "000";
		wait for 10 ns;
		temp <= '0';
		light <= '1';
		moist <= "000";	
		wait for 10 ns;
		temp <= '1';
		light <= '0';
		moist <= "000";	
		wait for 10 ns;
		temp <= '0';
		light <= '0';
		moist <= "001";
		wait for 10 ns;
		temp <= '0';
		light <= '1';
		moist <= "001";
		wait for 10 ns;
		temp <= '1';
		light <= '1';
		moist <= "001";
		wait for 10 ns;
		temp <= '0';
		light <= '0';
		moist <= "010";
		wait for 10 ns;
		temp <= '1';
		light <= '1';
		moist <= "000";
		wait for 10 ns;
		temp <= '0';
		light <= '1';
		moist <= "010";
		wait for 10 ns;
		temp <= '0';
		light <= '1';
		moist <= "001";
		wait for 10 ns;
		temp <= '1';
		light <= '0';
		moist <= "010";
		wait for 10 ns;
		temp <= '1';
		light <= '1';
		moist <= "010";
		wait for 10 ns;
		temp <= '0';
		light <= '0';
		moist <= "011";
		wait for 10 ns;
		temp <= '0';
		light <= '1';
		moist <= "011";
		wait for 10 ns;
		temp <= '1';
		light <= '0';
		moist <= "011";
		wait for 10 ns;
		temp <= '1';
		light <= '1';
		moist <= "011";
		wait for 10 ns;
		temp <= '0';
		light <= '0';
		moist <= "011";
		wait for 10 ns;
		temp <= '0';
		light <= '0';
		moist <= "100";
		wait for 10 ns;
		temp <= '0';
		light <= '1';
		moist <= "100";
		wait for 10 ns;
		temp <= '1';
		light <= '0';
		moist <= "100";
		wait for 10 ns;
		temp <= '1';
		light <= '1';
		moist <= "100";
		wait for 10 ns;
		temp <= '0';
		light <= '0';
		moist <= "101";
		wait for 10 ns;
		temp <= '0';
		light <= '0';
		moist <= "110";
		wait for 10 ns;
		temp <= '0';
		light <= '1';
		moist <= "110";
		wait for 10 ns;
		temp <= '1';
		light <= '0';
		moist <= "110";
		wait for 10 ns;
		temp <= '1';
		light <= '1';
		moist <= "110";
		wait for 10 ns;
		temp <= '0';
		light <= '0';
		moist <= "111";
		wait for 10 ns;
		temp <= '0';
		light <= '1';
		moist <= "111";
		wait for 10 ns;
		temp <= '1';
		light <= '0';
		moist <= "111";
		wait for 10 ns;
		temp <= '1';
		light <= '1';
		moist <= "111";
		wait for 10 ns;
		temp <= '1';
		light <= '1';
		moist <= "111";
		wait for 10 ns;
  end process;

end Architecture;
--...................................................................................--	

