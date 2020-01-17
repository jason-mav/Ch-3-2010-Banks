% Data
% System response in the absence of control

function [N,T,I] = getNoControlData()

for i = 1:3 %4
    switch i
        case 1
            filename="N.csv";
        case 2
            filename="T.csv";
        case 3
            filename="I.csv";
        %case 4
        %    filename="M.csv";
    end
    
    data = readtable('D:\Users\Jay\Google Drive\Πολυτεχνειο\Διπλωματική\Reproduce paper\data\no_control\'+filename);
%     data = readtable(filename);
    
    switch i
        case 1
            N=table2array(data);
        case 2
            T=table2array(data);
        case 3
            I=table2array(data);
        %case 4
        %    filename="M.csv";
    end
    
% % % % % % Show the plot
%     X=data{:,1};
%     Y=data{:,2};
%     hold on
%     plot(X,Y)
            
end
%     legend('N','T','I')



%t = [0:length(X)] 
%plot(T,t)

% sol = dsolve('Dx=2*sin(t)-4*x','x(0)=0','t');
% fplot(sol,[0 10])
% xlabel('t'),ylabel('x'), grid




