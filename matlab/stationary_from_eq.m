classdef stationary_from_eq < motor_wrapper
    properties 
        aaa = 1;
    end
    
    methods(Access = protected)
        function obj = calculate(obj)
            om1 = obj.omSupp;
            om2 = obj.omRot;
            s = (om1-om2)/om1;
            us = obj.suppAmp;
            
            Lm = obj.Lm;
            Lr = obj.Lr;
            Ls = obj.Ls;
            Rr = obj.Rr;
            Rs = obj.Rs;


            a = Lm/Lr;
            sigma = 1- Lm*Lm/(Lr*Ls);

            Rrr = Rr *a*a;
            Lmr = (1-sigma)*Ls;
            Llsr = sigma*Ls;

            R_mul = (Rrr/s*1i*om1*Lmr);
            R_add = (Rrr/s+1i*om1*Lmr);

            Urr = us*R_mul/(R_add*(Rs+1i*om1*Llsr)+R_mul);

            obj.is = ((us-Urr)/(Rs+1i*om1*Llsr));
            obj.psir = abs(Urr/om1/1i)/a;
            
            p_rot = abs(Urr)^2/Rrr*s;
            
            p_copp = p_rot * s;
            p_mech = p_rot - p_copp;
            obj.m = p_mech/om2;
            
%             istat2 = ((us-Urr)/(Rs+1i*om1*Llsr))
% 
%             psyi = abs(Urr/om1/1i)/a
        end
    end
    
end