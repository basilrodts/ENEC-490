[num,txt,raw]= xlsread('EER_EPMRU_PF4_Y35NY_DPGm.xls','Data 1'); %read excel file
avg1987=mean(num(8:19,2)); %there is an easier way to do this I'm sure, having a hard time figuring out how to simplify.
avg1988=mean(num(20:31,2));
avg1989=mean(num(32:43,2));
avg1990=mean(num(44:55,2));
avg1991=mean(num(56:67,2));
avg1992=mean(num(68:79,2));
avg1993=mean(num(80:91,2));
avg1994=mean(num(92:103,2));
avg1995=mean(num(104:115,2));
avg1996=mean(num(116:127,2));
avg1997=mean(num(128:139,2));
avg1998=mean(num(140:151,2));
avg1999=mean(num(152:163,2));
avg2000=mean(num(164:175,2));
avg2001=mean(num(176:187,2));
avg2002=mean(num(188:199,2));
avg2003=mean(num(200:211,2));
avg2004=mean(num(212:223,2));
avg2005=mean(num(224:235,2));
avg2006=mean(num(236:247,2));
avg2007=mean(num(248:259,2));
avg2008=mean(num(260:271,2));
avg2009=mean(num(272:283,2));
avg2010=mean(num(284:295,2));
avg2011=mean(num(296:307,2));
avg2012=mean(num(308:319,2));
avg2013=mean(num(320:331,2));
avg2014=mean(num(332:343,2));
avg2015=mean(num(344:355,2));
avg2016=mean(num(356:367,2));
dates=[1987:1:2016]';
average=[avg1987 avg1988 avg1989 avg1990 avg1991 avg1992 avg1993 avg1994 avg1995 avg1996 avg1997 avg1998 avg1999 avg2000 avg2001 avg2002 avg2003 avg2004 avg2005 avg2006 avg2007 avg2008 avg2009 avg2010 avg2011 avg2012 avg2013 avg2014 avg2015 avg2016]';
data=[dates average]; %1st column years, 2nd column averages
csvwrite('monthly_average_price.csv',data); %could not export using excel with mac, MATLAB could not open excel application

  %addtional notes
