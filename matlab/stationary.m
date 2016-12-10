

r = 100;
step = .1;
s=80:step:120;

%res = s-r/(s.^2*(s.^2-r.*s+r.^2+10));
slip = (s-r);
den = (Rr^2+(Lr.*slip).^2);
res2 = slip.*Rr./den; % (s.^2*(s.^2-r.*s+r.^2+10));
d1 = [diff(den)./step, 0];
plot(slip, res2, slip, slip, slip, den, slip, d1);
legend('Torq', 'slip', 'den', 'd1')
grid;

motor_type = 4;
setMotorParams;
Ls = Ls/10;

compute_supp_ref = 1;
compute_psy_ref = 0;
compute_sym = 0;


B = [1/Ls/sig, 0;
    0, 1/Ls/sig;
    0, 0;
    0, 0];

% om_supply = 0:10:500;
% om_rotor = 202;
%4.45
%om_supply = 33.6;
%om_rotor = 30;

om_supply = 100;
om_rotor = 99.9;
om_coord = om_supply;

u = [200;0];
    
%
% D-Q reference is the supply
%

if compute_supp_ref

    B1 = B;
    u1 = u;
    %u1 = rotMat*u;
    
    A34 = om_coord-om_rotor;
    A31 = Lm*Rr/Lr;
    A32 = -Rr/Lr;
    A11 = -R2/(Ls * sig);
    A13 = Lm*Rr/(Ls * sig * Lr*Lr);
    A14 = Lm*om_rotor/(Ls*sig*Lr);

    A = [A11,  om_coord,  A13,  A14;
        -om_coord,  A11,  -A14,   A13;
        A31,  0,  A32,  A34;
        0,   A31,  -A34  A32];

    x = A\(-B1*u1)
    i_vec = x(1:2);
    psy_vec = x(3:4);
    m = i_vec.*flipud(psy_vec);
    [psy_theta, psy_amp] = cart2pol(psy_vec(1), psy_vec(2))
    [i_theta, i_amp] = cart2pol(i_vec(1), i_vec(2))
    m = m(2)-m(1);
    m = m*3/2*Lm/Lr
    i_stat = norm(x(1:2))
    %psy = norm(x(3:4))
    
    a = (-B1*u1);
    a = a(1);
    A_inv = inv(A);
    x = A_inv(:,1).*a
    i_vec = x(1:2);
    psy_vec = x(3:4);
    m = i_vec.*flipud(psy_vec);
    [psy_theta, psy_amp] = cart2pol(psy_vec(1), psy_vec(2))
    [i_theta, i_amp] = cart2pol(i_vec(1), i_vec(2))
    m = m(2)-m(1)
    m = m*Lm/Lr
    i_stat = norm(i_vec)
    
end

%
% D-Q reference is the psy d
%

if compute_psy_ref 
    disp('compute_psy_ref')
    % theta = 0.4366;
    theta = -psy_theta;

    rotMat = [cos(theta) -sin(theta); sin(theta) cos(theta)];
    %rotMat = rotz(theta*180/2/pi)

%     B2 = [1/Ls/sig, 0, 0;
%         0, 1/Ls/sig, 0;
%         0, 0, 0];
    B2 = B(1:3,:);
    u2 = rotMat*u;


    A2 = [A11, om_coord, A13;
        -om_coord,  A11, -A14;
        A31, 0, A32];

    x2 = A2\(-B2*u2)

    i_vec2 = x2(1:2);
    psy2 = x2(3)
    m2 = i_vec2(2)* psy2*3/2*Lm/Lr
    i_stat = norm(x2(1:2))

end

if compute_sym 
    disp('compute_sym')

    syms a b c d e f o
    
    Asym = [a,  o,  b,  c;
        -o,  a,  -c,   b;
        f,  0,  d,  e;
        0,   f,  -e  d];
    
    
    Asym_inv = inv(Asym);
    
    x_sym = Asym_inv(:,1);
    m_sym = x_sym(2) * x_sym(3)  - x_sym(1) * x_sym(4);
    m_sym = simplify(m_sym);
    
     a = A11;
     b = A13;
     c = A14;
    o = om_coord;
    d = A32;
    e = A34;
     f = A31;
   
    syms R2S sigS LsS LmS LrS RrS om_rotorS om_coordS RsS
    
    
    R2S = RsS+(LmS*LmS*RrS/LrS/LrS);  %  R2;
    sigS = 1-LmS*LmS/LsS/LrS;  %  sig;
    
    a = subs(-R2S/(LsS * sigS));  % A11;
    b = subs(LmS*RrS/(LsS * sigS * LrS*LrS));  %  A13;
    c = subs(LmS*om_rotorS/(LsS*sigS*LrS));  %  A14;
    o = om_coordS;
    d = -RrS/LrS;  %  A32;
    e = om_coordS-om_rotorS;  %  A34;
    f = LmS*RrS/LrS;  %  A31;
    
    LsS = Ls;
    LmS = Lm;
    LrS = Lr;
    RrS = Rr;
    RsS = Rs;
    
    LsS = 1.00001;
    LmS = 1;
    LrS = 00001;
    RrS = 1;
    RsS = 0;
    
    double(subs(f))
    
    simplify(subs(subs(m_sym)))
    
    ub = om_supply/Ls/sig;
    
    om_rotorS = om_rotor;
    om_coordS = om_coord;
    
    double(subs(subs(m_sym*3/2*Lm/Lr*ub*ub)))
    
    
    %sum(Asym_inv(1,:));
    %s = simplify(s);
    
%     Asym2 = sym([A11,  om_coord,  A13,  A14;
%         -om_coord,  A11,  -A14,   A13;
%         A31,  0,  A32,  A34;
%         0,   A31,  -A34  A32]);
%     
%     Asym_inv2 = inv(Asym2);
%     x_sym2 = Asym_inv2(:,1);
%     m_sym2 = x_sym2(2) * x_sym2(3)  - x_sym2(1) * x_sym2(4);
%     m_sym2 = simplify(m_sym2);
    
end


