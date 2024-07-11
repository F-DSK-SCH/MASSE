function targetHeight = calculate_target_height(numAgents, maxDistance, currentHeights, xPositions, yPositions)%, consensusAlgorithm)
% Calculates the target height for each agent based on communication with neighbors
%
% Inputs:
%   numAgents: Number of agents
%   maxDistance: Maximum distance for agents to be considered connected
%   currentHeights: Current heights of agents
%   xPositions: X-coordinates of agents
%   yPositions: Y-coordinates of agents
%
% Output:
%   targetHeight: Calculated target height for each agent
% Written by Frederik Schmittel

adjacencyMatrix = create_euclidean_adjacency_matrix(currentHeights, numAgents, maxDistance, xPositions, yPositions);

if any(mean(adjacencyMatrix) == 0)
    
    disconnectedAgents = find(sum(abs(adjacencyMatrix)) == 0);
    
    for agent = disconnectedAgents
        adjacencyMatrix(agent, agent) = 1;
    end
end

heightSum = adjacencyMatrix * currentHeights;
connectionCount = adjacencyMatrix * ones(numAgents, 1);
targetHeight = heightSum ./ connectionCount;
    
end