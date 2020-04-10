readlist(0,[]).
readlist(N,[X|L]):-N>0,
write("������� �����: "),
read(X),
M is N-1,
readlist(M,L).

writelist([]).
writelist([H|T]):-
write(H),write(' '),
writelist(T).

deletelist([ ],_,[ ]).
deletelist([Y|Tail],Y,L):-!,deletelist(Tail,Y,L).
deletelist([Z|Tail],Y,[Z|Tail1]):-deletelist(Tail,Y,Tail1).

read_file(F):-
read_stream_to_codes(F,L),
string_to_list(S,L),
split_string(S,'\n','',L1),
reverse(L1,L2),
write_a_list(L2).

write_a_list([]).
write_a_list([H|T]):-
writeln(H),
write_a_list(T).

goal:-
write("������� ����� ������: "),
read(S),
readlist(S,L1),
write("����� ����� ���� ������?"),
read(K),
deletelist(L1,K,L2),
writeln("�������� ������: "),
writelist(L1),
writeln("\n������������ ������:"),
writelist(L2).

goal1:-
open('file.txt',read,F),
set_input(F),
tell('file1.txt'),
read_file(F),
told,
close(F).