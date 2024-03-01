Dump of assembler code for function encrypt_file:
   0x00000000004018a5 <+0>:	endbr64
   0x00000000004018a9 <+4>:	push   %rbp
   0x00000000004018aa <+5>:	mov    %rsp,%rbp
   0x00000000004018ad <+8>:	mov    %rdi,-0x18(%rbp)            # address to file content
   0x00000000004018b1 <+12>:	mov    %esi,-0x1c(%rbp)          # file size
   0x00000000004018b4 <+15>:	mov    %rdx,-0x28(%rbp)          # address of output
   0x00000000004018b8 <+19>:	movb   $0x0,-0x9(%rbp)           # will get the file character to encrypt
   0x00000000004018bc <+23>:	mov    -0x1c(%rbp),%eax
   0x00000000004018bf <+26>:	sub    $0x1,%eax
   0x00000000004018c2 <+29>:	mov    %eax,-0x8(%rbp)           # loop index file size - 1 -> 0
   0x00000000004018c5 <+32>:	movl   $0x0,-0x4(%rbp)           # loop index 0 -> file size - 1
   0x00000000004018cc <+39>:	jmp    0x40192f <encrypt_file+138>

while ($rbp - 0x8) < ($rbp - 0x1c = file_size):
     0x00000000004018ce <+41>:	mov    -0x4(%rbp),%eax         |
     0x00000000004018d1 <+44>:	movslq %eax,%rdx               |
     0x00000000004018d4 <+47>:	mov    -0x18(%rbp),%rax        |- load ith file character in %eax
     0x00000000004018d8 <+51>:	add    %rdx,%rax               |
     0x00000000004018db <+54>:	movzbl (%rax),%eax             |
     0x00000000004018de <+57>:	mov    %al,-0x9(%rbp)
     0x00000000004018e1 <+60>:	cmpb   $0x7e,-0x9(%rbp)
     0x00000000004018e5 <+64>:	ja     0x4018fc <encrypt_file+87>   # jump if char > 0x7e

       # char <= 0x7f
       0x00000000004018e7 <+66>:	mov    -0x8(%rbp),%edx
       0x00000000004018ea <+69>:	mov    -0x28(%rbp),%rax
       0x00000000004018ee <+73>:	add    %rdx,%rax               # $rax = address of (size - i)th characther of output
       0x00000000004018f1 <+76>:	movzbl -0x9(%rbp),%edx         # get file ith character
       0x00000000004018f5 <+80>:	sub    $0x7f,%edx              # $edx -= 0x7f
       0x00000000004018f8 <+83>:	mov    %dl,(%rax)              # store lowest part of byte at address described above
       0x00000000004018fa <+85>:	jmp    0x401927 <encrypt_file+130>

     0x00000000004018fc <+87>:	cmpb   $0x80,-0x9(%rbp)
     0x0000000000401900 <+91>:	jbe    0x401917 <encrypt_file+114>   # jump if 0x80 <= char

       # char > 0x80
       0x0000000000401902 <+93>:	mov    -0x8(%rbp),%edx
       0x0000000000401905 <+96>:	mov    -0x28(%rbp),%rax
       0x0000000000401909 <+100>:	add    %rdx,%rax
       0x000000000040190c <+103>:	movzbl -0x9(%rbp),%edx
       0x0000000000401910 <+107>:	add    $0x7f,%edx
       0x0000000000401913 <+110>:	mov    %dl,(%rax)              # same as above, but with $edx += 0x7f
       0x0000000000401915 <+112>:	jmp    0x401927 <encrypt_file+130>

     # char == 0x80
     0x0000000000401917 <+114>:	mov    -0x8(%rbp),%edx
     0x000000000040191a <+117>:	mov    -0x28(%rbp),%rax
     0x000000000040191e <+121>:	add    %rax,%rdx
     0x0000000000401921 <+124>:	movzbl -0x9(%rbp),%eax
     0x0000000000401925 <+128>:	mov    %al,(%rdx)

     # Complete loop
     0x0000000000401927 <+130>:	addl   $0x1,-0x4(%rbp)
     0x000000000040192b <+134>:	subl   $0x1,-0x8(%rbp)
     0x000000000040192f <+138>:	mov    -0x4(%rbp),%eax
     0x0000000000401932 <+141>:	cmp    -0x1c(%rbp),%eax
     0x0000000000401935 <+144>:	jb     0x4018ce <encrypt_file+41>

   0x0000000000401937 <+146>:	nop
   0x0000000000401938 <+147>:	nop
   0x0000000000401939 <+148>:	pop    %rbp
   0x000000000040193a <+149>:	ret
End of assembler dump.
