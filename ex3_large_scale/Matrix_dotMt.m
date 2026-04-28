function dM_dt=Matrix_dotMt(t, n)

    dM_dt = zeros(n, n);
    
    for l = 1:n
        for k = 1:n
            if l == k
           
                dA_dt(l, k) = 1i * cos(1i * t);
            else
             
                dA_dt(l, k) = -1i * sin(1i * t) / abs(l - k);
            end
        end
    end
end