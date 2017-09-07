%Lecture 5

%Read 2015 electricity demand data
data = csvread('hourly-day-ahead-bid-data-2015.csv',5,1);
vector = mat2vec(data);

%Read 2014 electricity demand data
bizarre_data = csvread('bizarre_data.csv');

%Pre-process Data
processed_data = pre_processor(bizarre_data);

candidates = find(processed_data > 130000);
index = candidates(find(candidates>7000));
day = floor(index/24);
hour = index - day*24;
answer = [day hour];

%histogram
figure;
histogram(processed_data,100); 
xlabel('Demand (MWh)','FontSize', 14)
ylabel('Frequency','FontSize', 14)
title('Pre-processed 2014 Data', 'FontSize',14)

%qqplot
figure; 
qqplot(processed_data); 
xlabel('Theoretical Normal Quantiles','FontSize',14)
ylabel('Empirical Data Normal Quantiles','FontSize',14)
title('QQ Plot of Pre-Processed Demand Data','FontSize',14)

%log transformation
transformed_data = log(processed_data); 

%histogram
figure; 
histogram(transformed_data,100); 
xlabel('log-Demand (MWh)','FontSize', 14)
ylabel('Frequency','FontSize', 14)
title('Log-Transformed 2014 Data', 'FontSize',14)


%qqplot
figure;
qqplot(transformed_data);
xlabel('Theoretical Normal Quantiles','FontSize',14)
ylabel('Empirical Data Normal Quantiles','FontSize',14)
title('QQ Plot of Log-Transformed Demand Data','FontSize',14)

%mean
mu = mean(processed_data); 
dev = std(processed_data); 

%number of standard deviations weird point is away from mean
number_stds = (processed_data(index) - mu)/dev;

%standard deviations with incremental 500 bins


bin=500;
outliers=[];
outliersvalue=[];
for idx=250:length(processed_data)-250
    mn=mean(processed_data(idx-249:1:idx+250));
    sd=std(processed_data(idx-249:1:idx+250));
    nmb_sd=(processed_data(idx)-mn)/sd;
    if nmb_sd>3
        outliers=[outliers idx];
        outliersvalue=[outliersvalue processed_data(idx)];
    end
end

together=[outliers; outliersvalue]';


%peak electricity demand

peak = [];
for idx = 1:24:length(processed_data)
    maximum = max(processed_data(idx+23));
    peak = [peak maximum];
end
peak=peak';

tempdata=csvread('tempdata.csv'); %read temperature
figure;
a=peak(:,1)./10^3;%reduce magnitude for graphical purposes, include in legend
scatter((1:1:365)',a); %scatter for peak
hold on;
scatter((1:1:365)',tempdata(:,2)); %scatter for temp
xlabel('Time in Days');
legend('Peak Electricity (10^-3)', 'Temperature (F)');
