use work.bv_arithmetic.all;
use work.dlx_types.all;

entity alu is 
	generic (prop_delay : Time := 15 ns);
	port(
		op1, op2: in dlx_word;
		operation: in alu_operation_code;
		result: out dlx_word;
		error: out error_code
	);
end entity alu;

-- alue operation_code values
-- 0000 = unsigned add
-- 0001 = unsigned subtract
-- 0010 = two?s complement add
-- 0011 = two?s complement subtract
-- 0100 = two?s complement multiply
-- 0101 = two?s complement divide
-- 0111 = bitwise AND
-- 1001 = bitwise OR
-- 1011 = bitwise NOT of operand1 (ignore operand2)
-- 1100 = pass operand1 through to the output
-- 1101 = pass operand2 through to the output
-- 1110 = output all zero?s
-- 1111 = output all one?s

-- error code values
-- 0000 = no error
-- 0001 = overflow (either negative or positive)
-- 0010 = divide by zero

architecture behaviour1 of alu is

begin
	aluProcess : process (op1,op2,operation) is
	
	variable res: dlx_word;
	variable one: dlx_word := x"00000001";
	variable zero: dlx_word := x"00000000";
	variable isOverflowing: boolean;
	variable div_zero: boolean;
	variable op1bool: boolean;
	variable op2bool: boolean;
	variable err_val: error_code;

		
	begin
		res := x"00000000";
		err_val := "0000";
		if operation = "0000" then  -- unsiged add
			bv_addu(op1, op2, res, isOverflowing);
			if isOverflowing then
				err_val := "0001";
			end if;
		elsif operation = "0001" then -- unsiged sub
			bv_subu(op1, op2, res, isOverflowing);
			if isOverflowing then
				err_val := "0001";
			end if;
		elsif operation = "0010" then -- two's complement add
			bv_add(op1, op2, res, isOverflowing);
			if isOverflowing then
				err_val := "0001";
			end if;
		elsif operation = "0011" then -- two's complement sub
			bv_sub(op1, op2, res, isOverflowing);
			if isOverflowing then
				err_val := "0001";
			end if;
		elsif operation = "0100" then -- two's complement multiply
			bv_mult(op1, op2, res, isOverflowing);
			if isOverflowing then
				err_val := "0001"; -- overflow
			end if;
		elsif operation = "0101" then -- two's complement divide
			bv_div(op1, op2, res, div_zero, isOverflowing);
			if div_zero then
				err_val := "0010";
			elsif isOverflowing then
				err_val := "0001";
			end if;
		elsif operation = "0111" then -- bitwise AND
			for i in 31 downto 0 loop
				res(i) := op1(i) AND op2(i);
			end loop;
		elsif operation = "1001" then -- bitwise OR
			for i in 31 downto 0 loop
				res(i) := op1(i) OR op2(i);
			end loop;
		elsif operation = "1011" then -- bitwise NOT of op1 (ignore op2)
			for i in 31 downto 0 loop
				res(i) := NOT op1(i);
			end loop;
		elsif operation = "1100" then
			res := op1;
		elsif operation = "1101" then
			res := op2;
		elsif operation = "1110" then
			res := (others => '1');
		else -- default
			res := (others => '0');
			err_val := "0000";
		end if;
		-- set result, error
		result <= res after prop_delay;
		error <= err_val after prop_delay;
	end process aluProcess;
end architecture behaviour1;


