clear all;
load("data.mat");

% c\p 2925 
K=2925;
[call_2925,Cdiff_2925,v_2925,T] = blscall(c2925,K)
[put_2925,Pdiff_2925,v_2925,T] = blsput(p2925,K)

% c\p 3025 
K=3025;
[call_3025,Cdiff_3025,v_3025,T] = blscall(c3025,K)
[put_3025,Pdiff_3025,v_3025,T] = blsput(p3025,K)

% c\p 3125 
K=3125;
[call_3125,Cdiff_3125,v_3125,T] = blscall(c3125,K)
[put_3125,Pdiff_3125,v_3125,T] = blsput(p3125,K)

% c\p 3225 
K=3225;
[call_3225,Cdiff_3225,v_3225,T] = blscall(c3225,K)
[put_3225,Pdiff_3225,v_3225,T] = blsput(p3225,K)

% c\p 3325 
K=3325;
[call_3325,Cdiff_3325,v_3325,T] = blscall(c3325,K)
[put_3325,Pdiff_3325,v_3325,T] = blsput(p3325,K)