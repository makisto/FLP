print_str(A,A):-A1 is (A mod 2),A1 \== 0,writeln(A);!,true.
print_str(A,B):-B=<A,!,fail.
print_str(A,B):-
N1 is (B mod 2),
N1 \== 0,
write(B), write(' '),
N1 is B-1,
print_str(A,N1);
N1 is B-1,
print_str(A,N1).

sum(A,B,A):-A==B,!.
sum(A,B,_):-B=<A,!,fail.
sum(A,B,S):-B1 is B-1,sum(A,B1,S1),S is S1+B.

minimum(N,_):-N<0,N2 is (N * -1),minimum(N2,9).
minimum(N,F):-N=:=0,write(F),!.
minimum(N,F):-
Q is (N mod 10),
N1 is (N div 10),
Q=<F,
F1 is Q,
minimum(N1, F1);
N1 is (N div 10),
minimum(N1, F).

fib(0,0).
fib(1,1).
fib(N,F):-
N>1,
N1 is N-1,
N2 is N-2,
fib(N1,F1),
fib(N2,F2),
F is F1+F2;
N<0,write('Out').
    
lab1:-
writeln('Input A'), read(A),
writeln('Input B'), read(B),
print_str(A,B).

lab2:-
writeln('Input A'), read(A),
writeln('Input B'), read(B),
sum(A,B,S),writeln(S).

lab3:-
writeln('Input N'), read(N),
minimum(N,9).

lab4:-
repeat,
writeln('Input N'), read(N),
fib(N,F), writeln(F),
N<0,!.