figure;

plot(phik_1(1,:),'b-o')
hold on;

plot(phik_2(1,:),'r-+')
hold on;

plot(phik_3(1,:),'g-x')

title('k=0')
xlabel('t'); legend('\phi (\nu_{inv} = 0.001)', '\phi (\nu_{inv} = 0.1)', '\phi (\nu_{inv} = 10)');
figure;

plot(phik_1(2,:),'b-o')
hold on;

plot(phik_2(2,:),'r-+')
hold on;

plot(phik_3(2,:),'g-x')

title('k=1')
xlabel('t'); legend('\phi (\nu_{inv} = 0.001)', '\phi (\nu_{inv} = 0.1)', '\phi (\nu_{inv} = 10)');

figure;

plot(phik_1(3,:),'b-o')
hold on;

plot(phik_2(3,:),'r-+')
hold on;

plot(phik_3(3,:),'g-x')

title('k=2')
xlabel('t'); legend('\phi (\nu_{inv} = 0.001)', '\phi (\nu_{inv} = 0.1)', '\phi (\nu_{inv} = 10)');

figure;

plot(phik_1(4,:),'b-o')
hold on;

plot(phik_2(4,:),'r-+')
hold on;

plot(phik_3(4,:),'g-x')

title('k=3')
xlabel('t'); legend('\phi (\nu_{inv} = 0.001)', '\phi (\nu_{inv} = 0.1)', '\phi (\nu_{inv} = 10)');