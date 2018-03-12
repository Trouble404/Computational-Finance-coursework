clear all

load('ftse_returns.mat')
load('all_returns.mat')

y = R_1
R = R_30;

 % sparse portfolio

array= zeros(400,2);
n=0;
for s = 0.01:0.5:200
    n=n+1;
    tau = s;
    cvx_begin quiet
    variable w_sparse(30);
    minimize (norm(y-R*w_sparse) + tau* norm(w_sparse,1));
    cvx_end
    coff_nzero= numel(find(abs(w_sparse)>0.00131752));
    array(n,1)=s;
    array(n,2)=coff_nzero;
end
figure(4)
plot(array(:,1),array(:,2),'rx','LineWidth',2)
ylabel('Number of Non-zero coefficients', 'FontSize', 14);
xlabel('Regularization', 'FontSize', 14);

x1 = array(:,1)
y1 = array(:,2)