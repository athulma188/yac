int x = 1;
int f (int a, int b)
{
  int x;
  if (a % 2 == 0)
      x = a;
    else
      x = a+1;
  
  int i = 0;
  int sum = 0;
  while (i < x)
    {
      sum = sum + b;
      i = i + 1;
    }
  
  return sum;
}
