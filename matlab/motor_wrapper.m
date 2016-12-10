classdef motor_wrapper < handle
    properties(Access = protected)
        wrapper_version = '0.1' % metadata: version of this wrapper.
        
        % motor parameters
        Rs = 0
        Rr = 0
        Ls = 0
        Lr = 0
        Lm = 0
        
        % operation Conditions
        omRot   = -1
        omSupp  = -1
        suppAmp = -1
        
        done = 0;
        
        % Calculated values
        m;
        is;
        psir;
    end
    
    methods (Abstract)
%         is = getIs(obj)  % returns the stator current (complex)
%         psir = getPsir(obj)  % returns the rotor flux (complex)
%         m = getTorque(obj)
        run(obj)
        
%         setOmRot(motor_wrapper, omRot)   % set the rotor speed
%         setOmSupp(obj, omSupp)  % set the supply speed
%         setSuppAmp(obj, suppAmp) % set the supply amplitude
    end
    
    methods
        function obj = setDone(obj)   % clear the done flag
            obj.done = 1; 
            %error('erer')           
        end
        
        function obj = clearDone(obj)   % clear the done flag
            obj.done = 0;         
        end
        
        function obj = setOmRot(obj, omRot)   % set the rotor speed
            obj.omRot = omRot;
            obj.clearDone();
            %obj.done = 0; %clearDone();
        end
        function obj = setOmSupp(obj, omSupp)  % set the supply speed
            obj.omSupp = omSupp;
            obj.clearDone();
        end
        function obj = setSuppAmp(obj, suppAmp) % set the supply amplitude
            obj.suppAmp = suppAmp;
            obj.clearDone();
        end
        
        % set the rotor speed, supply speed and supply amplitude
        function obj = setOperation(obj, omRot, omSupp, suppAmp)
             obj.setOmRot(omRot);
             obj.setOmSupp(omSupp);
             obj.setSuppAmp(suppAmp);
        end
    
        function obj = setParameters(obj, Rs, Rr, Ls, Lr, Lm) % set the stator and rotor resistance and inductance
            obj.Rs = Rs;
            obj.Rr = Rr;
            obj.Ls = Ls;
            obj.Lr = Lr;
            obj.Lm = Lm;
            obj.clearDone();
        end
    
        function is = getIs(obj)  % returns the stator current (complex)
            is = obj.is;
        end
        
        function psir = getPsir(obj)  % returns the rotor flux (complex)
            psir = obj.psir;
        end
        
        function m = getTorque(obj)
            m = obj.m;
        end
        
        
        function Rr = getRr(obj)  % returns the rotor flux (complex)
            Rr = obj.Rr;
        end
        
        function Rs = getRs(obj)  % returns the rotor flux (complex)
            Rs = obj.Rs;
        end
        
        
        function Lm = getLm(obj)  % returns the rotor flux (complex)
            Lm = obj.Lm;
        end
        
        
        function Ls = getLs(obj)  % returns the rotor flux (complex)
            Ls = obj.Ls;
        end
        
        
        function Lr = getLr(obj)  % returns the rotor flux (complex)
            Lr = obj.Lr;
        end
        
        function suppAmp = getSuppAmp(obj)  % returns the rotor flux (complex)
            suppAmp = obj.suppAmp;
        end
        
        
        function print(obj)
            disp('s')
            disp(obj.omRot)
            disp(obj.suppAmp)
            disp(obj.omSupp)
            disp(obj.done)
            
           % disp(obj.omSupp)
            
            %properties(obj)
        end
        
    end
    
end

