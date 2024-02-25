   0x7ffff7fb7159 <DOCTOR_DASTARDLY_BUGGS_JOURNAL>:	endbr64
   0x7ffff7fb715d <DOCTOR_DASTARDLY_BUGGS_JOURNAL+4>:	push   %rbp
   0x7ffff7fb715e <DOCTOR_DASTARDLY_BUGGS_JOURNAL+5>:	mov    %rsp,%rbp
   0x7ffff7fb7161 <DOCTOR_DASTARDLY_BUGGS_JOURNAL+8>:	lea    0xe98(%rip),%rax        # 0x7ffff7fb8000
   0x7ffff7fb7168 <DOCTOR_DASTARDLY_BUGGS_JOURNAL+15>:	mov    %rax,-0x10(%rbp)
   0x7ffff7fb716c <DOCTOR_DASTARDLY_BUGGS_JOURNAL+19>:	lea    0x1085(%rip),%rax        # 0x7ffff7fb81f8
   0x7ffff7fb7173 <DOCTOR_DASTARDLY_BUGGS_JOURNAL+26>:	mov    %rax,-0x8(%rbp)
   0x7ffff7fb7177 <DOCTOR_DASTARDLY_BUGGS_JOURNAL+30>:	mov    $0x0,%eax
   0x7ffff7fb717c <DOCTOR_DASTARDLY_BUGGS_JOURNAL+35>:	pop    %rbp
   0x7ffff7fb717d <DOCTOR_DASTARDLY_BUGGS_JOURNAL+36>:	ret

# Takes %edi as argument and sets eax to the opposite case: e.g. A <-> a
   0x7ffff7fb717e <switch_char_case>:	endbr64
   0x7ffff7fb7182 <switch_char_case+4>:	push   %rbp
   0x7ffff7fb7183 <switch_char_case+5>:	mov    %rsp,%rbp
   0x7ffff7fb7186 <switch_char_case+8>:	mov    %edi,%eax
   0x7ffff7fb7188 <switch_char_case+10>:	mov    %al,-0x4(%rbp)
   0x7ffff7fb718b <switch_char_case+13>:	movzbl -0x4(%rbp),%eax
   0x7ffff7fb718f <switch_char_case+17>:	xor    $0x20,%eax
   0x7ffff7fb7192 <switch_char_case+20>:	pop    %rbp
   0x7ffff7fb7193 <switch_char_case+21>:	ret

# Takes %edi as argument
   0x7ffff7fb7194 <get_influence_index>:	endbr64
   0x7ffff7fb7198 <get_influence_index+4>:	push   %rbp
   0x7ffff7fb7199 <get_influence_index+5>:	mov    %rsp,%rbp
   0x7ffff7fb719c <get_influence_index+8>:	mov    %edi,-0x14(%rbp)         # Save arg in $rbp - 0x14
   0x7ffff7fb719f <get_influence_index+11>:	lea    0x1142(%rip),%rax        # 0x7ffff7fb82e8 = documentation string n°1
   0x7ffff7fb71a6 <get_influence_index+18>:	mov    %rax,-0x8(%rbp)          # mov documentation to $rbp - 0x8
   0x7ffff7fb71aa <get_influence_index+22>:	mov    -0x14(%rbp),%edx         # Set arg in %edx
   0x7ffff7fb71ad <get_influence_index+25>:	mov    %edx,%eax
   0x7ffff7fb71af <get_influence_index+27>:	add    %eax,%eax
   0x7ffff7fb71b1 <get_influence_index+29>:	add    %edx,%eax                # => %eax = 3 * %edx
   0x7ffff7fb71b3 <get_influence_index+31>:	shl    $0x2,%eax                # multiply by 4
   0x7ffff7fb71b6 <get_influence_index+34>:	add    %edx,%eax                # => %eax = (4 * 3 + 1) * %edx = 13 * %edx
   0x7ffff7fb71b8 <get_influence_index+36>:	lea    0x7(%rax),%edx           # %edx = %eax + 7
   0x7ffff7fb71bb <get_influence_index+39>:	mov    %edx,%eax                # At this point, %edx and %eax are (arg*13+7), cf. documentation string n°1
   0x7ffff7fb71bd <get_influence_index+41>:	sar    $0x1f,%eax
   0x7ffff7fb71c0 <get_influence_index+44>:	shr    $0x1c,%eax
   0x7ffff7fb71c3 <get_influence_index+47>:	add    %eax,%edx
   0x7ffff7fb71c5 <get_influence_index+49>:	and    $0xf,%edx
   0x7ffff7fb71c8 <get_influence_index+52>:	sub    %eax,%edx
   0x7ffff7fb71ca <get_influence_index+54>:	mov    %edx,%eax
   0x7ffff7fb71cc <get_influence_index+56>:	pop    %rbp
   0x7ffff7fb71cd <get_influence_index+57>:	ret

# Takes a char in %edi, and returns 1 or 0 in %eax if is even
   0x7ffff7fb71ce <char_is_even>:	endbr64
   0x7ffff7fb71d2 <char_is_even+4>:	push   %rbp
   0x7ffff7fb71d3 <char_is_even+5>:	mov    %rsp,%rbp
   0x7ffff7fb71d6 <char_is_even+8>:	mov    %edi,%eax
   0x7ffff7fb71d8 <char_is_even+10>:	mov    %al,-0x4(%rbp)
   0x7ffff7fb71db <char_is_even+13>:	movzbl -0x4(%rbp),%eax
   0x7ffff7fb71df <char_is_even+17>:	and    $0x1,%eax
   0x7ffff7fb71e2 <char_is_even+20>:	test   %al,%al
   0x7ffff7fb71e4 <char_is_even+22>:	sete   %al
   0x7ffff7fb71e7 <char_is_even+25>:	pop    %rbp
   0x7ffff7fb71e8 <char_is_even+26>:	ret

# Takes a char in %edi, and returns 1 or 0 in %eax if is uppercase
   0x7ffff7fb71e9 <char_is_uppercase>:	endbr64
   0x7ffff7fb71ed <char_is_uppercase+4>:	push   %rbp
   0x7ffff7fb71ee <char_is_uppercase+5>:	mov    %rsp,%rbp
   0x7ffff7fb71f1 <char_is_uppercase+8>:	mov    %edi,%eax
   0x7ffff7fb71f3 <char_is_uppercase+10>:	mov    %al,-0x4(%rbp)
   0x7ffff7fb71f6 <char_is_uppercase+13>:	cmpb   $0x40,-0x4(%rbp)
   0x7ffff7fb71fa <char_is_uppercase+17>:	jle    0x7ffff7fb7209 <char_is_uppercase+32>
   0x7ffff7fb71fc <char_is_uppercase+19>:	cmpb   $0x5a,-0x4(%rbp)
   0x7ffff7fb7200 <char_is_uppercase+23>:	jg     0x7ffff7fb7209 <char_is_uppercase+32>
   0x7ffff7fb7202 <char_is_uppercase+25>:	mov    $0x1,%eax
   0x7ffff7fb7207 <char_is_uppercase+30>:	jmp    0x7ffff7fb720e <char_is_uppercase+37>
   0x7ffff7fb7209 <char_is_uppercase+32>:	mov    $0x0,%eax
   0x7ffff7fb720e <char_is_uppercase+37>:	and    $0x1,%eax
   0x7ffff7fb7211 <char_is_uppercase+40>:	pop    %rbp
   0x7ffff7fb7212 <char_is_uppercase+41>:	ret

   0x7ffff7fb7213 <count_uppercase>:	endbr64
   0x7ffff7fb7217 <count_uppercase+4>:	push   %rbp
   0x7ffff7fb7218 <count_uppercase+5>:	mov    %rsp,%rbp
   0x7ffff7fb721b <count_uppercase+8>:	sub    $0x18,%rsp
   0x7ffff7fb721f <count_uppercase+12>:	mov    %rdi,-0x18(%rbp)
   0x7ffff7fb7223 <count_uppercase+16>:	movl   $0x0,-0x8(%rbp)
   0x7ffff7fb722a <count_uppercase+23>:	movl   $0x0,-0x4(%rbp)
   0x7ffff7fb7231 <count_uppercase+30>:	jmp    0x7ffff7fb7259 <count_uppercase+70>
   0x7ffff7fb7233 <count_uppercase+32>:	mov    -0x4(%rbp),%eax
   0x7ffff7fb7236 <count_uppercase+35>:	movslq %eax,%rdx
   0x7ffff7fb7239 <count_uppercase+38>:	mov    -0x18(%rbp),%rax
   0x7ffff7fb723d <count_uppercase+42>:	add    %rdx,%rax
   0x7ffff7fb7240 <count_uppercase+45>:	movzbl (%rax),%eax
   0x7ffff7fb7243 <count_uppercase+48>:	movsbl %al,%eax
   0x7ffff7fb7246 <count_uppercase+51>:	mov    %eax,%edi
   0x7ffff7fb7248 <count_uppercase+53>:	call   0x7ffff7fb71e9 <char_is_uppercase>
   0x7ffff7fb724d <count_uppercase+58>:	test   %al,%al
   0x7ffff7fb724f <count_uppercase+60>:	je     0x7ffff7fb7255 <count_uppercase+66>
   0x7ffff7fb7251 <count_uppercase+62>:	addl   $0x1,-0x8(%rbp)
   0x7ffff7fb7255 <count_uppercase+66>:	addl   $0x1,-0x4(%rbp)
   0x7ffff7fb7259 <count_uppercase+70>:	cmpl   $0xf,-0x4(%rbp)
   0x7ffff7fb725d <count_uppercase+74>:	jle    0x7ffff7fb7233 <count_uppercase+32>
   0x7ffff7fb725f <count_uppercase+76>:	mov    -0x8(%rbp),%eax
   0x7ffff7fb7262 <count_uppercase+79>:	leave
   0x7ffff7fb7263 <count_uppercase+80>:	ret

   0x7ffff7fb7264 <fill_string_with_A>:	endbr64
   0x7ffff7fb7268 <fill_string_with_A+4>:	push   %rbp
   0x7ffff7fb7269 <fill_string_with_A+5>:	mov    %rsp,%rbp
   0x7ffff7fb726c <fill_string_with_A+8>:	mov    %rdi,-0x8(%rbp)
   0x7ffff7fb7270 <fill_string_with_A+12>:	mov    -0x8(%rbp),%rax
   0x7ffff7fb7274 <fill_string_with_A+16>:	movabs $0x4141414141414141,%rdx
   0x7ffff7fb727e <fill_string_with_A+26>:	movabs $0x4141414141414141,%rcx
   0x7ffff7fb7288 <fill_string_with_A+36>:	mov    %rdx,(%rax)
   0x7ffff7fb728b <fill_string_with_A+39>:	mov    %rcx,0x8(%rax)
   0x7ffff7fb728f <fill_string_with_A+43>:	movb   $0x0,0x10(%rax)
   0x7ffff7fb7293 <fill_string_with_A+47>:	mov    -0x8(%rbp),%rax
   0x7ffff7fb7297 <fill_string_with_A+51>:	pop    %rbp
   0x7ffff7fb7298 <fill_string_with_A+52>:	ret


   0x7ffff7fb7299 <command_transmitter+0>:	endbr64
   0x7ffff7fb729d <command_transmitter+4>:	push   %rbp
   0x7ffff7fb729e <command_transmitter+5>:	mov    %rsp,%rbp
   0x7ffff7fb72a1 <command_transmitter+8>:	push   %rbx
   0x7ffff7fb72a2 <command_transmitter+9>:	sub    $0x38,%rsp
   0x7ffff7fb72a6 <command_transmitter+13>:	mov    %rdi,-0x38(%rbp)
   0x7ffff7fb72aa <command_transmitter+17>:	mov    $0x10,%edi
   0x7ffff7fb72af <command_transmitter+22>:	call   0x7ffff7fb7090           # malloc
   0x7ffff7fb72b4 <command_transmitter+27>:	mov    %rax,-0x20(%rbp)
   0x7ffff7fb72b8 <command_transmitter+31>:	lea    0x10c9(%rip),%rax        # 0x7ffff7fb8388
   0x7ffff7fb72bf <command_transmitter+38>:	mov    %rax,-0x18(%rbp)
   0x7ffff7fb72c3 <command_transmitter+42>:	mov    -0x38(%rbp),%rax
   0x7ffff7fb72c7 <command_transmitter+46>:	mov    %rax,%rdi
   0x7ffff7fb72ca <command_transmitter+49>:	call   0x7ffff7fb7080           # strlen
   0x7ffff7fb72cf <command_transmitter+54>:	cmp    $0x10,%rax               # => password should be 16 characters long
   0x7ffff7fb72d3 <command_transmitter+58>:	je     0x7ffff7fb72e6 <command_transmitter+77>
   0x7ffff7fb72d5 <command_transmitter+60>:	mov    -0x20(%rbp),%rax
   0x7ffff7fb72d9 <command_transmitter+64>:	mov    %rax,%rdi
   0x7ffff7fb72dc <command_transmitter+67>:	call   0x7ffff7fb7264 <fill_string_with_A>    # If password is not 16 characters long, fill it with A
   0x7ffff7fb72e1 <command_transmitter+72>:	jmp    0x7ffff7fb73bd <command_transmitter+292>
   0x7ffff7fb72e6 <command_transmitter+77>:	mov    -0x38(%rbp),%rdx
   0x7ffff7fb72ea <command_transmitter+81>:	mov    -0x20(%rbp),%rax
   0x7ffff7fb72ee <command_transmitter+85>:	mov    %rdx,%rsi                # = arg, so the password / function input
   0x7ffff7fb72f1 <command_transmitter+88>:	mov    %rax,%rdi                # The address given by malloc
   0x7ffff7fb72f4 <command_transmitter+91>:	call   0x7ffff7fb7070           # strcpy
   0x7ffff7fb72f9 <command_transmitter+96>:	movl   $0x0,-0x28(%rbp)
   0x7ffff7fb7300 <command_transmitter+103>:	movl   $0x7,-0x24(%rbp)
   0x7ffff7fb7307 <command_transmitter+110>:	jmp    0x7ffff7fb73af <command_transmitter+278>

LOOP_UNTIL:    # loop until %rbp - 0x24 is equal to 0
   0x7ffff7fb730c <command_transmitter+115>:	lea    0x10dd(%rip),%rax        # 0x7ffff7fb83f0
   0x7ffff7fb7313 <command_transmitter+122>:	mov    %rax,-0x18(%rbp)
   0x7ffff7fb7317 <command_transmitter+126>:	mov    -0x28(%rbp),%eax
   0x7ffff7fb731a <command_transmitter+129>:	mov    %eax,%edi
   0x7ffff7fb731c <command_transmitter+131>:	call   0x7ffff7fb7194 <get_influence_index>
   0x7ffff7fb7321 <command_transmitter+136>:	mov    %eax,-0x24(%rbp)         # The influence index is saved in $rbp - 0x24


   0x7ffff7fb7324 <command_transmitter+139>:	mov    -0x24(%rbp),%eax
   0x7ffff7fb7327 <command_transmitter+142>:	movslq %eax,%rdx
   0x7ffff7fb732a <command_transmitter+145>:	mov    -0x38(%rbp),%rax
   0x7ffff7fb732e <command_transmitter+149>:	add    %rdx,%rax                # We add the influence index (II) to the address of the function input
                                                                              # i.e. $rax is now the address of the II's character of the password
   0x7ffff7fb7331 <command_transmitter+152>:	movzbl (%rax),%eax              # And now, $eax is the II's character of the password
   0x7ffff7fb7334 <command_transmitter+155>:	mov    %al,-0x29(%rbp)          # Save it in $rbp - 0x29
   0x7ffff7fb7337 <command_transmitter+158>:	movsbl -0x29(%rbp),%eax
   0x7ffff7fb733b <command_transmitter+162>:	mov    %eax,%edi
   0x7ffff7fb733d <command_transmitter+164>:	call   0x7ffff7fb71e9 <char_is_uppercase>
   0x7ffff7fb7342 <command_transmitter+169>:	test   %al,%al
   0x7ffff7fb7344 <command_transmitter+171>:	je     0x7ffff7fb7370 <command_transmitter+215>     # Jump if the char is not uppercase

   # If the char is uppercase, switch the case of -0x28(%rbp)
       0x7ffff7fb7346 <command_transmitter+173>:	mov    -0x28(%rbp),%eax         # -+
       0x7ffff7fb7349 <command_transmitter+176>:	movslq %eax,%rdx                #  |
       0x7ffff7fb734c <command_transmitter+179>:	mov    -0x20(%rbp),%rax         #  |
       0x7ffff7fb7350 <command_transmitter+183>:	add    %rdx,%rax                #  |
       0x7ffff7fb7353 <command_transmitter+186>:	movzbl (%rax),%eax              #  |
       0x7ffff7fb7356 <command_transmitter+189>:	movsbl %al,%eax                 # -+ -> %eax = the ($rbp - 0x28) character of the copy of the function input
       0x7ffff7fb7359 <command_transmitter+192>:	mov    -0x28(%rbp),%edx         # -+
       0x7ffff7fb735c <command_transmitter+195>:	movslq %edx,%rcx                #  |
       0x7ffff7fb735f <command_transmitter+198>:	mov    -0x20(%rbp),%rdx         #  |
       0x7ffff7fb7363 <command_transmitter+202>:	lea    (%rcx,%rdx,1),%rbx       # -+ -> %rbx = the address of this character
       0x7ffff7fb7367 <command_transmitter+206>:	mov    %eax,%edi
       0x7ffff7fb7369 <command_transmitter+208>:	call   0x7ffff7fb717e <switch_char_case>
       0x7ffff7fb736e <command_transmitter+213>:	mov    %al,(%rbx)

   0x7ffff7fb7370 <command_transmitter+215>:	movsbl -0x29(%rbp),%eax
   0x7ffff7fb7374 <command_transmitter+219>:	mov    %eax,%edi
   0x7ffff7fb7376 <command_transmitter+221>:	call   0x7ffff7fb71ce <char_is_even>   # Jump if the char code is odd
   0x7ffff7fb737b <command_transmitter+226>:	test   %al,%al
   0x7ffff7fb737d <command_transmitter+228>:	je     0x7ffff7fb73a9 <command_transmitter+272>

# If the InfluenceIndex char is even, reswitch the -0x28(%rbp) case
       0x7ffff7fb737f <command_transmitter+230>:	mov    -0x28(%rbp),%eax
       0x7ffff7fb7382 <command_transmitter+233>:	movslq %eax,%rdx
       0x7ffff7fb7385 <command_transmitter+236>:	mov    -0x20(%rbp),%rax
       0x7ffff7fb7389 <command_transmitter+240>:	add    %rdx,%rax
       0x7ffff7fb738c <command_transmitter+243>:	movzbl (%rax),%eax
       0x7ffff7fb738f <command_transmitter+246>:	movsbl %al,%eax
       0x7ffff7fb7392 <command_transmitter+249>:	mov    -0x28(%rbp),%edx
       0x7ffff7fb7395 <command_transmitter+252>:	movslq %edx,%rcx
       0x7ffff7fb7398 <command_transmitter+255>:	mov    -0x20(%rbp),%rdx
       0x7ffff7fb739c <command_transmitter+259>:	lea    (%rcx,%rdx,1),%rbx
       0x7ffff7fb73a0 <command_transmitter+263>:	mov    %eax,%edi
       0x7ffff7fb73a2 <command_transmitter+265>:	call   0x7ffff7fb717e <switch_char_case>
       0x7ffff7fb73a7 <command_transmitter+270>:	mov    %al,(%rbx)

   0x7ffff7fb73a9 <command_transmitter+272>:	mov    -0x24(%rbp),%eax
   0x7ffff7fb73ac <command_transmitter+275>:	mov    %eax,-0x28(%rbp)         # Set $rbp - 0x28 to previous influence index
   0x7ffff7fb73af <command_transmitter+278>:	cmpl   $0x0,-0x24(%rbp)
   0x7ffff7fb73b3 <command_transmitter+282>:	jne    0x7ffff7fb730c <command_transmitter+115>
   0x7ffff7fb73b9 <command_transmitter+288>:	mov    -0x20(%rbp),%rax
   0x7ffff7fb73bd <command_transmitter+292>:	mov    -0x8(%rbp),%rbx
   0x7ffff7fb73c1 <command_transmitter+296>:	leave
   0x7ffff7fb73c2 <command_transmitter+297>:	ret
