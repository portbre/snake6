10 rem char(42)  apple (*) 
20 rem char(250) snake body part (small square) 
30 rem A joystick on port #1 is read through address 56321/$DC01, and one on control port #2 are read via address 56320/$DC00
31 rem Bit 0 (weight 1) goes low if the "up" switch is activated,
32 rem Bit 1 (weight 2) goes low if the "down" switch is activated,
33 rem Bit 2 (weight 4) goes low if the "left" switch is activated,
34 rem Bit 3 (weight 8) goes low if the "right" switch is activated,
35 rem Bit 4 (weight 16) goes low if the fire button is pressed.
45 rem j=128  no joystick action detected
55 rem l = length of snake in characters
60 rem j = this joystick direction
65 rem k = last joystick direction

100 print"{clear}":l=5:x=20:y=10:dimz(1024):k=132
105 rem print apple randomly on screen
110 ifu=0thenr=1024+rnd(0)*1000:ifpeek(r)=32thenpoker,42:u=1
115 rem read joystick direction (j) - if none, set j to last joystick dir k
120 j=255-peek(56320):ifj=128thenj=k
130 ifjand1theny=y-1:goto170
140 ifjand2theny=y+1:goto170
150 ifjand4thenx=x-1:goto170
160 ifjand8thenx=x+1
170 ifx<0orx>39ory<0ory>24then230
180 c=1024+40*y+x:k=j
190 ifpeek(c)=42thenl=l+1:u=0
200 ifpeek(c)=250then230
205 rem draw snake head ; add snake head screen location to z array
210 pokec,250:z(n)=c:n=n+1:ifn<=lthen110
215 rem blank snake tail ; shift z array (tail-1 becomes tail)
220 pokez(0),32:form=1ton:z(m-1)=z(m):nextm:n=n-1:goto110
230 print"{down*10}game over":print"score:";l-5

