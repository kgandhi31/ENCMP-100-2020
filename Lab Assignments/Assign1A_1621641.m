%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Course: ENCMP 100
% Assignment: 1A
% Name: Krish Gandhi
% CCID: gandhi
% U of A ID: 1621641
%
% Description:
% This program will calculate your final grade in ENCMP100.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% program title and instruction for user
fprintf('ENCMP100 Final Grade Calculator\n\nPlease enter the following information in percent.\n');

% user inputs of their grades for all the assignments and exams
A1 = input('Assignment #1: ');
A2 = input('Assignment #2: ');
A3 = input('Assignment #3: ');
A4 = input('Assignment #4: ');
A5 = input('Assignment #5: ');
M1 = input('Midterm Exam: ');
F1 = input('Final Exam: ');

% final mark calculations
finalGrade = ((A1+A2+A3+A4+A5)*0.06 + M1*0.2333 + F1*0.4667);

% final grade message
fprintf('Your calculated final mark for ENCMP100 is : %.2f\n',finalGrade);



