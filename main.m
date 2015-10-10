%%画出各个mt函数图像
%%各个版本的G-O模型

% AMQ G-O DDS Li参数
clear all;
a = [497.8, 429.8, 208, 717.9, 351.8];
b = [0.002, 0.002, 0.013, 0.004, 0.003];
a_DDS = [295, 110.8, 187.8, 265.6, 1849.1];
b_DDS = [0.009, 0.026, 0.035, 0.034, 0.005];
a_Li = [257.4, 90.5, 287.2, 291.5, 724.5];
N_Li = [4.862, 3.622, 0.971, 1.248, 0.41];
A_Li = [1641.27, 593.226, 205.625, 177.079, 640.257];
afa_Li = [0.032, 0.09, 0.097, 0.113, 0.095];

% AMQ 变点模型 参数5.3.0 - 5.11.0
controlChart_t1 = [168, 54, 36, 17, 46];
controlChart_t2 = [198, 61, 56, 47];
controlChart_a = [255, 89.4, 186, 229.6, 2692];
controlChart_b1 = [0.005, 0.018, 0.015, 0.008, 0.003];
controlChart_b2 = [0.077, 0.245, 0.089, 0.061, 0.002];
controlChart_b3 = [0.05, 0.072, 0.031, 0.04];

publishTime_t1 = [171, 52, 35, 24, 45];
publishTime_t2 = [194, 57, 57, 48];
publishTime_a = [256, 89.1, 185.9, 229.8, 1686];
publishTime_b1 = [0.005, 0.016, 0.014, 0.016, 0.004];
publishTime_b2 = [0.084, 0.183, 0.086, 0.073, 0.003];
publishTime_b3 = [0.04, 0.1, 0.031, 0.038];

clusterAlgor_t1 = [153, 53, 47, 32, 33];
clusterAlgor_t2 = [203, 72, 96, 56];
clusterAlgor_a = [256, 89.4, 184.3, 221.1, 440];
clusterAlgor_b1 = [0.003, 0.018, 0.028, 0.029, 0.008];
clusterAlgor_b2 = [0.051, 0.177, 0.062, 0.077, 0.005];
clusterAlgor_b3 = [0.06, 0.063, 0.053, 0.052];

waveletAnalysis_t1 = [161, 49, 33, 25, 33];
waveletAnalysis_t2 = [193, 65, 49, 33];
waveletAnalysis_a = [255, 89.9, 184.6, 225.3, 440];
waveletAnalysis_b1 = [0.004, 0.014, 0.012, 0.018, 0.008];
waveletAnalysis_b2 = [0.059, 0.141, 0.075, 0.077, 0.005];
waveletAnalysis_b3 = [0.063, 0.059, 0.044, 0.044];

filename=['AMQ 5.3.0.xlsx'; 'AMQ 5.4.0.xlsx'; 'AMQ 5.6.0.xlsx'; 'AMQ 5.9.0.xlsx'; 'AMQ5.11.0.xlsx'];
datetype='week';

for i = 1: 5
    [ltmp,nt]=getFindDate(filename(i,:),datetype);
    l(i,1)=ltmp;
    for j = 1:l(i,1)
        t(j,i)=j;
    end
    Nt(1:l(i,1),i)=nt;
end


% get ft
for i = 1: 5
    [GOtmp]=getGOft(b(1,i),t(:,i),l(i,1));
    GO(1:l(i,1),i)=GOtmp(:,1);
%     figure;
%     plot(GO,'r-');
%     title(['go-',num2str(i)]);
    
    [DDStmp]=getDDSft(b_DDS(1,i),t(:,i),l(i,1));
    DDS(1:l(i,1),i)=DDStmp(:,1);
%     figure;
%     plot(DDS,'r-');
%     title(['dds-',num2str(i)]);
    
    [Litmp]=getLift(N_Li(1,i),A_Li(1,i),afa_Li(1,i),t(:,i),l(i,1));
    Li(1:l(i,1),i)=Litmp(:,1);
%     figure;
%     plot(Li,'r-');
%     title(['Li-',num2str(i)]);
    
end

for i = 1:4
    [CCPtmp,FCCPtmp]=get2CPft(controlChart_b1(1, i),controlChart_b2(1, i),controlChart_b3(1, i),controlChart_t1(1, i),controlChart_t2(1, i),t(:,i),l(i,1));
    CCP(1:l(i,1),i)=CCPtmp(:,1);
    FCCP(1:l(i,1),i)=FCCPtmp(:,1);
%     figure;
%     plot(CCP,'r-');
%     title(['ccp-',num2str(i)]);
    
    [PTPtmp,FPTPtmp]=get2CPft(publishTime_b1(1, i),publishTime_b2(1, i),publishTime_b3(1, i),publishTime_t1(1, i),publishTime_t2(1, i),t(:,i),l(i,1));
    PTP(1:l(i,1),i)=PTPtmp(:,1);
    FPTP(1:l(i,1),i)=FPTPtmp(:,1);
%     figure;
%     plot(PTP,'r-');
%     title(['ptp-',num2str(i)]);
    
    [CAPtmp,FCAPtmp]=get2CPft(clusterAlgor_b1(1, i),clusterAlgor_b2(1, i),clusterAlgor_b3(1, i),clusterAlgor_t1(1, i),clusterAlgor_t2(1, i),t(:,i),l(i,1));
    CAP(1:l(i,1),i)=CAPtmp(:,1);
    FCAP(1:l(i,1),i)=FCAPtmp(:,1);
%     figure;
%     plot(CAP,'r-');
%     title(['cap-',num2str(i)]);
    [WAPtmp,FWAPtmp]=get2CPft(waveletAnalysis_b1(1, i),waveletAnalysis_b2(1, i),waveletAnalysis_b3(1, i),waveletAnalysis_t1(1, i),waveletAnalysis_t2(1, i),t(:,i),l(i,1));
    WAP(1:l(i,1),i)=WAPtmp(:,1);
    FWAP(1:l(i,1),i)=FWAPtmp(:,1);
%     figure;
%     plot(WAP,'r-');
%     title(['wap-',num2str(i)]);
    
end
i=5;
[CCPtmp,FCCPtmp]=getCPft(controlChart_b1(1, i),controlChart_b2(1, i),controlChart_t1(1, i),t(:,i),l(i,1));
CCP(1:l(i,1),i)=CCPtmp(:,1);
FCCP(1:l(i,1),i)=FCCPtmp(:,1);
clear CCPtmp
clear FCCPtmp

[PTPtmp,FPTPtmp]=getCPft(publishTime_b1(1, i),publishTime_b2(1, i),publishTime_t1(1, i),t(:,i),l(i,1));
PTP(1:l(i,1),i)=PTPtmp(:,1);
FPTP(1:l(i,1),i)=FPTPtmp(:,1);
clear PTPtmp
clear FPTPtmp

[CAPtmp,FCAPtmp]=getCPft(clusterAlgor_b1(1, i),clusterAlgor_b2(1, i),clusterAlgor_t1(1, i),t(:,i),l(i,1));
CAP(1:l(i,1),i)=CAPtmp(:,1);
FCAP(1:l(i,1),i)=FCAPtmp(:,1);
clear CAPtmp
clear FCAPtmp

[WAPtmp,FWAPtmp]=getCPft(waveletAnalysis_b1(1, i),waveletAnalysis_b2(1, i),waveletAnalysis_t1(1, i),t(:,i),l(i,1));
WAP(1:l(i,1),i)=WAPtmp(:,1);
FWAP(1:l(i,1),i)=FWAPtmp(:,1);
clear WAPtmp
clear FWAPtmp


%%%draw plr
for i = 1:5
    DrawPLR('CCP','G-O',CCP(:,i),GO(:,i),l(i,1),i);
    DrawPLR('CCP','DDS',CCP(:,i),DDS(:,i),l(i,1),i);
    DrawPLR('CCP','Li',CCP(:,i),Li(:,i),l(i,1),i);
    
    DrawPLR('PTP','G-O',PTP(:,i),GO(:,i),l(i,1),i);
    DrawPLR('PTP','DDS',PTP(:,i),DDS(:,i),l(i,1),i);
    
    DrawPLR('PTP','Li',PTP(:,i),Li(:,i),l(i,1),i);
    
    DrawPLR('CAP','G-O',CAP(:,i),GO(:,i),l(i,1),i);
    DrawPLR('CAP','DDS',CAP(:,i),DDS(:,i),l(i,1),i);
    DrawPLR('CAP','Li',CAP(:,i),Li(:,i),l(i,1),i);
    
    DrawPLR('WAP','G-O',WAP(:,i),GO(:,i),l(i,1),i);
    DrawPLR('WAP','DDS',WAP(:,i),DDS(:,i),l(i,1),i);
    DrawPLR('WAP','Li',WAP(:,i),Li(:,i),l(i,1),i);
end
% 
% 
% 
% 
%%%draw U
for i = 1:5
    len=l(i,1);
    DrawU(Nt(1:len,i),FCCP(1:len,i),'CCP',len,i);
    DrawU(Nt(1:len,i),FPTP(1:len,i),'PTP',len,i);
    DrawU(Nt(1:len,i),FCAP(1:len,i),'CAP',len,i);
    DrawU(Nt(1:len,i),FWAP(1:len,i),'WAP',len,i);
end