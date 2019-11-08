clear all; close all; clc
step = '/Volumes/FunTown/allAnalyses/BangRS/processing/04vbm2Temp.mat';
subs = '/Volumes/FunTown/allAnalyses/BangRS/processing/sub_list.mat';

load(subs);
nsub = size(sub,1);


load(step);
matlabbatch = repmat(matlabbatch,1,nsub);


for i = 1:nsub
    matlabbatch{1,i}.spm.tools.vbm8.estwrite.data{1,1} = strrep(matlabbatch{1,i}.spm.tools.vbm8.estwrite.data{1,1},sub(1,:),sub(i,:));
end


newstep = strrep(step,'Temp','All');
save(newstep,'matlabbatch');