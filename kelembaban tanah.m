%inputx1
%permintaan
%turun
%derajad keanggotaan, rumus dan nilai keanggotaan
for x=1:10000
    if (x<1000)
          y(x)=1;
    elseif (x>=1000) & (x<=5000)
          y(x)=(5000-x)/4000;
    else  y(x)=0;
    end
end

%naik
for x1=1:10000
    if (x1>5000)
          y1(x1)=1;
    elseif (x1>=1000) & (x1<=5000)
          y1(x1)=(x1-1000)/4000;
    else  y1(x1)=0;
    end
end
subplot(311)
x=[1:1:10000];
x1=[1:1:10000];
plot(x,y(x),'-r')
hold on
plot(x1,y1(x1),'-g')
hold off
title('permintaan turun naik')
legend('turun','naik')

%inputx2
%persediaan
%sedikit
for x2=1:1000
    if (x2<100)
          y2(x2)=1;
    elseif (x2>=100) & (x2<=600)
          y2(x2)=(600-x2)/500;
    else  y2(x2)=0;
    end
end

%banyak
for x3=1:1000
    if (x3>600)
          y3(x3)=1;
    elseif (x3>=100) & (x3<=600)
          y3(x3)=(x3-100)/500;
    else  y3(x3)=0;
    end
end
subplot(312)
x2=[1:1:1000];
x3=[1:1:1000];
plot(x2,y2(x2),'-r')
hold on
plot(x3,y3(x3),'-g')
hold off
title('persediaan sedikit banyak')


%output z
%produksi
%berkurang
for a=1:10000
    if (a<2000)
          z1(a)=1;
    elseif (a>=2000) & (a<=7000)
          z1(a)=(7000-a)/5000;
    else  z1(a)=0;
    end
end

%bertambah
for b=1:10000
    if (b>7000)
          z2(b)=1;
    elseif (b>=2000) & (b<=7000)
          z2(b)=(b-2000)/5000;
    else  z2(b)=0;
    end
end
subplot(313)
a=[1:1:10000];
b=[1:1:10000];
plot(a,z1(a),'-r')
hold on
plot(b,z2(b),'-g')
hold off
title('produksi berkurang bertambah')

%--------------------------------------------
% nilai keanggotaan
%--------------------------------------------
permintaan1=input('nilai permintaan yang diinginkan= ')
persediaan1=input('nilai persediaan yang diinginkan= ')

miu_permintaan_turun=(5000-permintaan1)/4000
miu_permintaan_naik=(permintaan1-1000)/4000

miu_persediaan_sedikit=(600-persediaan1)/500
miu_persediaan_banyak=(persediaan1-100)/500

%-------------------------------------------
%rule
%---------------------------------------------
%rule1, jika permintaan turun dan persediaan banyak maka produksi berkurang
alpha1=min(miu_permintaan_turun,miu_persediaan_banyak)
%rule2, jika permintaan turun dan persediaan sedkit maka produksi berkurang
alpha2=min(miu_permintaan_turun,miu_persediaan_sedikit)
%rule3, jika permintaan naik dan persediaan banyak maka produksi bertambah
alpha3=min(miu_permintaan_naik,miu_persediaan_banyak)
%rule3, jika permintaan naik dan persediaan sedikit maka produksi bertambah
alpha4=min(miu_permintaan_naik,miu_persediaan_sedikit)

%-----------------------------------------------
%nilai Z
%-------------------------------------------------------
out_z1=7000-(alpha1*5000)
out_z2=7000-(alpha2*5000)
out_z3=(alpha3*5000)+2000
out_z4=(alpha4*5000)+2000

%------------------------------------------------------
%nilai Ztotal
%--------------------------------------------------------
ztot=((alpha1*out_z1)+(alpha2*out_z2)+(alpha3*out_z3)+(alpha4*out_z4))/(alpha1+alpha2+alpha3+alpha4)








