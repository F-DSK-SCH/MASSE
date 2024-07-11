function pauseButtonCallback(hObject, ~)
% Toggles the pause state and updates the button label.
%
% Inputs:
%   hObject - Handle to the pause button.
%
% Globals:
%   isPaused - Indicates if the process is paused.
%
%   Updates button text to 'Resume' or 'Pause'.
% Written by Frederik Schmittel

global isPaused;    
isPaused = ~isPaused;
if isPaused
    set(hObject, 'String', 'Resume');
else
    set(hObject, 'String', 'Pause');
end
end
