

%simOut = sim('om_M','ReturnWorkspaceOutputs','on');

%x1 = simOut.get('yout').getElement(1).Values.Data;

%x1(length(x1))

load_system('om_M');
omega_supplySweep = logspace(0, log10(400), 30); % logaritmic steps from '1' to '100'  5:5:20
%interNum = length(omega_supplySweep);

ampl_supplySweep = linspace(10, 200, 3); %200*ones(1, interNum)

omega_rotorSweep = logspace(0, log10(400), 30); % 0*ones(1, interNum)

resultDim = [length(omega_supplySweep), length(ampl_supplySweep), length(omega_rotorSweep)];
results = repmat(12, resultDim); % initialize 3x3 result matrix


var1.values = omega_supplySweep;
var1.name = 'speed of supply';

var2.values = ampl_supplySweep;
var2.name = 'amplitude of supply';

var3.values = omega_rotorSweep;
var3.name = 'speed of rotor';

%arr = zeros(1, interNum);
for i = 1:resultDim(1)
    display(sprintf('Setting om_M/omega_supply to %d', omega_supplySweep(i) ));
    set_param('om_M/omega_supply', 'Value', 'omega_supplySweep(i)');
    for j = 1:resultDim(2)
        fprintf('  Setting om_M/ampl_supply to %d\n', ampl_supplySweep(j) );
        set_param('om_M/ampl_supply', 'Value', 'ampl_supplySweep(j)');
        for k = 1:resultDim(3)
            
            %fprintf('    Setting om_M/omega_rotor to %d', omega_rotorSweep(k) );
            set_param('om_M/omega_rotor', 'Value', 'omega_rotorSweep(k)');

            simOut = sim('om_M','ReturnWorkspaceOutputs','on');

            x1 = simOut.get('yout').getElement(1).Values.Data;

            results(i, j, k) = x1(length(x1));

           % h1 = plot(x1); hold on;
           % h2 = plot(x2);
            %set(h1,'color',[0 1 0]); 
            %set(h2,'color',[0 0 1]);
            %legend('x1', 'x2');
        end
    end
end

% arr
%title('VDP States for mu=.5 to 1.5')
%xlabel('Time');
