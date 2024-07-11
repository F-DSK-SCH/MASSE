function [x, y, z] = generate_cluster_distribution(numAgents, xRange, yRange, zRange, clusterCenters, ~)
% generate_cluster_distribution Generates a clustered distribution of agents in 3D space
%
% Input:
%   numAgents - Number of agents to generate
%   xRange - [min, max] of x range
%   yRange - [min, max] of y range
%   zRange - [min, max] of z range
%   clusterCenters - Number of cluster centers
%
% Output:
%   x - x-coordinates of agents
%   y - y-coordinates of agents
%   z - z-coordinates of agents
%
% The function creates random cluster centers within the given ranges,
% assigns agents to these clusters, and adds Gaussian noise to their positions.
% Final positions are clamped to ensure they remain within the specified ranges.
% Written by Frederik Schmittel

centerX = xRange(1) + (xRange(2) - xRange(1)) * rand(clusterCenters, 1);
centerY = yRange(1) + (yRange(2) - yRange(1)) * rand(clusterCenters, 1);
centerZ = zRange(1) + (zRange(2) - zRange(1)) * rand(clusterCenters, 1);

clusterAssignments = randi(clusterCenters, numAgents, 1);
x = centerX(clusterAssignments) + (xRange(2)-xRange(1))/10 * randn(numAgents, 1);
y = centerY(clusterAssignments) + (yRange(2)-yRange(1))/10 * randn(numAgents, 1);
z = centerZ(clusterAssignments) + (zRange(2)-zRange(1))/10 * randn(numAgents, 1);

x = max(min(x, xRange(2)), xRange(1));
y = max(min(y, yRange(2)), yRange(1));
z = max(min(z, zRange(2)), zRange(1));

end