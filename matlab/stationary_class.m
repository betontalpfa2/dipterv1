classdef stationary_class < motor_wrapper
    properties 
%         omRot   = -1
%         omSupp  = -1
%         suppAmp = -1
        A = [];
        B = [];
    end
    
    methods
%         function setOmRot(obj, omRot)   % set the rotor speed
%             obj.omRot = omRot;
%         end
%         function setOmSupp(obj, omSupp)  % set the supply speed
%             obj.omSupp = omSupp;
%         end
%         function setSuppAmp(obj, suppAmp) % set the supply amplitude
%             obj.suppAmp = suppAmp;
%         end
        
        function obj = set(obj, omRot, omSupp, suppAmp) % set the rotor speed, supply speed and supply amplitude
            obj.omRot = omRot;
            obj.omSupp = omSupp;
            obj.suppAmp = suppAmp;
            obj.done = 0;
        end
        
        function obj = generateMatrices(obj) % set the rotor speed, supply speed and supply amplitude
            
            Rs = obj.Rs;
            Rr = obj.Rr;
            Ls = obj.Ls;
            Lr = obj.Lr;
            Lm = obj.Lm
            om_rotor = obj.omRot;
            om_coord = obj.omSupp;
            
            sig = 1-Lm*Lm/Ls/Lr; %???
            % om = 0; % rad/sec
            R2 = Rs+(Lm*Lm*Rr/Lr/Lr);
            
            obj.B = [1/Ls/sig, 0;
                0, 1/Ls/sig;
                0, 0;
                0, 0];
            
            A34 = om_coord-om_rotor;
            A31 = Lm*Rr/Lr;
            A32 = -Rr/Lr;
            A11 = -R2/(Ls * sig);
            A13 = Lm*Rr/(Ls * sig * Lr*Lr);
            A14 = Lm*om_rotor/(Ls*sig*Lr);

            obj.A = [A11,  om_coord,  A13,  A14;
                -om_coord,  A11,  -A14,   A13;
                A31,  0,  A32,  A34;
                0,   A31,  -A34  A32];

        end
    end
    
    methods(Access = private)
        function obj = calculate(obj)
            x = obj.A\(-obj.B*obj.suppAmp);
            
            i_vec = x(1:2);
            psy_vec = x(3:4);
            m = i_vec.*flipud(psy_vec);
            
            obj.psir = complex(psy_vec(1), psy_vec(2));
            obj.is = complex(i_vec(1), i_vec(2));
            
            m = m(2)-m(1);
            
            obj.m = m*obj.Lm/obj.Lr;
            
            obj.done = 1;
        end
    end
    
    
    methods
       function obj = run(obj)
           if(obj.done)
               return
           end
           obj.generateMatrices();
           obj.calculate()
       end
       
    end
end