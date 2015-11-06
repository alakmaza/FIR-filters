function [h1] = filterSound(a, x)

    h_in = (zeros(1,x));
    h_in(a) = 1;
    H = [h_in, h_in(end:-1:2)];
    L = 2 * length(h_in) - 1;
    ka = (0:(L-1)/2);
    kb = ((L+1)/2:(L-1));
    a = (-2*pi/L) * ka * ((L-1)/2);
    b = (2*pi/L) * (L - kb) * ((L-1)/2);
    theta = [a,b];
    H1 = H .* exp(1i*theta);
    h1 = ifft(H1);
end
