%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Course: ENCMP 100
% Assignment: 3B
% Name: Krish Gandhi
% CCID: gandhi
% U of A ID: 1621641
%
% Acknowledgements:
% None
% Description:
% This program calculates the required minimum monthly savings for a 4-year tuition fee.
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

% annual tuition fee for the next 22 years
annualCost = zeros(1,22);
annualCost(1) = tuition;
for i = 2:22
    annualCost(i) = annualCost(i-1) + (annualCost(i-1)*0.0575);
end

% cost of 4-year college tuition
tuitionCost = sum(annualCost(19:22));

% required minimum monthly balance
balance = zeros(1,216);
balance(1) = 2000;
monthlyPayment = 40;
while balance(end) < tuitionCost
    monthlyPayment = monthlyPayment + 10;
    for i = 2:216
        balance(i) = balance(i-1) + (balance(i-1)*0.005) + monthlyPayment;
    end
end

fprintf('The 4-year tuition fee is $ %.2f\n',tuitionCost);
fprintf('You will need to save $ %.2f each month to reach the goal\n', monthlyPayment);





