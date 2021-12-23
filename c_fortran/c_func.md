Subroutines and functions have to have the **BIND(C) attribute** to be compatible with **C**.   
 C uses **call-by-value** by default while Fortran behaves usually similar to **call-by-reference**.    
 Furthermore, *strings and pointers are handled differently*.
    
To pass a variable by value, use the **VALUE** attribute.    
Thus, the following C prototype   
```
int func(int i, int *j)
```
matches the Fortran declaration   
```
integer(c_int) function func(i,j)
  use iso_c_binding, only: c_int
  integer(c_int), VALUE :: i      !call by value (default for C)
  integer(c_int) :: j             !call by reference (default for Fortran)
```
Note that pointer arguments also frequently need the VALUE attribute   
   
*Strings* are handled quite differently in C and Fortran.   
In C a string is a **NUL-terminated** array of characters.   
While in Fortran each string has a length associated with it and is thus not terminated.   
   
for example,
```
#include <stdio.h>
void print_C(char *string) /* equivalent: char string[]  */
{
   printf("%s\n", string);
}
```
   
to print “Hello World” from Fortran,   
you can call it using   
```
  use iso_c_binding, only: C_CHAR, C_NULL_CHAR
  interface
    subroutine print_c(string) bind(C, name="print_C")
      use iso_c_binding, only: c_char
      character(kind=c_char) :: string(*)
    end subroutine print_c
  end interface
  call print_c(C_CHAR_"Hello World"//C_NULL_CHAR)
```
   
   
The use of strings is now further illustrated using the C library function strncpy,   
whose prototype is   
```
 char *strncpy(char *restrict s1, const char *restrict s2, size_t n);
```
   
