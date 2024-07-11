function controlSignal = p_controller(Kp, e)
% Calculates the control signal using a P (Proportional) controller
%
% Inputs:
%   Kp - Proportional gain
%   e  - Current error
%
% Output:
%   controlSignal - Calculated control signal
% Written by Frederik Schmittel

controlSignal = Kp * e;

end