% t=size(pos);
% counter=t(1);
clear all
close all
alpha=[pi/2 -pi/2 pi/2 -pi/2 pi/2 pi/2 0];
a=[0 0 0.0825 -0.0825 0 0.088 0];
d=[0.333 0 0.316 0 0.384 0 0.1070];
%  for j=1:counter
       % teta=pos(j,:);
       teta=[0,0,0,0,0,0,0];
dhparams=[a' alpha' d' teta'];
q=[pi/2 -pi/2 pi/2 -pi/2 0 pi/2];
for j=1:5
    clear robot
robot = rigidBodyTree;

body1 = rigidBody('body1');
jnt1 = rigidBodyJoint('jnt1','revolute');
body2 = rigidBody('body2');
jnt2 = rigidBodyJoint('jnt2','revolute');
body3 = rigidBody('body3');
jnt3 = rigidBodyJoint('jnt3','revolute');
body4 = rigidBody('body4');
jnt4 = rigidBodyJoint('jnt4','revolute');
body5 = rigidBody('body5');
jnt5 = rigidBodyJoint('jnt5','revolute');
body6 = rigidBody('body6');
jnt6 = rigidBodyJoint('jnt6','revolute');
body7 = rigidBody('body7');
jnt7 = rigidBodyJoint('jnt7','revolute');

setFixedTransform(jnt1,dhparams(1,:),'dh');
setFixedTransform(jnt2,dhparams(2,:),'dh');
setFixedTransform(jnt3,dhparams(3,:),'dh');
setFixedTransform(jnt4,dhparams(4,:),'dh');
setFixedTransform(jnt5,dhparams(5,:),'dh');
setFixedTransform(jnt6,dhparams(6,:),'dh');
setFixedTransform(jnt7,dhparams(7,:),'dh');

jnt2.HomePosition = q(j);
jnt3.HomePosition = q(j);
tform = trvec2tform([0.25, 0.25, 0]);
setFixedTransform(jnt2,tform);

body1.Joint = jnt1;
body2.Joint = jnt2;
body3.Joint = jnt3;
body4.Joint = jnt4;
body5.Joint = jnt5;
body6.Joint = jnt6;
body7.Joint = jnt7;

addBody(robot,body1,'base')
addBody(robot,body2,'body1')
addBody(robot,body3,'body2')
addBody(robot,body4,'body3')
addBody(robot,body5,'body4')
addBody(robot,body6,'body5')
addBody(robot,body7,'body6')


show(robot);
axis([-1 1 -1 1 -0.5 1.5])
        pause(1)
  end