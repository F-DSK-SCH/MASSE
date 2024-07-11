%% Multi-Agent System Simulation Environment
% Written by Frederik Schmittel
clc
clear

% Include all files in the directory
currentFolder = fileparts(mfilename('fullpath'));
addpath(genpath(currentFolder));

% Select number of agents for the simulation
agent.number = input('Please select number of agents: ');

% Number of steps
max_steps = 300;

% percentage distance from the agent space (range 0 to 100)
percentage_distance = 20;

% Visualisation
fig = figure('Position', [100, 100, 1000, 400]);
ax = axes('Parent', fig, 'Position', [0.1, 0.2, 0.8, 0.7]);
% Pause/Resume-Button
pauseButton = uicontrol('Style', 'pushbutton', 'String', 'Pause',...
    'Position', [20 20 60 30], 'Callback', @pauseButtonCallback);
% Global variables to store the pause state and camera settings
global isPaused;
isPaused = false; % Initial pause state

% Generation of agent formations
%[agent.x, agent.y, agent.z, absolute_distance] = generate_initial_values(agent.number, percentage_distance);

% [agent.x, agent.y, agent.z, absolute_distance] = generate_initial_values( ...
%      agent.number, percentage_distance,'Distribution', 'normal');%, ...
%     'XRange', [0, 1], 'YRange', [0, 1], 'ZRange', [0, 1]

cluster_number = 4;
[agent.x, agent.y, agent.z, absolute_distance] = generate_initial_values( ...
    agent.number, percentage_distance, ...
    'Distribution', 'cluster', 'ClusterCenters', cluster_number);

% [agent.x, agent.y, agent.z, absolute_distance] = generate_initial_values( ...
%     agent.number, percentage_distance, 'Distribution', 'uniform', ...
%     'XRange', [0, 1], 'YRange', [0, 1], 'ZRange', [0, 1]);

% physical components for the simulatio
agent.mass = 1.0;  % mass (kg)
agent.drag_coefficient = 0.1;  % air/fluid drag
agent.velocity = 0.0;  % start velocity (m/s)

% Agent properties
Kp = 0.05;  
dt = 0.1;  % time steps (s)

for step = 1:max_steps
    while isPaused
        drawnow;
        pause(0.05);
    end

    target_height = calculate_target_height(agent.number, absolute_distance, agent.z, agent.x, agent.y);%, selected_algorithm);

    % calculate control deviation 
    error = target_height - agent.z;

    % calculate the control value
    u = p_controller(Kp, error);
    
    %
    [agent.z, agent.velocity] = update_position_and_velocity(agent.z, agent.velocity, u, dt, agent.mass, agent.drag_coefficient);
    
    visualize_step(agent, step, max_steps);
    
end


