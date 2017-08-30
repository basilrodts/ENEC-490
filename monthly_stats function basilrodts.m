function [ n ] = monthly_stats( data )
%UNTITLED9 Summary of this function goes here
%   Detailed explanation goes here
n=zeros(12,2);
idx=133;
mn=[];
sd=[];
for idx=133:144
    mn=[mn mean(data(idx:12:end))];
    sd=[sd std(data(idx:12:end))];

end

mn=mn';
sd=sd';
n=[mn sd];
