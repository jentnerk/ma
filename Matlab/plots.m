
% shift serializer and tree serializer: area plot
figure
plot(shift_area(:,1),shift_area(:,2),'*',tree_area(:,1),tree_area(:,2),'*')
legend('shift serializer', 'tree serializer');
xlabel('n');
ylabel('area in [GE]');
title('Area vs n (# of input bits)');

% shift serializer and tree serializer: power plot
figure
plot(shift_power(:,1),shift_power(:,2),'*',tree_power(:,1),tree_power(:,2),'*')
legend('shift serializer', 'tree serializer');
title('Power vs n (# of input bits)');
xlabel('n');
ylabel('power in [mW]');