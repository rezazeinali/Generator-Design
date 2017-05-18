function y=phi_coil(B, rg, L1, Li, g, beta, alpha, step)
teta=0:step:4*pi;
%B=Bg(teta, g, Li, rm, rg);
B=B';
B=[B, B];
teta_s=0:step:2*pi;

for i=1:length(teta_s)
    teta1=teta(round(teta_s(i)/step+1):round((teta_s(i)+beta)/step+1));
    teta2=teta(round(teta_s(i)/step+1):round((teta_s(i)+beta/2)/step+1));
    teta3=teta(round((teta_s(i)+beta/2)/step+1):round((teta_s(i)+beta)/step+1));

    B1=B(round(teta_s(i)/step+1):round((teta_s(i)+beta)/step+1));
    B2=B(round(teta_s(i)/step+1):round((teta_s(i)+beta/2)/step+1));
    B3=B(round((teta_s(i)+beta/2)/step+1):round((teta_s(i)+beta)/step+1));

    y1=rg*L1*trapz(teta1, B1);
    y2=(rg^2/tan(alpha/2))*trapz(teta2, B2.*(teta2-teta_s(i)));
    y3=(rg^2/tan(alpha/2))*trapz(teta3, B3.*(teta_s(i)+beta-teta3));
    y(i)=y1+2*(y2+y3);
end

end