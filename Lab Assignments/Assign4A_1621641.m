%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Course: ENCMP 100
% Assignment: 4A
% Name: Krish Gandhi
% CCID: gandhi
% U of A ID: 1621641
%
% Acknowledgements:
% None
%
% Description:
% This program calculates medal standings for Olympics.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [] = Assign4A_1621641()

clear; clc; close all;

% loads countries, gold, silver, and bronze variables
% country codes include XXX, which is used to handle tied medals
% preallocate matrix for table values
load olympics.mat gold silver bronze countries;
results = zeros(size(countries,1),4);

% compute medals for each country saving it into an array or vector
for j=1:1:length(countries)
    results(j,:) = compute_medals(gold,silver,bronze,countries(j,:));
end

% display medal counts for all countries
print_country_results(countries,results);

% display countries with
% most medals (i=1), most gold medals (i=2), >=20 medals (i=3)
for i=1:3
    print_best_countries(countries,results,i);
end
end

function results = compute_medals(gold,silver,bronze,country)
% computes number of gold, silver, bronze medals and
% total medal tally for a given country and a given sport type
gold_count = 0;
silver_count = 0;
bronze_count = 0;
for j=1:1:length(gold)
    if country == gold(j,:)
        gold_count = gold_count + 1;
    end
    if country == silver(j,:)
        silver_count = silver_count + 1;
    end
    if country == bronze(j,:)
        bronze_count = bronze_count + 1;
    end
end
total_medals = gold_count + silver_count + bronze_count;
results = [gold_count, silver_count, bronze_count, total_medals];
end

function [] = print_country_results(countries,results)
% prints formatted results
fprintf('Country Gold Silver Bronze Total\n');
for i=1:1:length(countries)
    if (countries(i,:) ~= 'XXX')
        fprintf('%7s %4d %6d %6d %5d\n', countries(i,:), results(i,1), ...
            results(i,2), results(i,3), results(i,4));
    end
end
end

function [] = print_best_countries(countries,results,selection)
% prints best performing countries
% selection = 1 shows countries with most medals
% selection = 2 shows countries with most gold medals
% selection = 3 shows countries with at least 20 medals]
switch selection
    case 1
        [value,index] = max(results(:,4));
        fprintf('Countries with the most medals: ');
        fprintf('%s ', countries(index,:));
    case 2
        [value,index] = max(results(:,1));
        fprintf('Countries with the most gold medals: '),
        fprintf('%s ', countries(index,:));
    case 3
        index = find(results(:,4) >= 20);
        fprintf('Countries with at least 20 medals: ');
        for j=1:length(index)
            fprintf('%s ', countries(index(j),:)');
        end
end
fprintf('\n');
end
