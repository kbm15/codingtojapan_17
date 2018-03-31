%% Hours and values
%With this we get the values to create a simulation of the irradiance
%during the day
ajune=60*6+29;
amarch=60*7+27;
adecember=60*8+27;
starth=[ajune amarch adecember]

bjune=60*21+41;
bmarch=60*19+2;
bdecember=60*17+36;
stoph=[bjune bmarch bdecember]


hours=stoph-starth;

%% Vector generator
meanj=7900*0.1764;
meanm=4600*0.1764;
meand=1700*0.1764;
t=0:0.000001:1.439;

june=dayvalues(hours(1),meanj);
march=dayvalues(hours(2),meanm);
december=dayvalues(hours(3),meand);

%we generate a day, first goes zeros until dawn, the values calculated from
%the mean value and then zeros from dusk till 23.59
june=[zeros(1,starth(1)*1000), june, zeros(1,(1440-stoph(1))*1000)]';
march=[zeros(1,starth(2)*1000), march, zeros(1,(1440-stoph(2))*1000)]';
december=[zeros(1,starth(3)*1000), december, zeros(1,(1440-stoph(3))*1000)]';


%now we add the time column
june = timeseries(june, t');
march = timeseries(march, t');
december = timeseries(december, t');

%% mean of the day
volt=mean(simout.signals.values(:,1));
amp=mean(simout.signals.values(:,2));
power=volt*amp
day=power*24