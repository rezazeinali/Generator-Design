clc
clear all

B=xlsread('D:\ANDAR project\Slotless BLDC motor\EC2Pole\Analytic Design\Bg\Bg2.xls');

p=2;
step=0.01;

L_coil=30e-3;
Lstk=80e-3;
L1=L_coil;

Bbc=1.2;
%Bg=max(B);
%Bg=0.6;

phi_p=abs(sum(B(1:round(length(B)/p))))*step;

D_wire=0.52e-3;
Do=0.0385;
%Ds=Do*(2*Bbc/(2*Bbc+phi_p))
Ds=26e-3;
%D_coil=Ds-2*4*D_wire
D_coil=20.5e-3;
h_bc=(Do-Ds)/2;

rc=D_coil/2;
rg=Ds/2-2*D_wire;
g=2.505e-3;
Li=14e-3;


a=4;

gama=360/3/p;
t=rc*gama*pi/180;

b1=2*pi/p/2;
syms alpha1
alpha=double(solve(alpha1-2*atan(2*(t*cos(alpha1/2)/rc+b1)*rc/(Lstk-L1))==0, alpha1));

w0=t*cos(alpha/2);
b0=w0/rc;

N_coil=floor(w0/((a/2)*D_wire));
beta_max=2*(b0+b1);

n=14000;
% B=xlsread('D:\ANDAR project\Slotless BLDC motor\Reports\1\Bg.xls');

y=E_coil(B, rg, L1, g, Li, alpha, N_coil, D_wire, beta_max, p, n, step);
 E_max=max(y);
