function [ me2 ] = om_m_simWrkrfunc(model, omega_rotor )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    %set_param(strcat(model, '/omega_supply2'), 'Value', 'omega_supplySweep');
    setMotorParams
    load_system(model);
    set_param(model,'Profile','off')
    set_param(model,'StopTime', '50')
    
    set_param(strcat(model, '/omega_rotor'), 'Value', sprintf('%f', omega_rotor));

    %waitbar((j-1)/resultDim(2), h, sprintf('Processing ... %d/%d', j, resultDim(2)));
    simOut = sim('om_M2','ReturnWorkspaceOutputs','on');

    samp = simOut.get('yout').getElement(2).Values.Data;
    me = simOut.get('yout').getElement(1).Values.Data;

    me2 = me.*samp;
    me2(me2==0) = [];
    %results2(:,j) = me2;
    plot(me2)
    %return(me2)
end

