function visualize_step(agent, step, max_steps)
% VISUALIZE_STEP Visualizes the position of agents in 3D and side views
%
% This function creates two subplots to visualize the agents' positions.
% The first subplot shows a 3D view of the agents' positions.
% The second subplot shows a side view (XZ plane) with color representing the Y position.
%
% Inputs:
%   agent     - Structure containing agent positions (fields: x, y, z).
%   step      - Current simulation step.
%   max_steps - Total number of simulation steps.
%
% The function ensures the axis ranges are properly set and updates the plots.
% Written by Frederik Schmittel


ax1 = subplot(1, 2, 1);
ax2 = subplot(1, 2, 2);


x_min = min(agent.x) - 0.5;
x_max = max(agent.x) + 0.5;
y_min = min(agent.y) - 0.5;
y_max = max(agent.y) + 0.5;
z_min = min(agent.z) - 0.5;
z_max = max(agent.z) + 0.5;


x_range = [min(x_min, 0), max(x_max, 1)];
y_range = [min(y_min, 0), max(y_max, 1)];
z_range = [min(z_min, 0), max(z_max, 1)];

% 3D View
scatter3(ax1, agent.x, agent.y, agent.z, 50, 'filled');
xlabel(ax1, 'X Position');
ylabel(ax1, 'Y Position');
zlabel(ax1, 'Height');
title(ax1, 'Perspective 1: 3D View');
axis(ax1, [x_range y_range z_range]);
grid(ax1, 'on');
view(ax1, 3);

% XZ Plane
scatter(ax2, agent.x, agent.z, 50, agent.y, 'filled');
xlabel(ax2, 'X Position');
ylabel(ax2, 'Height');
title(ax2, 'Perspective 3: Side View');
axis(ax2, [x_range z_range]);
grid(ax2, 'on');

sgtitle(sprintf('Step %d / %d', step, max_steps));

drawnow;
end
