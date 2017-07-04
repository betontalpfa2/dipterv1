

%simOut = sim('om_M','ReturnWorkspaceOutputs','on');

%x1 = simOut.get('yout').getElement(1).Values.Data;

%x1(length(x1))

n1 = 20;
n2 = 3;
n3 = 3;

%omega_supplySweep = logspace(1, log10(400), n1); % logaritmic steps from '1' to '100'  5:5:20
%interNum = length(omega_supplySweep);

%ampl_supplySweep = linspace(10, 200, n2); %200*ones(1, interNum)
%omega_rotorSweep = logspace(1, log10(300), n3); % 0*ones(1, interNum)

%resultDim = [length(omega_supplySweep), length(ampl_supplySweep), length(omega_rotorSweep)];
results = repmat(12, [n1, n2, n3]); % initialize 3x3 result matrix

% 1) Load model and initialize the pool.

%parpool;
model = 'om_M';
%parpool;
%arr = zeros(1, interNum);
% spmd
%     % Setup tempdir and cd into it
%     currDir = pwd;
%     addpath(currDir);
%     tmpDir = tempname;
%     mkdir(tmpDir);
%     cd(tmpDir);
%     load_system('om_M');
% end

for i = 1:n1;
%     
% M_abc2ab0  = 2/3*[1, -0.5, -0.5; 0, sqrt(3)/2, -sqrt(3)/2;  0.5, 0.5, 0.5];
% M_ab02dq0  = [cos(th), sin(th), 0;  -sin(th), cos(th), 0;  0, 0, 1];
% M_phase_dq = M_ab02dq0*M_abc2ab0;
% M_ab02abc  = inv(M_abc2ab0);
% 
% Rs = 3.5; % ohm
% Rr = 4.3; %ohm
% Lm = 0.10; %H
% 
% Ls = 0.11; %H
% Lr = Ls; %H
% 
% %Ls = 0.16; %H
% %Lr = 0.13; %H
% sig = 1-Lm*Lm/Ls/Lr %???
% om = 0; % rad/sec
% R2 = Rs+(Lm*Lm*Rr/Lr/Lr)
% L = Ls

    load_system(model);
    omega_supplySweep = logspace(1, log10(400), n1);
    display(sprintf('Setting om_M/omega_supply to %d', omega_supplySweep(i) ));
    set_param('om_M/omega_supply', 'Value', num2str(omega_supplySweep(i)));

    ampl_supplySweep = linspace(10, 200, n2); %200*ones(1, interNum)

    omega_rotorSweep = logspace(1, log10(300), n3); % 0*ones(1, interNum)
    
    
    for j = 1:n2
        fprintf('  Setting om_M/ampl_supply to %d\n', ampl_supplySweep(j) );
        set_param('om_M/ampl_supply', 'Value', num2str(ampl_supplySweep(j)));
        for k = 1:n3
            fprintf('    Setting om_M/omega_rotor to %d', omega_rotorSweep(k) );
            set_param('om_M/omega_rotor', 'Value', num2str(omega_rotorSweep(k)));

            simOut = sim('om_M','ReturnWorkspaceOutputs','on');

            x1 = simOut.get('yout').getElement(1).Values.Data;

            results(i, j, k) = x1(length(x1));

        end
    end
end


% 5) Switch all of the workers back to their original folder.
% spmd
%     cd(currDir);
%     rmdir(tmpDir,'s');
%     rmpath(currDir);
%     close_system(model, 0);
% end


close_system(model, 0);
% delete(gcp('nocreate'));

% arr
%title('VDP States for mu=.5 to 1.5')
%xlabel('Time');
