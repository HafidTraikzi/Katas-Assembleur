segment .data
      
      msg_green:     db "Passed", 10 
      size_green:     equ $ - msg_green
      msg_red:     db "Failed", 10 
      size_red:     equ $ - msg_red
      
      msg_fizz:     db "Fizz", 10 
      size_fizz:     equ $ - msg_fizz
      msg_buzz:     db "Buzz", 10 
      size_buzz:     equ $ - msg_buzz
      msg_fizzbuzz:     db "FizzBuzz", 10 
      size_fizzbuzz:     equ $ - msg_fizzbuzz
     
segment .text
	  global main
	  
	  assertEqual:
      sub rsp, 0
      mov rax, [rsp+8]
      mov rbx, [rsp+16]
    loop:
      cmp rax, rbx
      je found
      jne notfound
    found:
      mov rax, 4
      mov rbx, 1
      mov rcx, msg_green
      mov rdx, size_green
      int 80h
      jmp exit
    notfound:
      mov rax, 4
      mov rbx, 1
      mov rcx, msg_red
      mov rdx, size_red
      int 80h
      jmp exit
      
	  test_1_donne_1:
	    push number
	    push qword 1
	    call assertEqual
	    add rsp, 16
	    
	  test_2_donne_2:
	    push number
	    push qword 2
	    call assertEqual
	    add rsp, 16
	  
	  test_4_donne_4:
	    push number
	    push qword 4
	    call assertEqual
	    add rsp, 16
	    
	  number: 
	    mov rax, 0
	    cmp rax, rbx
	    jne increment
	  increment:
	    inc rax
	    jmp loop
    
    main :
      call test_1_donne_1
      call test_2_donne_2
      call test_4_donne_4
      
	  exit:
	    add rsp, 0
	    ret
	    mov rax, 1
	    mov rbx, 0
      int 80h
	 
	  
  
