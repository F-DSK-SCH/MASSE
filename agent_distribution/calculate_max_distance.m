function maxDistance = calculate_max_distance(xRange, yRange, zRange, percentageDistance)
% calculate_max_distance Calculates the maximum distance based on a percentage of the bounding box diagonal
%
% Input:
%   xRange - [min, max] of x range
%   yRange - [min, max] of y range
%   zRange - [min, max] of z range
%   percentageDistance - Percentage of diagonal (0-100)
%
% Output:
%   maxDistance - Calculated maximum distance for the connection of the
%   agents
% Written by Frederik Schmittel

    boundingBoxDiagonal = sqrt((xRange(2)-xRange(1))^2 + (yRange(2)-yRange(1))^2 + (zRange(2)-zRange(1))^2);
    maxDistance = (percentageDistance / 100) * boundingBoxDiagonal;
end