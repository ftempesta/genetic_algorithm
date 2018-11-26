function score = Evaluation(population, n_city)

    [r,c] = size(population);
    score = [];
    average = 0;
    for i=1:r
%       @leap: cuantos bits para cada individuo
        leap = c/n_city;
        the_start = 1;
        the_end = leap;
        tmp = population(i,:);
        solution = [];
        for j=1:n_city
            tmp1 = bi2de(tmp(the_start:the_end));
            the_start = the_start + leap;
            the_end = the_end + leap;
            solution = [solution,tmp1];
        end
%         solution
        F = Cut(solution, n_city)
        score_solution = Fitness(F, n_city)
%         Suma = distan_cityiaRuta(solution,matrizDistan_cityiaLab1, n_city)
%         puntajes = [puntajes;Suma]
        score = [score; score_solution]
    end
    score
end