
clear all
clc
L_coil=1e-3:1e-3:60e-3;
global B
B=xlsread('D:\ANDAR project\Slotless BLDC motor\EC2Pole\Analytic Design\Bg\Bg2.xls');
for i=1:length(L_coil)
    E_max(i)=Opt_L(L_coil(i));
end
plot(E_max)