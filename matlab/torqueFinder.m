function wsup = torqueFinder( wrotorArr )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    motor_type = 4;
    
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

        % Nominal
        voltage = 380; % V
        freq = 50; % Hz
        power = 3.8; % hp
        Inom = 8;    %A
        % torqueNom = 1.7; % N
        speed = 1450; % rpm
        flux = 0.735; % wb

    end

    
    sig = 1-Lm*Lm/Ls/Lr; %???
    R2 = Rs+(Lm*Lm*Rr/Lr/Lr);
    %         compute_supp_ref = 1;
    %         compute_psy_ref = 0;
    %         compute_sym = 0;


    B = [1/Ls/sig, 0;
        0, 1/Ls/sig;
        0, 0;
        0, 0];

    % om_supply = 0:10:500;
    % om_rotor = 202;
    %4.45
    %om_supply = 33.6;
    %om_rotor = 30;

    u = [200;0];


    B1 = B;
    u1 = u;
    %u1 = rotMat*u;

    
    A31 = Lm*Rr/Lr;
    A32 = -Rr/Lr;
    A11 = -R2/(Ls * sig);
    A13 = Lm*Rr/(Ls * sig * Lr*Lr);
   
    wsup = zeros(1,length(wrotorArr));
    for i = 1:length(wrotorArr)
        wrotor = wrotorArr(i);
        wsup(i) = fminbnd(@torqueCalc, wrotor, wrotor+20);
    end
        
%     wsup = fminbnd(@myabs, -2, 2);
%     
%     function ret = myabs(x)
%         ret = x;
%         if(x<0)
%             ret = -x;
%         end
%     end
    
    function m = torqueCalc(wsupp)
        % om_supply = wsupp;
        om_rotor = wrotor;
        om_coord = wsupp;
        
        A14 = Lm*om_rotor/(Ls*sig*Lr);
        A34 = om_coord-om_rotor;

        A = [A11,  om_coord,  A13,  A14;
            -om_coord,  A11,  -A14,   A13;
            A31,  0,  A32,  A34;
            0,   A31,  -A34  A32];
    
        x = A\(-B1*u1);
        i_vec = x(1:2);
        psy_vec = x(3:4);
        m = i_vec.*flipud(psy_vec);
        %[psy_theta, psy_amp] = cart2pol(psy_vec(1), psy_vec(2));
        %[i_theta, i_amp] = cart2pol(i_vec(1), i_vec(2));
        m = m(2)-m(1);
        m = m*3/2*Lm/Lr;
        
        m = -m;
        %i_stat = norm(x(1:2));
    
   end

%     global a
%     disp(a);
%     torque = a;

end

