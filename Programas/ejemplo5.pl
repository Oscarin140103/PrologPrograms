% ===============================================
% Autor: Oscar Roberto Lopez Machado
% Fecha: 21 de octubre de 2024
% Descripción: Programa en Prolog que invierte una lista.
%              Se utiliza un acumulador para construir la lista invertida.
%              Se incluye una versión comentada en C# para referencia.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
% 
% class Program
% {
%     // Función para invertir una lista en C#.
%     static List<T> ReverseList<T>(List<T> list)
%     {
%         if (list == null)
%             throw new ArgumentException("La lista no puede ser nula.");
%         
%         List<T> reversedList = new List<T>(list);
%         reversedList.Reverse(); // Usa el método integrado para invertir la lista.
%         
%         return reversedList; // Devuelve la lista invertida.
%     }
% 
%     static void Main()
%     {
%         List<char> lista = new List<char> { 'a', 'b', 'c', 'd' };
%         List<char> listaInvertida = ReverseList(lista);
% 
%         Console.WriteLine("La lista invertida es: " + string.Join(", ", listaInvertida));
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Predicado reverse_list(L, R) que invierte la lista L y devuelve 
% la lista invertida R. Usa un acumulador para construir la lista invertida.

% Predicado principal que inicializa el acumulador.
reverse_list(L, R) :- 
    reverse_list(L, [], R).

% Caso base: cuando la lista original está vacía, el acumulador contiene la lista invertida.
reverse_list([], Acc, Acc).

% Caso recursivo: mueve el elemento de la cabeza al acumulador y continúa con la cola.
reverse_list([H|T], Acc, R) :- 
    reverse_list(T, [H|Acc], R).

% Ejemplo de uso:
% ?- reverse_list([a, b, c, d], R).
% R = [d, c, b, a].
% ----------------------------------------------

% Predicado main para ejecutar el programa
main :-
    List = [a, b, c, d],
    reverse_list(List, R),
    format('La lista invertida es: ~w~n', [R]),
    halt.

