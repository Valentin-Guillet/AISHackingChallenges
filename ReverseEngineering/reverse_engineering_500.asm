
   0x4a150a:    cld
   0x4a150b:    pop    %r11
   0x4a150d:    cmp    $0x8,%r8b
   0x4a1511:    jne    0x4a15c5
   0x4a1517:    jmp    0x4a1521
     0x4a1519:    inc    %rsi
     0x4a151c:    mov    %dl,(%rdi)
     0x4a151e:    inc    %rdi
     0x4a1521:    mov    (%rsi),%dl
     0x4a1523:    add    %ebx,%ebx
     0x4a1525:    jne    0x4a1531
     0x4a1527:    mov    (%rsi),%ebx
     0x4a1529:    sub    $0xfffffffffffffffc,%rsi
     0x4a152d:    adc    %ebx,%ebx
     0x4a152f:    mov    (%rsi),%dl
     0x4a1531:    jb     0x4a1519
   0x4a1533:    lea    0x1(%rcx),%eax
   0x4a1536:    jmp    0x4a153f
   0x4a1538:    dec    %eax
   0x4a153a:    call   *%r11
   0x4a153d:    adc    %eax,%eax
   0x4a153f:    call   *%r11                       # Not <main>
   0x4a1542:    adc    %eax,%eax
   0x4a1544:    add    %ebx,%ebx
   0x4a1546:    jne    0x4a1552
   0x4a1548:    mov    (%rsi),%ebx
   0x4a154a:    sub    $0xfffffffffffffffc,%rsi
   0x4a154e:    adc    %ebx,%ebx
   0x4a1550:    mov    (%rsi),%dl
   0x4a1552:    jae    0x4a1538
   0x4a1554:    sub    $0x3,%eax
   0x4a1557:    jb     0x4a1576
   0x4a1559:    shl    $0x8,%eax
   0x4a155c:    movzbl %dl,%edx
   0x4a155f:    or     %edx,%eax
   0x4a1561:    inc    %rsi
   0x4a1564:    xor    $0xffffffff,%eax
   0x4a1567:    je     0x4a15c7
   0x4a156d:    sar    %eax
   0x4a156f:    movslq %eax,%rbp
   0x4a1572:    jb     0x4a15ac
   0x4a1574:    jmp    0x4a1584
   0x4a1576:    add    %ebx,%ebx
   0x4a1578:    jne    0x4a1582
   0x4a157a:    mov    (%rsi),%ebx
   0x4a157c:    sub    $0xfffffffffffffffc,%rsi
   0x4a1580:    adc    %ebx,%ebx
   0x4a1582:    jb     0x4a15ac
   0x4a1584:    inc    %ecx
   0x4a1586:    add    %ebx,%ebx
   0x4a1588:    jne    0x4a1592
   0x4a158a:    mov    (%rsi),%ebx
   0x4a158c:    sub    $0xfffffffffffffffc,%rsi
   0x4a1590:    adc    %ebx,%ebx
   0x4a1592:    jb     0x4a15ac
   0x4a1594:    call   *%r11
   0x4a1597:    adc    %ecx,%ecx
   0x4a1599:    add    %ebx,%ebx
   0x4a159b:    jne    0x4a15a5
   0x4a159d:    mov    (%rsi),%ebx
   0x4a159f:    sub    $0xfffffffffffffffc,%rsi
   0x4a15a3:    adc    %ebx,%ebx
   0x4a15a5:    jae    0x4a1594
   0x4a15a7:    add    $0x2,%ecx
   0x4a15aa:    jmp    0x4a15b1
   0x4a15ac:    call   *%r11                     # Not <main> either
   0x4a15af:    adc    %ecx,%ecx
   0x4a15b1:    cmp    $0xfffffffffffffb00,%rbp
   0x4a15b8:    adc    $0x2,%ecx
   0x4a15bb:    call   0x4a14cc                  # Not <main> either
   0x4a15c0:    jmp    0x4a1521
   0x4a15c5:    push   %rdi
   0x4a15c6:    pop    %rsi
   0x4a15c7:    pop    %rcx
   0x4a15c8:    mov    %rsi,%rax
   0x4a15cb:    sub    %rcx,%rax
   0x4a15ce:    pop    %rdx
   0x4a15cf:    sub    %rdx,%rdi
   0x4a15d2:    pop    %rcx
   0x4a15d3:    mov    %edi,(%rcx)
   0x4a15d5:    pop    %rbx
   0x4a15d6:    pop    %rbp
   0x4a15d7:    ret



   0x404080:	endbr64
   0x404084:	push   %r13
   0x404086:	push   %r12
   0x404088:	push   %rbp
   0x404089:	push   %rbx
   0x40408a:	sub    $0x48,%rsp
   0x40408e:	mov    %fs:0x28,%rax
   0x404097:	mov    %rax,0x38(%rsp)
   0x40409c:	xor    %eax,%eax
   0x40409e:	lea    0x8(%rsp),%rbx
   0x4040a3:	nopl   0x0(%rax,%rax,1)
   0x4040a8:	xor    %edx,%edx
   0x4040aa:	mov    $0x8,%esi
   0x4040af:	mov    %rbx,%rdi
   0x4040b2:	call   0x4c54b0
   0x4040b7:	cmp    $0x8,%rax
   0x4040bb:	jne    0x4040a8
   0x4040bd:	mov    0x8(%rsp),%r13
   0x4040c2:	mov    $0xa,%ebp
   0x4040c7:	xor    %r12d,%r12d
   0x4040ca:	nopw   0x0(%rax,%rax,1)
   0x4040d0:	xor    %edx,%edx
   0x4040d2:	mov    $0x8,%esi
   0x4040d7:	mov    %rbx,%rdi
   0x4040da:	call   0x4c54b0
   0x4040df:	cmp    $0x8,%rax
   0x4040e3:	jne    0x4040d0
   0x4040e5:	mov    0x8(%rsp),%rax
   0x4040ea:	cmp    %rax,%r13
   0x4040ed:	je     0x40424e
   0x4040f3:	add    %rax,%r12
   0x4040f6:	sub    $0x1,%ebp
   0x4040f9:	jne    0x4040d0
   0x4040fb:	cmp    $0x270f,%r12
   0x404102:	jbe    0x40424e
   0x404108:	nopl   0x0(%rax,%rax,1)
   0x404110:	xor    %edx,%edx
   0x404112:	mov    $0x8,%esi
   0x404117:	mov    %rbx,%rdi
   0x40411a:	call   0x4c54b0
   0x40411f:	cmp    $0x8,%rax
   0x404123:	jne    0x404110
   0x404125:	mov    0x8(%rsp),%rbp
   0x40412a:	nopw   0x0(%rax,%rax,1)
   0x404130:	xor    %edx,%edx
   0x404132:	mov    $0x8,%esi
   0x404137:	mov    %rbx,%rdi
   0x40413a:	call   0x4c54b0
   0x40413f:	cmp    $0x8,%rax
   0x404143:	jne    0x404130
   0x404145:	mov    0x8(%rsp),%rax
   0x40414a:	mov    $0x2dc6c0,%ecx
   0x40414f:	imul   %rbp,%rax
   0x404153:	cqto
   0x404155:	idiv   %rcx
   0x404158:	lea    0x1(%rdx),%rax
   0x40415c:	xor    %rax,0x1b91bd(%rip)        # 0x5bd320
   0x404163:	xor    0x1b91fe(%rip),%rax        # 0x5bd368
   0x40416a:	mov    %rax,%rbp
   0x40416d:	lea    0x157e94(%rip),%rdi        # 0x55c008
   0x404174:	lea    0x10(%rsp),%rbx
   0x404179:	call   0x4d3720
   0x40417e:	lea    0x157eb3(%rip),%rdi        # 0x55c038
   0x404185:	call   0x4d3720
   0x40418a:	mov    0x1b7a87(%rip),%rdx        # 0x5bbc18
   0x404191:	mov    $0x20,%esi
   0x404196:	mov    %rbx,%rdi
   0x404199:	call   0x4d2a30
   0x40419e:	test   %rax,%rax
   0x4041a1:	je     0x404258
   0x4041a7:	mov    $0xa,%edx
   0x4041ac:	xor    %esi,%esi
   0x4041ae:	mov    %rbx,%rdi
   0x4041b1:	call   0x4ccb80
   0x4041b6:	xchg   %eax,%ebp
   0x4041b7:	lea    -0x1(%rax),%edx
   0x4041ba:	cmp    $0x2dc6bf,%rdx
   0x4041c1:	ja     0x404225
   0x4041c3:	xor    0x1b919e(%rip),%rbp        # 0x5bd368
   0x4041ca:	cmp    %rax,%rbp
   0x4041cd:	jne    0x40425f
   0x4041d3:	mov    $0x53,%edi
   0x4041d8:	xor    %ebx,%ebx
   0x4041da:	lea    0x157eb7(%rip),%r12        # 0x55c098
   0x4041e1:	lea    0x157ee0(%rip),%rbp        # 0x55c0c8
   0x4041e8:	nopl   0x0(%rax,%rax,1)
   0x4041f0:	xor    (%r12,%rbx,1),%dil
   0x4041f4:	mov    0x1b7a15(%rip),%rsi        # 0x5bbc10
   0x4041fb:	add    $0x1,%rbx
   0x4041ff:	movsbl %dil,%edi
   0x404203:	call   0x4d5ce0
   0x404208:	movzbl 0x0(%rbp,%rbx,1),%edi
   0x40420d:	test   %dil,%dil
   0x404210:	jne    0x4041f0
   0x404212:	mov    0x1b79f7(%rip),%rsi        # 0x5bbc10
   0x404219:	mov    $0xa,%edi
   0x40421e:	call   0x4d5ce0
   0x404223:	jmp    0x404231
   0x404225:	lea    0x157e34(%rip),%rdi        # 0x55c060
   0x40422c:	call   0x4d3720
   0x404231:	mov    0x38(%rsp),%rax
   0x404236:	sub    %fs:0x28,%rax
   0x40423f:	jne    0x40426d
   0x404241:	add    $0x48,%rsp
   0x404245:	xor    %eax,%eax
   0x404247:	pop    %rbx
   0x404248:	pop    %rbp
   0x404249:	pop    %r12
   0x40424b:	pop    %r13
   0x40424d:	ret



   0x40424e:	mov    $0x2dc6c1,%ebp
   0x404253:	jmp    0x40416d
   0x404258:	xor    %edi,%edi
   0x40425a:	call   0x4c5320
   0x40425f:	lea    0x157e92(%rip),%rdi        # 0x55c0f8
   0x404266:	call   0x4d3720
   0x40426b:	jmp    0x404231
   0x40426d:	call   0x51dea0
   0x404272:	data16 cs nopw 0x0(%rax,%rax,1)
   0x40427d:	nopl   (%rax)
   0x404280:	movabs $0xd16ff6716c2ae414,%rcx
   0x40428a:	push   %r15
   0x40428c:	movabs $0x377dc5db737d3538,%rsi
   0x404296:	movabs $0x4b8ac7e2cd5e1742,%rdx
   0x4042a0:	push   %r14
   0x4042a2:	push   %r13
   0x4042a4:	movabs $0x520eeab81c0f4517,%r13
   0x4042ae:	push   %r12
   0x4042b0:	movabs $0xa41b97051f058278,%r12
   0x4042ba:	push   %rbp
   0x4042bb:	push   %rbx
   0x4042bc:	movabs $0x4b8ac7e2cd5e1731,%rbx
   0x4042c6:	sub    $0x338,%rsp
   0x4042cd:	movdqa 0x157eeb(%rip),%xmm0        # 0x55c1c0
   0x4042d5:	mov    %fs:0x28,%rax
   0x4042de:	mov    %rax,0x328(%rsp)
   0x4042e6:	xor    %eax,%eax
   0x4042e8:	mov    %rsi,0x80(%rsp)
   0x4042f0:	movabs $0xfc1309c734734be2,%rax
   0x4042fa:	lea    0xd0(%rsp),%r14
   0x404302:	mov    %rcx,0x88(%rsp)
   0x40430a:	mov    %r14,%rdi
   0x40430d:	mov    %rdx,0x90(%rsp)
   0x404315:	mov    %rax,0x98(%rsp)
   0x40431d:	mov    %r13,0xd0(%rsp)
   0x404325:	mov    %r12,0xd8(%rsp)
   0x40432d:	mov    %rbx,0xe0(%rsp)
   0x404335:	mov    %rax,0xe8(%rsp)
   0x40433d:	mov    %rsi,0x80(%rsp)
   0x404345:	mov    %rcx,0x88(%rsp)
   0x40434d:	mov    %rdx,0x90(%rsp)
   0x404355:	mov    $0x8,%edx
   0x40435a:	mov    %rax,0x98(%rsp)
   0x404362:	movzbl 0x1b8ff8(%rip),%eax        # 0x5bd361
   0x404369:	movb   $0x0,0x1b8ff2(%rip)        # 0x5bd362
   0x404370:	pxor   0xd0(%rsp,%rax,8),%xmm0
   0x404379:	movaps %xmm0,0x80(%rsp)
   0x404381:	movdqa 0x157e47(%rip),%xmm0        # 0x55c1d0
   0x404389:	pxor   0xe0(%rsp,%rax,8),%xmm0
   0x404392:	lea    0x80(%rsp),%rax
   0x40439a:	mov    %rax,%rsi
   0x40439d:	mov    %rax,0x8(%rsp)
   0x4043a2:	movaps %xmm0,0x90(%rsp)
   0x4043aa:	call   0x40e030
   0x4043af:	lea    0x148(%rsp),%rdi
   0x4043b7:	call   0x406f90
   0x4043bc:	mov    %al,0x10(%rsp)
   0x4043c0:	test   %al,%al
   0x4043c2:	jne    0x404485
   0x4043c8:	mov    %r14,%rdi
   0x4043cb:	lea    0x38(%rsp),%r15
   0x4043d0:	call   0x40e9a0
   0x4043d5:	movb   $0x1,0x1b8f86(%rip)        # 0x5bd362
   0x4043dc:	movb   $0x0,0x10(%rsp)
   0x4043e1:	nopl   0x0(%rax)
   0x4043e8:	movzbl 0x10(%rsp),%eax
   0x4043ed:	mov    %al,0x1b8f6e(%rip)        # 0x5bd361
   0x4043f3:	nopl   0x0(%rax,%rax,1)
   0x4043f8:	xor    %edx,%edx
   0x4043fa:	mov    $0x8,%esi
   0x4043ff:	mov    %r15,%rdi
   0x404402:	call   0x4c54b0
   0x404407:	cmp    $0x8,%rax
   0x40440b:	jne    0x4043f8
   0x40440d:	mov    0x38(%rsp),%rax
   0x404412:	mov    %rax,0x1b8f57(%rip)        # 0x5bd370
   0x404419:	nopl   0x0(%rax)
   0x404420:	xor    %edx,%edx
   0x404422:	mov    $0x8,%esi
   0x404427:	mov    %r15,%rdi
   0x40442a:	call   0x4c54b0
   0x40442f:	cmp    $0x8,%rax
   0x404433:	jne    0x404420
   0x404435:	mov    0x38(%rsp),%rax
   0x40443a:	cmpb   $0x0,0x1b8f21(%rip)        # 0x5bd362
   0x404441:	mov    %rax,0x1b8f20(%rip)        # 0x5bd368
   0x404448:	mov    0x1b8f21(%rip),%rax        # 0x5bd370
   0x40444f:	mov    %rax,0x1b8eca(%rip)        # 0x5bd320
   0x404456:	je     0x404656
   0x40445c:	mov    0x328(%rsp),%rax
