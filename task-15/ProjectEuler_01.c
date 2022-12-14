#include <stdio.h>

void add(int);
int main()
{
    int t;
    scanf("%d",&t);
    for(int i=0;i<t;i++)
    {
        add(t);
    }
    return 0;
}
void add(int t)
{
    int n, count=0;
        scanf("%d",&n);
        for(int j=1;j<n;j++)
        {
            if(j%3==0 || j%5==0)
            count += j;
            
        }
        printf("%d\n",count);
}
