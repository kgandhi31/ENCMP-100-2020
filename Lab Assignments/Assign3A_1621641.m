%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Course: ENCMP 100
% Assignment: 3A
% Name: Krish Gandhi
% CCID: gandhi
% U of A ID: 1621641
%
% Acknowledgements:
% None
% Description:
% This program calculates savings for college education.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear; clc; close all;

option = input('Select a program: 1. Arts; 2. Science; 3. Engineering: ');

% current year tuition fees
switch option
    case 1 % Arts
        tuition = 6000;
    case 2 % Science
        tuition = 6500;
    case 3 % Engineering
        tuition = 7000;        
end

% monthly balance for the next 18 years
balance = zeros(1,216);
balance(1) = 2000;
for i = 2:216
    balance(i) = balance(i-1) + (balance(i-1)*0.005) + 200;
end

% annual tuition fee for the next 22 years
annualCost = zeros(1,22);
annualCost(1) = tuition;
for i = 2:22
    annualCost(i) = annualCost(i-1) + (annualCost(i-1)*0.0575);
end

% cost of 4-year college tuition
tuitionCost = sum(annualCost(19:22));

% compare balance and cost
fprintf('At the end of 18 years you will have saved $ %.2f\n',balance(end));
fprintf('The cost of a 4-year college tuition fee is $ %.2f\n',tuitionCost);
if balance(end) >= tuitionCost
    fprintf('Congratulations!!!! You have saved enough.\n');
else
    fprintf('The saving is $ %.2f short.\n',(tuitionCost - balance(end)));
end

% plot annual savings vs number of years
x = (1:216)/12;
yb = balance;
yline(tuitionCost,'b');
hold on;
plot(x,yb,'g');
xlabel('Year');
ylabel('Balance');
title('College Savings vs. Tuition Fee');

