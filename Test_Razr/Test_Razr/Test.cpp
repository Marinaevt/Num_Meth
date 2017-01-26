#include <stdio.h>

typedef union
{
	int i;
	float f;
} U;

int main(void)
{
	U u;

	u.f = 10.0;
	float a = 12.34;
	//printf("%g = %#x\n", u.f, u.i);

	__asm {
		xor eax, eax
		mov eax, a
		sar eax, 2
		mov a, eax
	}
	printf("%g\n", a);
	return 0;
}