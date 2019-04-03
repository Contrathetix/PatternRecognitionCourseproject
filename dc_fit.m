function P = dc_fit(sample,pd,s)

% dc_fit    Fits a polynomial to sample.
%
%     P = dc_fit(sample,p_degree,s) Fits a polynomial to each of the three
%     dimensions of sample.
%
%     pd = Degree of polynomial to fit to.
%
%     s  = Scale used to scale the sample.

% Scale the sample, to make each sample uniform in size.
sample = dc_scale(sample,s);

% The sampling points (imaginary, used for calculations only, for fitting).
fit_axis = linspace(0,1,size(sample,1))';

% The final fitting, for each of the three dimensions separately.
P = [
  dc_polyfit(fit_axis,sample(:,1),pd)
  dc_polyfit(fit_axis,sample(:,2),pd)
  dc_polyfit(fit_axis,sample(:,3),pd)
];

end
