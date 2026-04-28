function y = Matrix_Mt(t,n)
    y = zeros(n,n);
    for l=1:n
        for k=1:n
            if l==k
                y(l,k)=n+sin(1i*t);
            else
                y(l,k)=cos(1i*t)/(abs(l-k));
            
               
            end
        end
    end