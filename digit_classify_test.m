% Test driver for a test set of chosen size. Default size is 30% (0.3).
clear all; close all; clc;

p_degree = 9; % degree of polynomial used in fitting
s = [1,1,1];  % scale used to scale all samples
trainpath = 'training_data'; % training data directory
plot_figs = 1; % whether to plot figures
p_sample_n = 40;
test_sample_percentage = 0.3;

traindata = containers.Map;
testdata = containers.Map;

for number = 0 : 1 : 9
  filelist = dir(sprintf('%s/stroke_%d_*.mat',trainpath,number));
  filecount = size(filelist,1);
  testindex = randperm(filecount,floor(filecount * test_sample_percentage));
  testfiles = filelist(testindex);
  filelist(testindex) = [];
  trainfiles = filelist;
  traindata(sprintf('%d', number)) = trainfiles;
  testdata(sprintf('%d', number)) = testfiles;
end

P = dc_train(traindata,p_degree,s,p_sample_n,plot_figs);

testkeys = keys(testdata);
totalcount = 0;
failcount = 0;

t = linspace(0,1,p_sample_n);
F = [];
Flabels = {};

for k = 1 : 1 : length(testkeys)
  samplelist = testdata(testkeys{k});
  sampleclass = str2double(testkeys{k});
  samplecount = length(samplelist);
  totalcount = totalcount + samplecount;
  for j = 1 : 1 : samplecount
    load(sprintf('%s/%s',samplelist(j).folder,samplelist(j).name), 'pos');
    C = dc_classify(pos,P,p_degree,s,testkeys,p_sample_n,0);
    % uncomment to print sample class vs. classified class
    %fprintf('(%d,%d), ',sampleclass,C);
    if (C ~= sampleclass)
      failcount = failcount + 1;
      samplefit = dc_fit(pos,p_degree,s);
      F(:,:,end+1) = dc_polyval_xyz(samplefit,t);
      Flabels{end+1} = sprintf('(%d,%d)',sampleclass,C);
    end
  end
end

figure;
F(:,:,1) = [];
N = size(F,3);
row_max = 6;
col_count = ceil(N/row_max);
for k = 1 : 1 : N
  subplot(row_max,col_count,k); hold on;
  axis equal; grid on; axis([-s(1),s(1),-s(2),s(2),-s(3),s(3)]*(1/2));
  plot(F(:,1,k),F(:,2,k));
  title(Flabels{k});
  set(gca,'xtick',[]);
  set(gca,'ytick',[]);
  hold off;
end

fprintf('\nSuccess rate %.2f percent\n', (1-(failcount/totalcount))*100);
