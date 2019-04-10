library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity vga_test is
    port(
        clk100MHz      : in  std_logic;
        hsync,vsync    : out std_logic;
        red,green,blue : out std_logic_vector(3 downto 0)
    );
end vga_test;

architecture vga_test_arch of vga_test is

-- row constants
constant H_TOTAL: integer:=800-1;
constant H_SYNC: integer:=96-1;
constant H_BACK: integer:=48-1;
constant H_START: integer:=96+48-1;
constant H_ACTIVE: integer:=640-1;
constant H_END: integer:=800-16-1;
constant H_FRONT: integer:=16-1;

-- column constants
constant V_TOTAL: integer:=524-1;
constant V_SYNC: integer:=2-1;
constant V_BACK: integer:=31-1;
constant V_START: integer:=2+31-1;
constant V_ACTIVE: integer:=480-1;
constant V_END: integer:=524-11-1;
constant V_FRONT: integer:=11-1;

signal clk50MHz, clk25MHz: std_logic;
signal hcount, vcount: std_logic_vector(11 downto 0);

begin

-- generate 50MHz clock
vga_clk_gen_proc1: process(clk100MHz)
begin
    if( rising_edge(clk100MHz) ) then
        clk50MHz <= not clk50MHz;
    end if;
end process vga_clk_gen_proc1;

-- generate 25MHz clock
vga_clk_gen_proc2: process(clk50MHz)
begin
    if( rising_edge(clk50MHz) ) then
        clk25MHz <= not clk25MHz;
    end if;
end process vga_clk_gen_proc2;

-- horizontal counter
pixel_count_proc: process(clk25MHz)
begin
    if( rising_edge(clk25MHz) ) then
        if(hcount = H_TOTAL) then
            hcount <= (others => '0');
        else
            hcount <= hcount + 1;
        end if;
    end if;
end process pixel_count_proc;

-- generate hsync
hsync_gen_proc: process(hcount) begin
    if(hcount > H_SYNC) then
        hsync <= '1';
    else
        hsync <= '0';
    end if;
end process hsync_gen_proc;

-- vertical counter
line_count_proc: process(clk25MHz)
begin
    if( rising_edge(clk25MHz) ) then
        if(hcount = H_TOTAL) then
            if(vcount = V_TOTAL) then
                vcount <= (others => '0');
            else
                vcount <= vcount + 1;
            end if;
        end if;
    end if;
end process line_count_proc;

-- generate vsync
vsync_gen_proc: process(vcount)
begin
    if(vcount > V_SYNC) then
        vsync <= '1';
    else
        vsync <= '0';
    end if;
end process vsync_gen_proc;

-- generate RGB signals for 640x480 display area
data_output_proc: process(hcount, vcount)
begin
    if( (hcount>=H_START and hcount<H_END) and (vcount >= V_START and vcount<V_TOTAL) ) then
        if (hcount >= 220 + H_START and hcount < 420 + H_START) and (vcount >= 40 + V_START and vcount < 440 + V_START) then
            red   <= "1111";
            green <= "1111";
            blue  <= "1111";
        else
            red   <= "0000";
            green <= "0000";
            blue  <= "0000";
        end if;
    else
        red   <= "0000";
        green <= "0000";
        blue  <= "0000";
    end if;
end process data_output_proc;

end vga_test_arch;