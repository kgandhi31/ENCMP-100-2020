%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Course: ENCMP 100
% Assignment: 5PartB
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
% interfaces, and prints out all these shape-object properties along with
% their calculated areas in a table. The program also saves all the table
% contents into a text file.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [] = Assign5PartB_1621641()

% clear the command window, clear the workspace, and close all figures
clc; clear; close all;

% initialize the shape selection counting variable and the shape cell array
shapecounter = 0;
shape = {};

while 1
    % create a GUI of shapes for the user to select from
    % shapeList is a cell array of strings for the list box in the GUI
    shapeList = {'Circle','Square','Ellipse','Triangle','Rectangle'};
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
    
    % create a GUI of colours for the user to select from
    % colourList is a cell array of strings for the list box in the GUI
    colourList = {'red','yellow','blue','green','orange','violet'};
    [colour_selection,ok1] = listdlg('PromptString','Select the shape colour:',...
        'SelectionMode','single',...
        'OKString','Enter',...
        'CancelString','No colour',...
        'ListString',colourList);
    
    % colour_selection now holds the index of the selected colour
    % ok1 is 1 if a colour was selected; otherwise, ok1 is 0
    if ~ok1 break;end
    
    % increment the shape selection counting variable
    % also used as an indexing variable
    shapecounter = shapecounter + 1;
    
    % storing shape information into cell array
    % str2num(inputvalues{1}) is the value of the first dimension
    % str2num(inputvalues{2}) is the value of the second dimension
    shape{shapecounter} = {shapeList{selection},[str2num(inputvalues{1})...
        str2num(inputvalues{2})], colourList{colour_selection}};
end

% area_calculation function calculates the area for each of the selected
% objects in the shape cell array
area = area_calculation(shape);

% print out the total number of shape objects the user selected
fprintf('The number of entered objects was %d\n', shapecounter);

% summary table of results and storing area array into shape cell array
fprintf('No.\t\t\tID\t\t\tColor\t\t\tArea\n');
for i = 1:length(shape)
    shape{i}{4} = area(i);
    fprintf('%d\t\t\t%s\t\t%s\t\t\t%f\n', i, shape{i}{1}, shape{i}{3},...
        shape{i}{4});
end

% save shape cell array content into a text file
% Step1: Open the file for writing
fid = fopen('KrishGandhi.txt', 'w'); 

% Step2: Check whether the file was opened successfully
if fid == -1
    error('Failed to open the file for writing')
end

% Step3: Write data into text file
fprintf(fid,'The number of entered objects was %d\n', shapecounter);
fprintf(fid,'No.\t\t\tID\t\t\tColor\t\t\tArea\n');
for i = 1:length(shape)
    shape{i}{4} = area(i);
    fprintf(fid,'%d\t\t\t%s\t\t%s\t\t\t%.6f\n', i, shape{i}{1},...
        shape{i}{3}, shape{i}{4});
end

% Step4: Close the file
if fclose(fid) ~= 0
    error('Failed to close the file')
end
end

function [area] = area_calculation(shape)
% calculate the area of shape objects in the cell array and return the
% results in an area array

% initialize the area array
area = zeros(length(shape));

for i = 1:length(shape)
    switch shape{i}{1}
        case 'Circle'
            % area = pi * radius^2
            area(i) = pi * ((shape{i}{2}(1))/2)^2;
        case 'Square'
            % area = sidelength^2
            area(i) = (shape{i}{2}(1))^2;
        case 'Ellipse'
            % area = pi * major diamemter * minor diameter
            area(i) = pi * (shape{i}{2}(1)) * (shape{i}{2}(2));
        case 'Triangle'
            % area = 0.5 * base * height
            area(i) = 0.5 * (shape{i}{2}(1)) * (shape{i}{2}(2));
        case 'Rectangle'
            % area = height * width
            area(i) = (shape{i}{2}(1)) * (shape{i}{2}(2));
    end
end
end