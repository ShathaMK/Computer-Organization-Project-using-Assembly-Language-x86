[org 0x100]   

jmp start   

num: dw 10,6,14,3,5,15,8,12,9,13,12,7,11   
even: dw 0,0,0,0,0,0   
min: dw 0    
fact: dw 0  

start:   
mov bx,0   
mov di,0   
mov si,0   
call en   
call end   


en:  ;seperate even from array of numbers 
mov ax,[num+si]   
mov bx,2   
div bx    
cmp si,26  
je mi   
cmp dx,0   
je store  
jne again   
 
store:   ;store even numbers in even array
mul bx   
mov [even+di],ax   
add di,2   
add si,2   
loop en   

  

again:  ;Skip Odd numbers  
add si,2   
loop en   

mi:   ; Find minimum number from even array and store it in min array
mov ax,[even]   
mov bx,0   
mov [min],ax   
call checkmin   

  
checkmin:  ;compare each array indes numbers and store the min
add bx,2   
mov ax,[even+bx]   
cmp bx,14   
je fa   
cmp ax,[min]   
jg checkmin   
mov [min],ax   
loop checkmin   
 

fa: ; find the factorial of minimum number

mov ax,[min] 
mov bx,[min] 
again1:sub bx,1 
mul bx 
cmp bx,1 
jne again1 
mov [fact],ax   
Call end 


end: mov ax,0x4c00   ; terminate the program
int 0x21 

