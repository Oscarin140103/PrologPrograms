% ===============================================
% Autor: Oscar Roberto Lopez Machado
% Fecha: 21 de octubre de 2024
% Descripción: Programa en Prolog que agrupa 
%              duplicados consecutivos de una lista en sublistas.
%              Se incluye una versión comentada en C# para referencia.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
% 
% class Program
% {
%     // Función para agrupar duplicados consecutivos en sublistas en C#.
%     static List<List<T>> Pack<T>(List<T> list)
%     {
%         var result = new List<List<T>>();
%         if (list == null || list.Count == 0)
%             return result; // Retorna una lista vacía si la entrada es nula o vacía.
%         
%         var sublist = new List<T> { list[0] }; // Comienza la sublista con el primer elemento.
% 
%         for (int i = 1; i < list.Count; i++)
%         {
%             if (EqualityComparer<T>.Default.Equals(list[i], list[i - 1]))
%             {
%                 sublist.Add(list[i]); // Agrega el elemento a la sublista si es igual al anterior.
%             }
%             else
%             {
%                 result.Add(sublist); // Guarda la sublista anterior.
%                 sublist = new List<T> { list[i] }; // Comienza una nueva sublista.
%             }
%         }
%         result.Add(sublist); // Agrega la última sublista.
%         return result; // Devuelve la lista de sublistas.
%     }
% 
%     static void Main()
%     {
%         List<char> lista = new List<char> { 'a', 'a', 'b', 'b', 'c', 'a', 'a', 'd' };
%         List<List<char>> listaAgrupada = Pack(lista);
% 
%         Console.WriteLine("Lista agrupada: ");
%         foreach (var sublist in listaAgrupada)
%         {
%             Console.WriteLine("[" + string.Join(", ", sublist) + "]");
%         }
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Predicado pack(List, Packed) que agrupa duplicados consecutivos de la lista List en sublistas Packed.

% Caso base: una lista vacía se agrupa como una lista vacía.
pack([], []).

% Caso recursivo: transfiere todos los elementos consecutivos iguales a una sublista.
pack([X|Xs], [[X|Ys]|Zs]) :- 
    transfer(X, Xs, Ys, Rest), 
    pack(Rest, Zs).

% Transfiere los elementos duplicados consecutivos a una sublista.
transfer(X, [], [], []). % Fin de la transferencia cuando la lista está vacía.
% Si el siguiente elemento es diferente, termina la transferencia.
transfer(X, [Y|Ys], [], [Y|Ys]) :- 
    X \= Y.
% Si el siguiente elemento es igual, agrégalo a la sublista.
transfer(X, [X|Xs], [X|Ys], Rest) :- 
    transfer(X, Xs, Ys, Rest).

% Ejemplo de uso:
% ?- pack([a, a, b, b, c, a, a, d], Packed).
% Packed = [[a, a], [b, b], [c], [a, a], [d]].
% ----------------------------------------------
