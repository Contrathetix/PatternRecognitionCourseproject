function P = dc_fit_number(datafiles,pd,s)

% dc_fit_number    Fit all samples for a given number.
%
%     P = dc_fit_number(datafiles,pd,s) Perform fitting for each sample,
%     with the samples contained in the files listed in datafiles.
%     Return the average digit for this one, for use in classification.
%
%     datafiles = List of file infos.
%
%     pd        = Degree of polynomial used in fitting.
%
%     s         = Scale used to scale each sample.

datacount = length(datafiles);
P = zeros(3,pd+1,datacount);

% Read and fit.
for k = 1 : 1 : datacount
  load(sprintf('%s/%s',datafiles(k).folder,datafiles(k).name), 'pos');
  P(:,:,k) = dc_fit(pos,pd,s);
end

% Convert to average digit across all sample fits for this digit.
P = mean(P,3);

end
