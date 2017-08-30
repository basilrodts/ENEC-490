[data text combined] = xlsread('RNGWHHDm.xls','Data 1');

%call annual profile function
%data returns a 247x2 matrix, need to get it as a vector
data1=data(:,2);
d = annual_profile(data1); 
[months,years] = size(d);

%create new figure
figure; 
hold on;

%plot function within for loop
for i  = 1:years
    plot(d(:,i),'color',rand(1,3));
end

xlabel('Month','FontSize',14);
set(gca, 'XTickLabel',{'Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec'});
set(gca,'XTick',1:1:12);
ylabel('Natural Gas Price ($/MMBtu)','FontSize',14);
legend('2008','2009','2010','2011','2012','2013','2014','2015','2016');

%assignment 
% s takes the value for monthly_stats with data1 as input
s = monthly_stats(data1);

april = s(4,1) + s(4,2)*randn(1000,1);
january = s(1,1) + s(1,2)*randn(1000,1);

%histograms

figure;
bins = -4:0.5:12;
histogram(april,bins);
hold on;
histogram(january,bins);
xlabel({'Natural Gas Price','($/MMBtu)'});
ylabel('Frequency','FontSize',12);
legend('April','January');
%January has a higher mean with less variation in price while April has a lower mean
%but a higher variation in price.  As a result, we see January having a
%higher frequency in the $4 dollar range while April has higher frequencies
%than normal on the tail ends of the histogram. Now can you have a negative
%price?? That would mean you would be paying other people to take the
%natural gas instead of making money on it.

%function [ n ] = monthly_stats( data )
%UNTITLED9 Summary of this function goes here
%   Mean and std of every month from 2008 to present
%n=zeros(12,2);
%idx=133;
%mn=[];
%sd=[];
%for idx=133:144
   % mn=[mn mean(data(idx:12:end))];
   % sd=[sd std(data(idx:12:end))];

%end

%mn=mn';
%sd=sd';
%n=[mn sd];
