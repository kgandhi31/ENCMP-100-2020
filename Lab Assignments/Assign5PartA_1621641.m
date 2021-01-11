%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Course: ENCMP 100
% Assignment: 5PartA
% Name: Krish Gandhi
% CCID: gandhi
% U of A ID: 1621641
%
% Acknowledgements:
% None
%
% Description:
% This program creates multiple dialog boxes, lets the user choose shapes,
% the corresponding shape dimensions and shape colours from the user
% interfaces, and prints out the total number of shape objects selected.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% clear the command window, clear the workspace, and close all figures
clc; clear; close all;

% initialize the shape selection counting variable
shapecounter = 0;

while 1
    % create a GUI of shapes for the user to select from
    % shapeList is a cell array of strings for the list box in the GUI
    shapeList = {'Circle','Square', 'Ellipse', 'Triangle', 'Rectangle'};
    [selection,ok] = listdlg('PromptString','Select the next shape:',...
        'SelectionMode','single',...
        'OKString','Enter',...
        'CancelString','No more',...
        'ListString',shapeList);
    
    % selection now holds the index of the selected shape
    % ok is 1 if a shape was selected; otherwise, ok is 0
    if ~ok break; end
    
    % create a GUI for the user to enter two dimensions for the selected
    % shape
    % prompt is a cell array containing the prompt strings
    prompt={'Enter shape dimension 1','Enter shape dimension 2'};
    title = 'Shape dimension dialog box';
    numlines = 1;
    % defaults is a cell array containing the default inputs as strings
    % which are displayed for each prompt
    defaults = {'0','0'};
    % options is a structure that specifies additional options for the
    % dialog box
    options.Resize = 'on';
    options.WindowStyle = 'normal';
    options.Interpreter = 'none';
    % inputvalues is a cell array containing the user inputs as strings
    inputvalues = inputdlg(prompt,title,numlines,defaults,options);
    % str2num(inputvalues{1}) is the value of the first dimension
    % str2num(inputvalues{2}) is the value of the second dimension
    
    % create a GUI of colours for the user to select from
    % colourList is a cell array of strings for the list box in the GUI
    colourList = {'red','yellow', 'blue', 'green', 'orange', 'violet'};
    [colour_selection,ok1] = listdlg('PromptString','Select the shape colour:',...
        'SelectionMode','single',...
        'OKString','Enter',...
        'CancelString','No colour',...
        'ListString',colourList);
    
    % colour_selection now holds the index of the selected colour
    % ok1 is 1 if a colour was selected; otherwise, ok1 is 0
    if ~ok1 break;end
    
    % increment the shape selection counting variable
    shapecounter = shapecounter + 1;
end

%print out the total number of shape objects the user selected
fprintf('The number of entered objects was %d\n', shapecounter);