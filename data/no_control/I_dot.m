function dIdt = I_dot (s,ro,I,T,alpha,c1,d1)
    
    dIdt = s + ro*I*T/(alpha+T) - c1*I*T - d1*I;