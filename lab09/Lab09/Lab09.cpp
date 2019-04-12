#include "stdafx.h"

extern "C" int p1(int n, int *g);
extern "C" int p2(int n, int *g);
int n = 6; int nf = 7;

int _tmain(int argc, _TCHAR* argv[])
{
	p1(n, &nf);
	p2(n, &nf);
	return 0;
}
