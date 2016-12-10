classdef scim_verifier
    properties
        motor;
        b1
    end
    
    methods 
        function obj = scim_verifier(motor)
            setMotorParams;
            %motor = motor_wrapper;
            motor.setOperation(99, 100, 200);
            motor.setParameters(Rs, Rr, Ls, Lr, Lm);
            obj.motor= motor;
        end
        
        
        
        % Tests
        
        
        function obj = testDC(obj)
            obj.motor.setOperation(0.1, 0.1, 100);
            obj.motor.run();
            is = obj.motor.getIs();
            
            obj.asrt_diff(angle(is), 0, 'Stator current has imaginary component...');
%             if abs(angle(is))>0.1
%                 disp(is)
%                 error('Stator current has imaginary component...')
%             end
            
            Rs = obj.motor.getRs();
            isa = abs(is);
            u = obj.motor.getSuppAmp();

            
            obj.asrt_diff(u/isa, Rs, 'DC resistance is not correct...')
%             abs(u/isa-Rs)
%             if abs(u/isa-Rs)>0.1
%                 disp(is)
%                 error('DC resistance is not correct...')
%             end
        end
        
        
        function obj = testAC_sync(obj)
            obj.motor.setOperation(9999.9999, 10000, 100);
            obj.motor.run();
            is = obj.motor.getIs();
            
            obj.asrt_diff(angle(is), -pi/2, 'Stator current has real component...')


            Ls = obj.motor.getLs();
            u = obj.motor.getSuppAmp();
            obj.asrt_div(abs(u/is), 10000*Ls, 'AC impedance is not correct...')
            
        end
        
        
        
        function obj = testAC_async(obj)
            obj.motor.setOperation(10, 1000, 100);
            obj.motor.run();
            is = obj.motor.getIs();
            
            obj.asrt_diff(angle(is), -pi/2, 'Stator current has real component...')


            Ls = obj.motor.getLs();
            Lm = obj.motor.getLm();
            Lr = obj.motor.getLr();
            u = obj.motor.getSuppAmp();
            Lx = Ls-Lm*Lm/Lr;
            
            obj.asrt_div(abs(u/is), (Lx)*1000, 'AC impedance is not correct...')
            
        end
        
        
        function obj = testPower(obj)
            om1 = 150;
            om2 = 145;
            
            obj.motor.setOperation(om2, om1, 100);
            obj.motor.run();
            
            s = (om1-om2)/om1;
            
            is = obj.motor.getIs();
            u = obj.motor.getSuppAmp();
            p = real(is)*u
            abs(p)
            
            %obj.asrt_diff(angle(is), 0, 'Stator current has imaginary component...')


            Ls = obj.motor.getLs();
            Lm = obj.motor.getLm();
            Lr = obj.motor.getLr();
            m = obj.motor.getTorque();
            
            Rs = obj.motor.getRs();
            
            pm = 145*m * ((1-s))
            pcopp = Rs * abs(is)^2
            
            sig = 1-Lm*Lm/Ls/Lr;
            Lx = Ls*sig;
            
            obj.asrt_div(p, pm+pcopp, 'Powers are not correct...')
            
        end
        
        
    end
    
    methods(Static)
        function asrt_diff(val, exp, msg)
             if abs(val-exp)>0.1
                fprintf('Current val: %f  --  Excepted: %f\n', val, exp )
                error(msg)
            end
        end
        
        function asrt_div(val, exp, msg)
             if abs(val/exp-1)>0.1
                fprintf('Current val: %f  --  Excepted: %f\n', val, exp )
                error(msg)
            end
        end
    end
    
    
    
    methods
        function runAllTest(obj)
            obj.testDC
            obj.testAC_async
            obj.testAC_sync
            
            fprintf('OK\n')
        end
    end
%
% Get results
%

end

