clear all
close all
clc

global qi;

tf = 7;
Ts=0.001;
qi=[pi/2 ; 0 ; 0 ;-pi/2 ; 0 ;pi/2 ; pi/6]; %initial configuration
sim simulink_panda

%get data from simulation
x=ans.x;
x_des=ans.x_des;
pos = ans.q;

%plot graph
plot3(x(:,1),x(:,2),x(:,3));
xlabel('x');
ylabel('y');
zlabel('z');
title('x');
figure
plot3(x_des(:,1),x_des(:,2),x_des(:,3))
xlabel('x');
ylabel('y');
zlabel('z');
title('x-des');

%connect v-rep
connect_vrep


