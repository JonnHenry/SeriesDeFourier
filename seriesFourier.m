close all
clc
syms t n
%Crea variables simbolicas en matlab las cuales pueden ser usadas en su evaluaciï¿½n 
interAnalisCadena = '-1 0 1';

intervaloAnalisis = str2double(split(interAnalisCadena, ' '));

cadenaFuncion = '-1 1';

funcion=str2sym(split(cadenaFuncion, ' '));

periodo=max(intervaloAnalisis)-min(intervaloAnalisis);

frecuencia=2*pi/periodo;

%subs(funcion,valorVariable) Nos permite evaluar una funciï¿½n con la variable respectiva con el valor de valorVariable 

%expr = str2sym('x + 1') str2sym('x + 1') convierte una cadena a una expresion

%diff(funcion) derivada de una funcion
%int(funcion, variable, )

Ao=0;
for i=1:length(funcion)
    Ao=Ao+int(funcion(i),intervaloAnalisis(i),intervaloAnalisis(i+1));
end
%simplify simplificaciï¿½n algebraica de una expresiï¿½n
Ao=simplify(Ao/(periodo));
 
An=0;
for i=1:length(funcion)
    An=An+int(funcion(i)*cos(n*frecuencia*t),'t',intervaloAnalisis(i),intervaloAnalisis(i+1));
end
An=simplify(2*An/periodo);
 
Bn=0;
for i=1:length(funcion)
    Bn=Bn+int(funcion(i)*sin(n*frecuencia*t),'t',intervaloAnalisis(i),intervaloAnalisis(i+1));
end
Bn=simplify(2*Bn/periodo);

disp('Ao')
disp(Ao)
disp('An')
disp(An)
disp('Bn')
disp(Bn)


primerCoeficiente = simplify(An*cos(2*n*pi*t/periodo));
segundoCoeficiente = simplify(Bn*sin(2*n*pi*t/periodo));
 
numArmonicos = 100;

fx = 0;
fsuma =  primerCoeficiente +segundoCoeficiente;

for i=1:numArmonicos+1
    fx = fx + subs(fsuma,{n,t},{i,t});
end
fx = fx + Ao;

evalFuncion = subs(fx,{t},{-10:0.1:10});

plot(-10:0.1:10,evalFuncion); hold on
grid on
xlabel('\bf TIEMPO');
ylabel('\bf AMPLITUD');
title('\bf GRAFICA DE LA FUNCIÓN');

