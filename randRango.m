function [valor] = randRango(a,b)

r = a + (b-a).*rand(1,1);
valor = floor(r);

end
