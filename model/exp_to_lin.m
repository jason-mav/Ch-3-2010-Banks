x = linspace(0,3);

eq1 = 1-exp(-x);
eq2 = x;

fig1 = figure();
plot (x,eq1,'LineWidth',1)
hold on;
plot (x,eq2,'LineWidth',1)

set(gca,'FontSize',11)
xlabel('u','fontsize',12)
ylabel('f(u)','fontsize',12)
legend('f(u)=1-e^{-u}','f(u)=u');
title('Exponential vs linear drug behaviour', 'fontsize', 12)

saveas(fig1, 'figures\\exp_2_lin', 'fig');
print(fig1,'-dpng', 'figures\\exp_2_lin.png');
