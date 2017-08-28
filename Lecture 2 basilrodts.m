[num,txt,raw]= xlsread('EER_EPMRU_PF4_Y35NY_DPGm.xls','Data 1');
matrix=[];
idx=8;
while idx<367
    matrix=[matrix mean(num(idx:idx+11,2))];
    idx=idx+12;
end
matrix=matrix';
dates=[1987:1:2016]';
average=[avg1987 avg1988 avg1989 avg1990 avg1991 avg1992 avg1993 avg1994 avg1995 avg1996 avg1997 avg1998 avg1999 avg2000 avg2001 avg2002 avg2003 avg2004 avg2005 avg2006 avg2007 avg2008 avg2009 avg2010 avg2011 avg2012 avg2013 avg2014 avg2015 avg2016]';
data1=[dates matrix]; %1st column years, 2nd column averages
%xlswrite('monthly_average_price.xls',data);
csvwrite('monthly_average_price.csv',data1); %could not export using excel with mac, MATLAB could not open excel application
