function C = dc_classify(sample,P,pd,s,Pk,pln,plb)

% dc_classify    Classifies a digit.
%
%     C = dc_classify(sample,P,p_degree,s,trainkeys,p_sample_n,plot_figs)
%     Return the class C for a digit in range [0,9]. This is the actual
%     classification function, that takes more parameters than the
%     digit_classify wrapper, because the wrapper was defined in the
%     project task description as only taking one parameter.
%
%     sample = Matrix containing the x,y,z coordinates recorded for one
%              digit as drawn by the user.
%
%     P      = 3d matrix of polynomial coefficients for different digits
%              as trained beforehand based on training data.
%
%     pd     = Degree of polynomial used for training.
%
%     s      = Scale used in scaling the digits.
%
%     Pk     = Matching keys for P, number strings in range [0,9].
%
%     pln    = Sample count for plotting.
%
%     plb    = Whether to plot figures to illustrate.

sample_P = dc_fit(sample,pd,s);

plot_points = linspace(0,1,pln);
sample_values = dc_polyval_xyz(sample_P,plot_points);

C = 0; C_diff = inf;

% Find the best match for coefficients
for k = 1 : 1 : size(P,3)
  comp_values = dc_polyval_xyz(P(:,:,k),plot_points);
  if (plb)
    figure;
    % x
    subplot(2,2,1); hold on; grid on; axis equal; title('x');
    plot(plot_points,sample_values(:,1),'r-');
    plot(plot_points,comp_values(:,1),'b-');
    % y
    subplot(2,2,2); hold on; grid on; axis equal; title('y');
    plot(plot_points,sample_values(:,2),'r-');
    plot(plot_points,comp_values(:,2),'b-');
    % z
    subplot(2,2,3); hold on; grid on; axis equal; title('z');
    plot(plot_points,sample_values(:,3),'r-');
    plot(plot_points,comp_values(:,3),'b-');
    % full
    subplot(2,2,4); hold on; grid on; axis equal; title(Pk(k));
    plot3(sample_values(:,1),sample_values(:,2),sample_values(:,3),'r-');
    plot3(comp_values(:,1),comp_values(:,2),comp_values(:,3),'b-');
    hold off;
  end
  difference = sum(sqrt(sum((sample_values - comp_values).^2)));
  if (difference < C_diff)
    % Find the class with the lowest difference.
    C = str2double(Pk{k});
    C_diff = difference;
  end
end

end
