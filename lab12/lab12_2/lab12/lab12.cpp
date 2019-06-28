#include "stdafx.h"

extern "C" void MACRO_MAIN();
extern "C" int sum(int x, int y);

int _tmain(int argc, _TCHAR* argv[]) {
	MACRO_MAIN();
	int res = sum(2, 3);
}
