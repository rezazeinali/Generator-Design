function y=E_coil(B, rg, L1, g, Li, alpha, N_coil, D_wire, beta_max, p, n, step)
fe=n*p/120;
we=2*pi*fe;
wm=2/p*we;

lamda=0;
for i=1:N_coil
    beta=beta_max-4*(i)*D_wire/rg;
    phi=phi_coil(B, rg, L1, Li, g, beta, alpha, step);
    ph_shift=round((2*(i)*D_wire/rg)/step);
    phi=circshift(phi, [0 -ph_shift]);
    lamda=lamda+phi;
%     plot(phi)
%     hold on
end

%plot(lamda)
%hold on
for i=1:length(lamda)-1
    y(i)=wm*(lamda(i+1)-lamda(i))/step;
end

end