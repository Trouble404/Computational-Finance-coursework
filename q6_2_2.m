n= 30;
tau = 175;
cvx_begin quiet
variable w_sparse(n)
    minimize (norm(y-R*w_sparse) + tau* norm(w_sparse,1))
    subject to 
        w_sparse'*ones(n,1) ==1;

cvx_end
error_sparse = norm(y-R*w_sparse) + tau* norm(w_sparse,1);
mse_sparse = error_sparse/758; 
re_6= find(abs(w_sparse)>0.00131752);
re6_w = w_sparse(re_6)
