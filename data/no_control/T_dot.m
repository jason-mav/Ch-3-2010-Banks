function dTdt = T_dot (r1,T,b1,c2,I,c3,N)
    
    dTdt = r1*T*(1 - b1*T) - c2*I*T - c3*T*N;