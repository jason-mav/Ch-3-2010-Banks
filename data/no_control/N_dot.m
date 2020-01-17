function dNdt = N_dot (r2,N,b2,c4,T)
    
    dNdt = diff(r2*N*(1 - b2*N) - c4*T*N);