split(M,K,[Head|Tail],[Head|L1],L2,L3):-Head@<M,!,split(M,K,Tail,L1,L2,L3).
split(M,K,[Head|Tail],L1,L2,[Head|L3]):-Head@>K,!,split(M,K,Tail,L1,L2,L3).
split(M,K,[Head|Tail],L1,[Head|L2],L3):-split(M,K,Tail,L1,L2,L3).
split(_,_,[ ],[ ],[ ],[ ]).

max_val(Ret,[Head|Tail]):-max_val(Ret,Head,Tail),true.
max_val(Ret,X,[Head|Tail]):-X@<Head,!,max_val(Ret,Head,Tail).
max_val(Ret,X,[_|Tail]):-max_val(Ret,X,Tail).
max_val(Ret,X,[]):-Ret is X.

pos(List,List_pos):-max_val(Max, List),pos(Max,1,List,List_pos).
pos(Max,Pos,[Head|Tail],[Pos_r|List_pos]):-Pos_r is Pos,Head==Max,!,pos(Max,Pos+1,Tail,List_pos).
pos(Max,Pos,[_|Tail],List_pos):-pos(Max,Pos+1,Tail,List_pos).
pos(_,_,[ ],[ ]).

pu_sort(L,Sort_list):-swap(L,L1),!,pu_sort(L1,Sort_list).
pu_sort(L,L).
swap([X,Y|Tail],[Y,X|Tail]):-X@>Y.
swap([X|Tail],[X|Tail1]):-swap(Tail,Tail1).

elems(L1):-pu_sort(L1,SQ2),search(SQ2,SQ2,0,0).
elems([H|T]):-T==[],write(H),!.

search([H,Z|T],SQ2,N,P):-N1 is N+1,H==Z,T\==[],search([Z|T],SQ2,N1,P).
search([H,Z|T],SQ2,N,P):-H==Z,T==[],N1 is N+2,N1>=P,!,count(SQ2,N1,0).
search([H,Z|T],SQ2,N,P):-H==Z,T==[],N1 is N+2,N1<P,!,count(SQ2,P,0).
search([H,Z|T],SQ2,N,P):-N1 is N+1,H\==Z,T\==[],N1>=P,P1 is N1,search([Z|T],SQ2,0,P1).
search([H,Z|T],SQ2,N,P):-N1 is N+1,H\==Z,T\==[],N1<P,search([Z|T],SQ2,0,P).
search([H,Z|T],SQ2,N,P):-N1 is N+1,H\==Z,T==[],N1>=P,!,count(SQ2,N1,0).
search([H,Z|T],SQ2,N,P):-N1 is N+1,H\==Z,T==[],N1<P,!,count(SQ2,P,0).

count([],_,_).
count([H,Z|T],P,_):-P==1,T\==[],write(H),write(' '),count([Z|T],P,0).
count([H,Z|T],P,_):-P==1,T==[],write(H),write(' '),write(Z),count([Z|T],P,0).

count([H,Z|T],P,N):-P>1,N1 is N+1,H==Z,count([Z|T],P,N1).
count([H,Z|T],P,N):-P>1,N1 is N+1,H\==Z,N1==P,write(H),write(' '),count([Z|T],P,0).
count([H,Z|T],P,N):-P>1,N1 is N+1,H\==Z,N1\==P,count([Z|T],P,0).
count([H,Z|T],P,N):-P>1,T==[],H==Z,N1 is N+2,N1==P,write(H),count([Z|T],P,0).

%elems(S,SQ2):-elems(S,[],SQ),pu_sort(SQ,SQ1),reverse(SQ1,SQ2).
%elems([],SQ,SQ).
%elems([H|T],SQ0,SQ):-select1([N,H],SQ0,SQ1),N1 is N+1,!,elems(T,[[N1,H]|SQ1],SQ).
%elems([H|T],SQ0,SQ):-elems(T,[[1,H]|SQ0],SQ).

%select1(X,[X|Tail],Tail).
%select1(Elem,[Head|Tail],[Head|Rest]):-select1(Elem,Tail,Rest).