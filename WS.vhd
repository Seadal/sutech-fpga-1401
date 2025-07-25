--..........................Watering system..........................................--

.library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

--...................................................................................--

Entity WS is
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
End WS;

--...................................................................................--

Architecture fsm of WS is

	Component seg
		PORT (
			display : in std_logic_vector ( 1 downto 0);
			seg: out std_logic_vector ( 6 downto 0)
		      );
	End Component;

	Type stateT is (st0, st1); -- state type
	Signal ps, ns : stateT; -- ps:present state - ns:next state
	Signal S : std_logic_vector (1 downto 0);
	Attribute enum : string;
	Attribute enum of stateT : type is "00 01";
Begin

	sev : seg port map (display => S, seg => mySeg);
--...................................................................................--		

	process(clock, ns, reset)
	Begin
		if (reset = '1') then ps <= st0; -- not watering state
		Elsif (clock = '1' ) then ps <= ns; -- next state transition
		End if;
	End process ;

--...................................................................................--

	process(ps, temp, light, moist)
	Begin

		Case ps is
			When st0 => 
				If (temp = '0' and light = '0') and (moist <= "011") then
				ns <= st1;  moistOut <= moist; tempOut <= temp; lightOut <= light; -- condition 2
				S <= "01";
				Elsif (temp = '1' or light = '1') and (moist <= "001") then
				ns <= st1; moistOut <= moist; tempOut <= temp; lightOut <= light; -- condition 3
				S <= "01";
				Else 
				ns <= ST0; moistOut <= moist; tempOut <= temp; lightOut <= light; --staying at st0 (condition 1 and 4)
				S <= "00";
				end if;
			When st1 =>
				If (moist >= "111") then 
				ns <= st0; moistOut <= moist; tempOut <= temp; lightOut <= light; -- condition 2
				S <="00";
				elsif (moist >= "011") and (temp = '1' or light = '1') then
				ns <= ST0; moistOut <= moist; tempOut <= temp; lightOut <= light;
				S <="00";
				Else 
				ns <= st1; moistOut <= moist; tempOut <= temp; lightOut <= light; --staying at st1 (condition 1 and 4)
				S <= "01";
				end if;
			When others =>
				ns<=st1;
				S <="01";
		End case;
End process ;

--...................................................................................--

With ps select
		myState <= "00" when st0,
	         "01" when st1,
	         "11" when others;

End fsm;

--...................................................................................--