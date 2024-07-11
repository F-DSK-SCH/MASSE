function [x, y, z] = generate_uniform_distribution(numAgents, xRange, yRange, zRange, ~)
% generate_uniform_distribution Generates random points following a uniform 
% distribution within specified ranges.
%
% Input:
%   xRange - [min, max] of x range
%   yRange - [min, max] of y range
%   zRange - [min, max] of z range
%
% Outputs:
%   x - A numAgents x 1 vector of x coordinates following a normal distribution within xRange.
%   y - A numAgents x 1 vector of y coordinates following a normal distribution within yRange.
%   z - A numAgents x 1 vector of z coordinates following a normal distribution within zRange.
% Written by Frederik Schmittel

x = xRange(1) + (xRange(2) - xRange(1)) * rand(numAgents, 1);
y = yRange(1) + (yRange(2) - yRange(1)) * rand(numAgents, 1);
z = zRange(1) + (zRange(2) - zRange(1)) * rand(numAgents, 1);

end