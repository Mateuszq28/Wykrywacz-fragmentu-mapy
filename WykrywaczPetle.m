mapa = imread('mapa 2a.png');
mapa = zeros(size(mapa,1),size(mapa,2),size(mapa,3),1);
mapa(:,:,:,1) = imread('mapa 2a.png');
mapa(:,:,:,2) = imread('mapa 2b.png');
mapa(:,:,:,3) = imread('mapa 2c.png');
mapa(:,:,:,4) = imread('mapa 2d.png');
mapa(:,:,:,5) = imread('mapa 2e.png');
mapa(:,:,:,6) = imread('mapa 2f.png');
mapa(:,:,:,7) = imread('mapa 2g.png');
mapa(:,:,:,8) = imread('mapa 2h.png');
mapa(:,:,:,9) = imread('mapa 2i.png');
mapa(:,:,:,10) = imread('mapa 2j.png');
test1 = imread('test3.png');

test1 = test1(:,:,1);
oknoX = size(test1, 2);
oknoY = size(test1, 1);

BestOfAllX = 0;
BestOfAllY = 0;
MaxCorrAll = 0;
BestMap = 1;
for m = 1:size(mapa,4)
    mapa2D = mapa(:,:,1,m);
    liczba_test_poziom = size(mapa2D, 2) - oknoX;
    liczba_test_pion = size(mapa2D, 1) - oknoY;

    MaxCorr = 0;
    BestX = 0;
    BestY = 0;
    
    for i = 1:20:liczba_test_poziom
        for j = 1:20:liczba_test_pion
            temp = mapa2D(j:(j+oknoY-1),i:(i+oknoX-1));
            wynikPor = corr2(temp, test1);
            if (wynikPor >= MaxCorr)
                MaxCorr = wynikPor;
                BestX = i;
                BestY = j;
                if (wynikPor >= MaxCorrAll)
                    BestOfAllX = i;
                    BestOfAllY = j;
                    MaxCorrAll = wynikPor;
                    BestMap = m;
                end
            end    
        end
    end
end


MaxCorrAll
BestOfAllX
BestOfAllY
Najlepszy = mapa(BestOfAllY:(BestOfAllY+oknoY-1),BestOfAllX:(BestOfAllX+oknoX-1),:,m);
imshow(Najlepszy)