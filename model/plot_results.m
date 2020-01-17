close all;
clear i j period active_days;

case_sel=Case_out.data(1);
if (case_sel == 4)
    bound = 'bounded';
else
    bound = 'unbounded';
end

max_period = 14;
j=0;
for i=1:max_period+1
    if (Pulse_out.data(i)==0)
        j = j+1; % inactive days
        if (Pulse_out.data(i+1)==1) % new period
            break;
        end
    end
end
if (i==15 && j==0) % continuous
    period=1;
    active_days=1;
else
    period = i;
    active_days = i-j;
end

path = sprintf('D:\\Users\\Jay\\Google Drive\\???????????\\???????????\\Reproduce paper\\ch 3 [2010] Banks\\periodic dose\\case %d\\[%d-%d]', case_sel, period, active_days);
cells_print_path = sprintf('D:\\Users\\Jay\\Google Drive\\???????????\\???????????\\Reproduce paper\\ch 3 [2010] Banks\\periodic dose\\case %d\\[%d-%d].bmp', case_sel, period, active_days);
drug_print_path = sprintf('D:\\Users\\Jay\\Google Drive\\???????????\\???????????\\Reproduce paper\\ch 3 [2010] Banks\\periodic dose\\case %d\\[%d-%d]-d.bmp', case_sel, period, active_days);

% Cells figure
fig_cells = figure(1);
plot(Cells_out.time,Cells_out.data,'LineWidth',1)

title(sprintf('Period/Active days: [%d/%d]', period, active_days),'fontsize',12)
set(gca,'FontSize',11)
xlabel('Days','fontsize',12)
ylabel('Cells','fontsize',12)

saveas(fig_cells, path, 'fig');
print(fig_cells,'-dbmp',cells_print_path);

% Drug figure
fig_drug = figure(2)
stairs(Drug_out.time,Drug_out.data,'k','LineWidth',1)
ylim([0 1.2])
print(fig_drug,'-dbmp',drug_print_path);

