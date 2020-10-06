clear all; close all; clc

%% Define parameters: 

fig_size = 700;
font_size = 9;
border = 0.06;          % figure's borders 
border_r = 0.02;        % right border of the figure
dimA = 0.3;
dimBx = 0.16;
dimBCy = 0.08;
dimCx = 0.12;
spaceL = 0.08;
spaceBx = 1 - (border + dimA + 2*spaceL + 2*dimBx + dimCx +  + border_r);
spaceBCy = (dimA - 3*dimBCy)/2;

y_bottom = 1 - (dimA + border);
y_middle = y_bottom + dimBCy + spaceBCy;
y_top = y_middle + dimBCy + spaceBCy;
x_middle1 = border + dimA + spaceL;
x_middle2 = x_middle1 + dimBx + spaceBx;
x_right = x_middle2 + dimBx + spaceL; 

% position of panels' letters (A,B,C, etc.)
panel_x = -0.3;
y_f = 0.4;
panel_y = 1 + y_f;

sb_cl = 8;
sb_ro = 3;

% colors
st_col = [0, 0.2, 0.8]; 
dv_col = [0.8, 0.2, 0];
mst_col = [0 0.7 0.8];

%% Load data

load('data_figs.mat')
frc = data_figs.frc;

%% Create figure

f = figure('color', 'white');
pf = f.Position;
pf([3 4]) = fig_size;
pf([1 2]) = 0;
f.Position = pf;
f.Units = 'normalized';
%%

A = [border, y_bottom, dimA, dimA];
B1 = [x_middle1, y_top, dimBx, dimBCy];
B2 = [x_middle2, y_top, dimBx, dimBCy];
B3 = [x_middle1, y_middle, dimBx, dimBCy];
B4 = [x_middle2, y_middle, dimBx, dimBCy];
B5 = [x_middle1, y_bottom, dimBx, dimBCy];
B6 = [x_middle2, y_bottom, dimBx, dimBCy];
C1 = [x_right, y_top, dimCx, dimBCy];
C2 = [x_right, y_middle, dimCx, dimBCy];
C3 = [x_right, y_bottom, dimCx, dimBCy];

%%

hA = subplot(sb_ro,sb_cl,[1 2;9 10;17 18]);
hA.Units = 'normalized';
hA.Position = A;

hB1 = subplot(sb_ro,sb_cl,4);
hB1.Units = 'normalized';
hB1.Position = B1;

hB2 = subplot(sb_ro,sb_cl,6);
hB2.Units = 'normalized';
hB2.Position = B2;

hB3 = subplot(sb_ro,sb_cl,12);
hB3.Units = 'normalized';
hB3.Position = B3;

hB4 = subplot(sb_ro,sb_cl,14);
hB4.Units = 'normalized';
hB4.Position = B4;

hB5 = subplot(sb_ro,sb_cl,20);
hB5.Units = 'normalized';
hB5.Position = B5;

hB6 = subplot(sb_ro,sb_cl,22);
hB6.Units = 'normalized';
hB6.Position = B6;

hC1 = subplot(sb_ro,sb_cl,8);
hC1.Units = 'normalized';
hC1.Position = C1;

hC2 = subplot(sb_ro,sb_cl,16);
hC2.Units = 'normalized';
hC2.Position = C2;

hC3 = subplot(sb_ro,sb_cl,24);
hC3.Units = 'normalized';
hC3.Position = C3;

%% A: model 

model = data_figs.frc.model;
hold(hA, 'on');
plot(hA, model.unadpated(1,:), model.unadpated(2,:), 'k', 'LineWidth', 1.8);
plot(hA, model.adpated1(1,:), model.adpated1(2,:), 'Color', [0.6 0.6 0.6], 'LineWidth', 1.8);
plot(hA, model.adpated2(1,:), model.adpated2(2,:), 'Color', [0.6 0.6 0.6], 'LineWidth', 1.8);
plot(hA, model.tc1.st(1), model.tc1.st(2), 'ok', 'MarkerFaceColor', st_col, 'MarkerSize', 8);
plot(hA, model.tc2.st(1), model.tc2.st(2), 'ok', 'MarkerFaceColor', st_col, 'MarkerSize', 8);
plot(hA, model.tc1.dv(1), model.tc1.dv(2), 'ok', 'MarkerFaceColor', dv_col, 'MarkerSize', 8);
plot(hA, model.tc2.dv(1), model.tc2.dv(2), 'ok', 'MarkerFaceColor', dv_col, 'MarkerSize', 8);

xlim(hA, [1 100]);
ylim(hA, [0 2.2]);
ylabel(hA, 'Spike rate', 'FontSize', font_size, 'FontWeight', 'bold');
xlabel(hA, 'Tone cloud id', 'FontSize', font_size, 'FontWeight', 'bold');
set(hA, 'XTick', [40 80], 'XTickLabels', {'tc_1_s_t', 'tc_2_n_d'}, 'YTick', [], 'TickDir', 'out');
text(hA, 0.89, 0.85, 'g(tc)', 'Unit', 'normalized', 'FontSize', font_size, 'FontWeight', 'bold');
text(hA, 0.85, 0.63, '{\alpha}g(tc)', 'Unit', 'normalized', 'FontSize', font_size, 'FontWeight', 'bold', 'Color', [0.6 0.6 0.6]);
text(hA, 0.77, 0.44, '{\alpha}g(tc) - r', 'Unit', 'normalized', 'FontSize', font_size, 'FontWeight', 'bold', 'Color', [0.6 0.6 0.6]);

%% B: time courses

tc = data_figs.frc.tc;
gr_col = [0.8 0.8 0.8];

hold(hB1, 'on'); 
plot(hB1, tc.IC.b1.dv(1,:), tc.IC.b1.dv(2,:), 'Color', gr_col);
plot(hB1, tc.IC.b1.st(1,:), tc.IC.b1.st(2,:), 'Color', st_col);
plot(hB1, tc.IC.b2.st(1,:), tc.IC.b2.st(2,:), 'Color', gr_col);
plot(hB1, tc.IC.b2.dv(1,:), tc.IC.b2.dv(2,:), 'Color', dv_col);
set(hB1, 'XTick', [], 'YTick', [8 11], 'YLim', [8 11]);
t(1) = text(hB1, 0.05, 0.92, 'IC', 'Units', 'normalized', 'FontSize', 7, 'FontWeight', 'bold'); 

hold(hB2, 'on'); 
plot(hB2, tc.IC.b1.st(1,:), tc.IC.b1.st(2,:), 'Color', gr_col);
plot(hB2, tc.IC.b1.dv(1,:), tc.IC.b1.dv(2,:), 'Color', dv_col);
plot(hB2, tc.IC.b2.dv(1,:), tc.IC.b2.dv(2,:), 'Color', gr_col);
plot(hB2, tc.IC.b2.st(1,:), tc.IC.b2.st(2,:), 'Color', st_col);
set(hB2, 'XTick', [], 'YTick', [], 'YLim', [8 11]);

hold(hB3, 'on'); 
plot(hB3, tc.MGB.b1.dv(1,:), tc.MGB.b1.dv(2,:), 'Color', gr_col);
plot(hB3, tc.MGB.b1.st(1,:), tc.MGB.b1.st(2,:), 'Color', st_col);
plot(hB3, tc.MGB.b2.st(1,:), tc.MGB.b2.st(2,:), 'Color', gr_col);
plot(hB3, tc.MGB.b2.dv(1,:), tc.MGB.b2.dv(2,:), 'Color', dv_col);
set(hB3, 'XTick', [], 'YTick', [5 10], 'YLim', [5 10]);
t(2) = text(hB3, 0.05, 0.92, 'MGB', 'Units', 'normalized', 'FontSize', 7, 'FontWeight', 'bold'); 

hold(hB4, 'on'); 
plot(hB4, tc.MGB.b1.st(1,:), tc.MGB.b1.st(2,:), 'Color', gr_col);
plot(hB4, tc.MGB.b1.dv(1,:), tc.MGB.b1.dv(2,:), 'Color', dv_col);
plot(hB4, tc.MGB.b2.dv(1,:), tc.MGB.b2.dv(2,:), 'Color', gr_col);
plot(hB4, tc.MGB.b2.st(1,:), tc.MGB.b2.st(2,:), 'Color', st_col);
set(hB4, 'XTick', [], 'YTick', [], 'YLim', [5 10]);

hold(hB5, 'on'); 
plot(hB5, tc.A1.b1.dv(1,:), tc.A1.b1.dv(2,:), 'Color', gr_col);
plot(hB5, tc.A1.b1.st(1,:), tc.A1.b1.st(2,:), 'Color', st_col);
plot(hB5, tc.A1.b2.st(1,:), tc.A1.b2.st(2,:), 'Color', gr_col);
plot(hB5, tc.A1.b2.dv(1,:), tc.A1.b2.dv(2,:), 'Color', dv_col);
set(hB5, 'YTick', [1 7], 'YLim', [1 7]);
t(3) = text(hB5, 0.05, 0.92, 'A1', 'Units', 'normalized', 'FontSize', 7, 'FontWeight', 'bold'); 

hold(hB6, 'on'); 
plot(hB6, tc.A1.b1.st(1,:), tc.A1.b1.st(2,:), 'Color', gr_col);
plot(hB6, tc.A1.b1.dv(1,:), tc.A1.b1.dv(2,:), 'Color', dv_col);
plot(hB6, tc.A1.b2.dv(1,:), tc.A1.b2.dv(2,:), 'Color', gr_col);
plot(hB6, tc.A1.b2.st(1,:), tc.A1.b2.st(2,:), 'Color', st_col);
set(hB6, 'XTick', [], 'YTick', [], 'YLim', [1 7]);

xlabel(hB5, 'Trial #', 'FontSize', font_size, 'FontWeight', 'bold');
ylabel(hB5, 'Spike rate, Hz', 'FontSize', font_size, 'FontWeight', 'bold');
title(hB1, 'tc_1_s_t', 'FontSize', 7, 'FontWeight', 'bold');
title(hB2, 'tc_2_n_d', 'FontSize', 7, 'FontWeight', 'bold');

%% C: bars

bars = data_figs.frc.bars;

draw_bars(hC1, bars.IC, st_col, dv_col, 'IC');
draw_bars(hC2, bars.MGB, st_col, dv_col, 'MGB');
draw_bars(hC3, bars.A1, st_col, dv_col, 'A1');

breakyaxis(hC1, [0.5 8], 0.005);
breakyaxis(hC2, [0.5 6], 0.005);
breakyaxis(hC3, [1 2], 0.005); 


%% Fine tuning
set(findall(f,'-property','FontSize'),'FontSize',font_size);
hA.YLabel.Units = 'normalized';
hA.YLabel.Position = [-0.06, 0.5 0];
set(findall(f, 'String', ' tc_1_s_t        tc_2_n_d'), 'FontSize', 7);
set(findall(f, 'String', 'tc_1_s_t'), 'FontSize', 7);
set(findall(f, 'String', 'tc_2_n_d'), 'FontSize', 7);
set(findall(f, 'XTickLabel', {'bl_1', ' bl_2', 'bl_1', ' bl_2'}), 'FontSize', 7);
set(t, 'FontSize', 7);
yl = findall(f, 'String', 'Spike rate, Hz');
set(yl, 'FontSize', font_size, 'FontWeight', 'bold', 'Units', 'normalized', 'Position', [-0.2, 0.5 0]);
set(hB5.YLabel, 'Units', 'normalized', 'Position', [-0.2*dimCx/dimBx 0.5 0]);

hA.XLabel.Units = 'inches';
hB5.XLabel.Units = 'inches';
posA = hA.XLabel.Position;
posB5 = hB5.XLabel.Position;
posB5(2) = posA(2);
hB5.XLabel.Position = posB5;

tA = text(hA, panel_x*dimBx/dimA, 1+(panel_y-1)*dimBCy/dimA, 'A', 'Units', 'normalized', 'FontWeight', 'bold');
tB = text(hB1, panel_x, panel_y, 'B', 'Units', 'normalized', 'FontWeight', 'bold');
tC = text(hC1, panel_x*dimBx/dimCx, panel_y, 'C', 'Units', 'normalized', 'FontWeight', 'bold');


% text(0.05, 0.92, 'IC', 'Units', 'normalized', 'FontSize', 7, 'FontWeight', 'bold'); 
% text(0.05, 0.92, 'MGB', 'Units', 'normalized', 'FontSize', 7, 'FontWeight', 'bold'); 
% text(0.05, 0.92, 'A1', 'Units', 'normalized', 'FontSize', 7, 'FontWeight', 'bold'); 


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function draw_bars(h, bars, st_col, dv_col, reg)

hold(h, 'on');

bar(h, bars.tc1.st(1), bars.tc1.st(2), 'FaceColor', st_col);
errorbar(h, bars.tc1.st(1), bars.tc1.st(2), bars.tc1.st(3), 'Color', [0.5 0.5 0.5]);

bar(h, bars.tc1.dv(1), bars.tc1.dv(2), 'FaceColor', dv_col);
errorbar(h, bars.tc1.dv(1), bars.tc1.dv(2), bars.tc1.st(3), 'Color', [0.5 0.5 0.5]);

bar(h, bars.tc2.st(1), bars.tc2.st(2), 'FaceColor', st_col);
errorbar(h, bars.tc2.st(1), bars.tc2.st(2), bars.tc2.st(3), 'Color', [0.5 0.5 0.5]);

bar(h, bars.tc2.dv(1), bars.tc2.dv(2), 'FaceColor', dv_col);
errorbar(h, bars.tc2.dv(1), bars.tc2.dv(2), bars.tc2.st(3), 'Color', [0.5 0.5 0.5]);

y = ylim(h);
h.YLim = [floor(y(1)), ceil(y(2))];
h.YTick = [];
h.XTick = [];
switch reg
    case 'A1'
        set(h, 'XTick', [1 2 3.5 4.5], 'XTickLabels', {'bl_1', ' bl_2', 'bl_1', ' bl_2'});     
        set(h.XAxis, 'FontSize', 5, 'FontWeight', 'bold');
        ylabel(h, 'Spike rate, Hz', 'FontSize', 9, 'FontWeight', 'bold');
        h.YTick = [floor(y(1)), 2, ceil(y(2))];      
    case 'MGB'
        h.YTick = [floor(y(1)), 6, ceil(y(2))];
    case 'IC'
        h.YTick = [floor(y(1)), 8, ceil(y(2))];  
        title(h, ' tc_1_s_t        tc_2_n_d', 'FontSize', 7, 'FontWeight', 'bold');
end
end

%%



