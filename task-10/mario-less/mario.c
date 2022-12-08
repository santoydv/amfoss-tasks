#include <cs50.h>
#include <stdio.h>

int main(void)
{
   int height;

     do
     {
        printf("height: ");
        scanf("%d",&height);
    }
    while(height > 8 || height < 1);

    for(int i = 0; i < height; i++)      // no of times loop runs
     {
        for (int j = height - i - 1; j > 0; j--) //to print SPACE
        {
            printf(" ");
        }
        for (int k = 0; k < i + 1; k++) //to print hashes(#)
        {
            printf("#");
        }
        printf("\n");

    }
}