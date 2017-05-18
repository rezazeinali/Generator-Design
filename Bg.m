function B=Bg(teta, g, Li, rm, rg)

%magnet characteristic
Br=1.2;
ur=1.1;
%Bm=k*Br*lm/(lm+ur*g);
g_eff=g;
%g_eff=0;
teta_g_eff=g_eff/rm;
n=length(teta);

C_phi=rm/rg;
%C_phi=0.5;
lm1=rm-(Li/2)/sin(teta_g_eff+pi/4);
Bg1=C_phi*Br*lm1/(lm1+ur*g*C_phi);

for i=1:n
    if teta(i) >= 0 && teta(i) <=teta_g_eff
        B(i)=(Bg1/teta_g_eff)*teta(i);
    elseif teta(i) > teta_g_eff && teta(i) <=pi/2-teta_g_eff
        lm=rm-(Li/2)/sin(teta(i)+pi/4);
        Bg=C_phi*Br*lm/(lm+ur*g*C_phi);
        B(i)=Bg;
    elseif teta(i) > pi/2-teta_g_eff && teta(i) <=pi/2+teta_g_eff
        B(i)=-(Bg1/teta_g_eff)*(teta(i)-pi/2);
    elseif  teta(i) > pi/2+teta_g_eff && teta(i) <=pi-teta_g_eff
        lm=rm-(Li/2)/sin(teta(i)-pi/4);
        Bg=C_phi*Br*lm/(lm+ur*g*C_phi);
        B(i)=-Bg;
    elseif  teta(i) > pi-teta_g_eff && teta(i) <=pi+teta_g_eff
        B(i)=(Bg1/teta_g_eff)*(teta(i)-pi);
    elseif teta(i) > pi+teta_g_eff && teta(i) <=3*pi/2-teta_g_eff
        lm=rm-(Li/2)/sin(teta(i)-3*pi/4);
        Bg=C_phi*Br*lm/(lm+ur*g*C_phi);
        B(i)=Bg;
    elseif teta(i) > 3*pi/2-teta_g_eff && teta(i) <=3*pi/2+teta_g_eff
        B(i)=-(Bg1/teta_g_eff)*(teta(i)-3*pi/2);
    elseif teta(i) > 3*pi/2+teta_g_eff && teta(i) <=2*pi-teta_g_eff
        lm=rm-(Li/2)/sin(teta(i)-5*pi/4);
        Bg=C_phi*Br*lm/(lm+ur*g*C_phi);
        B(i)=-Bg;
    elseif teta(i) > 2*pi-teta_g_eff && teta(i) <=2*pi+teta_g_eff
        B(i)=(Bg1/teta_g_eff)*(teta(i)-2*pi);
    else
        B(i)=0;
    end
end
plot(B)
end

