library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library work;
use work.my_types_pkg.all;

entity move is
    Port ( 
            clk100MHz  : in std_logic;
            myboard : buffer board;
            key     : in std_logic_vector(3 downto 0);
              btnU : in STD_LOGIC;
              btnD : in STD_LOGIC;
              btnC : in STD_LOGIC;
              btnL : in STD_LOGIC;
              btnR : in STD_LOGIC;
            decode  : out std_logic_vector(3 downto 0)
    );
end move;

architecture Behavioral of move is

    -- clk1Hz
    signal counter2Hz : integer := 0;
    signal counter10Hz : integer := 0;
    
    signal blocks : std_logic_vector(2 downto 0) := "000";
    
    signal clk2Hz : std_logic := '0';
    signal clk10Hz : std_logic := '0';
    signal game_state: std_logic := '0';
begin
    
--DISPLAY: process(state)
--begin
--    if(state = '0') then
--        decode <= "00001";
--    elsif (state = '1') then
--        decode <= "00010";
--    else
--        decode <= "10000";
--    end if;
--end process;

FALLING: process(clk100MHz)
    variable curR1 : integer;
    variable curC1 : integer;
    variable curR2 : integer;
    variable curC2 : integer;
    variable curR3 : integer;
    variable curC3 : integer;
    variable curR4 : integer;
    variable curC4 : integer;
    
    variable state : std_logic := '0';
    
    variable clear : std_logic := '1';
    
    variable valid : integer;
                
    begin

    if rising_edge(clk100MHz) then
        if game_state = '1' then
           
              if (myboard(22)(0)) = "001" and (myboard(22)(1)) = "001"
                 and (myboard(22)(2)) = "001" and (myboard(22)(3)) = "001"
                 and (myboard(22)(4)) = "001" and (myboard(22)(5)) = "001"
                 and (myboard(22)(6)) = "001" and (myboard(22)(7)) = "001"
                 and (myboard(22)(8)) = "001" and (myboard(22)(9)) = "001" then
                   myboard(22) <= myboard(21);
                   myboard(21) <= myboard(20);
                   myboard(20) <= myboard(19);
                   myboard(19) <= myboard(18);
                   myboard(18) <= myboard(17);
                   myboard(17) <= myboard(16);
                   myboard(16) <= myboard(15);
                   myboard(15) <= myboard(14);
                   myboard(14) <= myboard(13);
                   myboard(13) <= myboard(12);
                   myboard(12) <= myboard(11);
                   myboard(11) <= myboard(10);
                   myboard(10) <= myboard(9);
                   myboard(9) <= myboard(8);
                   myboard(8) <= myboard(7);
                   myboard(7) <= myboard(6);
                   myboard(6) <= myboard(5);
                   myboard(5) <= myboard(4);
                   myboard(4) <= myboard(3);
                   myboard(3) <= myboard(2);
               elsif (myboard(21)(0)) = "001" and (myboard(21)(1)) = "001"
                   and (myboard(21)(2)) = "001" and (myboard(21)(3)) = "001"
                   and (myboard(21)(4)) = "001" and (myboard(21)(5)) = "001"
                   and (myboard(21)(6)) = "001" and (myboard(21)(7)) = "001"
                   and (myboard(21)(8)) = "001" and (myboard(21)(9)) = "001" then
                     myboard(21) <= myboard(20);
                     myboard(20) <= myboard(19);
                     myboard(19) <= myboard(18);
                     myboard(18) <= myboard(17);
                     myboard(17) <= myboard(16);
                     myboard(16) <= myboard(15);
                     myboard(15) <= myboard(14);
                     myboard(14) <= myboard(13);
                     myboard(13) <= myboard(12);
                     myboard(12) <= myboard(11);
                     myboard(11) <= myboard(10);
                     myboard(10) <= myboard(9);
                     myboard(9) <= myboard(8);
                     myboard(8) <= myboard(7);
                     myboard(7) <= myboard(6);
                     myboard(6) <= myboard(5);
                     myboard(5) <= myboard(4);
                     myboard(4) <= myboard(3);
                     myboard(3) <= myboard(2);
              elsif (myboard(20)(0)) = "001" and (myboard(20)(1)) = "001"
                    and (myboard(20)(2)) = "001" and (myboard(20)(3)) = "001"
                    and (myboard(20)(4)) = "001" and (myboard(20)(5)) = "001"
                    and (myboard(20)(6)) = "001" and (myboard(20)(7)) = "001"
                    and (myboard(20)(8)) = "001" and (myboard(20)(9)) = "001" then
                      myboard(20) <= myboard(19);
                      myboard(19) <= myboard(18);
                      myboard(18) <= myboard(17);
                      myboard(17) <= myboard(16);
                      myboard(16) <= myboard(15);
                      myboard(15) <= myboard(14);
                      myboard(14) <= myboard(13);
                      myboard(13) <= myboard(12);
                      myboard(12) <= myboard(11);
                      myboard(11) <= myboard(10);
                      myboard(10) <= myboard(9);
                      myboard(9) <= myboard(8);
                      myboard(8) <= myboard(7);
                      myboard(7) <= myboard(6);
                      myboard(6) <= myboard(5);
                      myboard(5) <= myboard(4);
                      myboard(4) <= myboard(3);
                      myboard(3) <= myboard(2);
              elsif (myboard(19)(0)) = "001" and (myboard(19)(1)) = "001"
                      and (myboard(19)(2)) = "001" and (myboard(19)(3)) = "001"
                      and (myboard(19)(4)) = "001" and (myboard(19)(5)) = "001"
                      and (myboard(19)(6)) = "001" and (myboard(19)(7)) = "001"
                      and (myboard(19)(8)) = "001" and (myboard(19)(9)) = "001" then
                        myboard(19) <= myboard(18);
                        myboard(18) <= myboard(17);
                        myboard(17) <= myboard(16);
                        myboard(16) <= myboard(15);
                        myboard(15) <= myboard(14);
                        myboard(14) <= myboard(13);
                        myboard(13) <= myboard(12);
                        myboard(12) <= myboard(11);
                        myboard(11) <= myboard(10);
                        myboard(10) <= myboard(9);
                        myboard(9) <= myboard(8);
                        myboard(8) <= myboard(7);
                        myboard(7) <= myboard(6);
                        myboard(6) <= myboard(5);
                        myboard(5) <= myboard(4);
                        myboard(4) <= myboard(3);
                        myboard(3) <= myboard(2);
              elsif (myboard(18)(0)) = "001" and (myboard(18)(1)) = "001"
                        and (myboard(18)(2)) = "001" and (myboard(18)(3)) = "001"
                        and (myboard(18)(4)) = "001" and (myboard(18)(5)) = "001"
                        and (myboard(18)(6)) = "001" and (myboard(18)(7)) = "001"
                        and (myboard(18)(8)) = "001" and (myboard(18)(9)) = "001" then
                          myboard(18) <= myboard(17);
                          myboard(17) <= myboard(16);
                          myboard(16) <= myboard(15);
                          myboard(15) <= myboard(14);
                          myboard(14) <= myboard(13);
                          myboard(13) <= myboard(12);
                          myboard(12) <= myboard(11);
                          myboard(11) <= myboard(10);
                          myboard(10) <= myboard(9);
                          myboard(9) <= myboard(8);
                          myboard(8) <= myboard(7);
                          myboard(7) <= myboard(6);
                          myboard(6) <= myboard(5);
                          myboard(5) <= myboard(4);
                          myboard(4) <= myboard(3);
                          myboard(3) <= myboard(2);
               elsif (myboard(17)(0)) = "001" and (myboard(17)(1)) = "001"
                        and (myboard(17)(2)) = "001" and (myboard(17)(3)) = "001"
                        and (myboard(17)(4)) = "001" and (myboard(17)(5)) = "001"
                        and (myboard(17)(6)) = "001" and (myboard(17)(7)) = "001"
                        and (myboard(17)(8)) = "001" and (myboard(17)(9)) = "001" then
                          myboard(17) <= myboard(16);
                          myboard(16) <= myboard(15);
                          myboard(15) <= myboard(14);
                          myboard(14) <= myboard(13);
                          myboard(13) <= myboard(12);
                          myboard(12) <= myboard(11);
                          myboard(11) <= myboard(10);
                          myboard(10) <= myboard(9);
                          myboard(9) <= myboard(8);
                          myboard(8) <= myboard(7);
                          myboard(7) <= myboard(6);
                          myboard(6) <= myboard(5);
                          myboard(5) <= myboard(4);
                          myboard(4) <= myboard(3);
                          myboard(3) <= myboard(2);
               elsif (myboard(16)(0)) = "001" and (myboard(16)(1)) = "001"
                       and (myboard(16)(2)) = "001" and (myboard(16)(3)) = "001"
                       and (myboard(16)(4)) = "001" and (myboard(16)(5)) = "001"
                       and (myboard(16)(6)) = "001" and (myboard(16)(7)) = "001"
                       and (myboard(16)(8)) = "001" and (myboard(16)(9)) = "001" then
                         myboard(16) <= myboard(15);
                         myboard(15) <= myboard(14);
                         myboard(14) <= myboard(13);
                         myboard(13) <= myboard(12);
                         myboard(12) <= myboard(11);
                         myboard(11) <= myboard(10);
                         myboard(10) <= myboard(9);
                         myboard(9) <= myboard(8);
                         myboard(8) <= myboard(7);
                         myboard(7) <= myboard(6);
                         myboard(6) <= myboard(5);
                         myboard(5) <= myboard(4);
                         myboard(4) <= myboard(3);
                         myboard(3) <= myboard(2);
               elsif (myboard(15)(0)) = "001" and (myboard(15)(1)) = "001"
                     and (myboard(15)(2)) = "001" and (myboard(15)(3)) = "001"
                     and (myboard(15)(4)) = "001" and (myboard(15)(5)) = "001"
                     and (myboard(15)(6)) = "001" and (myboard(15)(7)) = "001"
                     and (myboard(15)(8)) = "001" and (myboard(15)(9)) = "001" then
                       myboard(15) <= myboard(14);
                       myboard(14) <= myboard(13);
                       myboard(13) <= myboard(12);
                       myboard(12) <= myboard(11);
                       myboard(11) <= myboard(10);
                       myboard(10) <= myboard(9);
                       myboard(9) <= myboard(8);
                       myboard(8) <= myboard(7);
                       myboard(7) <= myboard(6);
                       myboard(6) <= myboard(5);
                       myboard(5) <= myboard(4);
                       myboard(4) <= myboard(3);
                       myboard(3) <= myboard(2);
               elsif (myboard(14)(0)) = "001" and (myboard(14)(1)) = "001"
                     and (myboard(14)(2)) = "001" and (myboard(14)(3)) = "001"
                     and (myboard(14)(4)) = "001" and (myboard(14)(5)) = "001"
                     and (myboard(14)(6)) = "001" and (myboard(14)(7)) = "001"
                     and (myboard(14)(8)) = "001" and (myboard(14)(9)) = "001" then
                       myboard(14) <= myboard(13);
                       myboard(13) <= myboard(12);
                       myboard(12) <= myboard(11);
                       myboard(11) <= myboard(10);
                       myboard(10) <= myboard(9);
                       myboard(9) <= myboard(8);
                       myboard(8) <= myboard(7);
                       myboard(7) <= myboard(6);
                       myboard(6) <= myboard(5);
                       myboard(5) <= myboard(4);
                       myboard(4) <= myboard(3);
                       myboard(3) <= myboard(2);
               elsif (myboard(13)(0)) = "001" and (myboard(13)(1)) = "001"
                     and (myboard(13)(2)) = "001" and (myboard(13)(3)) = "001"
                     and (myboard(13)(4)) = "001" and (myboard(13)(5)) = "001"
                     and (myboard(13)(6)) = "001" and (myboard(13)(7)) = "001"
                     and (myboard(13)(8)) = "001" and (myboard(13)(9)) = "001" then
                       myboard(13) <= myboard(12);
                       myboard(12) <= myboard(11);
                       myboard(11) <= myboard(10);
                       myboard(10) <= myboard(9);
                       myboard(9) <= myboard(8);
                       myboard(8) <= myboard(7);
                       myboard(7) <= myboard(6);
                       myboard(6) <= myboard(5);
                       myboard(5) <= myboard(4);
                       myboard(4) <= myboard(3);
                       myboard(3) <= myboard(2);
               elsif (myboard(12)(0)) = "001" and (myboard(12)(1)) = "001"
                     and (myboard(12)(2)) = "001" and (myboard(12)(3)) = "001"
                     and (myboard(12)(4)) = "001" and (myboard(12)(5)) = "001"
                     and (myboard(12)(6)) = "001" and (myboard(12)(7)) = "001"
                     and (myboard(12)(8)) = "001" and (myboard(12)(9)) = "001" then
                       myboard(12) <= myboard(11);
                       myboard(11) <= myboard(10);
                       myboard(10) <= myboard(9);
                       myboard(9) <= myboard(8);
                       myboard(8) <= myboard(7);
                       myboard(7) <= myboard(6);
                       myboard(6) <= myboard(5);
                       myboard(5) <= myboard(4);
                       myboard(4) <= myboard(3);
                       myboard(3) <= myboard(2);
               elsif (myboard(11)(0)) = "001" and (myboard(11)(1)) = "001"
                     and (myboard(11)(2)) = "001" and (myboard(11)(3)) = "001"
                     and (myboard(11)(4)) = "001" and (myboard(11)(5)) = "001"
                     and (myboard(11)(6)) = "001" and (myboard(11)(7)) = "001"
                     and (myboard(11)(8)) = "001" and (myboard(11)(9)) = "001" then
                       myboard(11) <= myboard(10);
                       myboard(10) <= myboard(9);
                       myboard(9) <= myboard(8);
                       myboard(8) <= myboard(7);
                       myboard(7) <= myboard(6);
                       myboard(6) <= myboard(5);
                       myboard(5) <= myboard(4);
                       myboard(4) <= myboard(3);
                       myboard(3) <= myboard(2);
               elsif (myboard(10)(0)) = "001" and (myboard(10)(1)) = "001"
                     and (myboard(10)(2)) = "001" and (myboard(10)(3)) = "001"
                     and (myboard(10)(4)) = "001" and (myboard(10)(5)) = "001"
                     and (myboard(10)(6)) = "001" and (myboard(10)(7)) = "001"
                     and (myboard(10)(8)) = "001" and (myboard(10)(9)) = "001" then
                       myboard(10) <= myboard(9);
                       myboard(9) <= myboard(8);
                       myboard(8) <= myboard(7);
                       myboard(7) <= myboard(6);
                       myboard(6) <= myboard(5);
                       myboard(5) <= myboard(4);
                       myboard(4) <= myboard(3);
                       myboard(3) <= myboard(2);
               elsif (myboard(9)(0)) = "001" and (myboard(9)(1)) = "001"
                     and (myboard(9)(2)) = "001" and (myboard(9)(3)) = "001"
                     and (myboard(9)(4)) = "001" and (myboard(9)(5)) = "001"
                     and (myboard(9)(6)) = "001" and (myboard(9)(7)) = "001"
                     and (myboard(9)(8)) = "001" and (myboard(9)(9)) = "001" then
                       myboard(9) <= myboard(8);
                       myboard(8) <= myboard(7);
                       myboard(7) <= myboard(6);
                       myboard(6) <= myboard(5);
                       myboard(5) <= myboard(4);
                       myboard(4) <= myboard(3);
                       myboard(3) <= myboard(2);
               elsif (myboard(8)(0)) = "001" and (myboard(8)(1)) = "001"
                     and (myboard(8)(2)) = "001" and (myboard(8)(3)) = "001"
                     and (myboard(8)(4)) = "001" and (myboard(8)(5)) = "001"
                     and (myboard(8)(6)) = "001" and (myboard(8)(7)) = "001"
                     and (myboard(8)(8)) = "001" and (myboard(8)(9)) = "001" then
                       myboard(8) <= myboard(7);
                       myboard(7) <= myboard(6);
                       myboard(6) <= myboard(5);
                       myboard(5) <= myboard(4);
                       myboard(4) <= myboard(3);
                       myboard(3) <= myboard(2);
               elsif (myboard(7)(0)) = "001" and (myboard(7)(1)) = "001"
                     and (myboard(7)(2)) = "001" and (myboard(7)(3)) = "001"
                     and (myboard(7)(4)) = "001" and (myboard(7)(5)) = "001"
                     and (myboard(7)(6)) = "001" and (myboard(7)(7)) = "001"
                     and (myboard(7)(8)) = "001" and (myboard(7)(9)) = "001" then
                       myboard(7) <= myboard(6);
                       myboard(6) <= myboard(5);
                       myboard(5) <= myboard(4);
                       myboard(4) <= myboard(3);
                       myboard(3) <= myboard(2);
               elsif (myboard(6)(0)) = "001" and (myboard(6)(1)) = "001"
                     and (myboard(6)(2)) = "001" and (myboard(6)(3)) = "001"
                     and (myboard(6)(4)) = "001" and (myboard(6)(5)) = "001"
                     and (myboard(6)(6)) = "001" and (myboard(6)(7)) = "001"
                     and (myboard(6)(8)) = "001" and (myboard(6)(9)) = "001" then
                       myboard(6) <= myboard(5);
                       myboard(5) <= myboard(4);
                       myboard(4) <= myboard(3);
                       myboard(3) <= myboard(2);
               elsif (myboard(5)(0)) = "001" and (myboard(5)(1)) = "001"
                     and (myboard(5)(2)) = "001" and (myboard(5)(3)) = "001"
                     and (myboard(5)(4)) = "001" and (myboard(5)(5)) = "001"
                     and (myboard(5)(6)) = "001" and (myboard(5)(7)) = "001"
                     and (myboard(5)(8)) = "001" and (myboard(5)(9)) = "001" then
                       myboard(5) <= myboard(4);
                       myboard(4) <= myboard(3);
                       myboard(3) <= myboard(2);
               elsif (myboard(4)(0)) = "001" and (myboard(4)(1)) = "001"
                     and (myboard(4)(2)) = "001" and (myboard(4)(3)) = "001"
                     and (myboard(4)(4)) = "001" and (myboard(4)(5)) = "001"
                     and (myboard(4)(6)) = "001" and (myboard(4)(7)) = "001"
                     and (myboard(4)(8)) = "001" and (myboard(4)(9)) = "001" then
                       myboard(4) <= myboard(3);
                       myboard(3) <= myboard(2);
               elsif (myboard(3)(0)) = "001" and (myboard(3)(1)) = "001"
                     and (myboard(3)(2)) = "001" and (myboard(3)(3)) = "001"
                     and (myboard(3)(4)) = "001" and (myboard(3)(5)) = "001"
                     and (myboard(3)(6)) = "001" and (myboard(3)(7)) = "001"
                     and (myboard(3)(8)) = "001" and (myboard(3)(9)) = "001" then
                       myboard(3) <= myboard(2);
               end if;

            
            --Check end game
            if (myboard(2)(0)) = "001" or (myboard(2)(1)) = "001"
               or (myboard(2)(2)) = "001" or (myboard(2)(3)) = "001"
               or (myboard(2)(4)) = "001" or (myboard(2)(5)) = "001"
               or (myboard(2)(6)) = "001" or (myboard(2)(7)) = "001"
               or (myboard(2)(8)) = "001" or (myboard(2)(9)) = "001"
               or (myboard(3)(3)) = "001" or (myboard(3)(4)) = "001"
               or (myboard(3)(5)) = "001" or (myboard(3)(6)) = "001" then
                   --end game
               game_state <= '0';
            end if;
       
              --BLOCK GENERATOR STATE
            if(state = '0') then
                if(blocks = "000") then
                  blocks <= "001";
                  curR1 := 0;   -- 1
                  curC1 := 5;   -- 2 
                  curR2 := 1;   -- 3
                  curC2 := 5;   -- 4
                  curR3 := 2;
                  curC3 := 5;
                  curR4 := 3;
                  curC4 := 5;
                elsif(blocks = "001") then
                  blocks <= "010";
                  curR1 := 1;   --   1
                  curC1 := 5;   --   2
                  curR2 := 2;   -- 4 3
                  curC2 := 5;
                  curR3 := 3;
                  curC3 := 5;
                  curR4 := 3;
                  curC4 := 4;
                elsif(blocks = "010") then
                  blocks <= "011";
                  curR1 := 1;   -- 1
                  curC1 := 4;   -- 2
                  curR2 := 2;   -- 3 4
                  curC2 := 4;
                  curR3 := 3;
                  curC3 := 4;
                  curR4 := 3;
                  curC4 := 5;
                elsif(blocks = "011") then
                  blocks <= "100";
                  curR1 := 1;   --   1
                  curC1 := 5;   -- 3 2
                  curR2 := 2;   -- 4
                  curC2 := 5;
                  curR3 := 2;
                  curC3 := 4;
                  curR4 := 3;
                  curC4 := 4;
                elsif(blocks = "100") then
                  blocks <= "101";   
                  curR1 := 1;   -- 1
                  curC1 := 4;   -- 2 3
                  curR2 := 2;   --   4
                  curC2 := 4;
                  curR3 := 2;
                  curC3 := 5;
                  curR4 := 3;
                  curC4 := 5;
                elsif(blocks = "101") then
                  blocks <= "110";
                  curR1 := 2;   --   1
                  curC1 := 5;   -- 2 3 4
                  curR2 := 3;
                  curC2 := 4;
                  curR3 := 3;
                  curC3 := 5;
                  curR4 := 3;
                  curC4 := 6;
                elsif(blocks = "110") then
                  blocks <= "000";  
                  curR1 := 2;   -- 1 2
                  curC1 := 4;   -- 3 4
                  curR2 := 2;
                  curC2 := 5;
                  curR3 := 3;
                  curC3 := 4;
                  curR4 := 3;
                  curC4 := 5;
                end if;
                
                myboard(curR1)(curC1) <= "010";
                myboard(curR2)(curC2) <= "010";
                myboard(curR3)(curC3) <= "010";
                myboard(curR4)(curC4) <= "010";
                state := '1';
            else -- if state = '1' FALLING STATE
                if(counter2Hz = 100000000/2) then
                   counter2Hz <= 0;
                   clk2Hz <= '1';
                else
                   counter2Hz <= counter2Hz + 1;
                end if;
            
                if(counter10Hz = 10000000) then
                   counter10Hz <= 0;
                   clk10Hz <= '1';
                else
                   counter10Hz <= counter10Hz + 1;
                end if;
            
                --falling procedure do in 2Hz
                if(clk2Hz = '1') then
                --get the initial position of block
                   
                    --check next move vaildity*
                    if (myboard(curR1+1)(curC1)) = "001"
                       or (myboard(curR2+1)(curC2)) = "001"
                       or (myboard(curR3+1)(curC3)) = "001"
                       or (myboard(curR4+1)(curC4)) = "001"
                       or curR1+1 > 22 or curR2+1 > 22
                       or curR3+1 > 22 or curR4+1 > 22 then
                       valid := 0;
                    else
                       valid := 1;
                    end if;
                       
                    --valid = 1 means do the falling
                    if(valid = 1) then
                    
                        --move downward
                        --remove the "10" element
                        for i in 0 to 22 loop
                           for j in 0 to 9 loop
                               if (myboard(i)(j)) = "010" then
                                   myboard(i)(j) <= "000";
                               else
                                   myboard(i)(j) <= myboard(i)(j);
                               end if;
                           end loop;
                        end loop;
                           
                        --update the next element
                        curR1 := curR1+1;
                        curR2 := curR2+1;
                        curR3 := curR3+1;
                        curR4 := curR4+1;   
                           
                        --fill the next element
                        for i in 0 to 22 loop
                           for j in 0 to 9 loop
                               if (i = curR1 and j = curC1) 
                                   or (i = curR2 and j = curC2)
                                   or (i = curR3 and j = curC3)
                                   or (i = curR4 and j = curC4) then
                                   myboard(i)(j) <= "010";
                               end if;
                           end loop;
                        end loop;
                           
                        
                   
                    --Stop falling(if valid = 0)          
                    else
                        state := '0';
                       
                        --change the block state
                        for i in 0 to 22 loop
                           for j in 0 to 9 loop
                               if (i = curR1 and j = curC1) 
                                   or (i = curR2 and j = curC2)
                                   or (i = curR3 and j = curC3)
                                   or (i = curR4 and j = curC4) then
                                   myboard(i)(j) <= "001";
                               else
                                   myboard(i)(j) <= myboard(i)(j);
                               end if;
                           end loop;
                        end loop;
                    end if;
                    clk2Hz <= '0';
                else    --for user control
                
                    if(clk10Hz = '1') then
                        --left
                        if(btnL = '1') then
                            --remove
                            for i in 0 to 22 loop
                               for j in 0 to 9 loop
                                   if (myboard(i)(j)) = "010" then
                                       myboard(i)(j) <= "000";
                                   else
                                       myboard(i)(j) <= myboard(i)(j);
                                   end if;
                               end loop;
                            end loop;
                        
                            if (curC1-1 >= 0) and (curC2-1 >= 0)
                                 and (curC3-1 >= 0) and (curC4-1 >= 0)
                                 and ((myboard(curR1)(curC1-1)) /= "001")
                                 and ((myboard(curR2)(curC2-1)) /= "001")
                                 and ((myboard(curR3)(curC3-1)) /= "001")
                                 and ((myboard(curR4)(curC4-1)) /= "001") then
                               curC1 := curC1 - 1;
                               curC2 := curC2 - 1;
                               curC3 := curC3 - 1;
                               curC4 := curC4 - 1;
                            end if;
                        
                            --fill
                            for i in 0 to 22 loop
                               for j in 0 to 9 loop
                                   if (i = curR1 and j = curC1) 
                                       or (i = curR2 and j = curC2)
                                       or (i = curR3 and j = curC3)
                                       or (i = curR4 and j = curC4) then
                                       myboard(i)(j) <= "010";
                                   end if;
                               end loop;
                            end loop;
                            
                        --right
                        elsif(btnR = '1') then
                        
                            --remove
                            for i in 0 to 22 loop
                              for j in 0 to 9 loop
                                  if (myboard(i)(j)) = "010" then
                                      myboard(i)(j) <= "000";
                                  else
                                      myboard(i)(j) <= myboard(i)(j);
                                  end if;
                              end loop;
                            end loop;
                        
                            if (curC1+1 <= 9) and (curC2+1 <= 9)
                                and (curC3+1 <= 9) and (curC4+1 <= 9)
                                and ((myboard(curR1)(curC1+1)) /= "001")
                                and ((myboard(curR2)(curC2+1)) /= "001")
                                and ((myboard(curR3)(curC3+1)) /= "001")
                                and ((myboard(curR4)(curC4+1)) /= "001") then
                                curC1 := curC1 + 1;
                                curC2 := curC2 + 1;
                                curC3 := curC3 + 1;
                                curC4 := curC4 + 1;
                            end if;
                        
                            --fill
                            for i in 0 to 22 loop
                              for j in 0 to 9 loop
                                  if (i = curR1 and j = curC1) 
                                      or (i = curR2 and j = curC2)
                                      or (i = curR3 and j = curC3)
                                      or (i = curR4 and j = curC4) then
                                      myboard(i)(j) <= "010";
                                  end if;
                              end loop;
                            end loop;
                        --Down
                        elsif(btnD = '1') then
                            --remove
                            for i in 0 to 22 loop
                                for j in 0 to 9 loop
                                    if (myboard(i)(j)) = "010" then
                                        myboard(i)(j) <= "000";
                                    else
                                        myboard(i)(j) <= myboard(i)(j);
                                    end if;
                                end loop;
                            end loop;
                        
                            if (curR1+1 <= 22) and (curR2+1 <= 22)
                                and (curR3+1 <= 22) and (curR4+1 <= 22)
                                and ((myboard(curR1+1)(curC1)) /= "001")
                                and ((myboard(curR2+1)(curC2)) /= "001")
                                and ((myboard(curR3+1)(curC3)) /= "001")
                                and ((myboard(curR4+1)(curC4)) /= "001") then
                                 curR1 := curR1 + 1;
                                 curR2 := curR2 + 1;
                                 curR3 := curR3 + 1;
                                 curR4 := curR4 + 1;
                            end if;
                        
                            --fill
                            for i in 0 to 22 loop
                             for j in 0 to 9 loop
                                 if (i = curR1 and j = curC1) 
                                     or (i = curR2 and j = curC2)
                                     or (i = curR3 and j = curC3)
                                     or (i = curR4 and j = curC4) then
                                     myboard(i)(j) <= "010";
                                 end if;
                             end loop;
                            end loop;
--                        elsif(btnU = '1') then
--                            --remove
--                            for i in 0 to 22 loop
--                                for j in 0 to 9 loop
--                                    if (myboard(i)(j)) = "010" then
--                                        myboard(i)(j) <= "000";
--                                    else
--                                        myboard(i)(j) <= myboard(i)(j);
--                                    end if;
--                                end loop;
--                            end loop;
                            
--                            if(blocks = "001") then
--                                --vertical
--                                if(curR1 < curR2) then
--                                    if(curC1 - 3 >= 0 and (myboard(curR1+3)(curC1-3)) /= "001"
--                                        and (myboard(curR2+2)(curC2-2)) /= "001"
--                                        and (myboard(curR3+1)(curC3-1)) /= "001") then
--                                        curR1 := curR1+3;
--                                        curC1 := curC1-3;
--                                        curR2 := curR2+2;
--                                        curC2 := curC2-2;
--                                        curR3 := curR3+1;
--                                        curC3 := curC3-1;
--                                        curR4 := curR4;
--                                        curC4 := curC4;
--                                    end if;
--                                --horizontal
--                                else
--                                    if(curR1 - 3 >= 0 and (myboard(curR1-3)(curC1+3)) /= "001"
--                                        and (myboard(curR2-2)(curC2+2)) /= "001"
--                                        and (myboard(curR3-1)(curC3+1)) /= "001") then
--                                        curR1 := curR1-3;
--                                        curC1 := curC1+3;
--                                        curR2 := curR2-2;
--                                        curC2 := curC2+2;
--                                        curR3 := curR3-1;
--                                        curC3 := curC3+1;
--                                        curR4 := curR4;
--                                        curC4 := curC4;
--                                    end if;
--                                end if;
--                            elsif(blocks = "010") then
--                                --0 degree
--                                if(curR1 < curR2) then
--                                    if(curC4-1 >= 0 and curR4+1 <= 22
--                                        and (myboard(curR1+2)(curC1-2)) /= "001"
--                                        and (myboard(curR4+1)(curC4+1)) /= "001") then
--                                        curR1 := curR1+2;
--                                        curC1 := curC1-2;
--                                        curR2 := curR4;
--                                        curC2 := curC4;
--                                        curR3 := curR3;
--                                        curC3 := curC3;
--                                        curR4 := curR4+1;
--                                        curC4 := curC4+1;
--                                    end if;
--                                --90 degree
--                                elsif(curR3 < curR4) then
--                                    if(curR3+2 <= 22 and curC4+1 <= 9
--                                        and (myboard(curR1+2)(curC1+2)) /= "001"
--                                        and (myboard(curR2+1)(curC2+1)) /= "001"
--                                        and (myboard(curR4-1)(curC4+1)) /= "001") then
--                                        curR1 := curR1+2;
--                                        curC1 := curC1+2;
--                                        curR2 := curR2+1;
--                                        curC2 := curC2+1;
--                                        curR3 := curR3;
--                                        curC3 := curC3;
--                                        curR4 := curR4-1;
--                                        curC4 := curC4+1;
--                                     end if;
--                                --270 degree
--                                elsif(curC3 < curC4) then
--                                    if(curC1+2 <= 22 and curR4-1 >= 0
--                                        and (myboard(curR1-2)(curC1+2)) /= "001"
--                                        and (myboard(curR2-1)(curC2+1)) /= "001"
--                                        and (myboard(curR4-1)(curC4-1)) /= "001") then
--                                        curR1 := curR1-2;
--                                        curC1 := curC1+2;
--                                        curR2 := curR2-1;
--                                        curC2 := curC2+1;
--                                        curR3 := curR3;
--                                        curC3 := curC3;
--                                        curR4 := curR4-1;
--                                        curC4 := curC4-1;
--                                     end if;
--                                else
--                                    if(curR1-2 >= 0 and curC4-1 >= 0
--                                        and (myboard(curR1-2)(curC1-2)) /= "001"
--                                        and (myboard(curR2-1)(curC2-1)) /= "001"
--                                        and (myboard(curR4+1)(curC4-1)) /= "001") then
--                                        curR1 := curR1-2;
--                                        curC1 := curC1-2;
--                                        curR2 := curR2-1;
--                                        curC2 := curC2-1;
--                                        curR3 := curR3;
--                                        curC3 := curC3;
--                                        curR4 := curR4+1;
--                                        curC4 := curC4-1;
--                                    end if;    
                                    
--                                end if;
--                            elsif(blocks = "011") then
--                                if(curR1 < curR2) then
--                                    if(curC1-2 >= 0 and curR4-1 >= 0
--                                        and (myboard(curR1+2)(curC1-2)) /= "001"
--                                        and (myboard(curR2+1)(curC2-1)) /= "001"
--                                        and (myboard(curR4-1)(curC4-1)) /= "001") then
--                                        curR1 := curR1+2;
--                                        curC1 := curC1-2;
--                                        curR2 := curR2+1;
--                                        curC2 := curC2-1;
--                                        curR3 := curR3;
--                                        curC3 := curC3;
--                                        curR4 := curR4-1;
--                                        curC4 := curC4-1;
--                                    end if;
--                                elsif(curR4 < curR3) then
--                                    if(curR1+2 <= 22 and curC4-1 >= 0
--                                        and (myboard(curR1+2)(curC1+2)) /= "001"
--                                        and (myboard(curR2+1)(curC2+1)) /= "001"
--                                        and (myboard(curR4+1)(curC4-1)) /= "001") then
--                                        curR1 := curR1+2;
--                                        curC1 := curC1+2;
--                                        curR2 := curR2+1;
--                                        curC2 := curC2+1;
--                                        curR3 := curR3;
--                                        curC3 := curC3;
--                                        curR4 := curR4+1;
--                                        curC4 := curC4-1;
--                                    end if;
--                                elsif(curC4 < curC3) then
--                                    if(curC1+2 <= 9 and curR4+1 <= 22
--                                        and (myboard(curR1-2)(curC1+2)) /= "001"
--                                        and (myboard(curR2-1)(curC2+1)) /= "001"
--                                        and (myboard(curR4+1)(curC4+1)) /= "001") then
--                                        curR1 := curR1-2;
--                                        curC1 := curC1+2;
--                                        curR2 := curR2-1;
--                                        curC2 := curC2+1;
--                                        curR3 := curR3;
--                                        curC3 := curC3;
--                                        curR4 := curR4+1;
--                                        curC4 := curC4+1;
--                                    end if;
--                                else
--                                    if(curR1-2 >= 0 and curC4+1 <= 9
--                                        and (myboard(curR1-2)(curC1-2)) /= "001"
--                                        and (myboard(curR2-1)(curC2-1)) /= "001"
--                                        and (myboard(curR4-1)(curC4+1)) /= "001") then
--                                        curR1 := curR1-2;
--                                        curC1 := curC1-2;
--                                        curR2 := curR2-1;
--                                        curC2 := curC2-1;
--                                        curR3 := curR3;
--                                        curC3 := curC3;
--                                        curR4 := curR4-1;
--                                        curC4 := curC4+1;
--                                    end if;
--                                end if;
--                            elsif(blocks = "100") then
--                                if(curR1 < curR2) then
--                                    if(curC1-2 >= 0 and curR2-1 >= 0
--                                        and (myboard(curR1+1)(curC1-2)) /= "001"
--                                        and (myboard(curR2-1)(curC2-1)) /= "001") then
--                                        curR1 := curR1+1;
--                                        curC1 := curC1-2;
--                                        curR2 := curR2-1;
--                                        curC2 := curC2-1;
--                                        curR3 := curR3;
--                                        curC3 := curC3;
--                                        curR4 := curR4-1;
--                                        curC4 := curC4+1;
--                                    end if;
--                                else
--                                    if(curR4+1 >= 22
--                                        and (myboard(curR1)(curC1+2)) /= "001"
--                                        and (myboard(curR2+1)(curC1+1)) /= "001"
--                                        and (myboard(curR4+1)(curC4-1)) /= "001") then
--                                        curR1 := curR1;
--                                        curC1 := curC1+2;
--                                        curR2 := curR2+1;
--                                        curC2 := curC2+1;
--                                        curR3 := curR3;
--                                        curC3 := curC3;
--                                        curR4 := curR4+1;
--                                        curC4 := curC4-1;
--                                    end if;
--                                end if;
--                            elsif(blocks = "101") then
--                                if(curR1 < curR2) then
--                                    if(curC4+1 <= 22
--                                        and (myboard(curR1+2)(curC1)) /= "001"
--                                        and (myboard(curR2+1)(curC2+1)) /= "001"
--                                        and (myboard(curR4-1)(curC4+1)) /= "001") then
--                                        curR1 := curR1+2;
--                                        curC1 := curC1;
--                                        curR2 := curR2+1;
--                                        curC2 := curC2+1;
--                                        curR3 := curR3;
--                                        curC3 := curC3;
--                                        curR4 := curR4-1;
--                                        curC4 := curC4+1;
--                                    end if;
--                                else
--                                    if(curR1-2 >= 0
--                                        and (myboard(curR1-2)(curC1)) /= "001"
--                                        and (myboard(curR2-1)(curC2-1)) /= "001"
--                                        and (myboard(curR4+1)(curC4-1)) /= "001") then
--                                        curR1 := curR1-2;
--                                        curC1 := curC1+2;
--                                        curR2 := curR2-1;
--                                        curC2 := curC2-1;
--                                        curR3 := curR3;
--                                        curC3 := curC3;
--                                        curR4 := curR4+1;
--                                        curC4 := curC4-1;
--                                    end if;
--                                end if;
--                            elsif(blocks = "110") then
--                                if(curR1 < curR3) then
--                                    if(curR2+1 <= 22
--                                        and (myboard(curR2+1)(curC2+1)) /= "001") then
--                                        curR1 := curR1+1;
--                                        curC1 := curC1-1;
--                                        curR2 := curR2+1;
--                                        curC2 := curC2+1;
--                                        curR3 := curR3;
--                                        curC3 := curC3;
--                                        curR4 := curR4-1;
--                                        curC4 := curC4-1;
--                                    end if;
--                                elsif(curR4 < curR3) then
--                                    if(curC2+1 <= 9
--                                        and (myboard(curR2-1)(curC2+1)) /= "001") then
--                                        curR1 := curR1+1;
--                                        curC1 := curC1+1;
--                                        curR2 := curR2-1;
--                                        curC2 := curC2+1;
--                                        curR3 := curR3;
--                                        curC3 := curC3;
--                                        curR4 := curR4+1;
--                                        curC4 := curC4-1;
--                                    end if;
--                                elsif(curR3 < curR1) then
--                                    if(curR2-1 >= 0
--                                        and (myboard(curR2-1)(curC2-1)) /= "001") then
--                                        curR1 := curR1-1;
--                                        curC1 := curC1+1;
--                                        curR2 := curR2-1;
--                                        curC2 := curC2-1;
--                                        curR3 := curR3;
--                                        curC3 := curC3;
--                                        curR4 := curR4+1;
--                                        curC4 := curC4+1;
--                                    end if;
--                                else
--                                    if(curC2-1 >= 0
--                                        and (myboard(curR2+1)(curC2-1)) /= "001") then
--                                        curR1 := curR1-1;
--                                        curC1 := curC1-1;
--                                        curR2 := curR2+1;
--                                        curC2 := curC2-1;
--                                        curR3 := curR3;
--                                        curC3 := curC3;
--                                        curR4 := curR4-1;
--                                        curC4 := curC4+1;
--                                    end if;
--                                end if;
--                            end if;
                        
--                            --fill
--                            for i in 0 to 22 loop
--                             for j in 0 to 9 loop
--                                 if (i = curR1 and j = curC1) 
--                                     or (i = curR2 and j = curC2)
--                                     or (i = curR3 and j = curC3)
--                                     or (i = curR4 and j = curC4) then
--                                     myboard(i)(j) <= "010";
--                                 end if;
--                             end loop;
--                            end loop;
                        
                        end if;
                        clk10Hz <= '0'; 
                    end if;
                end if;
           end if;
     
        
        --game_state = '0'
        elsif(game_state = '0') then
                --#MARIO1
                for i in 0 to 22 loop
                    for j in 0 to 9 loop
                        if (i=22 and j=0) or (i=22 and j=1)
                            or (i=22 and j=2) or (i=22 and j=7) 
                            or (i=22 and j=8) or (i=22 and j=9)
                            or (i=21 and j=1) or (i=21 and j=2)
                            or (i=21 and j=7) or (i=21 and j=8)
                            or (i=12 and j=1) or (i=12 and j=2)
                            or (i=11 and j=1) or (i=11 and j=3)
                            or (i=11 and j=4) or (i=10 and j=1)
                            or (i=10 and j=3) or (i=9  and j=2)
                            or (i=9  and j=3) or (i=9  and j=4) then
                                --Brown
                                myboard(i)(j) <= "011";
                        elsif (i=20 and j=2) or (i=20 and j=3)
                            or (i=20 and j=6) or (i=20 and j=7)
                            or (i=19 and j=2) or (i=19 and j=3)
                            or (i=19 and j=4) or (i=19 and j=5)
                            or (i=19 and j=6) or (i=19 and j=7)
                            or (i=18 and j=2) or (i=18 and j=3)
                            or (i=18 and j=4) or (i=18 and j=5)
                            or (i=18 and j=6) or (i=18 and j=7)
                            or (i=17 and j=2) or (i=17 and j=4)
                            or (i=17 and j=5) or (i=17 and j=7)
                            or (i=16 and j=2) or (i=16 and j=3)
                            or (i=16 and j=4) or (i=16 and j=5)
                            or (i=16 and j=6) or (i=16 and j=7)
                            or (i=15 and j=3) or (i=15 and j=6)
                            or (i=15 and j=7) or (i=14 and j=3) then
                                --Blue
                                myboard(i)(j) <= "101";
                        elsif (i=17 and j=3) or (i=17 and j=6) then
                                --Yellow
                                myboard(i)(j) <= "100";
                        elsif (i=18 and j=0) or (i=18 and j=1)
                            or (i=18 and j=8) or (i=18 and j=9)
                            or (i=17 and j=0) or (i=17 and j=1)
                            or (i=17 and j=8) or (i=17 and j=9)
                            or (i=13 and j=3) or (i=13 and j=4)
                            or (i=13 and j=5) or (i=13 and j=6)
                            or (i=13 and j=7) or (i=13 and j=8)
                            or (i=12 and j=3) or (i=12 and j=4)
                            or (i=12 and j=5) or (i=11 and j=2)
                            or (i=11 and j=5) or (i=11 and j=6)
                            or (i=11 and j=8) or (i=11 and j=9)
                            or (i=10 and j=2) or (i=10 and j=4)
                            or (i=10 and j=5) or (i=10 and j=7)
                            or (i=10 and j=8) or (i=9 and j=5)
                            or (i=9 and j=7) then
                                --skin
                                myboard(i)(j) <= "110";
                        elsif (i=16 and j=0) or (i=16 and j=1)
                            or (i=16 and j=8) or (i=16 and j=9)
                            or (i=15 and j=1) or (i=15 and j=2)
                            or (i=15 and j=4) or (i=15 and j=5)
                            or (i=15 and j=8) or (i=14 and j=2)
                            or (i=14 and j=4) or (i=14 and j=5)
                            or (i=14 and j=6) or (i=8 and j=2)
                            or (i=8 and j=3) or (i=8 and j=4)
                            or (i=8 and j=5) or (i=8 and j=6)
                            or (i=8 and j=7) or (i=8 and j=8)
                            or (i=8 and j=9) or (i=7 and j=3)
                            or (i=7 and j=4) or (i=7 and j=5)
                            or (i=7 and j=6) then
                                --red
                                myboard(i)(j) <= "010";
                        elsif (i=12 and j=6) or (i=12 and j=7)
                            or (i=12 and j=8) or (i=11 and j=7)
                            or (i=10 and j=6) or (i=9 and j=6) then
                                --black
                                myboard(i)(j) <= "000";
                        else
                                --grey
                                myboard(i)(j) <= "001";
                        end if;
                    end loop;
                end loop;
            
            if(key = "0001") then
                        --#MARIOSHORT
                    for i in 0 to 22 loop
                        for j in 0 to 9 loop
                            if (i=22 and j=0) or (i=22 and j=1)
                                or (i=22 and j=2) or (i=22 and j=7)
                                or (i=22 and j=8) or (i=22 and j=9)
                                or (i=21 and j=1) or (i=21 and j=2)
                                or (i=21 and j=7) or (i=21 and j=8)
                                or (i=13 and j=1) or (i=13 and j=2)
                                or (i=12 and j=1) or (i=12 and j=3)
                                or (i=12 and j=4) or (i=11 and j=1)
                                or (i=11 and j=3) or (i=10 and j=2)
                                or (i=10 and j=3) or (i=10 and j=4) then
                                    --Brown
                                    myboard(i)(j) <= "011";
                            elsif (i=20 and j=2) or (i=20 and j=3)
                                or (i=20 and j=6) or (i=20 and j=7)
                                or (i=19 and j=2) or (i=19 and j=3)
                                or (i=19 and j=4) or (i=19 and j=5)
                                or (i=19 and j=6) or (i=19 and j=7)
                                or (i=18 and j=2) or (i=18 and j=4)
                                or (i=18 and j=5) or (i=18 and j=7)
                                or (i=17 and j=2) or (i=17 and j=3)
                                or (i=17 and j=4) or (i=17 and j=5)
                      or (i=17 and j=6) or (i=17 and j=7)
                      or (i=16 and j=3) or (i=16 and j=6)
                      or (i=15 and j=3) then
                                    --Blue
                                    myboard(i)(j) <= "101";
                            elsif (i=18 and j=3) or (i=18 and j=6) then
                                    --Yellow
                                    myboard(i)(j) <= "100";
                            elsif (i=19 and j=0) or (i=19 and j=1)
                                or (i=19 and j=8) or (i=19 and j=9)
                                or (i=18 and j=0) or (i=18 and j=1)
                                or (i=18 and j=8) or (i=18 and j=9)
                                or (i=14 and j=3) or (i=14 and j=4)
                                or (i=14 and j=5) or (i=14 and j=6)
                                or (i=14 and j=7) or (i=14 and j=8)
                                or (i=13 and j=3) or (i=13 and j=4)
                                or (i=13 and j=5) or (i=12 and j=2)
                                or (i=12 and j=5) or (i=12 and j=6)
                                or (i=12 and j=8) or (i=12 and j=9)
                                or (i=11 and j=2) or (i=11 and j=4)
                                or (i=11 and j=5) or (i=11 and j=7)
                      or (i=11 and j=8) or (i=10 and j=5)
                                or (i=10 and j=7) then
                                    --skin
                                    myboard(i)(j) <= "110";
                            elsif (i=17 and j=0) or (i=17 and j=1)
                                or (i=17 and j=8) or (i=17 and j=9)
                                or (i=16 and j=1) or (i=16 and j=2)
                                or (i=16 and j=4) or (i=16 and j=5)
                                or (i=16 and j=7) or (i=16 and j=8)
                                or (i=15 and j=2) or (i=15 and j=4)
                                or (i=15 and j=5) or (i=15 and j=6)
                                or (i=9 and j=2) or (i=9 and j=3)
                                or (i=9 and j=4) or (i=9 and j=5)
                                or (i=9 and j=6) or (i=9 and j=7)
                                or (i=9 and j=8) or (i=9 and j=9)
                      or (i=9 and j=4) or (i=9 and j=5)
                                or (i=8 and j=3) or (i=8 and j=4)
                                or (i=8 and j=5) or (i=8 and j=6) then
                                    --red
                                    myboard(i)(j) <= "010";
                            elsif (i=13 and j=6) or (i=13 and j=7)
                                or (i=13 and j=8) or (i=12 and j=7)
                                or (i=11 and j=6) or (i=11 and j=6)
                      or (i=10 and j=6) then
                                    --black
                                    myboard(i)(j) <= "000";
                            else
                                    --grey
                                    myboard(i)(j) <= "001";
                            end if;
                        end loop;
                    end loop;

            end if;
            
            if(key = "0010") then
                                --#MARIOJUMP
                            for i in 0 to 22 loop
                                for j in 0 to 9 loop
                                    if (i=20 and j=0) or (i=19 and j=0)
                                        or (i=19 and j=1) or (i=19 and j=8)
                                        or (i=19 and j=9) or (i=18 and j=0)
                                        or (i=18 and j=1) or (i=18 and j=8)
                                        or (i=18 and j=9) or (i=17 and j=9)
                                        or (i=10 and j=1) or (i=10 and j=2)
                                        or (i=9 and j=1) or (i=9 and j=3)
                                        or (i=9 and j=4) or (i=8 and j=1)
                                        or (i=8 and j=3) or (i=7 and j=2)
                                        or (i=7 and j=3) or (i=7 and j=4) then
                                            --Brown
                                            myboard(i)(j) <= "011";
                                    elsif (i=19 and j=2) or (i=19 and j=3)
                                        or (i=19 and j=6) or (i=19 and j=7)
                                        or (i=18 and j=2) or (i=18 and j=3)
                                        or (i=18 and j=4) or (i=18 and j=5)
                                        or (i=18 and j=6) or (i=18 and j=7)
                                        or (i=17 and j=2) or (i=17 and j=3)
                                        or (i=17 and j=4) or (i=17 and j=5)
                                        or (i=17 and j=6) or (i=17 and j=7)
                                        or (i=16 and j=2) or (i=16 and j=3)
                                        or (i=16 and j=5) or (i=16 and j=5)
                                        or (i=16 and j=6) or (i=15 and j=2)
                                        or (i=15 and j=3) or (i=15 and j=4)
                                        or (i=15 and j=5) or (i=15 and j=6)
                                        or (i=15 and j=7) or (i=14 and j=2)
                                        or (i=14 and j=3) or (i=14 and j=4)
                                        or (i=14 and j=5) or (i=14 and j=6)
                                        or (i=14 and j=7) or (i=13 and j=4)
                                        or (i=13 and j=7) or (i=12 and j=3)
                                        or (i=12 and j=6) then
                                            --Blue
                                            myboard(i)(j) <= "101";
                                    elsif (i=16 and j=4) or (i=16 and j=7) then
                                            --Yellow
                                            myboard(i)(j) <= "100";
                                    elsif (i=16 and j=0) or (i=16 and j=1)
                                        or (i=15 and j=0) or (i=15 and j=1)
                                        or (i=11 and j=3) or (i=11 and j=4)
                                        or (i=11 and j=5) or (i=11 and j=6)
                                        or (i=11 and j=7) or (i=11 and j=8)
                                        or (i=10 and j=3) or (i=10 and j=4)
                                        or (i=10 and j=5) or (i=9 and j=2)
                                        or (i=9 and j=5) or (i=9 and j=6)
                                        or (i=9 and j=8) or (i=9 and j=9)
                                        or (i=8 and j=2) or (i=8 and j=4)
                                        or (i=8 and j=5) or (i=8 and j=7)
                                        or (i=8 and j=8) or (i=7 and j=5)
                                        or (i=7 and j=7) or (i=6 and j=9)
                                        or (i=5 and j=8) or (i=5 and j=9) then
                                            --skin
                                            myboard(i)(j) <= "110";
                                    elsif (i=14 and j=0) or (i=14 and j=1)
                                        or (i=13 and j=0) or (i=13 and j=1)
                                        or (i=13 and j=2) or (i=13 and j=3)
                                        or (i=13 and j=5) or (i=13 and j=6)
                                        or (i=13 and j=8) or (i=12 and j=1)
                                        or (i=12 and j=2) or (i=12 and j=4)
                                        or (i=12 and j=5) or (i=12 and j=7)
                                        or (i=12 and j=8) or (i=12 and j=9)
                                        or (i=11 and j=9) or (i=11 and j=9)
                                        or (i=10 and j=9) or (i=8 and j=9)
                                        or (i=7 and j=8) or (i=7 and j=9)
                                        or (i=6 and j=2) or (i=6 and j=2)
                                        or (i=6 and j=3) or (i=7 and j=4)
                                        or (i=6 and j=5) or (i=6 and j=6)
                                        or (i=6 and j=7) or (i=6 and j=8)
                                        or (i=5 and j=3) or (i=5 and j=4)
                                        or (i=5 and j=5) or (i=5 and j=6) then
                                            --red
                                            myboard(i)(j) <= "010";
                                    elsif (i=10 and j=6) or (i=10 and j=7)
                                        or (i=10 and j=8) or (i=9 and j=7)
                                        or (i=8 and j=6) or (i=7 and j=6) then
                                            --black
                                            myboard(i)(j) <= "000";
                                    else
                                            --grey
                                            myboard(i)(j) <= "001";
                                    end if;
                                end loop;
                            end loop;

            end if;
        
            --reset the board when pressing 0 in keypad
            if(btnC = '1') then
                for i in 0 to 22 loop
                    for j in 0 to 9 loop
                        myboard(i)(j) <= "000";
                    end loop;
                end loop;
                game_state <= '1';
            else
                game_state <= '0';
            end if;
            
        end if;   
    end if;
end process;

end Behavioral;


