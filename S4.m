%% Figure S4: ventral MGB

%% Define parameters: 

fig_size = 700;
font_size = 9;
border = 0.06;          % figure's borders 
border_r = 0.02;        % right border of the figure
dim_L = 0.22;           % size of large graphs (e.g. B)
space_L = (1-(border + border_r + dim_L*3))/2;  % space between large graphs

y_top = border + 2*dim_L + 2*space_L; 
y_middle = border + dim_L + space_L; 
x_middle = border + dim_L + space_L; 
x_right = border + 2*dim_L + 2*space_L;

% position of panels' letters (A,B,C, etc.)
panel_x = -0.25;
y_f = 0.01;
panel_y = 1 + y_f;

sb_cl = 2;
sb_ro = 2;

% colors
st_col = [0, 0.2, 0.8]; 
dv_col = [0.8, 0.2, 0];
mst_col = [0 0.7 0.8];
p_col = [0.4940, 0.1840, 0.5560];
g_col = [0, 0.5, 0];


%% Load data

load('data_figs.mat')
MGBv = data_figs.MGBv;

%% Create figure

f = figure('color', 'white');
pf = f.Position;
pf([3 4]) = fig_size;
pf([1 2]) = 0;
f.Position = pf;
f.Units = 'normalized';

%% Define positions of each subplot

A = [border, y_top, dim_L, dim_L];
B = [x_middle, y_top, dim_L, dim_L];
C = [border, y_middle, dim_L, dim_L];
D = [x_middle, y_middle, dim_L, dim_L];


%% Arrange subplots

hA = subplot(sb_ro,sb_cl,1);
hA.Units = 'normalized';
hA.Position = A;

hB = subplot(sb_ro,sb_cl,2);
hB.Units = 'normalized';
hB.Position = B;

hC = subplot(sb_ro,sb_cl,3);
hC.Units = 'normalized';
hC.Position = C;

hD = subplot(sb_ro,sb_cl,4);
hD.Units = 'normalized';
hD.Position = D;

%% A: SI-scatter

SI = MGBv.SI;
ms = 3; % dots' size
hold(hA, 'on');
scatter(hA, SI.all_SI1, SI.all_SI2, ms, 'MarkerEdgeColor', [0.75 0.75 0.75]);
scatter(hA, SI.sig_SI1, SI.sig_SI2, ms, 'filled', 'MarkerFaceColor', 'k');
text(hA, 0.92, 0.6, 'I', 'Units', 'normalized');
text(hA, 0.9, 0.4, 'IV', 'Units', 'normalized');
text(hA, 0.04, 0.6, 'II', 'Units', 'normalized');
text(hA, 0.03, 0.4, 'III', 'Units', 'normalized');
xlabel(hA, 'SI_1', 'FontWeight', 'bold');
ylabel(hA, 'SI_2', 'FontWeight', 'bold');
line(hA, [-1:1], -[-1:1], 'Color', 'k')
line(hA, zeros(1,3), [-1:1], 'Color', 'k');
line(hA, [-1:1], zeros(1,3), 'Color', 'k');
set(hA, 'Xtick', [-1 0 1]);
set(hA, 'Ytick', [-1 0 1]);

%% B: bars

bars = MGBv.bars;
hold(hB, 'on'); 
colors = [st_col; mst_col; dv_col; mst_col; dv_col; st_col]; 
x = bars.x(end:-1:1);
y = bars.y(end:-1:1);
err = bars.err(end:-1:1,:);
for k = 1:6
    bar_h(k) = bar(hB, x(k), y(k),'FaceColor', colors(k,:));
    err_h = errorbar(hB, err(k,1), err(k,2), err(k,3), 'Color', [0.5 0.5 0.5]);
    errorbarT(err_h, x(k),1.5);
end

xlim(hB, [0 7.2]);
ylim(hB, [0 round(max(bars.y))+1]);
set(hB, 'Ytick', [0 round(max(bars.y))+1]);
ylabel(hB, 'Spike rate, Hz', 'FontWeight', 'bold');
labels = {'1st standards', 'early standards', '1st deviants', 'late standards', 'last deviants', 'last standards', ' '};
xticks(hB, [0.8 2.2 3 4.2 5 6.4]);
hC.XLabel.FontSize = 2;
xticklabels(hB, labels); 
xtickangle(hB, 32);
set(hB, 'TickDir', 'out');

%% C: time course- model

tcm = MGBv.tc_model;
s_col = hsv2rgb(rgb2hsv(st_col) + [0 -0.65 0]);
d_col = hsv2rgb(rgb2hsv(dv_col) + [0 -0.65 0]);

hold(hC, 'on');
x = linspace(1,500,50);
plot(hC, x, tcm.dv.data, 'o', 'Color', d_col, 'MarkerFaceColor', d_col, 'MarkerEdgeColor', d_col, 'MarkerSize', 2); 
plot(hC, x, tcm.st.data, 'o', 'Color', s_col, 'MarkerFaceColor', s_col, 'MarkerEdgeColor', s_col, 'MarkerSize', 2); 
plot(hC, x, tcm.dv.model, 'Color', dv_col);
plot(hC, x, tcm.st.model, 'Color', st_col); 
patch(hC, tcm.dv.patch(:,1), tcm.dv.patch(:,2), dv_col, 'FaceAlpha', 0.3, 'EdgeAlpha', 0);
patch(hC, tcm.st.patch(:,1), tcm.st.patch(:,2), st_col, 'FaceAlpha', 0.3, 'EdgeAlpha', 0);       

er1 = errorbar(hC, tcm.st.er(1), tcm.st.er(2), tcm.st.er(3), 'Color', s_col, 'MarkerFaceColor', s_col, 'MarkerEdgeColor', s_col, 'LineStyle', 'none', 'Marker', 'o', 'MarkerSize', 3);
er2 = errorbar(hC, tcm.dv.er(1), tcm.dv.er(2), tcm.dv.er(3), 'Color', d_col, 'MarkerFaceColor', d_col, 'MarkerEdgeColor', d_col, 'LineStyle', 'none', 'Marker', 'o','MarkerSize', 3);;
errorbarT(er1,1,0.7);
errorbarT(er2,1,0.7);
ylim(hC, [0,10]);
set(hC, 'XTick', [1 500], 'XTickLabels', {'1', '50'});
set(hC, 'YTick', [0 10]);
xlabel(hC, 'Trial #', 'FontWeight', 'bold');
ylabel(hC, 'Spike rate, Hz', 'FontWeight', 'bold'); 
xlim(hC, [1 500]);

%% D: change rate histograms

hists = MGBv.hists;
hold (hD, 'on');
h1 = histogram(hD, hists.st_change_rate, 100, 'Facecolor',st_col);
histogram(hD, hists.dv_change_rate, 100, 'Facecolor',dv_col, 'BinWidth', h1.BinWidth);
xlabel(hD, 'Rate change, Hz', 'FontSize', font_size, 'FontWeight', 'bold');
ylabel(hD, 'Count', 'FontSize', font_size, 'FontWeight', 'bold');
xlim(hD, [-9 9]);
ylim(hD, [0 900])
xticks(hD, [-5 0 5]);
yticks(hD, hD.YLim);
set(hD, 'TickDir', 'out');


%% Fine tuning

set(findall(f,'-property','FontSize'),'FontSize',font_size);
hC.XAxis.FontSize = 7.5;

% panels' letters
tB = text(hA, panel_x, panel_y, 'A', 'Units', 'normalized', 'FontWeight', 'bold');
tC = text(hB, panel_x, panel_y, 'B', 'Units', 'normalized', 'FontWeight', 'bold');
tD = text(hC, panel_x, panel_y, 'C', 'Units', 'normalized', 'FontWeight', 'bold');
tE = text(hD, panel_x, panel_y, 'D', 'Units', 'normalized', 'FontWeight', 'bold');

hA.YLabel.Units = 'normalized';
hB.YLabel.Units = 'normalized';
hC.YLabel.Units = 'normalized';
hD.YLabel.Units = 'normalized';

posYA = hA.YLabel.Position;
posYB = hB.YLabel.Position;
posYC = hC.YLabel.Position;
posYD = hD.YLabel.Position;

posYB(1) = posYA(1);
posYC(1) = posYA(1);
posYD(1) = posYA(1);

hB.YLabel.Position = posYB;
hC.YLabel.Position = posYC;
hD.YLabel.Position = posYD;


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
    