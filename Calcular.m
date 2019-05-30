function [C,Kb,Sut,Ssy,K,Ts,ns,Na,Ne,Nt,Ls,Lo,p] = Calcular(TipoResorte,D,d,Zeta,F,y,A,m,G)
%% Entradas
% TipoResorte = Tipo de terminales del resorte+
% d = diametro propuesto
% Zeta 
% F = Fuerza Máxima
% A 
% m
% G

%% Salidas
C = D/d ;
Kb = ((4*C)+2)/((4*C)-3);
Sut =  A/(d^m);
Ssy = 0.45*Sut;
K = F/y;
Ts = (Kb*(8+8*Zeta)*F*D)/(pi*(d^3));
ns = Ssy/Ts;
Na = (G*(d^4)*y)/(8*(D^3)*F);
switch TipoResorte
    case 1
        Ne = 0;
        Nt = Na;
        Ls = d*(Nt+1);
        Lo = 1.15*y + Ls;
        p = (Lo - d)/Na;
    case 2
        Ne = 1;
        Nt = Na+1;
        Ls = d*(Nt);
        Lo = 1.15*y+Ls;
        p = (Lo)/(Na+1);
    case 3
        Ne = 2;
        Nt = Na+2;
        Ls = d*(Nt+1);
        Lo = 1.15*y + Ls;
        p = (Lo - 3*d)/Na;
    case 4
        Ne = 2;
        Nt = Na+2;
        Ls = d*(Nt);
        Lo = 1.15*y + Ls;
        p = (Lo - 2*d)/Na;
    otherwise
        
end

end

