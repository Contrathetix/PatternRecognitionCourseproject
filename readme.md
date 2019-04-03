# Pattern Recognition Course Project

Practical assignment required for a course. Requires the training data from the course, but the code might work with also other data that is in a similar format. The code was developed in GNU Octave, and later edited in Matlab, so should work in both, hopefully.

For example, the code was implemented and tested with the training data in folder:

    /training_data

Within that folder, there would be one `.mat` file for each sample (only one sample for each file) that are loaded. The `.mat` files should be named in the following format:

    /training_data/stroke_X_YYYY.mat

Where `X` is the digit in range [0, 9] and `YYYY` is the measurement number. For example, the 35<sup>th</sup> sample of digit 7 would be contained within the file:

    /training_data/stroke_7_0035.mat

Within each `.mat` file, there should be a matrix `pos` that contains three columns: first column represents the x coordinates, second the y coordinates and third the z coordinates of the sample as recorded when drawn by someone. The number of rows can be anything, as long as there are enough measurements to identify the digit.
