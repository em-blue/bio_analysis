 % Biopic analysis

close all
clear all

disp('Select VFA T1 map')
t1mapName = uigetfile('*.dcm'); 
vfa=dicomread(t1mapName);

%testROI=load_nii('TESTlabel.nii.gz');
%testROI=fliplr(rot90(testROI.img,1));

disp('Select ROI folder')
dirName = uigetdir(); 

supipsparotid=load_nii('sup ips parotid-label.nii.gz');
supipsparotid=fliplr(rot90(supipsparotid.img,1));
supconparotid=load_nii('sup con parotid-label.nii.gz');
supconparotid=fliplr(rot90(supconparotid.img,1));
ipssubmandib=load_nii('ips submandib-label.nii.gz');
ipssubmandib=fliplr(rot90(ipssubmandib.img,1));
consubmandib=load_nii('con submandib-label.nii.gz');
consubmandib=fliplr(rot90(consubmandib.img,1));
node=load_nii('Node-label.nii.gz');
node=fliplr(rot90(node.img,1));
primary=load_nii('Primary-label.nii.gz');
primary=fliplr(rot90(primary.img,1));

size(vfa)
vfa=squeeze(vfa);
size(vfa)
vfa=flip(vfa,3);
nbslice = size(vfa, 3);



%% ALL ROIs
for i=1:nbslice

figure 
imagesc(vfa(:,:,i))
hold on
%b_testROI = bwboundaries(testROI(:,:,i)); 
%visboundaries(b_testROI,'Color','c','LineWidth', 1)
b_supipsparotid = bwboundaries(supipsparotid(:,:,i)); 
visboundaries(b_supipsparotid,'Color','c','LineWidth', 1)
hold on
b_supconparotid = bwboundaries(supconparotid(:,:,i)); 
visboundaries(b_supconparotid,'Color','m','LineWidth', 1)
hold on
b_ipssubmandib = bwboundaries(ipssubmandib(:,:,i)); 
visboundaries(b_ipssubmandib,'Color','y','LineWidth', 1)
hold on
b_consubmandib = bwboundaries(consubmandib(:,:,i)); 
visboundaries(b_consubmandib,'Color','b','LineWidth', 1)
hold on
b_node = bwboundaries(node(:,:,i)); 
visboundaries(b_node,'Color','g','LineWidth', 1)
hold on
b_primary = bwboundaries(primary(:,:,i)); 
visboundaries(b_primary,'Color','w','LineWidth', 1)
colormap(plasma)
axis off
caxis([0,3500])
daspect([1 1 1])
colorbar
title(sprintf('%s-allroi-%d.png',t1mapName,i))
saveas(gcf,sprintf('%s_allroi_%d.png',t1mapName,i))

end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% PRIMARY 
spreadsheet = zeros([1000,nbslice]);
for i=1:nbslice

figure 

imagesc(vfa(:,:,i))
hold on
b_tumour = bwboundaries(primary(:,:,i)); 
visboundaries(b_tumour,'Color','w','LineWidth', 1)
colormap(plasma)
axis off
caxis([0,3500])
daspect([1 1 1])
colorbar
title(sprintf('%s-primary-%d.png',t1mapName,i))
saveas(gcf,sprintf('%s_primary_%d.png',t1mapName,i))


mask = logical(primary(:,:,i));% Access the ROI data as a binary mask
vfa_slice=vfa(:,:,i);
vals_wbackground = vfa_slice(mask(:)); % Extract only the image values in the mask
vals=vals_wbackground >0; 
ROI_vals=vals_wbackground(vals);
sizeROIvals=size(ROI_vals);
    if ROI_vals > 0
        spreadsheet(1:sizeROIvals(1),i)=ROI_vals;
    end

end
save((sprintf('primaryROIvals%s.mat',t1mapName)),'spreadsheet','-mat')

%% supipsparotid
spreadsheet = zeros([1000,nbslice]);
for i=1:nbslice

figure 

imagesc(vfa(:,:,i))
hold on
b_tumour = bwboundaries(supipsparotid(:,:,i)); 
visboundaries(b_tumour,'Color','w','LineWidth', 1)
colormap(plasma)
axis off
caxis([0,3500])
daspect([1 1 1])
colorbar
title(sprintf('%s-supipsparotid-%d.png',t1mapName,i))
saveas(gcf,sprintf('%s_supipsparotid_%d.png',t1mapName,i))


mask = logical(supipsparotid(:,:,i));% Access the ROI data as a binary mask
vfa_slice=vfa(:,:,i);
vals_wbackground = vfa_slice(mask(:)); % Extract only the image values in the mask
vals=vals_wbackground >0; 
ROI_vals=vals_wbackground(vals);
sizeROIvals=size(ROI_vals);
    if ROI_vals > 0
        spreadsheet(1:sizeROIvals(1),i)=ROI_vals;
    end

end
save(sprintf('supipsparotidROIvals%s.mat',t1mapName),'spreadsheet')

%% supconparotid
spreadsheet = zeros([1000,nbslice]);
for i=1:nbslice

figure 

imagesc(vfa(:,:,i))
hold on
b_tumour = bwboundaries(supconparotid(:,:,i)); 
visboundaries(b_tumour,'Color','w','LineWidth', 1)
colormap(plasma)
axis off
caxis([0,3500])
daspect([1 1 1])
colorbar
title(sprintf('%s-supconparotid-%d.png',t1mapName,i))
saveas(gcf,sprintf('%s_supconparotid_%d.png',t1mapName,i))


mask = logical(supconparotid(:,:,i));% Access the ROI data as a binary mask
vfa_slice=vfa(:,:,i);
vals_wbackground = vfa_slice(mask(:)); % Extract only the image values in the mask
vals=vals_wbackground >0; 
ROI_vals=vals_wbackground(vals);
sizeROIvals=size(ROI_vals);
    if ROI_vals > 0
        spreadsheet(1:sizeROIvals(1),i)=ROI_vals;
    end

end
save(sprintf('supconparotidROIvals%s.mat',t1mapName),'spreadsheet')

%% ipssubmandib 
spreadsheet = zeros([1000,nbslice]);
for i=1:nbslice

figure 

imagesc(vfa(:,:,i))
hold on
b_tumour = bwboundaries(ipssubmandib(:,:,i)); 
visboundaries(b_tumour,'Color','w','LineWidth', 1)
colormap(plasma)
axis off
caxis([0,3500])
daspect([1 1 1])
colorbar
title(sprintf('%s-ipssubmandib-%d.png',t1mapName,i))
saveas(gcf,sprintf('%s_ipssubmandib_%d.png',t1mapName,i))


mask = logical(ipssubmandib(:,:,i));% Access the ROI data as a binary mask
vfa_slice=vfa(:,:,i);
vals_wbackground = vfa_slice(mask(:)); % Extract only the image values in the mask
vals=vals_wbackground >0; 
ROI_vals=vals_wbackground(vals);
sizeROIvals=size(ROI_vals);
    if ROI_vals > 0
        spreadsheet(1:sizeROIvals(1),i)=ROI_vals;
    end

end
save(sprintf('ipssubmandibROIvals%s.mat',t1mapName),'spreadsheet')

%% consubmandib 
spreadsheet = zeros([1000,nbslice]);
for i=1:nbslice

figure 

imagesc(vfa(:,:,i))
hold on
b_tumour = bwboundaries(consubmandib(:,:,i)); 
visboundaries(b_tumour,'Color','w','LineWidth', 1)
colormap(plasma)
axis off
caxis([0,3500])
daspect([1 1 1])
colorbar
title(sprintf('%s-consubmandib-%d.png',t1mapName,i))
saveas(gcf,sprintf('%s_consubmandib_%d.png',t1mapName,i))


mask = logical(consubmandib(:,:,i));% Access the ROI data as a binary mask
vfa_slice=vfa(:,:,i);
vals_wbackground = vfa_slice(mask(:)); % Extract only the image values in the mask
vals=vals_wbackground >0; 
ROI_vals=vals_wbackground(vals);
sizeROIvals=size(ROI_vals);
    if ROI_vals > 0
        spreadsheet(1:sizeROIvals(1),i)=ROI_vals;
    end

end
save(sprintf('consubmandibROIvals%s.mat',t1mapName),'spreadsheet')

%% node
spreadsheet = zeros([1000,nbslice]);
for i=1:nbslice

figure 

imagesc(vfa(:,:,i))
hold on
b_tumour = bwboundaries(node(:,:,i)); 
visboundaries(b_tumour,'Color','w','LineWidth', 1)
colormap(plasma)
axis off
caxis([0,3500])
daspect([1 1 1])
colorbar
title(sprintf('%s-node-%d.png',t1mapName,i))
saveas(gcf,sprintf('%s_node_%d.png',t1mapName,i))


mask = logical(node(:,:,i));% Access the ROI data as a binary mask
vfa_slice=vfa(:,:,i);
vals_wbackground = vfa_slice(mask(:)); % Extract only the image values in the mask
vals=vals_wbackground >0; 
ROI_vals=vals_wbackground(vals);
sizeROIvals=size(ROI_vals);
    if ROI_vals > 0
        spreadsheet(1:sizeROIvals(1),i)=ROI_vals;
    end

end
save(sprintf('nodeROIvals%s.mat',t1mapName),'spreadsheet')


