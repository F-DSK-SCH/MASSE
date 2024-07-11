function controlSignal = pid_controller(Kp, Ki, Kd, error, integralError, errorDerivative)
% Calculates the control signal using a PID controller
%
% Inputs:
%   Kp: Proportional gain
%   Ki: Integral gain
%   Kd: Derivative gain
%   error: Current error
%   integralError: Accumulated error over time
%   errorDerivative: Rate of change of error
%
% Output:
%   controlSignal: Calculated control signal
% Written by Frederik Schmittel

proportionalTerm = Kp * error;
integralTerm = Ki * integralError;
derivativeTerm = Kd * errorDerivative;

controlSignal = proportionalTerm + integralTerm + derivativeTerm;
end
