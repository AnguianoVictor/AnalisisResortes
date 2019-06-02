function [ C,Nb,Lo,Sut,Ssy,Sy,Fi,Ti,Tgancho,Tcuerpo,Nygancho,Nycuerpo,Kbgancho,Kbcuerpo,K,Na] = CalcularExtension( d,ny,F,y,A,m,G,E )
%CALCULAREXTENSION Summary of this function goes here
%   Detailed explanation goes here
Sut = A/(d^m);
Ssy = 0.45*Sut;
Sy = 0.75*Sut;

a = 4;
b = ((Sy*pi*d^2)/(4*ny*F));
c = b-2;
p = [a b c];
r = (-1).*roots(p);
if r(1)<= 12 && r(1)>= 4
    C = r(1);
else
    C = r(2);
end

D = C*d
Ti = ((33500)/(exp(0.105*C)))-1000*(4-((C-3)/6.5));
Kbcuerpo = ((4*C+2)/(4*C-3));
Tcuerpo = ((8*Kbcuerpo*F*D)/(pi*d^3));
Fi = ((Ti*pi*d^3)/(8*Kbcuerpo*D));
Nycuerpo = Ssy/Tcuerpo;

C2 = 4;
Kbgancho = ((4*C2-1)/(4*C2-4));
Tgancho = ((8*Kbgancho*F*D)/(pi*d^3));
Nygancho = Ssy/Tgancho;

K = ((F-Fi)/y);
Na = (((d^4)*G)/(8*K*D^3));
Nb = (Na - (G/E));
Lo = (Nb+1)*d+2*(D-d);
end

