%% Figure 2: A1

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
dim_paradigm_x = 0.25;  % width of paradigm
dim_paradigm_y = 0.05;  % height of paradigm
space_L = (1-(border + border_r + dim_L*3))/2;  % space between large graphs
space_S1x = 0.007;                      % x-space between typical bests data
space_S1y = 0.04;                       % y-space betweentypical bests data
space_S2x = dim_paradigm_x - 2*dim_S2x; % x-space between typical bests model
space_S2y = dim_L - 2*dim_S2y;          % x-space between typical bests model
space_tb = ((dim_L*2 + space_L) - (dim_S1*6 + space_S1x*3))/2; % space between typical best (all 4)
space_paradigm = 0.06;                  % y-space between oddball sequences (D)

y_top = border + 2*dim_L + 2*space_L;
y_middle = border + dim_L + space_L; 
x_middle = border + dim_L + space_L; 
x_right = border + 2*dim_L + 2*space_L;

% position of panels' letters (A,B,C, etc.)
panel_x = -0.25;
y_f = 0.05;
panel_y = 1 + y_f;

sb_cl = 7;
sb_ro = 6;

% colors
st_col = [0, 0.2, 0.8]; 
dv_col = [0.8, 0.2, 0];
mst_col = [0 0.7 0.8];
p_col = [0.4940, 0.1840, 0.5560];
g_col = [0, 0.5, 0];


%% Load data

load('data_figs.mat')
A1 = data_figs.A1;

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
D1 = [x_middle - (dim_paradigm_x-dim_L)/2, y_middle, dim_paradigm_x, dim_paradigm_y];
D2 = [x_middle - (dim_paradigm_x-dim_L)/2,...
      y_middle + space_paradigm + dim_paradigm_y,...
      dim_paradigm_x, dim_paradigm_y];
E = [x_right, y_middle, dim_L, dim_L];
F = [border, border, dim_L, dim_L];
G1 = [x_middle-(dim_paradigm_x-dim_L)/2,...
      border + dim_S2y + space_S2y,...
      dim_S2x, dim_S2y];
G2 = [x_middle-(dim_paradigm_x-dim_L)/2 + dim_S2x + space_S2x,...
      border + dim_S2y + space_S2y,...
      dim_S2x, dim_S2y];
G3 = [x_middle-(dim_paradigm_x-dim_L)/2,...
      border, dim_S2x, dim_S2y];
G4 = [x_middle-(dim_paradigm_x-dim_L)/2 + dim_S2x + space_S2x,...
      border, dim_S2x, dim_S2y];
H = [x_right, border, dim_L, dim_L];

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

hD1 = subplot(sb_ro,sb_cl,25);
hD1.Units = 'normalized';
hD1.Position = D1;

hD2 = subplot(sb_ro,sb_cl,17);
hD2.Units = 'normalized';
hD2.Position = D2;

hE = subplot(sb_ro,sb_cl,20);
hE.Units = 'normalized';
hE.Position = E;

hF = subplot(sb_ro,sb_cl,29);
hF.Units = 'normalized';
hF.Position = F;

hG1 = subplot(sb_ro,sb_cl,32);
hG1.Units = 'normalized';
hG1.Position = G1;

hG2 = subplot(sb_ro,sb_cl,33);
hG2.Units = 'normalized';
hG2.Position = G2;

hG3 = subplot(sb_ro,sb_cl,41);
hG3.Units = 'normalized';
hG3.Position = G3;

hG4 = subplot(sb_ro,sb_cl,42);
hG4.Units = 'normalized';
hG4.Position = G4;

hH = subplot(sb_ro,sb_cl,34);
hH.Units = 'normalized';
hH.Position = H;


%% A: typical bests- data

A1_tb = A1.tb_data;
hA_rs1 = [hA1_rs1, hA2_rs1, hA3_rs1];
hA_rs2 = [hA1_rs2, hA2_rs2, hA3_rs2];
hA_PSTH1 = [hA1_PSTH1, hA2_PSTH1, hA3_PSTH1];
hA_PSTH2 = [hA1_PSTH2, hA2_PSTH2, hA3_PSTH2];

for t = 1:3  
    tb = A1_tb{t};
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

SI = A1.SI;
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

%% C: time course- data

tcd = A1.tc_data;

hold(hC, 'on');
xd = linspace(10,500,50);
xs = linspace(1,500,450);
plot(hC, xd, tcd.dv.data, 'Color', dv_col);
plot(hC, xs, tcd.st.data, 'Color', st_col); 
patch(hC, tcd.dv.patch(:,1), tcd.dv.patch(:,2), dv_col, 'FaceAlpha', 0.3, 'EdgeAlpha', 0);
patch(hC, tcd.st.patch(:,1), tcd.st.patch(:,2), st_col, 'FaceAlpha', 0.3, 'EdgeAlpha', 0);       

ylim(hC, [0,7]);
set(hC, 'XTick', [1 500]);
set(hC, 'YTick', [0 7]);
xlabel(hC, 'Trial #', 'FontWeight', 'bold');
ylabel(hC, 'Spike rate, Hz', 'FontWeight', 'bold'); 
xlim(hC, [1 500]);

%% D: oddball paradigm

tr = [1:20, 25:44];

d1 = [4 7 15 17 19 26 29 36 43];        % deviant trials in the upper block
st1 = [1 2 3 5 6 39 40 41 42 44];       % standard trials in the upper block
mst1 = [8 10 14 18 20 25 28 32 35 38];  % matched standard trials in the upper block
d2 = [8 10 14 18 20 25 28 32 35 38];    % deviant trials in the bottom block

hold(hD2, 'on'); % upper block
for i = tr
    hp = plot(hD2, [i i], [0 0.6], 'Color', st_col, 'LineWidth', 1.2);
    if ismember(i, d1)
        hp.Color = dv_col;
    elseif ismember(i, mst1)
        hp.Color = mst_col;
        plot(hD2, [i, i], [0.7 0.8], 'k', 'LineWidth', 0.4);
    elseif ismember(i,st1)
        plot(hD2, [i, i], [0.7 0.8], 'k', 'LineWidth', 0.4);
    end
end

plot(hD2, [1 6], [0.8 0.8], 'k', 'LineWidth', 0.4);
plot(hD2, [3.5, 3.5], [0.8, 0.95], 'k', 'LineWidth', 0.4);
txt(1) = text(hD2, 2, 1.6, sprintf('First\nstandards'), 'FontSize', 6,...
    'HorizontalAlignment', 'center', 'FontWeight', 'bold', 'Color', st_col);

plot(hD2, [8, 20], [0.8, 0.8], 'k', 'LineWidth', 0.4);
plot(hD2, [14, 14], [0.8, 0.95], 'k', 'LineWidth', 0.4);
txt(2) = text(hD2, 15.5, 1.6, sprintf('Early\nstandards'), 'FontSize', 6,...
    'HorizontalAlignment', 'center', 'FontWeight', 'bold', 'Color', mst_col);

plot(hD2, [25, 38], [0.8, 0.8], 'k', 'LineWidth', 0.4);
plot(hD2, [31, 31], [0.8, 0.95], 'k', 'LineWidth', 0.4);
txt(3) = text(hD2, 30.5, 1.6, sprintf('Late\nstandards'), 'FontSize', 6,...
    'HorizontalAlignment', 'center', 'FontWeight', 'bold', 'Color', mst_col);

plot(hD2, [39, 44], [0.8, 0.8], 'k', 'LineWidth', 0.4);
plot(hD2, [41.5, 41.5], [0.8, 0.95], 'k', 'LineWidth', 0.4);
txt(4) = text(hD2, 44, 1.6, sprintf('Last\nstandards'), 'FontSize', 6,...
    'HorizontalAlignment', 'center', 'FontWeight', 'bold', 'Color', st_col);

ylim(hD2, [0 1.1]);
xlim(hD2, [1 44]);
hD2.XTick = [];
hD2.YTick = [];
hD2.YAxis.Visible = 'off';

hold(hD1, 'on');
for i = tr
    hp = plot(hD1, [i i], [0 0.6], 'Color', st_col, 'LineWidth', 1.2);
    if ismember(i, d2)
        hp.Color = dv_col;
        plot(hD1, [i, i], [0.7 0.8], 'k', 'LineWidth', 0.4);
    end
end

plot(hD1, [8, 20], [0.8, 0.8], 'k', 'LineWidth', 0.4);
plot(hD1, [14 14], [0.8, 0.95], 'k', 'LineWidth', 0.4);
txt(5) = text(hD1, 14, 1.6, sprintf('First\ndeviants'), 'FontSize', 6,...
    'HorizontalAlignment', 'center', 'FontWeight', 'bold', 'Color', dv_col);

plot(hD1, [25, 38], [0.8, 0.8], 'k', 'LineWidth', 0.4);
plot(hD1, [31, 31], [0.8, 0.95], 'k', 'LineWidth', 0.4);
txt(6) = text(hD1, 31, 1.6, sprintf('Last\ndeviants'), 'FontSize', 6,...
    'HorizontalAlignment', 'center', 'FontWeight', 'bold', 'Color', dv_col);

ylim(hD1, [0 1.1]);
xlim(hD1, [1 44]);
hD1.XTick = [1 44];
hD1.XTickLabel = {'1', '500'};
hD1.YTick = [];
hD1.XLabel.String = 'Trial #';
hD1.XLabel.FontWeight = 'bold';
hD1.YAxis.Visible = 'off';
hD1.TickDir = 'out';

%% E: bars

bars = A1.bars;
hold(hE, 'on'); 
colors = [st_col; mst_col; dv_col; mst_col; dv_col; st_col]; 
x = bars.x(end:-1:1);
y = bars.y(end:-1:1);
err = bars.err(end:-1:1,:);
for k = 1:6
    bar_h(k) = bar(hE, x(k), y(k),'FaceColor', colors(k,:));
    err_h = errorbar(hE, err(k,1), err(k,2), err(k,3), 'Color', [0.5 0.5 0.5]);
    errorbarT(err_h, x(k),1.5);
end

xlim(hE, [0 7.2]);
ylim(hE, [0 round(max(bars.y))+1]);
set(hE, 'Ytick', [0 round(max(bars.y))+1]);
ylabel(hE, 'Spike rate, Hz', 'FontWeight', 'bold');
labels = {'1st standards', 'early standards', '1st deviants', 'late standards', 'last deviants', 'last standards', ' '};
xticks(hE, [0.8 2.2 3 4.2 5 6.4]);
hE.XLabel.FontSize = 2;
xticklabels(hE, labels); 
xtickangle(hE, 32);
set(hE, 'TickDir', 'out');

%% F: time course- model

tcm = A1.tc_model;
s_col = hsv2rgb(rgb2hsv(st_col) + [0 -0.65 0]);
d_col = hsv2rgb(rgb2hsv(dv_col) + [0 -0.65 0]);

hold(hF, 'on');
x = linspace(1,500,50);
plot(hF, x, tcm.dv.data, 'o', 'Color', d_col, 'MarkerFaceColor', d_col, 'MarkerEdgeColor', d_col, 'MarkerSize', 2); 
plot(hF, x, tcm.st.data, 'o', 'Color', s_col, 'MarkerFaceColor', s_col, 'MarkerEdgeColor', s_col, 'MarkerSize', 2); 
plot(hF, x, tcm.dv.model, 'Color', dv_col);
plot(hF, x, tcm.st.model, 'Color', st_col); 
patch(hF, tcm.dv.patch(:,1), tcm.dv.patch(:,2), dv_col, 'FaceAlpha', 0.3, 'EdgeAlpha', 0);
patch(hF, tcm.st.patch(:,1), tcm.st.patch(:,2), st_col, 'FaceAlpha', 0.3, 'EdgeAlpha', 0);       

er1 = errorbar(hF, tcm.st.er(1), tcm.st.er(2), tcm.st.er(3), 'Color', s_col, 'MarkerFaceColor', s_col, 'MarkerEdgeColor', s_col, 'LineStyle', 'none', 'Marker', 'o', 'MarkerSize', 3);
er2 = errorbar(hF, tcm.dv.er(1), tcm.dv.er(2), tcm.dv.er(3), 'Color', d_col, 'MarkerFaceColor', d_col, 'MarkerEdgeColor', d_col, 'LineStyle', 'none', 'Marker', 'o','MarkerSize', 3);;
errorbarT(er1,1,0.7);
errorbarT(er2,1,0.7);
ylim(hF, [0,7]);
set(hF, 'XTick', [1 500], 'XTickLabels', {'1', '50'});
set(hF, 'YTick', [0 7]);
xlabel(hF, 'Trial #', 'FontWeight', 'bold');
ylabel(hF, 'Spike rate, Hz', 'FontWeight', 'bold'); 
xlim(hF, [1 500]);

%% G: typical bests- model

tbm = A1.tb_model;
tbm = tbm([2 1 3 4]);
hG = [hG1, hG2, hG3, hG4];

for k = 1:4
    hold(hG(k), 'on');
    plot(hG(k), tbm{k}.dv.data, '-o', 'Color', d_col,'MarkerSize', 1.7, 'LineWidth', 0.3, 'MarkerFaceColor',d_col);
    plot(hG(k), tbm{k}.st.data, '-o', 'Color',s_col,'MarkerSize', 1.7, 'LineWidth', 0.3, 'MarkerFaceColor', s_col);
    plot(hG(k), tbm{k}.dv.model, 'Color', dv_col, 'LineWidth', 1.5);
    plot(hG(k), tbm{k}.st.model, 'Color', st_col, 'LineWidth', 1.5);
    xlim(hG(k), [0 50]);
    y_ul = round(max([tbm{k}.dv.data,tbm{k}.st.data]))+1;
    ylim(hG(k), [0 y_ul]);
    set(hG(k), 'YTick', [0 y_ul]);
    set(hG(k), 'XTick', []);
end
xlabel(hG(3), 'Trial #', 'FontWeight', 'bold');
ylabel(hG(3), 'Spike rate, Hz', 'FontWeight', 'bold');
set(hG(3), 'XTick', [0 50], 'XTickLabels', {'1', '50'});
scatter(hG(2), 49, tbm{2}.dv.model(end), 20, 'MarkerFaceColor', p_col, 'MarkerEdgeColor', 'k')
scatter(hG(2), 1, tbm{2}.dv.model(1), 20, 'MarkerFaceColor', g_col, 'MarkerEdgeColor', 'k')

%% H: change rate histograms

hists = A1.hists;

hold (hH, 'on');
h1 = histogram(hH, hists.dv_change_rate, 100, 'Facecolor',dv_col);
histogram(hH, hists.st_change_rate, 100, 'Facecolor',st_col, 'BinWidth', h1.BinWidth);
xlabel(hH, 'Rate change, Hz', 'FontSize', font_size, 'FontWeight', 'bold');
ylabel(hH, 'Count', 'FontSize', font_size, 'FontWeight', 'bold');
xlim(hH, [-1.7 1.7]);
ylim(hH, [0 500])
xticks(hH, [-1 0 1]);
yticks(hH, hH.YLim);
set(hH, 'TickDir', 'out');
tHm = text(hH, 0.03, 0.95,['\fontsize{7}Rate Change = '...
    '{\color[rgb]{0.4940, 0.1840, 0.5560} model(50) '...
    '\color{black} - '...
    '\color[rgb]{0, 0.5, 0}model(1)}'],...
    'Units', 'normalized', 'FontWeight', 'bold');

%% Fine tuning

set(findall(f,'-property','FontSize'),'FontSize',font_size);
set(txt, 'FontSize', 6.2);
hE.XAxis.FontSize = 7.5;
tHm.FontSize = 6.8;

% panels' letters
tA = text(hA1_rs1, -0.67, 1.4, 'A', 'Units', 'normalized', 'FontWeight', 'bold');
tB = text(hB, panel_x, panel_y, 'B', 'Units', 'normalized', 'FontWeight', 'bold');
tC = text(hC, panel_x, panel_y, 'C', 'Units', 'normalized', 'FontWeight', 'bold');
tD = text(hD2, -0.23, 2.45, 'D', 'Units', 'normalized', 'FontWeight', 'bold');
tE = text(hE, panel_x, panel_y, 'E', 'Units', 'normalized', 'FontWeight', 'bold');
tF = text(hF, panel_x, panel_y, 'F', 'Units', 'normalized', 'FontWeight', 'bold');
tG = text(hG1, -0.55, 1.115, 'G', 'Units', 'normalized', 'FontWeight', 'bold');
tH = text(hH, panel_x, panel_y, 'H', 'Units', 'normalized', 'FontWeight', 'bold');


hB.YLabel.Units = 'normalized';
hE.YLabel.Units = 'normalized';
hH.YLabel.Units = 'normalized';
hf.YLabel.Units = 'normalized';
hA1_rs1.YLabel.Units = 'normalized';
hA1_PSTH1.YLabel.Units = 'normalized';

posYA1 = hA1_rs1.YLabel.Position;
posYA2 = hA1_PSTH1.YLabel.Position;
posYB = hB.YLabel.Position;
posYE = hE.YLabel.Position;
posYH = hH.YLabel.Position;
posYF = hF.YLabel.Position;
posYA1(1) = posYA2(1);
posYB(1) = posYE(1);
posYH(1) = posYE(1);
hA1_rs1.YLabel.Position = posYA1;
hB.YLabel.Position = posYB;
hH.YLabel.Position = posYH;
hF.YLabel.Position = posYF;


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
    
