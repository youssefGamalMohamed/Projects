INCLUDE Irvine32.inc

.DATA
;----------------- Grenaral String ----------------------
M1 byte "Press 8: Solve Equation Till Third Degree",0
M2 byte "Press 2: Solve Combination",0
M3 Byte "Press 3: Find Percentage",0
M4 byte "Press 4: Solve Loge Base 10",0
M5 byte "Press 5: Find Roots of Second Order Equation",0
M6 byte "Press 6: Find Sin",0
M7 byte "Press 7: Find Cos",0
M8 byte "Press 0: End Program",0
M9 byte "Enter Choice",0
M10 byte "Press 1: Solve Two Equation",0
M11 byte "Invalid Choice",0
M12 byte "Bye Bye, We Will Miss You :)",0
M13 byte "The Scientific Calculator :)",0
M14 byte "Press 9: To Clear The Screen",0

;---------- rounding fun var-------------
Show real4 ?
expo byte ?
mantissa dword ?
leftMantissa dword ?
divisor dword 2
RightMantissa dword ?
point byte '.'

;--------- Calculate F(X) Variabel -------
Inputstring1 byte 30 dup(?),0
checksign1 byte 0
checkstar1 byte 0
a2 sdword ?
b2 sdword ?
c2 sdword ?
d2 sdword ?
XValue sdword ?
size2 dword ?
Value sdword 0 
Msg1 byte "Enter The Equation [Fist OR Second OR Third Degree]: ",0
Msg2 byte "Enter The Value Of X: ",0
Msg3 byte "The Result: ",0
Address1 dword ?


;------ Get Root Variabel -------
Inputstring byte 15 dup(?),0
checksign byte 0
checkstar byte 0
str1 byte "Imagnari Number",0
a1 sdword ?
b1 sdword ?
c1 sdword ?
result real8 ?
subresult sdword ?
size1 dword ?
Address2 dword ?

Msg4 byte "Enter The Equation : ",0
Msg5 byte "The Roots: ",0

;---------- Combination & Sin & Cos Variabel-------------------- 
const byte "Please enter (N) and (R) : ",0
const2 byte "(R) should be smaller than or equal (N), and greater than or equal (0), insert (R) again : ",0
N dword ?
R dword ?
fact_result dword ?
comb_result dword ?
X real8 ?
X1 real8 ?
X2 real8 ?
X3 real8 ?
power_result real8 ?
sin_result real8 ?
cos_result real8 ?
int_power_result dword ?
cosX real8 1.0
PI real8 3.14159265359
hundredeighty real8 180.0
const3 byte "Please enter (X) : ",0

;--------- data of Percentage --------------------
p real4 100.0
resp dword ?
mes1 byte "Enter x : ",0
mes2 byte "Enter y : ",0
mpoped dword ?
emes byte "INVALID OPERATION",0
resmessage byte "Result is : " , 0


;------- data of solve two equation ---------------------
enterfirsteq byte "Enter the first Equation of X and Y : ",0
entersecondeq byte "Enter the second Equation of X and Y : ",0
resultoftwoeduqtionx byte  "X : ",0
resultoftwoeduqtiony byte "Y : ",0
hasnosolution byte "Has No Solution",0
eq1 byte 30 dup(0),0 
eq2 byte 30 dup(0),0
checksign2 byte 0
checkstar2 byte 0
mydigit dword 0
check byte 0
a0 sdword ?
b0 sdword ?
c0 sdword ?
a3 sdword ?
b3 sdword ?
c3 sdword ?
a4 sdword ?
b4 sdword ?
c4 sdword ?
temp1 sdword ?
temp2 sdword ?
tempa2 sdword ?
temp3 sdword ?
fb1 real4 0.0
fc1 real4 0.0
yeq real4 0.0
xeq real4 0.0
finalanswerofx sdword ?
finalanswerofy sdword ?

;------------ data of Log base 10 -------------
numberoftens real4 0.0
counter dword 0
baseten real4 10.0
mylogarr real4  0.0 , 0.301 , 0.477 , 0.602 , 0.698 , 0.778 , 0.845 , 0.903 , 0.954 , 1.0 
last dword ?
logmessageinput byte "Enter the number : " , 0
logmessageoutput byte "The Result of Log10(number) is : " , 0 
notaccepted byte "NOT ACCEPTED ",0

;-----------------------main--------------
.code
main PROC

start:
mov eax, 0
mov ebx, 0
mov ecx, 0
mov edx, 0
mov esi, 0
mov edi, 0

mov edx,offset M13
call writestring
call crlf
call crlf

mov edx,offset M10
call writestring
call crlf

mov edx,offset M2
call writestring
call crlf

mov edx,offset M3
call writestring
call crlf

mov edx,offset M4
call writestring
call crlf

mov edx,offset M5
call writestring
call crlf

mov edx,offset M6
call writestring
call crlf

mov edx,offset M7
call writestring
call crlf

mov edx,offset M1
call writestring
call crlf

mov edx,offset M14
call writestring
call crlf

mov edx,offset M8
call writestring
call crlf
call crlf

mov edx,offset M9
call writestring
call crlf


call readdec 

cmp eax, 1
jne Next
call SolveTwoEqation
Jmp start

Next:
cmp eax, 2
jne Next1
call combination
Jmp start

Next1:
cmp eax, 3
jne Next2
call Percentage
Jmp start

Next2:
cmp eax, 4
Jne Next3
call Log10
Jmp start

Next3:
cmp eax, 5
Jne Next4
call GetRoot
Jmp start

Next4:
cmp eax, 6
Jne Next5
call sin
Jmp start

Next5:
cmp eax, 7
Jne Next6
call cos
Jmp start

Next6:
cmp eax, 8
Jne Next7
call GetValue
Jmp start

Next7:
cmp eax, 9
Jne Next8
call clrscr
Jmp start


Next8:
cmp eax, 0
Je out2
mov edx,offset M11
call writestring
call crlf
Jmp start

out2:
mov edx,offset M12
call writestring
call crlf

	exit
main ENDP
;--------------------end main-------------------

;------------------get coff fun ------------------
GetCoefficinet Proc

	L:
		cmp ecx,0
		je outofloop

		cmp byte ptr[esi],'='
		je equalorpositivie
		cmp byte ptr[esi],'+'
		je equalorpositivie
		cmp byte ptr[esi],'-'
		je negativesign
		cmp byte ptr[esi],'*'
		je multplication
		cmp byte ptr[esi],'x'
		je variablexy
		cmp byte ptr[esi],'y'
		je variablexy

		mov edx,0
		mul ebx
		movzx edi,byte ptr [esi]
		sub edi,48
		add eax,edi

		jmp G



		negativesign:
			mov checksign2,1
			mov checkstar2,0
			mov eax,0
		jmp G


		variablexy:
			cmp checkstar2,0
			je nocoefficinet
			jmp G

			nocoefficinet:
				cmp checksign2,1
				je nocoefficinetandnegativesign
				mov eax,1
				push eax
				mov eax,0
				jmp G 
				nocoefficinetandnegativesign:
					mov eax,-1
					push eax
					mov eax,0
				jmp G

		multplication:
			mov checkstar2,1
			cmp checksign2,1
			je negiationofnumber
			push eax
			mov eax,0
			jmp G

			negiationofnumber:
				neg eax
				push eax
				mov eax,0
			jmp G

		equalorpositivie:
			mov checksign2,0
			mov checkstar2,0
			mov eax,0

		G:
			inc esi
			dec ecx
	jmp L



	outofloop:

	cmp checksign2,1
	je NNN
	jmp NNNN
	NNN:
		neg eax

	NNNN:
		push eax

	pop eax
	mov c0,eax

	pop eax
	mov b0,eax

	pop eax
	mov a0,eax

	ret
GetCoefficinet EndP
;------------- end of get coff fun ---------------------------

;------------- solve 2 eq ----------------------
SolveTwoEqation Proc
	mov edx,offset enterfirsteq
	call writestring 


	mov edx,offset eq1
	mov ecx, LENGTHOF eq1
	call readstring
	mov ecx,eax

	mov eax,0
	mov esi,offset eq1
	mov ebx,10

	call GetCoefficinet

	
	mov eax,a0
	mov a1,eax

	mov eax,b0
	mov b1,eax

	mov eax,c0
	mov c1,eax

	mov edx,offset entersecondeq
	call writestring


	mov edx,offset eq2
	mov ecx, LENGTHOF eq2
	call readstring
	mov ecx,eax

	mov eax,0
	mov esi,offset eq2
	mov ebx,10
	mov checkstar,0
	mov checksign,0
	mov mydigit,0
	mov a0,0
	mov b0,0
	mov c0,0
	call GetCoefficinet

	
	mov eax,a0
	mov a2,eax
	mov eax,b0
	mov b2,eax
	mov eax,c0
	mov c2,eax

	mov edi,a2
	mov tempa2,edi


	mov eax , a2
	neg eax
	mov  temp3,eax 
	fild temp3 
	fild a1
	fdiv 

	
	fild b1
	fmul st(0),st(1)
	fstp fb1

	fild c1
	fmul st(0),st(1)
	fstp fc1


	
	finit
	fld fc1
	fild c2
	fadd
	fld fb1
	fild b2
	fadd
	fldz
	fcomi st(0),st(1)
	je invaldeq
	fistp temp3
	fdiv
	fstp yeq	
	


	fild c2
	fld yeq
	fild b2
	fmul 
	fsub

	fild a2
	fdiv 
	fstp xeq


	fld xeq
	fistp finalanswerofx

	fld yeq
	fistp finalanswerofy

	mov eax,finalanswerofx
	mov edx,offset resultoftwoeduqtionx
	call writestring
	call writeint 
	call crlf

	mov eax,finalanswerofy
	mov edx,offset resultoftwoeduqtiony
	call writestring
	call writeint 
	call crlf

	jmp hassol
	invaldeq:
		mov edx,offset hasnosolution
		call writestring
		call crlf 
	hassol:

	ret
SolveTwoEqation EndP
;---------- end solve 2 eq ----------------------------

;---------- % fun -------------------------------------
Percentage proc
	I: finit	
	mov edx,offset mes1
	call writestring 
	call READFLOAT    
	mov edx,offset mes2
	call writestring
	call READFLOAT    
	fcomi st(0),st(1)
	jb K
	fldz 
	fcomi st(0),st(1)
	je K
	fstp mpoped
	fdiv              
	fld p	             
	fmul              
	mov edx,offset resmessage
	call writestring
	fist resp
	mov eax,resp
	call writedec
	mov eax,'%'
	call writechar
	call crlf
	jmp Q
	K:
		mov edx,offset emes
		call writestring
		call crlf
		jmp I
	Q:
	call crlf
    ret 
Percentage EndP
;---------------------- end % fun -------------------------

;---------------------- log10 fun--------------------------
Log10 proc
	I: finit
	mov edx,offset logmessageinput
	call writestring 
	call readdec
	cmp eax,0
	je K
	mov esi,10
	mov ebx,eax
	mov edx,0
	div esi
	cmp edx,0
	jne K
	mov eax,ebx
	L:
		mov edx,0
		div esi
		cmp edx,0
		jne O
		inc counter		
	jmp L
	O:
		fild counter
		dec edx
		fld  mylogarr[edx*4]
		fadd 
		mov edx,offset logmessageoutput
		call writestring
		fst Show
		call Round
		call crlf

	jmp M
	K:
		mov edx,offset  notaccepted
		call writestring 
		call crlf
		jmp I
	M:
	call crlf
	ret
Log10 EndP
;-----------------end log 10----------------

;--------------------combination proc uses ecx,eax,and edx ------------------------
combination PROC uses ecx eax edx
	mov edx,offset const
	call writestring
	call crlf
		;reading (N) and (R).
	call readint
	mov N,eax
	call readint
	mov R,eax
			;if (N) equal (R).
	cmp N,eax
	jne ok2
	mov eax,1
	mov comb_result,eax
	call writedec
	call crlf
	ret 
	ok2:
			;(R) should be N>=R>=0. 
	cmp N,eax
	jnb ok
	up:
	mov edx,offset const2
	call writestring
	call crlf
	call readint
	mov R,eax
		;if (R) is invaled enter it again N<R.
	cmp N,eax
	jb up
		;if (R) is invaled enter it again R<0.
	cmp R,0
	jb up
		;if (R) is valid.
	ok:
		;put the value to get it's factorial in ecx it will return in fact_result.
	mov ecx,N
	call factorial
	mov esi,fact_result
	mov ecx,R
	call factorial
	mov ebx,fact_result
	mov ecx,N
	sub ecx,R
	call factorial
	mov edx,fact_result
	mov eax,ebx
	mul edx
	mov edi,eax
	mov edx,0
	mov eax,esi
	div edi
	mov comb_result,eax
	call writedec
	call crlf
	call crlf
ret
combination ENDP
;--------------- End Combination -------------------------

;------------------------ we calculate factorial of ecx, and return the result in fact_result, it uses eax and ecx. ----------------------
factorial PROC uses eax ecx 
	mov eax, ecx
L1:
	cmp ecx,0
	je one
	cmp ecx, 1
	jbe stop
	dec ecx
	mul ecx
	jmp L1
stop:
	mov fact_result,eax
	jmp fin
one:
	mov fact_result,1
fin:
ret
factorial ENDP
;-------------- End Factorial ----------------

;------------- Sin PROC --------------------
sin PROC
finit
mov edx,offset const3
	call writestring
	call crlf
	call readfloat
	fst X
	fmul PI
	fdiv hundredeighty
	fst X
		;get X1
	mov ecx,3
	call get_x
	fst X1
		;get X2
	fld X
	mov ecx,5
	call get_x
	fst X2
		;get X3
	fld X
	mov ecx,7
	call get_x
	fst X3
	fld X
	fsub X1
	fadd X2
	fsub X3
	fst sin_result
	call writefloat
	call crlf
	call crlf
ret
sin ENDP
;----------------- End Sin ---------------------

;-------------power proc take the base in X and the power in ecx return the result as integer in N and as float in power_result uses ecx,eax---------
power PROC uses ecx eax
dec ecx
L:
fmul X
loop L
fst power_result
FIST int_power_result
ret
power ENDP
;------------- End Power --------------

;------------------------ get_x proc take the value in ecx and calculate (X^(ecx)/(ecx)!) uses ecx ---------------------------------
get_x PROC uses ecx
	call power
	call factorial
	fld power_result
	fild fact_result
	fdiv
ret
get_x ENDP

;------------------------ Cos PROC ------------------------
cos PROC
finit
mov edx,offset const3
	call writestring
	call crlf
	call readfloat
	fst X
	fmul PI
	fdiv hundredeighty
	fst X
		;get X1
	mov ecx,2
	call get_x
	fst X1
		;get X2
	fld X
	mov ecx,4
	call get_x
	fst X2
		;get X3
	fld X
	mov ecx,6
	call get_x
	fst X3
	fld cosX
	fsub X1
	fadd X2
	fsub X3             
	fst cos_result
	call writefloat
	call crlf
	call crlf
ret
cos ENDP
;------------- End Cos -----------------------------

;------------ Calculate F(x) Fun ------------------
GetValue Proc
pop eax
mov Address1, eax

mov edx, offset Msg1
call writeString
call crlf

mov edx, offset Inputstring1
mov ecx, lengthof Inputstring1 
call readstring
mov ecx, eax
mov size2, eax
mov esi, offset Inputstring1

mov edx, offset Msg2
call writeString
call crlf

call readint
mov XValue, eax

;---------------- Get Coff Part ----------------------------
mov ebx,10
mov eax, 0

	L:
		cmp ecx,0
		je outofloop

		cmp byte ptr[esi],'+'
		je equalorpositivie
		cmp byte ptr[esi],'-'
		je negativesign
		cmp byte ptr[esi],'*'
		je multplication
		cmp byte ptr[esi],'X'
		je variablex

		mov edx,0
		imul ebx
		movzx edi,byte ptr [esi]
		sub edi,48
		add eax,edi

		jmp G



		negativesign:
			mov checksign1,1
			mov checkstar1,0
			mov eax,0
		jmp G

		variablex:
			cmp checkstar1,0
			je nocoefficinet
			jmp G

			nocoefficinet:
				cmp checksign1,1
				je nocoefficinetandnegativesign
				mov eax,1
				push eax
				mov eax,0
				jmp G 
				nocoefficinetandnegativesign:
					mov eax,-1
					push eax
					mov eax,0
				jmp G

		multplication:
			mov checkstar1,1
			cmp checksign1,1
			je negiationofnumber
			push eax
			mov eax,0
			jmp G

			negiationofnumber:
				neg eax
				push eax
				mov eax,0
			jmp G

		equalorpositivie:
			mov checksign1,0
			mov checkstar1,0
			mov eax,0

		G:
			inc esi
			dec ecx
	jmp L



	outofloop:

	cmp checksign1,1
	je NNN
	jmp NNNN
	NNN:
		neg eax

	NNNN:
		push eax

	pop eax
	mov d2, eax 

	pop eax
	mov c2, eax

	pop eax
	mov b2, eax
	
	pop eax
	mov a2, eax
;-------------------- Get Coff Part --------------------------	

mov esi, 1
mov ecx, size2
mov ebx, 0 

l5: 
cmp Inputstring1 [esi] , '+'
jne A
inc ebx

A:cmp Inputstring1 [esi], '-'
jne K
inc ebx

K:
inc esi
loop l5

cmp ebx, 3
je Third

Cmp ebx, 2
je Second
jmp First

Third:
mov edi, 0
mov esi, 0
mov ecx, size2
l9:
cmp Inputstring1[esi], '^'
jne next

inc esi
mov eax, 0
mov al, Inputstring1[esi]
sub al, 48
mov ebx, ecx
mov ecx, eax
sub ecx, 1 
mov eax, XValue
l19:
imul XValue
loop l19

cmp edi, 0
je Q
imul b2
add Value, eax
mov ecx, ebx
dec esi
jmp next

Q:
imul a2
add Value, eax
mov ecx, ebx
dec esi
inc edi

next:
inc esi
loop l9

mov eax, XValue
imul c2
add Value, eax

mov eax, d2
add Value, eax

mov edx, offset Msg3
call writeString

mov eax, Value
call writeint
call crlf
Jmp EFinal

Second:
mov esi, 0
mov ecx, size2

l7:
cmp Inputstring1[esi], '^'
jne next1

inc esi
mov eax, 0
mov al, Inputstring1[esi]
sub al, 48
mov ebx, ecx
mov ecx, eax
sub ecx, 1 
mov eax, XValue
l17:
imul XValue
loop l17
imul b2
add Value, eax
mov ecx, ebx
dec esi

next1:
inc esi
loop l7

mov eax, XValue
imul c2
add Value, eax

mov eax, d2
add Value, eax

mov edx, offset Msg3
call writeString

mov eax, Value
call writeint
call crlf
Jmp EFinal

First:
mov eax, XValue
imul c2
add Value, eax
mov eax, d2
add Value, eax

mov edx, offset Msg3
call writeString

mov eax, Value 
call writeint
call crlf

EFinal:
call crlf
push Address1
	ret
GetValue EndP
;------ End of Calc F(x) Fun ---------------

;-------- Get Root Fun----------------------
GetRoot Proc
pop eax
mov Address2, eax

mov edx, offset Msg4
call writeString
call crlf

mov edx, offset Inputstring
mov ecx, lengthof Inputstring 
call readstring
mov ecx, eax
mov size1, eax
mov esi, offset Inputstring

;--------------- Get Coff Part ---------------------
mov ebx,10
mov eax, 0

	L:
		cmp ecx,0
		je outofloop

		cmp byte ptr[esi],'+'
		je equalorpositivie
		cmp byte ptr[esi],'-'
		je negativesign
		cmp byte ptr[esi],'*'
		je multplication
		cmp byte ptr[esi],'X'
		je variablex

		mov edx,0
		mul ebx
		movzx edi,byte ptr [esi]
		sub edi,48
		add eax,edi

		jmp G



		negativesign:
			mov checksign,1
			mov checkstar,0
			mov eax,0
		jmp G

		variablex:
			cmp checkstar,0
			je nocoefficinet
			jmp G

			nocoefficinet:
				cmp checksign,1
				je nocoefficinetandnegativesign
				mov eax,1
				push eax
				mov eax,0
				jmp G 
				nocoefficinetandnegativesign:
					mov eax,-1
					push eax
					mov eax,0
				jmp G

		multplication:
			mov checkstar,1
			cmp checksign,1
			je negiationofnumber
			push eax
			mov eax,0
			jmp G

			negiationofnumber:
				neg eax
				push eax
				mov eax,0
			jmp G

		equalorpositivie:
			mov checksign,0
			mov checkstar,0
			mov eax,0

		G:
			inc esi
			dec ecx
	jmp L



	outofloop:

	cmp checksign,1
	je NNN
	jmp NNNN
	NNN:
		neg eax

	NNNN:
		push eax

	pop eax
	mov c1, eax 

	pop eax
	mov b1, eax

	pop eax
	mov a1, eax
;--------------- Get Coff Part ---------------------
mov esi, 1
mov ecx, size1
mov ebx, 0 
mov edx, 0

l5: 
cmp Inputstring [esi] , '+'
jne A
inc ebx

A:cmp Inputstring [esi], '-'
jne H
inc ebx

H: cmp Inputstring [esi], '^'
jne K
mov edx, 1

K:
inc esi
loop l5

cmp ebx, 2
je Second

cmp edx, 1
je Temp
mov eax, c1
neg eax
mov c1, eax
fild c1
fidiv b1
fst Show
jmp Final

Temp:
mov eax, b1
mov b1, 0
mov a1, eax

Second:
mov eax,b1
mul eax
mov ebx, eax

mov eax, 4
mul a1
mul c1
mov ecx, eax

cmp ebx, ecx
Jnl l1

mov edx, offset Msg5
call writeString
call crlf

mov edx, offset str1
call writeString
Jmp EFinal

l1:
mov eax, 2
mul a1
mov a1,eax

sub ebx, ecx
mov subresult, ebx
fild subresult
fst result
fsqrt 
fst result
fst subresult

mov edx, offset Msg5
call writeString
call crlf

mov eax, b1
neg eax
mov b1, eax

fild b1
fadd result
fst result
fidiv a1
fst Show

call Round

fild b1
fsub subresult
fst subresult
fidiv a1
fst subresult

call writefloat
call crlf 

jmp EFinal

Final:
mov edx, offset Msg5
call writeString
call crlf
call Round
call crlf

EFinal:
push Address2
call crlf
	ret
GetRoot EndP
;------------- End Get Root Fun --------------

;--------- Rounding (value in Show) ------------
Round Proc
mov ecx, 0
mov eax, Show
shl eax, 1
jc llast

mov eax, Show
shr eax, 23
add al, -127
mov expo, al

mov eax, Show
and eax, 07fffffh
shl eax, 8
or eax, 80000000h
mov mantissa, eax
mov cl, 32
inc expo
sub cl, expo
shr eax, cl
mov leftMantissa, eax

mov ecx, 31
sub cl,  expo

lb:
bt mantissa, ecx
jnc l
mov eax, 10000
mov edx, 0
div divisor
add RightMantissa, eax
l:
shl divisor, 1
dec ecx
cmp ecx,7
jne lb

mov eax, leftMantissa
call writedec 

mov  edx, offset point
call writestring 

mov eax, RightMantissa
call writedec 
call crlf
jmp finsh

llast:
call writefloat
call crlf

finsh:
call crlf

ret
Round EndP
;----------------------------rounding end----------------------

END main
