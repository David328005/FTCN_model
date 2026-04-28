function phi_z = phi(z)


k1=2;
k2=2;
k3=1;
k4=1;
d=0.8;
c=4;
a=0.3;
b=0.2;


abs_z = abs(z);


sgn_z = zeros(size(z));
nonzero_idx = abs_z ~= 0;
if any(nonzero_idx(:))
    if isreal(z)
        
        sgn_z(nonzero_idx) = sign(z(nonzero_idx));
    else
        
        sgn_z(nonzero_idx) = z(nonzero_idx) ./ abs_z(nonzero_idx);
    end
end


exp_term = exp(abs_z.^d);


term1 = (k1 * abs_z.^a + k2 * abs_z.^b).^c .* sgn_z;


term2 = k4 * sgn_z;


term3 = (k3/d) * exp_term .* (abs_z.^(1-d)) .* sgn_z;


phi_z = term1 + term2 + term3;

zero_idx = (abs_z == 0);
phi_z(zero_idx) = 0;
end


