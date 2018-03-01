m = [ 0.10, 0.20, 0.15 ]';
C = 100 * [
      [  0.005, -0.010,  0.004 ]
      [ -0.010,  0.040, -0.002 ]
      [  0.004, -0.002,  0.023 ]
    ];

[PRisk1, PRoR1, PWts1] = NativeMV(m, C, 10);
[PRisk2, PRoR2, PWts2] = NativeMV_CVX(m, C, 10);
plot(PRisk1, PRoR1);
hold on;
plot(PRisk2, PRoR2);
title('Efficient frontier');
xlabel('Risk (Variance)');
ylabel('Expected Return');