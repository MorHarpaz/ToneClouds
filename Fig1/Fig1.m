close all; clear all; clc;

fig_size = 700;
font_size = 9;
border = 0.04;          % figure's borders 
border_r = 0.025;        % right border of the figure

dimAx = 0.2;
dimAy = 0.32;
dimBx = 0.33;
dimBy = 0.25;
dimCx = 0.18;
dimCyt = 0.18;
dimCym = 0.03;
dimCyb = 0.05;
dimDx = 0.3;
dimDy = 0.2;
inD = 0.01;
space_C = (dimAy - (dimCyt + dimCym + dimCyb))/2;
space_D = (1 - (border + border_r + 3*dimDx))/2;
space_top = (1 - (dimAx + dimBx + dimCx + border + border_r))/2;
space_bet = 0.1;

y_bottom = 1 - (border + dimAy + dimDy + space_bet);
y_top = 1 - (border + dimAy);
st_col = [0, 0.2, 0.8]; 
dv_col = [0.8, 0.2, 0];
%%
A = [border, y_top, dimAx, dimAy];
B = [0.032 + border + dimAx + space_top,...
    y_top+0.02, dimBx, dimBy];
C1 = [border + dimAx + dimBx + 2*space_top,...
    y_top + dimCyb + dimCym + 2*space_C,...
    dimCx, dimCyt];
C2 = [border + dimAx + dimBx + 2*space_top,...
    0.01+y_top + dimCyb + space_C,...
    dimCx, dimCym];
C3 = [border + dimAx + dimBx + 2*space_top,...
    -0.025 + y_top, dimCx, dimCyb];
D1 = [border, y_bottom, dimDx, dimDy];
D1i = [border + inD, y_bottom + inD, dimDx - 2*inD, dimDy - 2*inD];  
D2 = [border + dimDx + space_D,...
    y_bottom, dimDx, dimDy];
D2i = [border + dimDx + space_D + inD,...
    y_bottom + inD, dimDx - 2*inD, dimDy - 2*inD];
D3 = [border + 2*dimDx + 2*space_D,...
    y_bottom, dimDx, dimDy];
D3i = [border + 2*dimDx + 2*space_D + inD,...
    y_bottom + inD, dimDx - 2*inD, dimDy - 2*inD];

%%
f = figure('color', 'white');
pf = f.Position;
pf([3 4]) = fig_size;
pf([1 2]) = 0;
f.Position = pf;
f.Units = 'normalized';

% position of panels' letters (A,B,C, etc.)
panel_x = -0.25;
y_f = 0.01;
panel_y = 1 + y_f;

sb_cl = 5;
sb_ro = 4;


hA = subplot(sb_ro,sb_cl,[1; 6; 11]);
hA.Units = 'normalized';
hA.Position = A;

hB = subplot(sb_ro,sb_cl,[2; 7; 12]);
hB.Units = 'normalized';
hB.Position = B;

hC1 = subplot(sb_ro, sb_cl, 5);
hC1.Units = 'normalized';
hC1.Position = C1;

hC2 = subplot(sb_ro, sb_cl, 10);
hC2.Units = 'normalized';
hC2.Position = C2;

hC3 = subplot(sb_ro, sb_cl, 15);
hC3.Units = 'normalized';
hC3.Position = C3;

hD1 = subplot(sb_ro, sb_cl, 16);
hD1.Units = 'normalized';
hD1.Position = D1;

hD2 = subplot(sb_ro, sb_cl, 18);
hD2.Units = 'normalized';
hD2.Position = D2;

hD3 = subplot(sb_ro, sb_cl, 20);
hD3.Units = 'normalized';
hD3.Position = D3;

%% A: model

ANFC_model = imread('ANFC_model.jpg');
imagesc(hA, ANFC_model);
set(hA, 'Box', 'off', 'Visible', 'off');
hold(hA, 'on');
text(hA,0.5, -0.08, 'Frequency','Unit', 'normalized', 'HorizontalAlignment', 'center',...
    'FontSize', font_size, 'FontWeight', 'bold');
text(hA,-0.12, 0.1, 'Spike rate','Unit', 'normalized', 'HorizontalAlignment', 'center', 'Rotation', 90,...
    'FontSize', font_size, 'FontWeight', 'bold');

%% B: predictions
ANFC_predictions = imread('ANFC_predictions.jpg');
imagesc(hB, ANFC_predictions);
set(hB, 'Box', 'off', 'Visible', 'off');
hold(hA, 'on');

% t1.Visible = 'off';
% t2.Visible = 'off';
%  t3.Visible = 'off';
%  t4.Visible = 'off';
% t5.Visible = 'off';
% t6.Visible = 'off';
% t7.Visible = 'off';
% t8.Visible = 'off';
% t9.Visible = 'off';
% t10.Visible = 'off';
% t11.Visible = 'off';
% t12.Visible = 'off';

t1 =  text(hB, 0.21, -0.05, 'Time','Unit', 'normalized', 'HorizontalAlignment', 'center',...
    'FontSize', 8);
t2 =  text(hB, 0.09, 0.135, 'Spike rate','Unit', 'normalized', 'HorizontalAlignment', 'center',...
    'FontSize', 8, 'Rotation', 90);
t3 = text(hB, 0.22, -0.165, 'SSA','Unit', 'normalized', 'HorizontalAlignment', 'center',...
    'FontSize', font_size, 'FontWeight', 'bold');
t4 = text(hB, 0.76, -0.165, 'no SSA','Unit', 'normalized', 'HorizontalAlignment', 'center',...
    'FontSize', font_size, 'FontWeight', 'bold');
t5 = text(hB, 0.5, 0.2, 'Standard','Unit', 'normalized', 'HorizontalAlignment', 'center',...
    'FontSize', font_size, 'FontWeight', 'bold', 'Color', st_col);
t6 = text(hB, 0.5, 0.1, 'Deviant','Unit', 'normalized', 'HorizontalAlignment', 'center',...
    'FontSize', font_size, 'FontWeight', 'bold', 'Color', dv_col);
t7 = text(hB, 0.22, 0.74, 'Pure tones','Unit', 'normalized', 'HorizontalAlignment', 'center',...
    'FontSize', font_size, 'FontWeight', 'bold');
t8 = text(hB, 0.75, 0.74, 'Tone clouds','Unit', 'normalized', 'HorizontalAlignment', 'center',...
    'FontSize', font_size, 'FontWeight', 'bold');
t9 = text(hB, 0.48, 1.12, 'Unadapted channels','Unit', 'normalized', 'HorizontalAlignment', 'center',...
    'FontSize', font_size, 'FontWeight', 'bold');
t10 = text(hB, -0.26, 0.74, 'Stimulus:','Unit', 'normalized','FontSize', font_size, 'FontWeight', 'bold');
t11 = text(hB, -0.26, 0.51, sprintf('Adaptation\nprofile:'),'Unit', 'normalized','FontSize', font_size, 'FontWeight', 'bold');
t12 = text(hB, -0.26, 0.15, 'Output:','Unit', 'normalized','FontSize', font_size, 'FontWeight', 'bold');


%% C tone clouds

load('cloudspecs.mat');

t = 10;
fr = log10(squeeze(freqs(t,:,:)));
ons = squeeze(onsets(t,:,:));
ph = squeeze(phases(t,:,:));

cols = [0, 0.4470, 0.7410;
        0.8500, 0.3250, 0.0980;
        0.9290, 0.6940, 0.1250;	          
        0.4940, 0.1840, 0.5560;	          
        0.4660, 0.6740, 0.1880;	        
        0.3010, 0.7450, 0.9330];

hold(hC1, 'on');     
for i = 1:6
    for k = 1:6
        plot(hC1, [(i-1)*3200 + ons(k,i)'; i*3200+ons(k,i)'], [fr(k,i), fr(k,i)]','Color', cols(k,:), 'LineWidth', 2.5);   
    end
    if i > 1
        plot(hC1, [(i-1)*3200, (i-1)*3200], [3 4.8],  'Color', [0.3 0.3 0.3])
    end
end

plot(hC1, [(i)*3200, (i)*3200], [3 4.8], 'Color', [0.3 0.3 0.3])

xlim(hC1, [0 (i+1)*3200])
y = [3 3.3 3.6 3.9 4.2 4.5 4.8];
yy = [y;y];
x = xlim(hC1);
plot(hC1, x, yy,  'Color', [0.3 0.3 0.3])
hC1.YTick = [3 3.6 4.2 4.8];
hC1.YLim = [3, 4.8];
hC1.YTickLabels = [1 4 16 64];
hC1.XTick = [];
ylabel(hC1, 'Frequency, kHz', 'FontSize', font_size, 'FontWeight', 'bold');
hC1.Box = 'on';
hC1.YAxis.FontSize = font_size;

% 192 samples per 1ms

fr_m = zeros(22400, 36);
c = 0;
frr = squeeze(freqs(t,:,:));
sm_w = ones(1,3200);
sm_w(1:960) = 0:1/959:1;
sm_w((end-960+1):end)=1:-(1/959):0;

for o = 1:6 
    for f = 1:6
        c = c + 1;
        range = [((o-1)*3200 + ons(f,o)'):(o*3200 + ons(f,o)-1)];
        fr_m(range, c) = sm_w.*cos(2*pi*range*frr(f,o) + ph(f,o));                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
    end
end

wave = sum(fr_m, 2);
plot(hC2, wave, 'k', 'LineWidth', 0.2);
xlim([0 22400]);
tp = [20 60 100];
hC2.XTick = 192 * tp;
hC2.XTickLabels = {'20', '60', '100'};
hC2.YTick = [];
xlabel(hC2, 'Time, ms', 'FontSize', font_size, 'FontWeight', 'bold');
hC2.TickDir = 'out';
hC2.Box = 'off';
hC2.YAxis.Visible = 'off';
hC2.XAxis.FontSize = font_size;

frr1 = squeeze(freqs(t,:,:));
frr2 = squeeze(freqs(3,:,:));
fr_m1 = zeros(22400, 36);
fr_m2 = zeros(22400, 36);
ons1 = squeeze(onsets(t,:,:));
ons2 = squeeze(onsets(3,:,:));
ph1 = squeeze(phases(t,:,:));
ph2 = squeeze(phases(3,:,:));

for o = 1:6 
    for f = 1:6
        c = c + 1;
        range1 = [((o-1)*3200 + ons1(f,o)'):(o*3200 + ons1(f,o)-1)];
        range2 = [((o-1)*3200 + ons2(f,o)'):(o*3200 + ons2(f,o)-1)];
        fr_m1(range1, c) = sm_w.*cos(2*pi*range1*frr1(f,o) + ph1(f,o)); 
        fr_m2(range2, c) = sm_w.*cos(2*pi*range2*frr2(f,o) + ph2(f,o));  
    end
end

wave1 = sum(fr_m1, 2);
wave2 = sum(fr_m2, 2);

gap_dur = length(wave1)/4; 
stim_dur = length(wave1);
xx = 0:(5.*gap_dur + 4.*stim_dur);
hold(hC3, 'on');

plot(hC3, xx, 24.*ones(size(xx)), 'Color', st_col, 'LineWidth', 0.1);
plot(hC3, xx, zeros(size(xx)), 'Color', st_col, 'LineWidth', 0.1);

plot(hC3, gap_dur:(gap_dur+stim_dur)-1, 24+wave1, 'Color', st_col, 'LineWidth', 0.1);
plot(hC3, (2.*gap_dur + stim_dur):1:(2.*gap_dur+2.*stim_dur)-1, 24+wave2, 'Color', dv_col, 'LineWidth', 0.1);
plot(hC3, (3.*gap_dur+2.*stim_dur):1:(3.*gap_dur+3.*stim_dur)-1, 24+wave1, 'Color', st_col, 'LineWidth', 0.1);
plot(hC3, (4.*gap_dur+3.*stim_dur):1:(4.*gap_dur+4.*stim_dur)-1, 24+wave1, 'Color', st_col, 'LineWidth', 0.1);
plot(hC3, gap_dur:(gap_dur+stim_dur)-1, wave2, 'Color', st_col, 'LineWidth', 0.1);
plot(hC3, (3.*gap_dur+2.*stim_dur):1:(3.*gap_dur+3.*stim_dur)-1, wave1, 'Color', dv_col, 'LineWidth', 0.1);
plot(hC3, (2.*gap_dur + stim_dur):1:(2.*gap_dur+2.*stim_dur)-1, wave2, 'Color', st_col, 'LineWidth', 0.1);
plot(hC3, (4.*gap_dur+3.*stim_dur):1:(4.*gap_dur+4.*stim_dur)-1, wave2, 'Color', st_col, 'LineWidth', 0.1);
hC3.XTick = [];
hC3.YTick = [];

hC3.YColor = 'none';
hC3.XColor = 'none';
hC3.YColor = 'none';

dis = 30;
text(hC3, gap_dur+dis, 13, 'tc_1_0', 'FontSize', 7, 'Color', st_col);
text(hC3, 2.*gap_dur + stim_dur+dis, 13, 'tc_3', 'FontSize', 7,'Color', dv_col);
text(hC3, 3.*gap_dur+2.*stim_dur+dis, 13, 'tc_1_0', 'FontSize', 7, 'Color', st_col);
text(hC3, 4.*gap_dur+3.*stim_dur+dis, 13, 'tc_1_0', 'FontSize', 7, 'Color', st_col);

text(hC3, gap_dur+dis, -11, 'tc_3', 'FontSize', 7, 'Color', st_col);
text(hC3, 2.*gap_dur + stim_dur+dis, -11, 'tc_3', 'FontSize', 7, 'Color', st_col);
text(hC3, 3.*gap_dur+2.*stim_dur+dis, -11, 'tc_1_0', 'FontSize', 7, 'Color', dv_col);
text(hC3, 4.*gap_dur+3.*stim_dur+dis, -11, 'tc_3', 'FontSize', 7,'Color', st_col);

hC3.YLabel.FontWeight = 'Bold';
hC3.XLabel.FontWeight = 'Bold';
hC3.TickDir = 'out';

%% D



A1_slice = load('A1_slice.mat');
hD1.Color = 'k';
hD1i = axes('Position',D1i);
image(hD1i, imgaussfilt(A1_slice.slice,8));
set(hD1, 'Box', 'off');
axis(hD1i, 'image');
hD1.YAxis.Visible = 'off';
hD1.XAxis.Visible = 'off';
hD1i.YAxis.Visible = 'off';
hD1i.XAxis.Visible = 'off';

MGB_slice = load('MGB_slice.mat');
hD2.Color = 'k';
hD2i = axes('Position',D2i);
image(hD2i, imgaussfilt(MGB_slice.slice,8));
set(hD2, 'Box', 'off');
axis(hD2i, 'image');
hD2.YAxis.Visible = 'off';
hD2.XAxis.Visible = 'off';
hD2i.YAxis.Visible = 'off';
hD2i.XAxis.Visible = 'off';

IC_slice = load('IC_slice.mat');
hD3.Color = 'k';
hD3i = axes('Position',D3i);
image(hD3i, fliplr(imgaussfilt(IC_slice.slice,8)));
set(hD3, 'Box', 'off');
axis(hD3i, 'image');
hD3.YAxis.Visible = 'off';
hD3.XAxis.Visible = 'off';
hD3i.YAxis.Visible = 'off';
hD3i.XAxis.Visible = 'off';

% tA1.Visible = 'off';
% tMGB.Visible = 'off';
% tIC.Visible = 'off';
tA1 = text(hD1i, -0.05, 0.96, 'A1', 'Color', 'w', 'FontWeight', 'bold', 'FontSize', 11, 'Units', 'normalized');
tMGB = text(hD2i, -0.01, 0.96, 'MGB', 'Color', 'w', 'FontWeight', 'bold', 'FontSize', 11, 'Units', 'normalized');
tIC = text(hD3i, -0.01, 1.12, 'IC', 'Color', 'w', 'FontWeight', 'bold', 'FontSize', 11, 'Units', 'normalized');

%% Fine tuning

% tA.Visible = 'off';
% tB.Visible = 'off';
% tC.Visible = 'off';
% tD.Visible = 'off';

yA = 1.02;
tA = text(hA, -0.15, 1.02, 'A', 'Units', 'normalized', 'FontWeight', 'bold');
tB = text(hB, -0.32, 1.23, 'B', 'Units', 'normalized', 'FontWeight', 'bold');
tC = text(hC1, -0.32, 1.03, 'C', 'Units', 'normalized', 'FontWeight', 'bold');
tD = text(hD1, -0.1, 1.1, 'D', 'Units', 'normalized', 'FontWeight', 'bold');


