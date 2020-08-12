 % Biopic analysis

close all
clear all

disp('Select molli air T1 map')
t1mapName_air = uigetfile('*.dcm'); 
vfa_air=dicomread(t1mapName_air);

disp('Select molli ox T1 map')
t1mapName_ox = uigetfile('*.dcm'); 
vfa_ox=dicomread(t1mapName_ox);

disp('Select ROI folder')
dirName = uigetdir(); 

%%%
air_node=load_nii('air_node-label.nii.gz');
air_node=fliplr(rot90(air_node.img,1));

ox_node=load_nii('ox_node-label.nii.gz');
ox_node=fliplr(rot90(ox_node.img,1));

% primary=load_nii('Primary-label.nii.gz');
% primary=fliplr(rot90(primary.img,1));

%%
% air_primary=load_nii('air_primary-label.nii.gz');
% air_primary=fliplr(rot90(air_primary.img,1));
% 
% ox_primary=load_nii('ox_primary-label.nii.gz');
% ox_primary=fliplr(rot90(ox_primary.img,1));
% 
% % node=load_nii('Node-label.nii.gz');
% % node=fliplr(rot90(node.img,1));



supipsparotid=load_nii('sup ips parotid-label.nii.gz');
supipsparotid=fliplr(rot90(supipsparotid.img,1));
supconparotid=load_nii('sup con parotid-label.nii.gz');
supconparotid=fliplr(rot90(supconparotid.img,1));
ipssubmandib=load_nii('ips submandib-label.nii.gz');
ipssubmandib=fliplr(rot90(ipssubmandib.img,1));
consubmandib=load_nii('con submandib-label.nii.gz');
consubmandib=fliplr(rot90(consubmandib.img,1));



% size(vfa)
% vfa=squeeze(vfa);
% size(vfa)
% vfa=flip(vfa,3);
nbslice = 1



%% ALL ROIs - AIR
for i=1:nbslice

figure 
imagesc(vfa_air(:,:,i))
hold on
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
% %
% b_node = bwboundaries(node(:,:,i)); 
% visboundaries(b_node,'Color','g','LineWidth', 1)
% hold on
% b_primary = bwboundaries(air_primary(:,:,i)); 
% visboundaries(b_primary,'Color','w','LineWidth', 1)
% % %
b_node = bwboundaries(air_node(:,:,i));
visboundaries(b_node,'Color','g','LineWidth', 1)
% b_primary = bwboundaries(primary(:,:,i)); 
% visboundaries(b_primary,'Color','w','LineWidth', 1)
% %
colormap(plasma)
axis off
caxis([0,3500])
daspect([1 1 1])
colorbar
title(sprintf('%s%s-allroi-%d.png',dirName,t1mapName_air,i))
saveas(gcf,sprintf('%s%s_allroi_%d.png',dirName,t1mapName_air,i))

end

%% ALL ROIs - OXYGEN
for i=1:nbslice

figure 
imagesc(vfa_ox(:,:,i))
hold on
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
%
% b_node = bwboundaries(node(:,:,i)); 
% visboundaries(b_node,'Color','g','LineWidth', 1)
% hold on
% b_primary = bwboundaries(ox_primary(:,:,i)); 
% visboundaries(b_primary,'Color','w','LineWidth', 1)
% %
b_node = bwboundaries(ox_node(:,:,i));
visboundaries(b_node,'Color','g','LineWidth', 1)
% b_primary = bwboundaries(primary(:,:,i)); 
% visboundaries(b_primary,'Color','w','LineWidth', 1)

colormap(plasma)
axis off
caxis([0,3500])
daspect([1 1 1])
colorbar
title(sprintf('%s%s-allroi-%d.png',dirName,t1mapName_ox,i))
saveas(gcf,sprintf('%s%s_allroi_%d.png',dirName,t1mapName_ox,i))

end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%PRIMARY 
% spreadsheet = zeros([1000,nbslice]);
% vfa=vfa_air;
% for i=1:nbslice
% 
% figure 
% 
% imagesc(vfa(:,:,i))
% hold on
% b_tumour = bwboundaries(air_primary(:,:,i)); 
% visboundaries(b_tumour,'Color','w','LineWidth', 1)
% colormap(plasma)
% axis off
% caxis([0,3500])
% daspect([1 1 1])
% colorbar
% title(sprintf('%s-primary-%d.png',t1mapName_air,i))
% saveas(gcf,sprintf('%s_primary_%d.png',t1mapName_air,i))
% 
% 
% mask = logical(air_primary(:,:,i));% Access the ROI data as a binary mask
% vfa_slice=vfa(:,:,i);
% vals_wbackground = vfa_slice(mask(:)); % Extract only the image values in the mask
% vals=vals_wbackground >0; 
% ROI_vals=vals_wbackground(vals);
% sizeROIvals=size(ROI_vals);
%     if ROI_vals > 0
%         spreadsheet(1:sizeROIvals(1),i)=ROI_vals;
%     end
% 
% end
% save((sprintf('primaryROIvals%s.mat',t1mapName_air)),'spreadsheet','-mat')
% 
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%PRIMARY 
% spreadsheet = zeros([1000,nbslice]);
% vfa=vfa_ox;
% for i=1:nbslice
% 
% figure 
% 
% imagesc(vfa(:,:,i))
% hold on
% b_tumour = bwboundaries(ox_primary(:,:,i)); 
% visboundaries(b_tumour,'Color','w','LineWidth', 1)
% colormap(plasma)
% axis off
% caxis([0,3500])
% daspect([1 1 1])
% colorbar
% title(sprintf('%s-primary-%d.png',t1mapName_ox,i))
% saveas(gcf,sprintf('%s_primary_%d.png',t1mapName_ox,i))
% 
% 
% mask = logical(ox_primary(:,:,i));% Access the ROI data as a binary mask
% vfa_slice=vfa(:,:,i);
% vals_wbackground = vfa_slice(mask(:)); % Extract only the image values in the mask
% vals=vals_wbackground >0; 
% ROI_vals=vals_wbackground(vals);
% sizeROIvals=size(ROI_vals);
%     if ROI_vals > 0
%         spreadsheet(1:sizeROIvals(1),i)=ROI_vals;
%     end
% 
% end
% save((sprintf('primaryROIvals%s.mat',t1mapName_ox)),'spreadsheet','-mat')

%% node
spreadsheet = zeros([1000,nbslice]);
vfa=vfa_air;
for i=1:nbslice

figure 

imagesc(vfa(:,:,i))
hold on
b_tumour = bwboundaries(air_node(:,:,i)); 
visboundaries(b_tumour,'Color','w','LineWidth', 1)
colormap(plasma)
axis off
caxis([0,3500])
daspect([1 1 1])
colorbar
title(sprintf('%s-node-%d.png',t1mapName_air,i))
saveas(gcf,sprintf('%s_node_%d.png',t1mapName_air,i))


mask = logical(air_node(:,:,i));% Access the ROI data as a binary mask
vfa_slice=vfa(:,:,i);
vals_wbackground = vfa_slice(mask(:)); % Extract only the image values in the mask
vals=vals_wbackground >0; 
ROI_vals=vals_wbackground(vals);
sizeROIvals=size(ROI_vals);
    if ROI_vals > 0
        spreadsheet(1:sizeROIvals(1),i)=ROI_vals;
    end

end
save(sprintf('nodeROIvals%s.mat',t1mapName_air),'spreadsheet')

%% node
spreadsheet = zeros([1000,nbslice]);
vfa=vfa_ox;
for i=1:nbslice

figure 

imagesc(vfa(:,:,i))
hold on
b_tumour = bwboundaries(ox_node(:,:,i)); 
visboundaries(b_tumour,'Color','w','LineWidth', 1)
colormap(plasma)
axis off
caxis([0,3500])
daspect([1 1 1])
colorbar
title(sprintf('%s-node-%d.png',t1mapName_ox,i))
saveas(gcf,sprintf('%s_node_%d.png',t1mapName_ox,i))


mask = logical(ox_node(:,:,i));% Access the ROI data as a binary mask
vfa_slice=vfa(:,:,i);
vals_wbackground = vfa_slice(mask(:)); % Extract only the image values in the mask
vals=vals_wbackground >0; 
ROI_vals=vals_wbackground(vals);
sizeROIvals=size(ROI_vals);
    if ROI_vals > 0
        spreadsheet(1:sizeROIvals(1),i)=ROI_vals;
    end

end
save(sprintf('nodeROIvals%s.mat',t1mapName_ox),'spreadsheet')


beep