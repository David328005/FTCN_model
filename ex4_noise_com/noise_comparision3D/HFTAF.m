function y = HFTAF(x)
n=0.2;


  

    abs_x = abs(x);
   
    sign_x = sign(x);

   
    term1 = 0.5 * (abs_x.^n) .* sign_x;
    term2 = 0.5 * x;
    term3 = 0.5 * (abs_x.^(1/n)) .* sign_x;

   
    y = term1 + term2 + term3;
end