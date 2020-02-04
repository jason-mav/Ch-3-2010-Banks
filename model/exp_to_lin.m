x = linspace(0,1);

f_eq1 = @(x)1-exp(-x);
f_eq2 = @(x)0.735*x;

fig1 = figure();
plot (x,1-exp(-x),'LineWidth',1)
hold on;
plot (x,0.735*x,'LineWidth',1)

set(gca,'FontSize',11)
xlabel('u','fontsize',12)
ylabel('f(u)','fontsize',12)
legend('f(u)=1-e^{-u}','f(u)=u');
title('Exponential vs linear drug behaviour', 'fontsize', 12)

% saveas(fig1, 'figures\\exp_2_lin', 'fig');
% print(fig1,'-dpng', 'figures\\exp_2_lin.png');
integral(@(x)f_eq1(x),0,1)
integral(@(x)f_eq2(x),0,1)