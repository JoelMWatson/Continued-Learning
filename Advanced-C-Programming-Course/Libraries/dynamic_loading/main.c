#include <stdio.h>
#include <stdlib.h>
#include <dlfcn.h>

int main(void)
{
  void *handle = NULL;
  double (*cosine)(double) = NULL;
  char *error = NULL;

  handle = dlopen("/usr/bin/cygwin1.dll", RTLD_LAZY);

  if (!handle)
  {
    fputs(dlerror(), stderr);
    exit(1);
  }

  dlerror();

  cosine = dlsym(handle, "cos");

  printf("%f\n", (*cosine)(2.0));

  dlclose(handle);
  return 0;
}