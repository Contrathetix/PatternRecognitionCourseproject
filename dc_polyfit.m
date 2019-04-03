function coeff = dc_polyfit(x,y,degree)

% dc_polyfit    Fit a polynomial to data points.
%
%     coeff = dc_polyfit(x,y,degree) Fit a polynomial of degree 'degree'
%             to data points (x,y). Returns the coefficients.

% Initialise the matrix A containing values for x in different powers.
A = ones(length(x), degree + 1);

% Fill in the matrix with the x values to powers of degree.
% First column contains highest degree, last column lowest.
for p = 1 : 1 : degree
  A(:,degree + 1 - p) = x.^p;
end

% Perform a fit, as best as possible, hoping nothing breaks, and
% return a row vector, for compatibility with the original polyfit.
%coeff = (inv(A'*A)*A'*y)';
coeff = (A\y)';

end
