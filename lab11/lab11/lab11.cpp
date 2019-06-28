#include "stdafx.h"

extern "C" int DlinaStroki(char *s);
extern "C" char *CopyStr(char *src, char *dst, int L);
extern "C" int DelProbel(char *s);

int _tmain(int argc, _TCHAR* argv[]) {
	char s1[16] = "1234567";
	char s2[16] = "\0";
	char *tempPtr;
	int len1;
	int len2;

	len1 = DlinaStroki(s1);
	len2 = DlinaStroki(s2);

	printf("Source : '%s' - %d\n", s1, len1);
	printf("Destination : '%s' - %d\n", s2, len2);

	tempPtr = CopyStr(s1, s2, len1);
	len2 = len1;

	len1 = DlinaStroki(s1);
	len2 = DlinaStroki(s2);

	printf("Source : '%s' - %d\n", s1, len1);
	printf("Destination : '%s' - %d\n", s2, len2);

	char s3[16] = "   a b c   ";
	printf("Before: '%s'\n", s3);

	int len3 = DelProbel(s3);
	printf("After: '%s' - %d\n", s3, len3);

	printf("\nFor exit, press Enter");
	getchar();
}
