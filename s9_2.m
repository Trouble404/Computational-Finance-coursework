clear all;
load("data.mat")

% call option
vol_30_c1= implied(c2925,2925);
vol_30_c2= implied(c3025,3025);
vol_30_c3= implied(c3125,3125);
vol_30_c4= implied(c3225,3225);
vol_30_c5= implied(c3325,3325);

% put option
vol_30_p1= implied(p2925,2925);
vol_30_p2= implied(p3025,3025);
vol_30_p3= implied(p3125,3125);
vol_30_p4= implied(p3225,3225);
vol_30_p5= implied(p3325,3325);
% 
s = [2925;3025;3125;3225;3325];
s_v = [s, zeros(5,1)];
s_p = [s, zeros(5,1)];
vol_30 = [vol_30_c1,vol_30_c2,vol_30_c3,vol_30_c4,vol_30_c5];
vol_30_p = [vol_30_p1,vol_30_p2,vol_30_p3,vol_30_p4,vol_30_p5];
% choose 2
i=101;
s_v(1,2)= vol_30_c1(i,:);
s_v(2,2)= vol_30_c2(i,:);
s_v(3,2)= vol_30_c3(i,:);
s_v(4,2)= vol_30_c4(i,:);
s_v(5,2)= vol_30_c5(i,:);

s_p(1,2)= vol_30_p1(i,:);
s_p(2,2)= vol_30_p2(i,:);
s_p(3,2)= vol_30_p3(i,:);
s_p(4,2)= vol_30_p4(i,:);
s_p(5,2)= vol_30_p5(i,:);

