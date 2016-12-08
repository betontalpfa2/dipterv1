disp 'a'
th = 0;

M_abc2ab0  = [1, -0.5, -0.5; 0, sqrt(3)/2, -sqrt(3)/2;  0.5, 0.5, 0.5];
M_ab02dq0  = [cos(th), sin(th), 0;  -sin(th), cos(th), 0;  0, 0, 1];
M_phase_dq = M_ab02dq0*M_abc2ab0;
M_ab02abc  = inv(M_abc2ab0);

% t in ms
% for t  = drange(0:10)
%     Uabc   = sin_3phase(t/1000)
%     Udq0   = M_phase_dq * Uabc
% end
%t = 0;
%disp (t)

if ~exist('motor_type', 'var')
   motor_type = 4;
end

if motor_type == 1
    Rs = 3.5; % ohm
    Rr = 5.3; %ohm
    Lm = 0.10; %H
    p = '???';  % number of pole-pair 

    Ls = 0.11; %H
    Lr = Ls; %H
end

% From: http://www.jatit.org/volumes/Vol70No2/22Vol70No2.pdf
if motor_type == 2
    Rs = 4.05; % ohm
    Rr = 2.60; %ohm
    Lm = 0.53868; %H
    p = '???';  % number of pole-pair 

    Ls = 0.01397+Lm; %H
    Lr = 0.01397+Lm; %H
    Inertia = 0.06; % kgm2
    damp = 0.089;  % Ns/m
    
    %Lr = Ls; %H
end


% From: http://www.wseas.us/e-library/conferences/2007venice/papers/570-633.pdf
if motor_type == 3
    Rs = 34; % ohm
    Rr = 15.2; %ohm
    Lm = 1.06; %H

    Ls = 0.300+Lm; %H
    %Lr = 0.01397+Lm; %H
    %Inertia = 0.06; % kgm2
    %damp = 0.089;  % Ns/m
    Lr = Ls; %H ???
    p = 2;  % number of pole-pair 
    
    % Nominal
    Inom = 0.85;    %A
    torqueNom = 1.7; % N
    wNom = 144.5; % rad/sec
    
end

% From: http://infomesr.org/attachments/31-113.pdf
if motor_type == 4
    Rs = 1.725; % ohm
    Rr = 1.009; %ohm
    Lm = 0.1271; %H

    Ls = 0.1473+Lm; %H
    Lr = 0.1473+Lm; %H
    %Inertia = 0.06; % kgm2
    %damp = 0.089;  % Ns/m
    %Lr = Ls; %H ???
    p = 2;  % number of pole-pair 
    
    % Nominal
    voltage = 380; % V
    freq = 50; % Hz
    power = 2.8; %kW (3.8 hp)
    Inom = 8;    %A
    % torqueNom = 1.7; % N
    speedRPM = 1450; % rpm
    speedRAD = speedRPM/30*pi; % rpm
    flux = 0.735; % wb
    
end


%Ls = 0.16; %H
%Lr = 0.13; %H
sig = 1-Lm*Lm/Ls/Lr %???
om = 0; % rad/sec
R2 = Rs+(Lm*Lm*Rr/Lr/Lr)
%L = Ls


% B = [1/Ls/sig, 0;
%     0, 1/Ls/sig;
%     0, 0;
%     0, 0];
% 
% A = [-R2/(Ls * sig),  0,  Lm*Rr/(Ls * sig * Lr*Lr),  Lm*om/(Ls*sig*Lr);
%     0,  -R2/(Ls * sig),  -Lm*om/(Ls*sig*Lr),   Lm*Rr/(Ls * sig * Lr*Lr);
%     Lm*Rr/Lr,  0,  -Rr/Lr,  -om;
%     0,   Lm*Rr/Lr,  om  -Rr/Lr];
% 
% B2 = [1/L/sig, 0;
%     0, 1/L/sig;
%     0, 0;
%     0, 0];
% 
% A2 = [0, 0, Lm*Rr/Ls/sig/Lr/Lr, Lm*om/Ls/sig/Lr;
%     0, -R2/Ls/sig, -Lm*om/Ls/sig/Lr, Lm*Rr/Ls/sig/Lr/Lr;
%     Lm*Rr/Lr, 0, -Rr/Lr, -om;
%     0, Lm*Rr/Lr, om, -Rr/Lr];
% 
% B3 = [1/L/sig, 0;
%     0, 0;
%     0, 0;
%     0, 0];
% 
% A3 = [-R2/Ls/sig, 0, Lm*Rr/Ls/sig/Lr/Lr, 0;
%     0, 0, 0, 0;
%     Lm*Rr/Lr, 0, -Rr/Lr, 0;
%     0, 0, 0, 0];
% 
% 
% EQ = A-A2
% 
% Eq2 = B-B2
% 
% u = [1; 0]
% 
% inv(A)
% (-B*u)
% 
% x = inv(A2)*(-B*u)
