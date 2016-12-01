

%simOut = sim('om_M','ReturnWorkspaceOutputs','on');

%x1 = simOut.get('yout').getElement(1).Values.Data;

motor_type = 4;
setMotorParams;

%h = waitbar(0, 'starting...');
%x1(length(x1))
model = 'om_M3';
load_system(model);
set_param(model,'Profile','off')
set_param(model,'StopTime', '10000')

omega_supplySweep = logspace(0, log10(500), 60); % logaritmic steps from '1' to '100'  5:5:20
%interNum = length(omega_supplySweep);

%ampl_supplySweep = linspace(10, 200, 3); %200*ones(1, interNum)

omega_rotorSweep = logspace(0, log10(500), 50); % 0*ones(1, interNum)

resultDim = [length(omega_supplySweep), length(omega_rotorSweep)];
results2 = repmat(12, resultDim); % initialize 3x3 result matrix


% var21.values = omega_supplySweep;
% var21.name = 'speed of supply';
% 
% var22.values = omega_rotorSweep;
% var22.name = 'speed of rotor';


%display(sprintf('Setting omega_supply to %d\n', omega_supplySweep ));
set_param(strcat(model, '/speeds'), 'Value', 'space');
%set_param(strcat(model, '/omega_supply2'), 'Value', 'omega_supplySweep');
%for j = 1:resultDim(2)
%set_param(strcat(model, '/omega_rotor'), 'Value', 'omega_rotorSweep(j)');

%waitbar((j-1)/resultDim(2), h, sprintf('Processing ... %d/%d', j, resultDim(2)));
simOut = sim(model,'ReturnWorkspaceOutputs','on');

samp = simOut.get('yout').getElement(2).Values.Data;
me = simOut.get('yout').getElement(1).Values.Data;

me2 = me.*samp;
me2(me2==0) = [];
samp = 1;
me = 1;
%results2(:,j) = me2;
%end

%close(h);

