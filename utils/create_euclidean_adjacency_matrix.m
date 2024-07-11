function [adjacencyMatrix] = create_euclidean_adjacency_matrix(agentHeights, numAgents, maxDistance, xPositions, yPositions)
% This function creates an adjacency matrix based on the Euclidean 
% distances between agents in 3D space.
% 
% Inputs:
%   agentHeights: Vector of agent heights
%   numAgents: Number of agents
%   maxDistance: Maximum distance for agents to be considered connected
%   xPositions: X-coordinates of agents
%   yPositions: Y-coordinates of agents
%
% Output:
%   adjacencyMatrix: Symmetric adjacency matrix
% Written by Frederik Schmittel

adjacencyMatrix = zeros(numAgents, numAgents);

for i = 1:numAgents
    for j = 1:(i-1)
        distanceVector = [
            agentHeights(i) - agentHeights(j);
            xPositions(i) - xPositions(j);
            yPositions(i) - yPositions(j)
        ];
        
        if norm(distanceVector) < maxDistance
            adjacencyMatrix(i, j) = 1;
        end
    end
end

% Make the matrix symmetric
adjacencyMatrix = adjacencyMatrix + adjacencyMatrix';
end