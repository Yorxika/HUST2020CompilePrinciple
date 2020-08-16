int a,b,c;
int fibo(int a)
{
    if (a == 0 || a == 1) return 1;
    return fibo(a-1)+fibo(a-2);
}

int main()
{
    int m,n,i;
    int x[5];
    m = read();
    i = 0;
    while(i <= m)
    {
        n = fibo(i);
        if(i <= 5)
            x[i] = read();
        write(n);
        i++;
    }
    return 1;
}