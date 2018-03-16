function [ pred, vega ] = bls_cp( K, s, tau, r, sig, type )

    d1 = (log((s/K))+( r+(sig^2)/2)*(tau))/ (sig*sqrt(tau));
    d2 = ((log((s/K))+( r+(sig^2)/2)*(tau))/ (sig*sqrt(tau))) - (sig*sqrt(tau));

    if strcmp(type,'call')
        pred= (s*normcdf(d1)) - (K*exp(-r*(tau))*normcdf(d2));
    else
        pred= (K*exp(-r*(tau))*normcdf(-d2)) - (s*normcdf(-d1))  ;
    end

    vega = s*normcdf(d1)*sqrt(tau);
end

