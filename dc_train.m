function P = dc_train(T,pd,s,pln,plb)

% dc_train    Performs training based on the training data.
%
%     T   = Training data, cell array of file info items for the training
%           datafor each digit.
%
%     pd  = Degree of polynomial used in training, when fitting the
%           polynomial used to represent the digit.
%
%     s   = Target scale vector of [w,h,d] used to scale each sample
%           before fitting.
%
%     pln = Number of points used in plotting the fitted average digits
%           for illustrative purposes.
%
%     plb = Whether to plot the fitted digits to illustrate or not.

trainkeys = keys(T);
N = length(trainkeys);
P = zeros(3,pd+1,N);

% Calculate the 'average digit' for each digit, using the training data
% available for each digit.
for k = 1 : 1 : N
  P(:,:,k) = dc_fit_number(T(trainkeys{k}),pd,s);
end

% Plot the average digits for illustrative purposes if needed.
if (plb)
  figure;
  plot_points = linspace(0,1,pln);
  plotaxes = [-s(1), s(1), -s(2), s(2), -s(3), s(3)]*(1/2);
  row_count = 4;
  col_count = round(N/row_count);
  for k = 1 : 1 : N
    subplot(row_count,col_count,k);
    hold on; grid on; axis equal;
    plot3( ...
        dc_polyval(P(1,:,k),plot_points), ...
        dc_polyval(P(2,:,k),plot_points), ...
        dc_polyval(P(3,:,k),plot_points)  ...
    );
    axis(plotaxes);
    title(trainkeys(k));
    hold off;
  end
end

end
