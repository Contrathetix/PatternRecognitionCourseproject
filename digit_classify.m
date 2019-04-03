function C = digit_classify(sample)

% digit_classify    Determine the digit.
%
%   C = digit_classify(C) is the digit represented by the sample C.
%
%   The digit will be in range [0,9], and the sample C is a matrix
%   containing the x, y and z coordinates recorded for the digit when
%   drawn.
%
%   The function only classifies a single sample at a time, and trains
%   the system for each sample separately, which will result in poor
%   performance when running it multiple times.

p_degree = 9;                % degree of polynomial used in fitting
s = [1,1,0.1];               % scale used to scale all samples
trainpath = 'training_data'; % training data directory
plot_figs = 1;               % whether to plot figures
p_sample_n = 40;

traindata = containers.Map;

for number = 0 : 1 : 9
  trainfiles = dir(sprintf('%s/stroke_%d_*.mat',trainpath,number));
  traindata(sprintf('%d', number)) = trainfiles;
end

% 3d matrix of polynomial coefficients
P = dc_train(traindata,p_degree,s,p_sample_n,plot_figs);

% actual classification
C = dc_classify(sample,P,p_degree,s,keys(traindata),p_sample_n,plot_figs);

end
