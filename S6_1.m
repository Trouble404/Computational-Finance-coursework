clear all

load('ftse_returns.mat')
load('all_returns.mat')

y = R_1
R = R_30;

% n=6;
% cvx_begin quiet
% variable weight(n)
%     minimize (norm(y - R(:,1:6)*weight))
%     subject to
%         weight'* ones(n,1)== 1;
%         weight' >= 0 ;
% cvx_end

% the first stock is 19
n1= 1;
min_error =0;
opt_s1 =0;
for k =1:1:30
    error = norm(y- R(:,k));
    if k ==1
        opt_s1 =k;
        min_error = error;
    else
        if error < min_error
            opt_s1 =k;
            min_error = error;
        end
    end
end 
 
% second stock selected is 22
n2 =2;
opt_s2 =0;
R2 = ones(length(y),n2);
R2(:,1)=R(:,opt_s1);
for k =1:1:30
    if k ~= opt_s1
        R2(:,2) = R(:,k);
        cvx_begin quiet
        variable w(n2)
            minimize (norm(y - R2*w))
            subject to
                w'* ones(n2,1)== 1;
         cvx_end
    end
    error = norm(y-R2*w);
    if opt_s2 ==0
        opt_s2 = k;
        min_error = error;
    else
        if error < min_error
            min_error = error;
            opt_s2 =k;
        end
    end
end
  
% third stock select is 15
n3 =3;
opt_s3 =0;
R3 = ones(length(y),n3);
R3(:,1)=R(:,opt_s1);
R3(:,2)=R(:,opt_s2);
for k =1:1:30
    if k ~= opt_s1 && k ~= opt_s2
        R3(:,3) = R(:,k);
        cvx_begin quiet
        variable w(n3)
            minimize (norm(y - R3*w))
            subject to
                w'* ones(n3,1)== 1;
         cvx_end
    end
    error = norm(y-R3*w);
    if opt_s3 ==0
        opt_s3 = k;
        min_error = error;
    else
        if error < min_error
            min_error = error;
            opt_s3 =k;
        end
    end
end


% fourth stock selected is 18
n4 =4;
opt_s4 =0;
R4 = ones(length(y),n4);
R4(:,1)=R(:,opt_s1);
R4(:,2)=R(:,opt_s2);
R4(:,3)=R(:,opt_s3);
for k =1:1:30
    if k ~= opt_s1 && k ~= opt_s2 && k~= opt_s3
        R4(:,n4) = R(:,k);
        cvx_begin quiet
        variable w(n4)
            minimize (norm(y - R4*w))
            subject to
                w'* ones(n4,1)== 1;
         cvx_end
    end
    error = norm(y-R4*w);
    if opt_s4 ==0
        opt_s4 = k;
        min_error = error;
    else
        if error < min_error
            min_error = error;
            opt_s4 =k;
        end
    end
end

% fith stock selected is 30
n5 =5;
opt_s5 =0;
R5 = ones(length(y),n5);
R5(:,1)=R(:,opt_s1);
R5(:,2)=R(:,opt_s2);
R5(:,3)=R(:,opt_s3);
R5(:,4)=R(:,opt_s4);
for k =1:1:30
    if k ~= opt_s1 && k ~= opt_s2 && k~= opt_s3 && k~= opt_s4
        R5(:,n5) = R(:,k);
        cvx_begin quiet
        variable w(n5)
            minimize (norm(y - R5*w))
            subject to
                w'* ones(n5,1)== 1;
         cvx_end
    end
    error = norm(y-R5*w);
    if opt_s5 ==0
        opt_s5 = k;
        min_error = error;
    else
        if error < min_error
            min_error = error;
            opt_s5 =k;
        end
    end
end
% 
%  sixth stock selected is 1
n6 =6;
opt_s6 =0;
R6 = ones(length(y),n6);
R6(:,1)=R(:,opt_s1);
R6(:,2)=R(:,opt_s2);
R6(:,3)=R(:,opt_s3);
R6(:,4)=R(:,opt_s4);
R6(:,5)=R(:,opt_s4);
for k =1:1:30
    if k ~= opt_s1 && k ~= opt_s2 && k~= opt_s3 && k~= opt_s4 && k~= opt_s5
        R5(:,n6) = R(:,k);
        cvx_begin quiet
        variable w(n6)
            minimize (norm(y - R6*w))
            subject to
                w'* ones(n6,1)== 1;
         cvx_end
    end
    error = norm(y-R6*w);
    if opt_s6 ==0
        opt_s6 = k;
        min_error = error;
    else
        if error < min_error
            min_error = error;
            opt_s6 =k;
        end
    end
end