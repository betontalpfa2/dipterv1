for j = 1:resultDim(2)
    
    plot (a)
    pause(1)
    a(1)
    pause(1)
    a(1)
    pause(1)
    a(1)
%         set_param(strcat(model, '/omega_rotor'), 'Value', 'omega_rotorSweep(j)');
% 
%         waitbar((j-1)/resultDim(2), h, sprintf('Processing ... %d/%d', j, resultDim(2)));
%         simOut = sim('om_M2','ReturnWorkspaceOutputs','on');
% 
%         samp = simOut.get('yout').getElement(2).Values.Data;
%         me = simOut.get('yout').getElement(1).Values.Data;
% 
%         me2 = me.*samp;
%         me2(me2==0) = [];
%         results2(:,j) = me2;
end