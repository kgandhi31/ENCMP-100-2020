%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Course: ENCMP 100
% Assignment: 2
% Name: Krish Gandhi
% CCID: gandhi
% U of A ID: 1621641
% Acknowledgements:
% I received help from Andrew Samoil on using the mod function.
%
% Description:
% This program contains four rules which can be used to crack the
% secret code to save Maverick the co-op student.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear
clc

% get secret code; if code is 9 digits, get sum of digits
code = input('Please enter a code to break: ','s');
if (length(code) ~= 9)
    disp('Decoy Message: Not a nine-digit number.');
    return;
else
    digits = (code - '0');
    codeSum = sum(digits);
end

% odd-even "truth" test; if even, get rescue number
if (mod(codeSum,2) ~= 0)
    disp('Decoy Message: Sum is odd.');
    return;
else
    rescueNum = digits(1)*digits(3) - digits(5);
end

% valid rescue day
switch rescueNum
    case 1
        rescueDay = "Monday";
    case 2
        rescueDay = "Tuesday";
    case 3
        rescueDay = "Wednesday";
    case 4
        rescueDay = "Thursday";
    case 5
        rescueDay = "Friday";
    case 6
        rescueDay = "Saturday";
    case 7
        rescueDay = "Sunday";
    otherwise
        disp('Decoy Message: Invalid rescue day.');
        return;
end

% get rendezvous number
if (mod((digits(2)*digits(4) - digits(6)),3) == 0)
    rendNum = digits(7) - digits(9);
else
    rendNum = digits(8) - digits(9);
end

% valid rendezvous point
switch rendNum
    case 1
        rendPoint = "bridge";
    case 2
        rendPoint = "library";
    case 3
        rendPoint = "river crossing";
    case 4
        rendPoint = "airport";
    case 5
        rendPoint = "bus terminal";
    case 6
        rendPoint = "hospital";
    case 7
        rendPoint = "St. Petes Church";
    otherwise
        disp('Decoy Message: Invalid rendezvous point.');
        return;
end

% display successful rescue day and rendezvous point message
if (rendNum == 7)
    disp('Rescue on ' + rescueDay + ' at ' + rendPoint + '.');
else
    disp('Rescue on ' + rescueDay + ' at the ' + rendPoint + '.');
end
