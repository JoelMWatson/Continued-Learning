#include <stdio.h>
#include <stdlib.h>

long long tobinary(int dno);
signed int getNeg(int num);

int main()
{
    signed int num1, num2;
    printf("Please enter a number\n");
    scanf("%d", &num1);

    printf("Please enter a number\n");
    scanf("%d", &num2);

    printf("Number 1: %d = %d\n", num1, tobinary(num1));
    printf("Number 2: %d = %d\n", num2, tobinary(num2));

    // flip
    printf("~%d = %d\n", num1, tobinary(~num1));
    printf("~%d = %d\n", num2, tobinary(~num2));

    printf("%d & %d = %d\n", tobinary(num1), tobinary(num2), tobinary(num1 & num2));

    printf("%d | %d = %d\n", tobinary(num1), tobinary(num2), tobinary(num1 | num2));

    printf("%d ^ %d = %d\n", tobinary(num1), tobinary(num2), tobinary(num1 ^ num2));

    printf("%d >> 2 = %d\n", tobinary(num1), tobinary(num1 >> 2));
    printf("%d >> 2 = %d\n", tobinary(num2), tobinary(num2 >> 2));

    printf("%d << 2 = %d\n", tobinary(num1), tobinary(num1 << 2));
    printf("%d << 2 = %d\n", tobinary(num2), tobinary(num2 << 2));

    printf("\n\nEnter to close program...");
    getchar();
    return 0;
}

long long tobinary(int dno)
{
    long long bno = 0, rem, f = 1;
    while (dno != 0)
    {
        rem = dno % 2;
        bno = bno + rem * f;
        f = f * 10;
        dno = dno / 2;
    }
    return bno;
}