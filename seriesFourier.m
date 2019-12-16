
function seriesFourier(cantidadArmonicos)
    clc
    syms t n
    hold on
    intervaloAnalisis = [-1 0 1];
    x=min(intervaloAnalisis):0.01:max(intervaloAnalisis);
    evalFunIngreso = subs(t,{t},{x});
    plot(x,evalFunIngreso,'r');
    Ck=exp(pi*n*t*1i)*((exp(-pi*n*1i)*(pi*n*1i + 1))/(2*n^2*pi^2) + (exp(pi*n*1i)*(pi*n*1i - 1))/(2*n^2*pi^2));
    numArmonicos = round(cantidadArmonicos/2);
    fx = 0;               
    for i=-numArmonicos:numArmonicos
        if (i>0) || (i<0)
            fx = fx + subs(Ck,{n,t},{i,t});
        end
    end
    z=-6:0.01:6;
    evalFuncion = subs(fx,{t},{z});
    plot(z,evalFuncion, 'b');
    title(sprintf('Aproximación de Fourier: %i términos',cantidadArmonicos))
    grid on
    xlabel('t'); 
    ylabel('f(t)')
    hold off
end


