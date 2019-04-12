#include "stdafx.h"
#include <cstdint>

uint8_t matrix[8][8] = {
	{1, 1, 1, 1, 1},
	{2, 2, 2, 2, 2},
	{3, 3, 3, 3, 3},
	{4, 4, 4, 4, 4},
	{5, 5, 5, 5, 5}
};

void print_matrix() {
	for (int i = 0; i < 5; ++i) {
		for (int j = 0; j < 5; ++j)
			printf("%3d ", matrix[i][j]);
		putchar('\n');
	}
	putchar('\n');
}


int _tmain(int argc, _TCHAR* argv[])
{
	print_matrix();

	_asm {
		mov  ebx, offset matrix
		mov  ecx, 4

		m1:
		mov  eax, ecx
		mov  edi, 8
		mov  esi, 1

		m2:
		xchg dh, [ebx][esi]
		xchg dh, [ebx][edi]
		xchg dh, [ebx][esi]

		add  edi, 8
		inc  esi
		loop m2

		add  ebx, 9
		mov  ecx, eax
		loop m1
	}

	print_matrix();

	for (int i = 0; i < 5; ++i)
		for (int j = i + 1; j < 5; ++j) {
			const uint8_t tmp = matrix[i][j];
			matrix[i][j] = matrix[j][i];
			matrix[j][i] = tmp;
		}

	print_matrix();


	return 0;
}
