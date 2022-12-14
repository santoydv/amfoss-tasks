#include <math.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <assert.h>
#include <limits.h>
#include <stdbool.h>

long maxPrimeFactors(long n)
{
    long maxPrime = -1;

    
    while (n % 2 == 0) {
        maxPrime = 2;
        n >>= 1; 
    }

    for (int i = 3; i <= sqrt(n); i += 2) {
        while (n % i == 0) {
            maxPrime = i;
            n = n / i;
        }
    }

    if (n > 2)
        maxPrime = n;

    return maxPrime;
}

int main(){
    int t; 
    scanf("%d",&t);
    for(int a0 = 0; a0 < t; a0++){
        long n; 
        scanf("%ld",&n);
        printf("%ld\n", maxPrimeFactors(n));
        
       }
       
    return 0;
    }
