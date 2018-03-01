m = [ 0.10, 0.20, 0.15 ]';
C = [
      [  0.005, -0.010,  0.004 ]
      [ -0.010,  0.040, -0.002 ]
      [  0.004, -0.002,  0.023 ]
    ];

E = zeros(100, 1);
V = zeros(100, 1);

for n = 1:100
    y = rand(3, 1);
    y = y / norm(y, 1);
    E(n) = m' * y;
    for i = 1:3
        for j = 1:3
            V(n) = V(n) + C(i, j) * y(i) * y(j);
        end
    end
end

for n = 1:100
    V(n) = sqrt(V(n));
end

frontcon(m, C);
title('E-V plot and efficient frontier of three-asset model');
hold on;
scatter(V, E);