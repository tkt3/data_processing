clearvars; clc; close all;
% Runs fiber tracking using mostly default AFQ pipeline.

sub_dirs = importTextList('../paths4dti.txt');
% sub_dirs = {};
% sub_dirs{1,1} = '/Users/cinnamon/Documents/dti2114/dtitrilin';


%==========================================================================

sub_group = ones(1,size(sub_dirs,1));

afq = AFQ_Create('cutoff',[5,95],'sub_dirs',sub_dirs,'sub_group',sub_group);
afq.params.track.faThresh = 0.15; 
afq.params.track.faMaskThresh = 0.15;
afq.params.track.angleThresh = 40;
afq.overwrite.fibers.wholebrain = sub_group;
afq.overwrite.fibers.segmented = sub_group;
afq.overwrite.fibers.clean = sub_group;
afq.overwrite.vals = sub_group;

[afq patient_data control_data norms abn abnTracts] = AFQ_run(sub_dirs, sub_group, afq);

save('afq_spm_output.mat');