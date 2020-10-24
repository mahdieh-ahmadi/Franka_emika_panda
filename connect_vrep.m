clc

t=size(pos);
counter=t(1);

vrep=remApi('remoteApi');
vrep.simxFinish(-1); % just in case, close all opened connections
clientID=vrep.simxStart('127.0.0.1',19999,true,true,5000,5);

if (clientID>-1)
    disp('Connected to remote API server');
    vrep.simxAddStatusbarMessage(clientID,'Hello CoppeliaSim!',vrep.simx_opmode_oneshot);
   
    %joint handle
     h=[0,0,0,0,0,0,0];
     for i=1:7 
     [~,h(i)]=vrep.simxGetObjectHandle(clientID,['Franka_joint',num2str(i)],vrep.simx_opmode_blocking);
     end
     
      for j=1:counter
          p = pos(j,:);
          
          vrep.simxSetJointTargetPosition(clientID,h(1),p(1),vrep.simx_opmode_streaming);
          vrep.simxSetJointTargetPosition(clientID,h(2),-p(2),vrep.simx_opmode_streaming);
          vrep.simxSetJointTargetPosition(clientID,h(3),p(3),vrep.simx_opmode_streaming);
          vrep.simxSetJointTargetPosition(clientID,h(4),p(4),vrep.simx_opmode_streaming);
          vrep.simxSetJointTargetPosition(clientID,h(5),p(5),vrep.simx_opmode_streaming);
          vrep.simxSetJointTargetPosition(clientID,h(6),p(6),vrep.simx_opmode_streaming);
          vrep.simxSetJointTargetPosition(clientID,h(7),p(7),vrep.simx_opmode_streaming);
          
          pause(0.01)
      end
else
    disp('Failed connecting to remote API server');
end
vrep.delete(); % call the destructor!
disp('Program ended');