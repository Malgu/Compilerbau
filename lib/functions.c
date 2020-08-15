#include <stdio.h>
#include <stdlib.h>
#include <math.h>

int next_fib(int input)
{
	int fib1 = 0;
	int fib2 = 1;
	int fib_final = 0;
	while(fib_final < input)
	{
		fib_final = fib1+fib2;
		fib1 = fib2;
		fib2 = fib_final;
	}
	printf("Next fibonacci number to %i is: %i\n", input, fib_final);
	return fib_final;
}

int g_div(int input)
{
	int counter = 1;
	int divisor = 1;
	int gd_num = input;
	while(counter < gd_num)
	{
		if(gd_num%counter == 0)
			divisor = counter;
		counter++;
	}
	if(divisor ==1)
		divisor = gd_num;

	printf("Greatest divisor of %i is: %i\n", gd_num, divisor);
	return divisor;
}

int g_com_div(int input_1, int input_2)
{
	int small_num = 0;
	int big_num = 0;

	if(input_1 < input_2)
	{
		small_num = input_1;
		big_num = input_2;
	}
	else
	{
		small_num = input_2;
		big_num = input_1;
	}
	int divisor = small_num;

	while(divisor > 1 && (big_num % divisor != 0 || small_num % divisor != 0))
		divisor--;
	printf("\nGreatest Common Divisor of %i and %i: %i\n", input_1, input_2, divisor);
	return divisor;		
}

int l_com_mult(int input_1, int input_2)
{
	int small_num = 0;
	int big_num = 0;

	if(input_1 < input_2)
	{
		small_num = input_1;
		big_num = input_2;
	}
	else
	{
		small_num = input_2;
		big_num = input_1;
	}

	int num1 = small_num;
	int num2 = big_num;	
	while(num1 != num2)
	{
		while(num1 < num2)
			num1 += small_num;

		if(num2 < num1)
			num2 += big_num;
	}
	printf("\nLeast Common Multiple of %i and %i: %i", input_1, input_2, num1); 
	return num1;
}