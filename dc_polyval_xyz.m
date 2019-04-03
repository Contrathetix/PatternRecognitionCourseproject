function polyvals = dc_polyval_xyz(P,t)

% dc_polyval_xyz    Calculate values for all three dimensions.
%
%     Y = dc_polyval_xyz(P,t) Return values for all three dimensions for
%         polynomial with coefficients P at sampling points t.
%         P is a 3*poly_degree matrix.

polyvals = [
  dc_polyval(P(1,:),t)
  dc_polyval(P(2,:),t)
  dc_polyval(P(3,:),t)
]';

end
