%% setup and reading values from repfiles
clear all
hold off

%set some constants
GE=1.44;
tunit='ns';

%give the path to the current folder
rptdir = '~/ma/synopsys/reports/';

%make sure this corresponds with the timing constraints 
%in the compile script
time=[2.5 2.4 2.3 2.2 2.1 2.0 1.9 1.8 1.7 1.6 1.5 1.4 1.3 1.2 1.1 1.0];
linspace_time = linspace(0.9,2.6,20);

% call bash script to grep out the values from the reports
!./getValues.sh

%read the values
file = fopen([rptdir '/' 'shift_serializer_at_values.dat']);
shift_serializer_getValues=fscanf(file,'%e');
fclose(file);


%convert clock/slack/area to a and t vectors
shift_serializer = reshape(div2_getValues,3,[]);

% shift_serializer has now the following Matrix-form:
% [Clock_1     Clock_2     Clock_3 ...]
% [Slack_1     Slack_2     Slack_3 ...]
% [Area_1      Area_2      Area_3  ...]


%subtract slack from clock to get the longest path
AT_shift_serializer = [shift_serializer(3,:);shift_serializer(1,:)- shift_serializer(2,:)];

% results in a Matrix as:
% [area_1               area_2                area_3           ...]
% [longest_path_1       longest_path_2        longest_path_3   ...]


%sort by time
[AT_shift_serializer(2,:),idx] = sort(AT_shift_serializer(2,:)); % sort time
AT_shift_serializer(1,:) = AT_shift_serializer(1,idx)./GE/1000; % apply shuffle to area, compute kGE



%% plot AT-Plot of all Architectures
shift_serializer = plot(AT_shift_serializer(2,:),AT_shift_serializer(1,:),'linestyle','--', 'marker','d','linewidth',2,'markeredgecolor','k');
hold on

%plotATconstants
hold on
plot(linspace_time, 8./linspace_time, 'Color', [0.7,0.7,0.7], 'Linewidth', 0.3)
hold on
plot(linspace_time, 18./linspace_time, 'Color', [0.7,0.7,0.7], 'Linewidth', 0.3)
hold on
plot(linspace_time, 22./linspace_time, 'Color', [0.7,0.7,0.7], 'Linewidth', 0.3)
%label the curves
legend('shift_serializer', 'AT = const.');
%limit the x-axis
xlim([0.9 2.6])
ylim([0 24])
%setting for plot
grid on;
box on;
xlabel(strcat('T [',tunit,']'));
ylabel('A [kGE]');
title('AT plot');
