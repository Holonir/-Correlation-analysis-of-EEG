clear all;
close all;
S=load('R3_08.txt');
N=length(S);
Fs=250;
s1=S(1:N,1);
s2=S(1:N,2);
s3=S(1:N,3);
tmax=N/Fs;
T=1/Fs;
t=0:T:tmax-T;

x0=20; 
y0=50;
w0=1800;
h0=900;
figure('position',[x0,y0,w0,h0])
x1=30;
dx=50;
dy=50;
y1=30;
w=651;
h=250;
hAxes11=axes('units','pixels','position',[x1,y1,w/2,h]);
hAxes21=axes('units','pixels','position',[x1+dx+w/2,y1,w,h]);
hAxes31=axes('units','pixels','position',[x1+2*dx+3/2*w,y1,w,h]);
hAxes12=axes('units','pixels','position',[x1,y1+dy+h,w/2,h]);
hAxes22=axes('units','pixels','position',[x1+dx+w/2,y1+dy+h,w,h]);
hAxes32=axes('units','pixels','position',[x1+2*dx+3/2*w,y1+dy+h,w,h]);
hAxes13=axes('units','pixels','position',[x1,y1+2*dy+2*h,w/2,h]);
hAxes23=axes('units','pixels','position',[x1+dx+w/2,y1+2*dy+2*h,w,h]);
hAxes33=axes('units','pixels','position',[x1+2*dx+3/2*w,y1+2*dy+2*h,w,h]);



Amax(1)=max(s1); Amin(1)=min(s1);
Amax(2)=max(s2); Amin(2)=min(s2);
Amax(3)=max(s3); Amin(3)=min(s3);

axes(hAxes11)
plot(t,s1)
set(hAxes11,'YLim',[min(Amin(1)) max(Amax(1))])
hold on

axes(hAxes12)
plot(t,s2)
set(hAxes12,'YLim',[min(Amin(2)) max(Amax(2))])
hold on

axes(hAxes13)
plot(t,s3)
set(hAxes13,'YLim',[min(Amin(3)) max(Amax(3))])
hold on

axes(hAxes21)
tcf=-tmax+T:T:tmax-T;
acf1=xcorr(s1,'coeff');
hold on
plot(tcf,acf1)

axes(hAxes22)
tcf=-tmax+T:T:tmax-T;
acf2=xcorr(s2,'coeff');
hold on
plot(tcf,acf2)

axes(hAxes23)
tcf=-tmax+T:T:tmax-T;
acf3=xcorr(s3,'coeff');
hold on
plot(tcf,acf3)

axes(hAxes31)
ccf12=xcorr(s1,s2,'coeff');
plot(tcf,ccf12)
set(hAxes31,'YLim',[-1 +1])

axes(hAxes32)
ccf23=xcorr(s2,s3,'coeff');
plot(tcf,ccf23)
set(hAxes32,'YLim',[-1 +1])

axes(hAxes33)
ccf13=xcorr(s1,s3,'coeff');
plot(tcf,ccf13)
set(hAxes33,'YLim',[-1 +1])