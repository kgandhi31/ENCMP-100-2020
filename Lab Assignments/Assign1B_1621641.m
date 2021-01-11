%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Course: ENCMP 100
% Assignment: 1B
% Name: Krish Gandhi
% CCID: gandhi
% U of A ID: 1621641
% 
% Description:
% This program will create a plot of the height and the velocity of a ball
% as a function of time for the first 10 seconds of flight, incremented
% every second. 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% program title 
fprintf('Plot of Height and Velocity vs Time for a Ball\n\n');

% initial height and initial velocity of the ball
vInitial = input('Enter the initial velocity of the ball: '); 
hInitial = input('Enter the initial height of the ball: ');

% plotting the graph 
figure(1);
x = 0:10;
axis([0 10 -100 250]);
grid on;
ax = gca;
ax.GridLineStyle = '--';
hold on;
y1 = (0.5*-9.81*x.^2 + vInitial*x + hInitial); % height equation
y2 = (-9.81*x + vInitial);                     % velocity equation
plot(x,y1,'-b',x,y2,'--og'); 
legend('Height','Velocity');
xlabel('Time (s)');
ylabel('Height (m) and Velocity (m/s)');
title('Plot of height and velocity vs time');


