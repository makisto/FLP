readlist(0,[]).
readlist(N,[X|L]):-N>0,
write("Введите число: "),
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
write("Введите длину списка: "),
read(S),
readlist(S,L1),
write("Какое число надо убрать?"),
read(K),
deletelist(L1,K,L2),
writeln("Исходный список: "),
writelist(L1),
writeln("\nОбработанный список:"),
writelist(L2).

goal1:-
open('file.txt',read,F),
set_input(F),
tell('file1.txt'),
read_file(F),
told,
close(F).