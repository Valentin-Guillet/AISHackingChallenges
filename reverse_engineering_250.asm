Dump of assembler code for function check_disarm:
   0x08049bcf <+0>:	push   %ebp
   0x08049bd0 <+1>:	mov    %esp,%ebp
   0x08049bd2 <+3>:	push   %ebx
   0x08049bd3 <+4>:	sub    $0x54,%esp
   0x08049bd6 <+7>:	call   0x8049840 <__x86.get_pc_thunk.bx>
   0x08049bdb <+12>:	add    $0xbb419,%ebx
   0x08049be1 <+18>:	mov    $0x0,%ecx
   0x08049be6 <+23>:	mov    $0x1c,%eax
   0x08049beb <+28>:	and    $0xfffffffc,%eax
   0x08049bee <+31>:	mov    %eax,%edx
   0x08049bf0 <+33>:	mov    $0x0,%eax
   0x08049bf5 <+38>:	mov    %ecx,-0x30(%ebp,%eax,1)
   0x08049bf9 <+42>:	add    $0x4,%eax
   0x08049bfc <+45>:	cmp    %edx,%eax
   0x08049bfe <+47>:	jb     0x8049bf5 <check_disarm+38>
   0x08049c00 <+49>:	mov    $0x0,%ecx
   0x08049c05 <+54>:	mov    $0x1c,%eax
   0x08049c0a <+59>:	and    $0xfffffffc,%eax
   0x08049c0d <+62>:	mov    %eax,%edx
   0x08049c0f <+64>:	mov    $0x0,%eax
   0x08049c14 <+69>:	mov    %ecx,-0x4c(%ebp,%eax,1)
   0x08049c18 <+73>:	add    $0x4,%eax
   0x08049c1b <+76>:	cmp    %edx,%eax
   0x08049c1d <+78>:	jb     0x8049c14 <check_disarm+69>
   0x08049c1f <+80>:	sub    $0xc,%esp
   0x08049c22 <+83>:	lea    -0x30(%ebp),%eax
   0x08049c25 <+86>:	add    $0x18,%eax
   0x08049c28 <+89>:	push   %eax
   0x08049c29 <+90>:	lea    -0x30(%ebp),%eax
   0x08049c2c <+93>:	add    $0x14,%eax
   0x08049c2f <+96>:	push   %eax
   0x08049c30 <+97>:	lea    -0x30(%ebp),%eax
   0x08049c33 <+100>:	add    $0x10,%eax
   0x08049c36 <+103>:	push   %eax
   0x08049c37 <+104>:	lea    -0x30(%ebp),%eax
   0x08049c3a <+107>:	add    $0xc,%eax
   0x08049c3d <+110>:	push   %eax
   0x08049c3e <+111>:	lea    -0x30(%ebp),%eax
   0x08049c41 <+114>:	add    $0x8,%eax
   0x08049c44 <+117>:	push   %eax
   0x08049c45 <+118>:	lea    -0x30(%ebp),%eax
   0x08049c48 <+121>:	add    $0x4,%eax
   0x08049c4b <+124>:	push   %eax
   0x08049c4c <+125>:	lea    -0x30(%ebp),%eax
   0x08049c4f <+128>:	push   %eax
   0x08049c50 <+129>:	lea    -0x36e12(%ebx),%eax
   0x08049c56 <+135>:	push   %eax
   0x08049c57 <+136>:	push   0x8(%ebp)
   0x08049c5a <+139>:	call   0x804de90 <__isoc99_sscanf>      # scanf of "%d %d %d %d %d %d %d"
   0x08049c5f <+144>:	add    $0x30,%esp
   0x08049c62 <+147>:	mov    %eax,-0x14(%ebp)
   0x08049c65 <+150>:	cmpl   $0x7,-0x14(%ebp)                 # check that 7 values were read by scanf
   0x08049c69 <+154>:	je     0x8049c72 <check_disarm+163>
   0x08049c6b <+156>:	mov    $0x0,%eax
   0x08049c70 <+161>:	jmp    0x8049cec <check_disarm+285>

   0x08049c72 <+163>:	movl   $0x0,-0xc(%ebp)
   0x08049c79 <+170>:	jmp    0x8049cb2 <check_disarm+227>

LOOP_6_TIMES:
    0x08049c7b <+172>:	mov    -0xc(%ebp),%eax                # Index i of the sequence to check
    0x08049c7e <+175>:	mov    -0x30(%ebp,%eax,4),%eax        # Get the i-th char of the input
    0x08049c82 <+179>:	cmp    $0x6,%eax                      # Check that it is <= 6
    0x08049c85 <+182>:	jg     0x8049c92 <check_disarm+195>
    0x08049c87 <+184>:	mov    -0xc(%ebp),%eax
    0x08049c8a <+187>:	mov    -0x30(%ebp,%eax,4),%eax
    0x08049c8e <+191>:	test   %eax,%eax
    0x08049c90 <+193>:	jns    0x8049c99 <check_disarm+202>
    0x08049c92 <+195>:	mov    $0x0,%eax
    0x08049c97 <+200>:	jmp    0x8049cec <check_disarm+285>
    0x08049c99 <+202>:	mov    -0xc(%ebp),%eax
    0x08049c9c <+205>:	mov    -0x30(%ebp,%eax,4),%eax
    0x08049ca0 <+209>:	mov    -0x36fec(%ebx,%eax,4),%edx     # %ebx - 0x36fec is the wire_cut_sequence, which is 1 4 3 0 2 6 5
    0x08049ca7 <+216>:	mov    -0xc(%ebp),%eax
    0x08049caa <+219>:	mov    %edx,-0x4c(%ebp,%eax,4)        # Load the input[i]-th char of the wire sequence at $ebp - 0x4c
    0x08049cae <+223>:	addl   $0x1,-0xc(%ebp)                # Increment i
    0x08049cb2 <+227>:	cmpl   $0x6,-0xc(%ebp)                # Break if i == 6
    0x08049cb6 <+231>:	jle    0x8049c7b <check_disarm+172>

# At this point, $ebp - 0x4c contains the wire cut sequence indexed by OUR input sequence
   0x08049cb8 <+233>:	movl   $0x0,-0x10(%ebp)
   0x08049cbf <+240>:	jmp    0x8049ce1 <check_disarm+274>

LOOP_5_TIMES:
    0x08049cc1 <+242>:	mov    -0x10(%ebp),%eax               # Index i from 0 to 5
    0x08049cc4 <+245>:	mov    -0x4c(%ebp,%eax,4),%edx        # Get i-th char
    0x08049cc8 <+249>:	mov    -0x10(%ebp),%eax
    0x08049ccb <+252>:	add    $0x1,%eax
    0x08049cce <+255>:	mov    -0x4c(%ebp,%eax,4),%eax       # Get (i+1)-th char
    0x08049cd2 <+259>:	cmp    %eax,%edx                     # Check that the sequence is in increasing order, i.e. is sorted
    0x08049cd4 <+261>:	jle    0x8049cdd <check_disarm+270>
    0x08049cd6 <+263>:	mov    $0x0,%eax
    0x08049cdb <+268>:	jmp    0x8049cec <check_disarm+285>
    0x08049cdd <+270>:	addl   $0x1,-0x10(%ebp)               # Increment i
    0x08049ce1 <+274>:	cmpl   $0x5,-0x10(%ebp)               # Break if i == 5
    0x08049ce5 <+278>:	jle    0x8049cc1 <check_disarm+242>

   0x08049ce7 <+280>:	mov    $0x1,%eax
   0x08049cec <+285>:	mov    -0x4(%ebp),%ebx
   0x08049cef <+288>:	leave
   0x08049cf0 <+289>:	ret
End of assembler dump.


Dump of assembler code for function phase_reverse:
   0x08049e03 <+0>:	push   %ebp
   0x08049e04 <+1>:	mov    %esp,%ebp
   0x08049e06 <+3>:	push   %ebx
   0x08049e07 <+4>:	sub    $0x24,%esp
   0x08049e0a <+7>:	call   0x8049840 <__x86.get_pc_thunk.bx>
   0x08049e0f <+12>:	add    $0xbb1e5,%ebx
   0x08049e15 <+18>:	call   0x80499b5 <read_input>
   0x08049e1a <+23>:	movl   $0x0,-0x1c(%ebp)
   0x08049e21 <+30>:	sub    $0xc,%esp
   0x08049e24 <+33>:	lea    -0x1c(%ebp),%eax
   0x08049e27 <+36>:	push   %eax
   0x08049e28 <+37>:	lea    -0x18(%ebp),%eax
   0x08049e2b <+40>:	push   %eax
   0x08049e2c <+41>:	lea    -0x14(%ebp),%eax
   0x08049e2f <+44>:	push   %eax
   0x08049e30 <+45>:	lea    -0x36dc7(%ebx),%eax
   0x08049e36 <+51>:	push   %eax
   0x08049e37 <+52>:	lea    0x124c(%ebx),%eax
   0x08049e3d <+58>:	push   %eax
   0x08049e3e <+59>:	call   0x804de90 <__isoc99_sscanf>      # scanf of "%d %d %d"
   0x08049e43 <+64>:	add    $0x20,%esp
   0x08049e46 <+67>:	mov    %eax,-0xc(%ebp)
   0x08049e49 <+70>:	cmpl   $0x3,-0xc(%ebp)                  # check that 3 values were read by scanf
   0x08049e4d <+74>:	je     0x8049e66 <phase_reverse+99>
   0x08049e4f <+76>:	sub    $0xc,%esp
   0x08049e52 <+79>:	lea    -0x36dbe(%ebx),%eax
   0x08049e58 <+85>:	push   %eax
   0x08049e59 <+86>:	call   0x8059e80 <puts>
   0x08049e5e <+91>:	add    $0x10,%esp
   0x08049e61 <+94>:	call   0x8049965 <explode>

# Check that the 3 inputs are not negative
   0x08049e66 <+99>:	mov    -0x14(%ebp),%eax                 # First char of input
   0x08049e69 <+102>:	test   %eax,%eax
   0x08049e6b <+104>:	js     0x8049e7b <phase_reverse+120>
   0x08049e6d <+106>:	mov    -0x18(%ebp),%eax                 # Second char of input
   0x08049e70 <+109>:	test   %eax,%eax
   0x08049e72 <+111>:	js     0x8049e7b <phase_reverse+120>
   0x08049e74 <+113>:	mov    -0x1c(%ebp),%eax                 # Third char of input
   0x08049e77 <+116>:	test   %eax,%eax
   0x08049e79 <+118>:	jns    0x8049e92 <phase_reverse+143>
   0x08049e7b <+120>:	sub    $0xc,%esp
   0x08049e7e <+123>:	lea    -0x36daa(%ebx),%eax
   0x08049e84 <+129>:	push   %eax
   0x08049e85 <+130>:	call   0x8059e80 <puts>
   0x08049e8a <+135>:	add    $0x10,%esp
   0x08049e8d <+138>:	call   0x8049965 <explode>

   0x08049e92 <+143>:	mov    -0x14(%ebp),%edx
   0x08049e95 <+146>:	mov    -0x18(%ebp),%eax
   0x08049e98 <+149>:	add    %eax,%edx
   0x08049e9a <+151>:	mov    -0x1c(%ebp),%eax
   0x08049e9d <+154>:	add    %edx,%eax
   0x08049e9f <+156>:	mov    %eax,-0x10(%ebp)                 # $ebp - 0x10 == input[0] + input[1] + input[2]
   0x08049ea2 <+159>:	cmpl   $0xffffffff,-0x10(%ebp)          # The sum must be == 0xffffffff
   0x08049ea6 <+163>:	je     0x8049ebf <phase_reverse+188>
   0x08049ea8 <+165>:	sub    $0xc,%esp
   0x08049eab <+168>:	lea    -0x36da0(%ebx),%eax
   0x08049eb1 <+174>:	push   %eax
   0x08049eb2 <+175>:	call   0x8059e80 <puts>
   0x08049eb7 <+180>:	add    $0x10,%esp
   0x08049eba <+183>:	call   0x8049965 <explode>
   0x08049ebf <+188>:	nop
   0x08049ec0 <+189>:	mov    -0x4(%ebp),%ebx
   0x08049ec3 <+192>:	leave
   0x08049ec4 <+193>:	ret
End of assembler dump.


Dump of assembler code for function phase_disposal:
   0x08049ec5 <+0>:	push   %ebp
   0x08049ec6 <+1>:	mov    %esp,%ebp
   0x08049ec8 <+3>:	push   %ebx
   0x08049ec9 <+4>:	sub    $0x14,%esp
   0x08049ecc <+7>:	call   0x8049840 <__x86.get_pc_thunk.bx>

   0x08049ed1 <+12>:	add    $0xbb123,%ebx
   0x08049ed7 <+18>:	movb   $0x0,-0xd(%ebp)         # disposal_mode value
   0x08049edb <+22>:	movb   $0x0,-0xe(%ebp)         # check_light value
   0x08049edf <+26>:	movl   $0x0,-0x14(%ebp)
   0x08049ee6 <+33>:	movw   $0x0,-0x10(%ebp)
   0x08049eec <+39>:	jmp    0x804a080 <phase_disposal+443>

LOOP_FOR_4_TIMES:
   0x08049ef1 <+44>:	mov    0x54(%ebx),%eax                       # Increment value at $ebx + 0x54, which starts at -1
   0x08049ef7 <+50>:	add    $0x1,%eax
   0x08049efa <+53>:	mov    %eax,0x54(%ebx)
   0x08049f00 <+59>:	mov    0x54(%ebx),%eax

# On low attempts, print series of DING!
   0x08049f06 <+65>:	cmp    $0x2,%eax
   0x08049f09 <+68>:	jle    0x8049f78 <phase_disposal+179>
   0x08049f0b <+70>:	sub    $0xc,%esp
   0x08049f0e <+73>:	lea    -0x36d88(%ebx),%eax
   0x08049f14 <+79>:	push   %eax
   0x08049f15 <+80>:	call   0x8059e80 <puts>
   0x08049f1a <+85>:	add    $0x10,%esp
   0x08049f1d <+88>:	movl   $0x0,-0xc(%ebp)
   0x08049f24 <+95>:	jmp    0x8049f60 <phase_disposal+155>
   0x08049f26 <+97>:	sub    $0xc,%esp
   0x08049f29 <+100>:	lea    -0x36d36(%ebx),%eax
   0x08049f2f <+106>:	push   %eax
   0x08049f30 <+107>:	call   0x804df40 <printf>
   0x08049f35 <+112>:	add    $0x10,%esp
   0x08049f38 <+115>:	mov    $0x8105430,%eax
   0x08049f3e <+121>:	mov    (%eax),%eax
   0x08049f40 <+123>:	sub    $0xc,%esp
   0x08049f43 <+126>:	push   %eax
   0x08049f44 <+127>:	call   0x8059630 <fflush>
   0x08049f49 <+132>:	add    $0x10,%esp
   0x08049f4c <+135>:	sub    $0xc,%esp
   0x08049f4f <+138>:	push   $0x186a0
   0x08049f54 <+143>:	call   0x806ec90 <usleep>
   0x08049f59 <+148>:	add    $0x10,%esp
   0x08049f5c <+151>:	addl   $0x1,-0xc(%ebp)
   0x08049f60 <+155>:	cmpl   $0x9,-0xc(%ebp)
   0x08049f64 <+159>:	jle    0x8049f26 <phase_disposal+97>
   0x08049f66 <+161>:	sub    $0xc,%esp
   0x08049f69 <+164>:	lea    -0x36d2e(%ebx),%eax
   0x08049f6f <+170>:	push   %eax
   0x08049f70 <+171>:	call   0x8059e80 <puts>
   0x08049f75 <+176>:	add    $0x10,%esp

# Sequence to print informations
   0x08049f78 <+179>:	mov    $0x4,%edx
   0x08049f7d <+184>:	mov    0x54(%ebx),%eax                 # $ebx + 0x54 = nb of attempts
   0x08049f83 <+190>:	sub    $0x4,%esp
   0x08049f86 <+193>:	push   %edx
   0x08049f87 <+194>:	push   %eax
   0x08049f88 <+195>:	lea    -0x36d18(%ebx),%eax             # "\n\tAttempt: %d/%d\n"
   0x08049f8e <+201>:	push   %eax
   0x08049f8f <+202>:	call   0x804df40 <printf>              # Print "Attempt: x/4", with n = $ebx + 0x54
   0x08049f94 <+207>:	add    $0x10,%esp
   0x08049f97 <+210>:	movsbl -0xe(%ebp),%eax                 # $eax = check_light
   0x08049f9b <+214>:	sub    $0x8,%esp
   0x08049f9e <+217>:	push   %eax
   0x08049f9f <+218>:	lea    -0x36d06(%ebx),%eax             # "\tCheck light: %d\n"
   0x08049fa5 <+224>:	push   %eax
   0x08049fa6 <+225>:	call   0x804df40 <printf>              # Print "Check light: n", with n = $ebp - 0xe
   0x08049fab <+230>:	add    $0x10,%esp
   0x08049fae <+233>:	movsbl -0xd(%ebp),%eax                 # $eax = disposal_mode
   0x08049fb2 <+237>:	sub    $0x8,%esp
   0x08049fb5 <+240>:	push   %eax
   0x08049fb6 <+241>:	lea    -0x36cf4(%ebx),%eax             # "\tDisposal Mode: %d\n\n"
   0x08049fbc <+247>:	push   %eax
   0x08049fbd <+248>:	call   0x804df40 <printf>              # Print "Disposal Mode: n", with n = $ebp - 0xd
   0x08049fc2 <+253>:	add    $0x10,%esp
   0x08049fc5 <+256>:	sub    $0xc,%esp
   0x08049fc8 <+259>:	lea    -0x36eb4(%ebx),%eax
   0x08049fce <+265>:	push   %eax
   0x08049fcf <+266>:	call   0x804df40 <printf>              # Print "$ "
   0x08049fd4 <+271>:	add    $0x10,%esp
   0x08049fd7 <+274>:	sub    $0xc,%esp
   0x08049fda <+277>:	lea    -0x14(%ebp),%eax
   0x08049fdd <+280>:	push   %eax
   0x08049fde <+281>:	call   0x8059ca0 <gets>                # We can set the check_light and disposal_mode here using a buffer overflow
                                                             # The check_light is set to the 7th value of input, and disposal_mode to the 8th
   0x08049fe3 <+286>:	add    $0x10,%esp
   0x08049fe6 <+289>:	cmpb   $0x45,-0xe(%ebp)
   0x08049fea <+293>:	jne    0x804a008 <phase_disposal+323>  # Jump if disposal_mode is not 0x45 = 'E'

   0x08049fec <+295>:	sub    $0x4,%esp
   0x08049fef <+298>:	push   $0x6                            # n = 6
   0x08049ff1 <+300>:	mov    $0x80eb27c,%eax                 # "bypas5"
   0x08049ff7 <+306>:	push   %eax
   0x08049ff8 <+307>:	lea    -0x14(%ebp),%eax                # input
   0x08049ffb <+310>:	push   %eax
   0x08049ffc <+311>:	call   0x806b2e0 <strncmp>             # => Check if the first 6 chars of the input are "bypas5"
   0x0804a001 <+316>:	add    $0x10,%esp
   0x0804a004 <+319>:	test   %eax,%eax
   0x0804a006 <+321>:	je     0x804a01c <phase_disposal+343>

   0x0804a008 <+323>:	sub    $0xc,%esp
   0x0804a00b <+326>:	lea    -0x36cdf(%ebx),%eax
   0x0804a011 <+332>:	push   %eax
   0x0804a012 <+333>:	call   0x8059e80 <puts>                # Print "disposal robot malfunction"
   0x0804a017 <+338>:	add    $0x10,%esp
   0x0804a01a <+341>:	jmp    0x804a080 <phase_disposal+443>

   0x0804a01c <+343>:	movsbl -0xd(%ebp),%eax                 # Check if disposal_mode = 0x47 = 'G'
   0x0804a020 <+347>:	cmp    $0x47,%eax
   0x0804a023 <+350>:	je     0x804a09a <phase_disposal+469>
   0x0804a025 <+352>:	cmp    $0x47,%eax
   0x0804a028 <+355>:	jg     0x804a07b <phase_disposal+438>
   0x0804a02a <+357>:	cmp    $0x46,%eax
   0x0804a02d <+360>:	je     0x804a053 <phase_disposal+398>
   0x0804a02f <+362>:	cmp    $0x46,%eax
   0x0804a032 <+365>:	jg     0x804a07b <phase_disposal+438>
   0x0804a034 <+367>:	test   %eax,%eax
   0x0804a036 <+369>:	je     0x804a03f <phase_disposal+378>
   0x0804a038 <+371>:	cmp    $0x44,%eax
   0x0804a03b <+374>:	je     0x804a067 <phase_disposal+418>
   0x0804a03d <+376>:	jmp    0x804a07b <phase_disposal+438>
   0x0804a03f <+378>:	sub    $0xc,%esp
   0x0804a042 <+381>:	lea    -0x36cc4(%ebx),%eax
   0x0804a048 <+387>:	push   %eax
   0x0804a049 <+388>:	call   0x8059e80 <puts>
   0x0804a04e <+393>:	add    $0x10,%esp
   0x0804a051 <+396>:	jmp    0x804a080 <phase_disposal+443>
   0x0804a053 <+398>:	sub    $0xc,%esp
   0x0804a056 <+401>:	lea    -0x36ca8(%ebx),%eax
   0x0804a05c <+407>:	push   %eax
   0x0804a05d <+408>:	call   0x8059e80 <puts>
   0x0804a062 <+413>:	add    $0x10,%esp
   0x0804a065 <+416>:	jmp    0x804a080 <phase_disposal+443>
   0x0804a067 <+418>:	sub    $0xc,%esp
   0x0804a06a <+421>:	lea    -0x36c80(%ebx),%eax
   0x0804a070 <+427>:	push   %eax
   0x0804a071 <+428>:	call   0x8059e80 <puts>
   0x0804a076 <+433>:	add    $0x10,%esp
   0x0804a079 <+436>:	jmp    0x804a080 <phase_disposal+443>
   0x0804a07b <+438>:	call   0x8049965 <explode>

   0x0804a080 <+443>:	mov    0x54(%ebx),%eax                     # = 0xffffffff (= -1) at first
   0x0804a086 <+449>:	mov    $0x4,%edx
   0x0804a08b <+454>:	cmp    %edx,%eax
   0x0804a08d <+456>:	jle    0x8049ef1 <phase_disposal+44>
   0x0804a093 <+462>:	call   0x8049965 <explode>
   0x0804a098 <+467>:	jmp    0x804a09b <phase_disposal+470>
   0x0804a09a <+469>:	nop
   0x0804a09b <+470>:	mov    -0x4(%ebp),%ebx
   0x0804a09e <+473>:	leave
   0x0804a09f <+474>:	ret
End of assembler dump.
