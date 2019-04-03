function y = dc_polyval(p,t)

% dc_polyval    Calculate values for polynomial.
%
%     y = digit_classify_polyval(p,t) Calculate values for polynomial
%         with coefficients p at points t. The degree is defined by
%         the number of coefficients.

% Column count, that is, the degree of the polynomial + 1 I think.
colcount = length(p);

% Init the matrix to contain the values of t to powers.
A = ones(length(t),colcount);

% Fill the values of t to powers.
for k = 1 : 1 : colcount
  A(:,k) = t.^(colcount-k);
end

% Calculate values.
y = (A*p')';

end
