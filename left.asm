section .text
 global _start       ;must be declared for using gcc
_start:                     ;tell linker entry point

mov rax,8
mov rbx,msg
call LEFT


mov rbx,number
mov [rbx],rax
mov rdx,msg
call str64

 mov rdx, len-8    ;message length
 mov rcx, msg    ;message to write
 mov rbx, 1     ;file descriptor (stdout)
 mov rax, 4     ;system call number (sys_write)
 int 0x80        ;call kernel
 mov rax, 1     ;system call number (sys_exit)
 int 0x80        ;call kernel

str64:
          push rax                
          push rbx                
          push rcx                
          push rdx                
          push rdi                
          push rsi                
          push rbp                
          mov rsi,rbx
          mov rdi,rdx
          mov rax,[rsi]
          mov rbp, 1000000000000000000
          STR321:                
                    xor rdx,rdx
                    xor rcx,rcx
                    mov rbx,rbp
                    clc                 
                    div rbx                
                    mov rsi,rdx
                    mov ah,'0'
                    clc                
                    add al,ah
                    mov [rdi],al
                    inc rdi                
                    mov rax,rbp
                    xor rdx,rdx
                    xor rcx,rcx
                    mov rbx,10
                    clc                
                    div rbx                
                    mov rbp,rax
                    mov rax,rsi
                    cmp rbp,0
                    JNZ STR321

          pop rbp                
          pop rsi                
          pop rdi                
          pop rdx                
          pop rcx                
          pop rbx                
          pop rax                
ret

LEFT:                
          clc                
          add rax,rbx
          RET                
                
                
                
                    
                
                
                     

                
                
                

section .data

endf db " "

number dq 987654321,0
msg db 'THIS IS A STRING _________________________________',0xa,0,0 ;our dear string
len equ $ - msg ;length of our dear string



