  clc
  clear all
  disp("Generador Tabla Codigo Binario")
  
  input("Numero de Variables?")
  Q = ans;
  if Q > 6
    disp("Numero Maximo es 6 Varibles!")
    return
  endif
  
  % Creacion tabla
  matA = zeros( 2^Q , Q+1 );
  
  % Seleccion tipo de tabla
  input("1)Bin 2)Gray")
  O = ans;
    
  for I = 1:Q             % Contador Columansa MatA.
    
    U = 0;                % Valor inicial escritura de bit, inicia en cero.
    
    if O == 1             % Cuando tabla Binario
      P = 0;                % Valor inicial contador Bits.
      T = 2^( Q - I );      % Tiempo en alto.
    else                  % Cuando tabla Gray
      P = 2 ^ (Q - I );     % Valor inicial contador Bits.
      T = 2 ^ (Q - I + 1);  % Tiempo en alto.
    endif
    
    for J = 1:2^Q         % Contador Filas MatA.
      
      if I == 1             % Cuando es la primera columna
        matA(J,Q+1) = J-1;  % Escribe numero fila en ultima columna.
      endif
      
      P = P + 1;            % Incrementa contador de Bits.
      
      if U                  % Cuando indicador de escritura U es 1
        matA(J,I) = 1;        % Escribe 1 en el elemento.
      endif
      
      if P == T             % Cuando Contador pasos Igual tiempo en alto. 
        P = 0;              % Reinicia contador.
        
        if !U               % Cuando U es Cero
          U = 1;              % Cambia valor U a 1.
        else                % Cuando U es Uno
          U = 0;              % Cambia valor U a 0.
        endif
        
      endif
      
    endfor
  endfor
  
  matA
