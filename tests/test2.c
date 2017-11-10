int fac(int n)
{
  if (n == 1)
  {
    int out = 1;
    return out;
  }
  else
  {
    int out;
    int parm = n -1;
    out = fac(parm);
    out = n * out;
    return out;
  }
}
