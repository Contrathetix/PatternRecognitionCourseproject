% Test driver for a single digit
clear all; close all; clc;

load('training_data/stroke_7_0035.mat', 'pos');
C = digit_classify(pos)
