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
            obj.print_name();
            obj.motor.setOperation(0.01, 0.011, 100);
            obj.motor.run();
            is = obj.motor.getIs();
            
            obj.asrt_diff(angle(is), 0, 'Stator current has imaginary component...');
            
            Rs = obj.motor.getRs();
            isa = abs(is);
            u = obj.motor.getSuppAmp();
            obj.asrt_div(u/isa, Rs, 'DC resistance is not correct...')

            
            psir = obj.motor.getPsir();
            Lm = obj.motor.getLm();
            obj.asrt_div(psir, is*Lm, 'DC resistance is not correct...')

            
        end
        
        
        function obj = testAC_sync(obj)
            obj.print_name();
            obj.motor.setOperation(9999.9999, 10000, 100);
            obj.motor.run();
            is = obj.motor.getIs();
            
            obj.asrt_diff(angle(is), -pi/2, 'Stator current has real component...')


            Ls = obj.motor.getLs();
            u = obj.motor.getSuppAmp();
            obj.asrt_div(abs(u/is), 10000*Ls, 'AC impedance is not correct...')
            
        end
        
        
        
        function obj = testAC_async(obj)
            obj.print_name();
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
            obj.print_name();
            om1 = 314;
            om2 = 300;
            
            obj.motor.setOperation(om2, om1, 325);
            obj.motor.run();
            
            s = (om1-om2)/om1;
            
            is = obj.motor.getIs();
            u = obj.motor.getSuppAmp();
            p = real(is)*u
            abs(p)
            
            %obj.asrt_diff(angle(is), 0, 'Stator current has imaginary component...')


%             Ls = obj.motor.getLs();
%             Lm = obj.motor.getLm();
%             Lr = obj.motor.getLr();
            m = obj.motor.getTorque()
            
            Rs = obj.motor.getRs();
            
            pm = om2*m
            pcopp = Rs * abs(is)^2
            
%             sig = 1-Lm*Lm/Ls/Lr;
%             Lx = Ls*sig;
            
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
             if abs(val/exp-1)>0.05
                fprintf('Current val: %f  --  Excepted: %f\n', val, exp )
                error(msg)
            end
        end
        
        function print_name()
            [ST,I] = dbstack;
            fprintf('Running test: %s\n', ST(2).name)
            %ST.name(1)
        end
        
    end
    
    
    
    methods
        function runAllTest(obj)
            obj.testDC;
            obj.testAC_async;
            obj.testAC_sync;
            obj.testPower;
            
            fprintf('OK\n')
        end
    end
%
% Get results
%

end

