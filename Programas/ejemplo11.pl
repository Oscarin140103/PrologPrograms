% ===============================================
% Autor: Oscar Roberto Lopez Machado
% Fecha: 22 de octubre de 2024
% Descripción: Programa en Prolog que modifica
%              la codificación Run-Length de una lista.
%              Se incluye una versión comentada en Python para referencia.
% ===============================================

% -------- Código en Python (comentado) --------
# Función para codificar la lista con Run-Length en Python.
def encode(lst):
    """Realiza la codificación Run-Length de la lista."""
    packed = pack(lst)  # Agrupa duplicados consecutivos
    return [(len(sublist), sublist[0]) for sublist in packed]

# Función auxiliar para agrupar duplicados consecutivos en sublistas.
def pack(lst):
    """Agrupa duplicados consecutivos en sublistas."""
    if not lst:
        return []
    
    result = []
    sublist = [lst[0]]
    
    for item in lst[1:]:
        if item == sublist[-1]:
            sublist.append(item)
        else:
            result.append(sublist)
            sublist = [item]
    
    result.append(sublist)
    return result

# Modifica la codificación Run-Length.
# Si un elemento no tiene duplicados, se mantiene sin empaquetar.
def encode_modified(lst):
    """Modifica la codificación Run-Length.
       Si un elemento no tiene duplicados, se mantiene sin empaquetar."""
    encoded = encode(lst)
    return [x if n == 1 else (n, x) for n, x in encoded]

# Ejemplo de uso en Python.
if __name__ == "__main__":
    lista = ['a', 'a', 'b', 'b', 'c', 'a', 'a', 'd']
    resultado_modificado = encode_modified(lista)
    
    print("Lista codificada modificada:", resultado_modificado)
# ----------------------------------------------

% -------- Código en Prolog --------------------
% Predicado encode_modified(L, R) que modifica la codificación Run-Length de la lista L.

% Primero codifica la lista usando codificación Run-Length.
encode_modified(L, R) :- 
    encode(L, Enc), 
    modify(Enc, R).

% Codificación Run-Length básica de una lista.
encode(L, R) :- 
    pack(L, P), 
    transform(P, R).

% Agrupa duplicados consecutivos en sublistas.
pack([], []).
pack([X|Xs], [[X|Ys]|Zs]) :- 
    transfer(X, Xs, Ys, Rest), 
    pack(Rest, Zs).

% Transfiere duplicados consecutivos a una sublista.
transfer(X, [], [], []).
transfer(X, [Y|Ys], [], [Y|Ys]) :- 
    X \= Y.
transfer(X, [X|Xs], [X|Ys], Rest) :- 
    transfer(X, Xs, Ys, Rest).

% Transforma sublistas en parejas (N, X).
transform([], []).
transform([[X|Xs]|Ys], [[N,X]|Zs]) :- 
    length([X|Xs], N), 
    transform(Ys, Zs).

% Modifica la codificación: si hay solo un elemento, se mantiene sin empaquetar.
modify([], []).
modify([[1,X]|T], [X|R]) :- modify(T, R).
modify([[N,X]|T], [[N,X]|R]) :- N > 1, modify(T, R).

% Ejemplo de uso:
% ?- encode_modified([a, a, b, b, c, a, a, d], R).
% R = [[2, a], [2, b], c, [2, a], d].
% ----------------------------------------------
