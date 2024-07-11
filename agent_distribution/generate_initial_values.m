function [initialXPositions, initialYPositions, initialHeights, maxDistance] = generate_initial_values(numAgents, percentage_distance, varargin)
% Generates initial random positions for agents and calculates the maximum communication distance
%
% Inputs:
% numAgents: Number of agents
% percentageDistance: Percentage used to calculate the maximum distance (0-100)
% Optional Name-Value Pair Arguments:
%   'Distribution': 'uniform' (default), 'normal', or 'cluster'
%   'XRange': [min, max] for X dimension (default: [0, 1])
%   'YRange': [min, max] for Y dimension (default: [0, 1])
%   'ZRange': [min, max] for Z dimension (default: [0, 1])
%   'ClusterCenters': Number of cluster centers if 'cluster' distribution is chosen (default: 3)
%
% Outputs:
% initialHeights: Initial z-coordinates (heights) of agents
% initialXPositions: Initial x-coordinates of agents
% initialYPositions: Initial y-coordinates of agents
% maxDistance: Maximum distance for agent communication
% Written by Frederik Schmittel

p = inputParser;
addParameter(p, 'Distribution', 'uniform', @(x) any(validatestring(x,{'uniform','normal','cluster'})));
addParameter(p, 'XRange', [0, 1], @(x) isnumeric(x) && length(x)==2);
addParameter(p, 'YRange', [0, 1], @(x) isnumeric(x) && length(x)==2);
addParameter(p, 'ZRange', [0, 1], @(x) isnumeric(x) && length(x)==2);
addParameter(p, 'ClusterCenters', 3, @(x) isnumeric(x) && x > 0);
parse(p, varargin{:});

% Generate initial positions based on chosen distribution
[initialXPositions, initialYPositions, initialHeights] = feval(['generate_' p.Results.Distribution '_distribution'], ...
    numAgents, p.Results.XRange, p.Results.YRange, p.Results.ZRange, p.Results.ClusterCenters);

% Calculate maximum distance
maxDistance = calculate_max_distance(p.Results.XRange, p.Results.YRange, p.Results.ZRange, percentage_distance);
end