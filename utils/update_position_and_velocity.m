function [new_position, new_velocity] = update_position_and_velocity(agent_position, agent_velocity, u, dt, mass, drag_coefficient)
% update_position_and_velocity Updates the position and velocity of an agent
%
% This function calculates the new position and velocity of an agent based on
% its current position, velocity, applied force, time step, mass, and drag coefficient.
%
% Inputs:
%   agent_position   - Current position of the agent.
%   agent_velocity   - Current velocity of the agent.
%   u                - Control input (force applied to the agent).
%   dt               - Time step for the update.
%   mass             - Mass of the agent (optional, default is 1.0 kg).
%   drag_coefficient - Air drag coefficient (optional, default is 0.1).
%
% Outputs:
%   new_position     - Updated position of the agent.
%   new_velocity     - Updated velocity of the agent.
%
% If mass and drag_coefficient are not provided, default values of 1.0 kg
% and 0.1 are used, respectively.
%
% The function uses Runge-Kutta 4th order method to update the position
% considering the influence of acceleration and drag on velocity.
% Written by Frederik Schmittel

% Parameter
if nargin < 5
    mass = 1.0;  % Agent mass (kg)
end
if nargin < 6
    drag_coefficient = 0.1;  % air drag coefficient
end

acceleration = u / mass;

new_velocity = agent_velocity + (acceleration - drag_coefficient * agent_velocity) * dt;

k1 = dt * new_velocity;
k2 = dt * (new_velocity + 0.5 * k1);
k3 = dt * (new_velocity + 0.5 * k2);
k4 = dt * (new_velocity + k3);
new_position = agent_position + (k1 + 2*k2 + 2*k3 + k4) / 6;

end