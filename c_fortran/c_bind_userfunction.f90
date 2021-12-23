program user_define_function
  use iso_c_binding, only: C_CHAR, C_NULL_CHAR
  interface
    subroutine print_c(string) bind(C, name="print_C")
      use iso_c_binding, only: c_char
      character(kind=c_char) :: string(*)
    end subroutine print_c
  end interface
  
  call print_c(C_CHAR_"Hello World"//C_NULL_CHAR)
end program
