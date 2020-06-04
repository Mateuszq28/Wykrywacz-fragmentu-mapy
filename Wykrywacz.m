mapa = imread('mapa 2g.png');
mapaCopy = mapa;
test1 = imread('test28.png');
%test2 = imread('test4.png');
test2 = mapa;

test1 = imresize(test1, 0.513);
%imshow(test1)
rozmiar = size(test1)

%test1 = [1 2 3; 4 5 6; 7 8 9]
%test2 = cat(2, test, [0; 0; 0])
%test2 = [1 2 3; 4 5 6; 7 8 9]

rozmA = size(test1)
rozmB = size(test2)

test1 = test1(:,:,1);
test2 = test2(:,:,1);
mapa = mapa(:,:,1);

rozmA = size(test1)
rozmB = size(test2)

okno_X = size(test1, 2);
okno_Y = size(test1, 1);
liczba_test_poziom = size(mapa, 2) - okno_X;
liczba_test_pion = size(mapa, 1) - okno_Y;

MaxCorr = 0;
BestX = 0;
BestY = 0;
for i = 1:5:liczba_test_poziom
   for j = 1:5:liczba_test_pion
       temp = mapa(j:(j+okno_Y-1),i:(i+okno_X-1));
       wynikPor = corr2(temp, test1);
       if (wynikPor >= MaxCorr)
          MaxCorr = wynikPor;
          BestX = i;
          BestY = j;
       end    
   end
end

MaxCorr
BestX
BestY
Najlepszy = mapaCopy(BestY:(BestY+okno_Y-1),BestX:(BestX+okno_X-1),:);
imshow(Najlepszy)
imwrite(Najlepszy, 'wynik.png')