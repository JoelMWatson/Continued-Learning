#include <stdio.h>
#include <stdlib.h>
#include <dlfcn.h>

int main()
{
  void *handle = NULL;
  char *error = NULL;
  void (*fun)() = NULL;

  handle = dlopen("/cygdrive/c/Users/Joel/Projects/Continued-Learning/Advanced-C-Programming-Course/Libraries/dynamic_lib/lib_mylib.dll", RTLD_LAZY);

  if (!handle)
  {
    fputs(dlerror(), stderr);
    exit(1);
  }

  fun = dlsym(handle, "fun");

  if ((error = dlerror()) != NULL)
  {
    fputs(error, stderr);
    exit(1);
  }

  fun();

  dlclose(handle);
  getchar();
  return 0;
}