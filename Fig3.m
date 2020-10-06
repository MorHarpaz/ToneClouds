%% Figure 3: IC

%clear all; close all; clc

%% Define parameters: 

fig_size = 700;
font_size = 9;
border = 0.06;          % figure's borders 
border_r = 0.02;        % right border of the figure
dim_L = 0.22;           % size of large graphs (e.g. B)
dim_S1 = 0.08;          % size of typical best- data
dim_S2x = 0.105;        % width of typical best- model
dim_S2y = 0.095;        % height og typical best- model
space_L = (1-(border + border_r + dim_L*3))/2;  % space between large graphs
space_S1x = 0.007;                      % x-space between typical bests data
space_S1y = 0.04;                       % y-space betweentypical bests data
space_tb = ((dim_L*2 + space_L) - (dim_S1*6 + space_S1x*3))/2; % space between typical best (all 4)

y_top = border + 2*dim_L + 2*space_L; 
y_middle = border + dim_L + space_L; 
x_middle = border + dim_L + space_L; 
x_right = border + 2*dim_L + 2*space_L;
x_S2 = x_right - space_L - dim_S2x;
y_S2 = 0.015;

% position of panels' letters (A,B,C, etc.)
panel_x = -0.25;
y_f = 0.01;
panel_y = 1 + y_f;

sb_cl = 7;
sb_ro = 3;

% colors
st_col = [0, 0.2, 0.8]; 
dv_col = [0.8, 0.2, 0];
mst_col = [0 0.7 0.8];
p_col = [0.4940, 0.1840, 0.5560];
g_col = [0, 0.5, 0];


%% Load data

load('data_figs.mat')
IC = data_figs.IC;

%% Create figure

f = figure('color', 'white');
pf = f.Position;
pf([3 4]) = fig_size;
pf([1 2]) = 0;
f.Position = pf;
f.Units = 'normalized';

%% Define positions of each subplot

% typical best #1
A1_rs1 = [border,...
          y_top + dim_S1 + space_S1y,...
          dim_S1, dim_S1];
A1_PSTH1 = [border, y_top, dim_S1, dim_S1];
A1_rs2 = [border + dim_S1 + space_S1x,...
          y_top + dim_S1 + space_S1y,...
          dim_S1, dim_S1]; 
A1_PSTH2 = [border + dim_S1 + space_S1x,...
            y_top, dim_S1, dim_S1];

% typical best #2
A2_rs1 = [border + 2*dim_S1 + space_S1x + space_tb,...
          y_top + dim_S1 + space_S1y,...
          dim_S1, dim_S1];
A2_PSTH1 = [border + 2*dim_S1 + space_S1x + space_tb,...
            y_top, dim_S1, dim_S1];
A2_rs2 = [border + 3*dim_S1 + 2*space_S1x + space_tb,...
          y_top + dim_S1 + space_S1y,...
          dim_S1, dim_S1];
A2_PSTH2 = [border + 3*dim_S1 + 2*space_S1x + space_tb,...
            y_top, dim_S1, dim_S1];

% typical best #3        
A3_rs1 = [border + 4*dim_S1 + 2*space_S1x + 2*space_tb,...
          y_top + dim_S1 + space_S1y,...
          dim_S1, dim_S1];
A3_PSTH1 = [border + 4*dim_S1 + 2*space_S1x + 2*space_tb,...
            y_top, dim_S1, dim_S1];
A3_rs2 = [border + 5*dim_S1 + 3*space_S1x + 2*space_tb,...
          y_top + dim_S1 + space_S1y,...
          dim_S1, dim_S1];
A3_PSTH2 = [border + 5*dim_S1 + 3*space_S1x + 2*space_tb,...
            y_top, dim_S1, dim_S1];


B = [x_right, y_top, dim_L, dim_L];
C = [border, y_middle, dim_L, dim_L];
D = [x_middle, y_middle, dim_L, dim_L];
Di = [x_S2, y_middle + y_S2, dim_S2x, dim_S2y];
E = [x_right, y_middle, dim_L, dim_L];

%% Arrange subplots

hA1_rs1 = subplot(sb_ro,sb_cl,1);
hA1_rs1.Units = 'normalized';
hA1_rs1.Position = A1_rs1;

hA1_rs2 = subplot(sb_ro,sb_cl,2);
hA1_rs2.Units = 'normalized';
hA1_rs2.Position = A1_rs2;

hA2_rs1 = subplot(sb_ro,sb_cl,3);
hA2_rs1.Units = 'normalized';
hA2_rs1.Position = A2_rs1;

hA2_rs2 = subplot(sb_ro,sb_cl,4);
hA2_rs2.Units = 'normalized';
hA2_rs2.Position = A2_rs2;

hA3_rs1 = subplot(sb_ro,sb_cl,5);
hA3_rs1.Units = 'normalized';
hA3_rs1.Position = A3_rs1;

hA3_rs2 = subplot(sb_ro,sb_cl,6);
hA3_rs2.Units = 'normalized';
hA3_rs2.Position = A3_rs2;

hA1_PSTH1 = subplot(sb_ro,sb_cl,8);
hA1_PSTH1.Units = 'normalized';
hA1_PSTH1.Position = A1_PSTH1;

hA1_PSTH2 = subplot(sb_ro,sb_cl,9);
hA1_PSTH2.Units = 'normalized';
hA1_PSTH2.Position = A1_PSTH2;

hA2_PSTH1 = subplot(sb_ro,sb_cl,10);
hA2_PSTH1.Units = 'normalized';
hA2_PSTH1.Position = A2_PSTH1;
 
hA2_PSTH2 = subplot(sb_ro,sb_cl,11);
hA2_PSTH2.Units = 'normalized';
hA2_PSTH2.Position = A2_PSTH2;

hA3_PSTH1 = subplot(sb_ro,sb_cl,12);
hA3_PSTH1.Units = 'normalized';
hA3_PSTH1.Position = A3_PSTH1;

hA3_PSTH2 = subplot(sb_ro,sb_cl,13);
hA3_PSTH2.Units = 'normalized';
hA3_PSTH2.Position = A3_PSTH2;

hB = subplot(sb_ro,sb_cl,7);
hB.Units = 'normalized';
hB.Position = B;

hC = subplot(sb_ro,sb_cl,15);
hC.Units = 'normalized';
hC.Position = C;

hD = subplot(sb_ro,sb_cl,17);
hD.Units = 'normalized';
hD.Position = D;
hDi = axes('Position',Di);

hE = subplot(sb_ro,sb_cl,20);
hE.Units = 'normalized';
hE.Position = E;


%% A: typical bests- data

IC_tb = IC.tb_data;
hA_rs1 = [hA1_rs1, hA2_rs1, hA3_rs1];
hA_rs2 = [hA1_rs2, hA2_rs2, hA3_rs2];
hA_PSTH1 = [hA1_PSTH1, hA2_PSTH1, hA3_PSTH1];
hA_PSTH2 = [hA1_PSTH2, hA2_PSTH2, hA3_PSTH2];

for t = 1:3  
    tb = IC_tb{t};
    rs1 = tb.rs1;
    rs2 = tb.rs2;
    PSTH1 = tb.PSTH1;
    PSTH2 = tb.PSTH2;
    ll = round(min([PSTH1.dv, PSTH1.st, PSTH2.dv, PSTH2.st]));
    ul = round(max([PSTH1.dv, PSTH1.st, PSTH2.dv, PSTH2.st]));    
    plot_rs_PSTH(hA_rs1(t), hA_PSTH1(t), rs1, PSTH1, ll, ul);
    plot_rs_PSTH(hA_rs2(t), hA_PSTH2(t), rs2, PSTH2, ll, ul);
    set(hA_PSTH1(t), 'YTick', [ll ul]);
end

title(hA_rs1(1), 'Cloud 1');
title(hA_rs2(1), 'Cloud 2');
ylabel(hA_rs1(1), 'Trial #', 'FontWeight', 'bold');
xlabel(hA_PSTH1(1), 'Time, ms', 'FontWeight', 'bold');
ylabel(hA_PSTH1(1), 'Spike rate, Hz', 'FontWeight', 'bold');
pyl = hA_rs1(1).YLabel.Position;
pyl(1) = hA_PSTH1(1).YLabel.Position(1);
hA_rs1(1).YLabel.Position = pyl;
set(hA_rs1(1), 'YTick', [1 500]);
set(hA_PSTH1(1), 'XTick', [50 200]);
set(hA_PSTH1(1), 'XTickLabel', [0 150]);
py_rs1 = hA_rs1(1).YLabel.Position;
py_PSTH1 = hA_PSTH1(1).YLabel.Position;
py_rs1(1) = py_PSTH1(1);
hA_rs1(1).YLabel.Position = py_rs1;

%% B: SI-scatter

SI = IC.SI;
ms = 3; % dots' size
hold(hB, 'on');
scatter(hB, SI.all_SI1, SI.all_SI2, ms, 'MarkerEdgeColor', [0.75 0.75 0.75]);
scatter(hB, SI.sig_SI1, SI.sig_SI2, ms, 'filled', 'MarkerFaceColor', 'k');
text(hB, 0.92, 0.6, 'I', 'Units', 'normalized');
text(hB, 0.9, 0.4, 'IV', 'Units', 'normalized');
text(hB, 0.04, 0.6, 'II', 'Units', 'normalized');
text(hB, 0.03, 0.4, 'III', 'Units', 'normalized');
xlabel(hB, 'SI_1', 'FontWeight', 'bold');
ylabel(hB, 'SI_2', 'FontWeight', 'bold');
line(hB, [-1:1], -[-1:1], 'Color', 'k')
line(hB, zeros(1,3), [-1:1], 'Color', 'k');
line(hB, [-1:1], zeros(1,3), 'Color', 'k');
set(hB, 'Xtick', [-1 0 1]);
set(hB, 'Ytick', [-1 0 1]);

%% C: bars

bars = IC.bars;
hold(hC, 'on'); 
colors = [st_col; mst_col; dv_col; mst_col; dv_col; st_col]; 
x = bars.x(end:-1:1);
y = bars.y(end:-1:1);
err = bars.err(end:-1:1,:);
for k = 1:6
    bar_h(k) = bar(hC, x(k), y(k),'FaceColor', colors(k,:));
    err_h = errorbar(hC, err(k,1), err(k,2), err(k,3), 'Color', [0.5 0.5 0.5]);
    errorbarT(err_h, x(k),1.5);
end

xlim(hC, [0 7.2]);
ylim(hC, [0 round(max(bars.y))+1]);
set(hC, 'Ytick', [0 round(max(bars.y))+1]);
ylabel(hC, 'Spike rate, Hz', 'FontWeight', 'bold');
labels = {'1st standards', 'early standards', '1st deviants', 'late standards', 'last deviants', 'last standards', ' '};
xticks(hC, [0.8 2.2 3 4.2 5 6.4]);
hC.XLabel.FontSize = 2;
xticklabels(hC, labels); 
xtickangle(hC, 32);
set(hC, 'TickDir', 'out');

%% D: time course- model

tcm = IC.tc_model;
s_col = hsv2rgb(rgb2hsv(st_col) + [0 -0.65 0]);
d_col = hsv2rgb(rgb2hsv(dv_col) + [0 -0.65 0]);

hold(hD, 'on');
x = linspace(1,500,50);
plot(hD, x, tcm.dv.data, 'o', 'Color', d_col, 'MarkerFaceColor', d_col, 'MarkerEdgeColor', d_col, 'MarkerSize', 2); 
plot(hD, x, tcm.st.data, 'o', 'Color', s_col, 'MarkerFaceColor', s_col, 'MarkerEdgeColor', s_col, 'MarkerSize', 2); 
plot(hD, x, tcm.dv.model, 'Color', dv_col);
plot(hD, x, tcm.st.model, 'Color', st_col); 
patch(hD, tcm.dv.patch(:,1), tcm.dv.patch(:,2), dv_col, 'FaceAlpha', 0.3, 'EdgeAlpha', 0);
patch(hD, tcm.st.patch(:,1), tcm.st.patch(:,2), st_col, 'FaceAlpha', 0.3, 'EdgeAlpha', 0);       

er1 = errorbar(hD, tcm.st.er(1), tcm.st.er(2), tcm.st.er(3), 'Color', s_col, 'MarkerFaceColor', s_col, 'MarkerEdgeColor', s_col, 'LineStyle', 'none', 'Marker', 'o', 'MarkerSize', 3);
er2 = errorbar(hD, tcm.dv.er(1), tcm.dv.er(2), tcm.dv.er(3), 'Color', d_col, 'MarkerFaceColor', d_col, 'MarkerEdgeColor', d_col, 'LineStyle', 'none', 'Marker', 'o','MarkerSize', 3);;
errorbarT(er1,1,0.7);
errorbarT(er2,1,0.7);
ylim(hD, [0,12]);
set(hD, 'XTick', [1 500], 'XTickLabels', {'1', '50'});
set(hD, 'YTick', [0 12]);
xlabel(hD, 'Trial #', 'FontWeight', 'bold');
ylabel(hD, 'Spike rate, Hz', 'FontWeight', 'bold'); 
xlim(hD, [1 500]);

%% Di typical best, inset

tbm = IC.tb_model;

hold(hDi, 'on');
plot(hDi, tbm.dv.data, '-o', 'Color', d_col,'MarkerSize', 1.7, 'LineWidth', 0.3, 'MarkerFaceColor',d_col);
plot(hDi, tbm.st.data, '-o', 'Color',s_col,'MarkerSize', 1.7, 'LineWidth', 0.3, 'MarkerFaceColor', s_col);
plot(hDi, tbm.dv.model, 'Color', dv_col, 'LineWidth', 1.5);
plot(hDi, tbm.st.model, 'Color', st_col, 'LineWidth', 1.5);
xlim(hDi, [0 50]);
y_ul = round(max([tbm.dv.data,tbm.st.data]))+1;
ylim(hDi, [0 y_ul]);
set(hDi, 'YTick', [0 y_ul]);
set(hDi, 'XTick', []);


%% E: change rate histograms

hists = IC.hists;
hold (hE, 'on');
h1 = histogram(hE, hists.st_change_rate, 100, 'Facecolor',st_col);
histogram(hE, hists.dv_change_rate, 100, 'Facecolor',dv_col, 'BinWidth', h1.BinWidth);
xlabel(hE, 'Rate change, Hz', 'FontSize', font_size, 'FontWeight', 'bold');
ylabel(hE, 'Count', 'FontSize', font_size, 'FontWeight', 'bold');
xlim(hE, [-7 7]);
ylim(hE, [0 2000])
xticks(hE, [-5 0 5]);
yticks(hE, hE.YLim);
set(hE, 'TickDir', 'out');


%% Fine tuning

set(findall(f,'-property','FontSize'),'FontSize',font_size);
hC.XAxis.FontSize = 7.5;

% panels' letters
tA = text(hA1_rs1, -0.67, 1.4, 'A', 'Units', 'normalized', 'FontWeight', 'bold');
tB = text(hB, panel_x, panel_y, 'B', 'Units', 'normalized', 'FontWeight', 'bold');
tC = text(hC, panel_x, panel_y, 'C', 'Units', 'normalized', 'FontWeight', 'bold');
tD = text(hD, panel_x, panel_y, 'D', 'Units', 'normalized', 'FontWeight', 'bold');
tE = text(hE, panel_x, panel_y, 'E', 'Units', 'normalized', 'FontWeight', 'bold');

hB.YLabel.Units = 'normalized';
hE.YLabel.Units = 'normalized';
posYB = hB.YLabel.Position;
posYE = hE.YLabel.Position;
posYE(1) = posYB(1);
hE.YLabel.Position = posYE;

hA1_rs1.YLabel.Units = 'normalized';
hA1_PSTH1.YLabel.Units = 'normalized';
posYA1 = hA1_rs1.YLabel.Position;
posYA2 = hA1_PSTH1.YLabel.Position;
posYA1(1) = posYA2(1);
hA1_rs1.YLabel.Position = posYA1;

% posYH(1) = posYE(1);
% hB.YLabel.Position = posYB;
% hH.YLabel.Position = posYH;
% hF.YLabel.Position = posYF;


%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Local functions %%%%%%%%%%%%%%%%%%%%%%%%%%%
   
function plot_rs_PSTH(sb_rs, sb_PSTH, rs, PSTH, ll, ul)
    
    hold(sb_rs, 'on');
    rectangle(sb_rs, 'Position', [51 0 150 500], 'FaceColor', [0.95 0.95 0.95], 'EdgeColor', 'none')
    scatter(sb_rs, rs.dv.x, rs.dv.y, 1.2,'filled', 'MarkerFaceColor', [0.8 0.2 0]);
    scatter(sb_rs, rs.st.x, rs.st.y, 1.2, 'filled', 'MarkerFaceColor', [0 0.2 0.8]);
    xlim(sb_rs, [0 513]);
    ylim(sb_rs, [1 500]);
    
    hold(sb_PSTH, 'on');
    rectangle(sb_PSTH, 'Position', [51 ll 150 ul-ll], 'FaceColor', [0.95 0.95 0.95], 'EdgeColor', 'none');
    plot(sb_PSTH, PSTH.dv, 'Color', [0.8 0.2 0], 'LineWidth', 0.7);
    plot(sb_PSTH, PSTH.st, 'Color', [0 0.2 0.8], 'LineWidth', 0.7);
    xlim(sb_PSTH, [0 513]);
    ylim(sb_PSTH, [ll ul]);
    
    set([sb_rs, sb_PSTH], 'TickDir', 'out', 'XTick', [], 'YTick', []);
    
end
    