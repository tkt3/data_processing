clear all; close all; clc

step1 = '/Volumes/FunTown/allAnalyses/BangRS/processing/01sliceTimingTemp1.mat';
step2 = '/Volumes/FunTown/allAnalyses/BangRS/processing/01sliceTimingTemp2.mat';
subs = '/Volumes/FunTown/allAnalyses/BangRS/processing/sub_list.mat';


n_img = 205; % number of volumes to be sliced

load(subs);
% nsub = size(sub,1);


load(step1);
matlabbatch = repmat(matlabbatch,1,21);

for i = 1:21
     for ii = 1:n_img
        matlabbatch{1,i}.spm.temporal.st.scans{1,1}{ii,1} = strrep(matlabbatch{1,i}.spm.temporal.st.scans{1,1}{ii,1},sub(1,:),sub(i,:));
     end
end
newstep = strrep(step1,'Temp','All');
save(newstep,'matlabbatch');

clearvars matlabbatch newstep i ii

load(step2);
matlabbatch = repmat(matlabbatch,1,22);

for i = 1:22
     for ii = 1:n_img
        matlabbatch{1,i}.spm.temporal.st.scans{1,1}{ii,1} = strrep(matlabbatch{1,i}.spm.temporal.st.scans{1,1}{ii,1},sub(22,:),sub(i+21,:));
     end
end

newstep = strrep(step2,'Temp','All');
save(newstep,'matlabbatch');