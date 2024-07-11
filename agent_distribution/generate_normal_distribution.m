function [x, y, z] = generate_normal_distribution(numAgents, xRange, yRange, zRange, ~)
% generate_normal_distribution Generates random points following a normal 
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

x = normrnd(mean(xRange), (xRange(2)-xRange(1))/6, [numAgents, 1]);
y = normrnd(mean(yRange), (yRange(2)-yRange(1))/6, [numAgents, 1]);
z = normrnd(mean(zRange), (zRange(2)-zRange(1))/6, [numAgents, 1]);


x = max(min(x, xRange(2)), xRange(1));
y = max(min(y, yRange(2)), yRange(1));
z = max(min(z, zRange(2)), zRange(1));

end