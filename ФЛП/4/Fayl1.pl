% Автор:кто-то
% Дата: какая-то

parent("Джон","Боб").
parent("Мэри","Боб").
parent("Мэри","Энн").
parent("Боб","Лиз").
parent("Боб","Паул").
parent("Боб","Сэм").
parent("Паул","Пат").

female("Мэри").
female("Лиз").
female("Энн").
female("Пат").

male("Джон").
male("Боб").
male("Паул").
male("Сэм").

father(X,Y):-parent(X,Y),male(X).
mother(X,Y):-parent(X,Y),female(X).
brother(X,Y):-male(X),X\==Y,parent(Z,X),parent(Z,Y).
sister(X,Y):-female(X),X\==Y,parent(Z,X),parent(Z,Y).
grandson(X,Y):-male(X),X\==Y,parent(Y,Z),parent(Z,X).
aunt(X,Y):-sister(X,Z),parent(Z,Y).
twochild(X):-parent(X,Y),parent(X,Z).
growth(X):-male(X),parent(X,Y),male(Y).