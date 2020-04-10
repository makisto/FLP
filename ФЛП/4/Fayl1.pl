% �����:���-��
% ����: �����-��

parent("����","���").
parent("����","���").
parent("����","���").
parent("���","���").
parent("���","����").
parent("���","���").
parent("����","���").

female("����").
female("���").
female("���").
female("���").

male("����").
male("���").
male("����").
male("���").

father(X,Y):-parent(X,Y),male(X).
mother(X,Y):-parent(X,Y),female(X).
brother(X,Y):-male(X),X\==Y,parent(Z,X),parent(Z,Y).
sister(X,Y):-female(X),X\==Y,parent(Z,X),parent(Z,Y).
grandson(X,Y):-male(X),X\==Y,parent(Y,Z),parent(Z,X).
aunt(X,Y):-sister(X,Z),parent(Z,Y).
twochild(X):-parent(X,Y),parent(X,Z).
growth(X):-male(X),parent(X,Y),male(Y).