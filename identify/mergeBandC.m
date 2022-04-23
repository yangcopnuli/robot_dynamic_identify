function [C] = mergeBandC(CC,KK)
dq = sym('dq',[6,1]);
assume(dq,'real');
for i=1:6
  Cc(:,i)=CC(:,i).*dq(i);  
end
%�����������ɣ�6X6����ʽ
K1 = [0,0,0,0,0,0]';
K2=KK*[dq(1),0,0,0,0,dq(3),dq(4),dq(5),dq(6),0,0,0,0,0,0]';
K3 = KK*[0,dq(1),0,0,0,0,0,0,0,dq(4),dq(5),dq(6),0,0,0]';
K4 = KK*[0,0,dq(1),0,0,0,0,0,0,0,0,0,dq(5),dq(6),0]';
K5 = KK*[0,0,0,dq(1),0,0,0,0,0,0,0,0,0,0,dq(6)]';
K6 = KK*[0,0,0,0,dq(1),0,0,0,0,0,0,0,0,0,0]';
k=[K1,K2,K3,K4,K5,K6];
%����C��
C = k + Cc;
end