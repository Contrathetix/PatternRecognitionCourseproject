function pos = dc_scale(pos,scales_vector)

% dc_scale    Scale the points contained within pos.
%
%     pos = dc_scale(pos,scales_vector) Scales points in pos to bounds
%     provided by scales_vector. This function is based on the research
%     paper on using scaling and other methods to help with character
%     recognition by someone. Cannot remember who. Please read the paper
%     for explanations, the code is adapted from it, with some edits to
%     make it shorter.

max_M = max(pos,[],1); % Current maximum value
min_M = min(pos,[],1); % Current minimum value

v_c = (min_M + max_M) / 2;
bounds = max_M - min_M;
pos = (scales_vector ./ bounds).*(pos - v_c);

end
