S0 = 3480; K = 3025; T = 0.5; r = 0.06; sigma = 0.5;

for M=1:100 
    type='call'; 
    Price = bls_cp( K, S0, T, r, sigma, type )
    Vec(M)=Price;
end

for M=1:100 
    type='Lattice';  
    Price=LatticeEurCall(S0,K,r,T,sigma,M);
    Vep(M)=Price; 
end

for M=1:100 
    type='Amput'; 
    Price=AmPutLattice(S0,K,r,T,sigma,M);  
    Vac(M)=Price;
end

for M=1:100
    type= 'Amcall'; 
    Price=AmCallLattice(S0,K,r,T,sigma,M); 
    Vap(M)=Price;
end

figure(1)  
plot(Vec,'b');
hold on;
plot(Vep,'r'); 
hold on;  
legend ('Eurocall','Bino');

figure(2)
plot(Vac,'b'); 
hold on;
plot(Vap,'r');
legend ('Amput','Amcall');