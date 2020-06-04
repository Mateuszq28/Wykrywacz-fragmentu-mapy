mapa = imread('mapa 2a.png');
mapa = zeros(size(mapa,1),size(mapa,2),size(mapa,3),12);
%mapa(:,:,:,1) = imread('mapa 2a.png');
%mapa(:,:,:,2) = imread('mapa 2b.png');
%mapa(:,:,:,3) = imread('mapa 2c.png');
%mapa(:,:,:,4) = imread('mapa 2d.png');
%mapa(:,:,:,5) = imread('mapa 2e.png');
%mapa(:,:,:,6) = imread('mapa 2f.png');
%mapa(:,:,:,7) = imread('mapa 2g.png');
%mapa(:,:,:,8) = imread('mapa 2h.png');
%mapa(:,:,:,9) = imread('mapa 2i.png');
%mapa(:,:,:,10) = imread('mapa 2j.png');
test1 = imread('test32.png');

test1 = imresize(test1, 0.513);
%imshow(test1)
rozmiar = size(test1)

test1 = test1(:,:,1);
oknoX = size(test1, 2);
oknoY = size(test1, 1);

BestOfAllX = 0;
BestOfAllY = 0;
MaxCorrAll = 0;
BestMap = 1;
%for m = 1:size(mapa,4)
for m = 1:16
    
    switch m
        case 1
            mapa2D = imread('mapa 2a.png');
        case 2
            mapa2D = imread('mapa 2b.png');
        case 3
            mapa2D = imread('mapa 2c.png');
        case 4
            mapa2D = imread('mapa 2d.png');
        case 5
            mapa2D = imread('mapa 2e.png');
        case 6
            mapa2D = imread('mapa 2f.png');
        case 7
            mapa2D = imread('mapa 2g.png');
        case 8
            mapa2D = imread('mapa 2h.png');
        case 9
            mapa2D = imread('mapa 2i.png');
        case 10
            mapa2D = imread('mapa 2j.png');
        case 11
            mapa2D = imread('mapa 1.png');
        case 12
            mapa2D = imread('mapa 2k.png');
        case 13
            mapa2D = imread('mapa 2l.png');
        case 14
            mapa2D = imread('mapa 2m.png');
        case 15
            mapa2D = imread('mapa 2n.png');
        case 16
            mapa2D = imread('mapa 2o.png');
    end
    mapa2Dcopy = mapa2D;
    mapa2D = mapa2D(:,:,1);
    
    %mapa2D = mapa(:,:,1,m);
    liczba_test_poziom = size(mapa2D, 2) - oknoX;
    liczba_test_pion = size(mapa2D, 1) - oknoY;

    MaxCorr = 0;
    BestX = 0;
    BestY = 0;
    
    for i = 1:5:liczba_test_poziom
        for j = 1:5:liczba_test_pion
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
    MaxCorr
    BestX
    BestY
    Najlepszy = mapa2Dcopy(BestY:(BestY+oknoY-1),BestX:(BestX+oknoX-1),:);
    %hold on;
    imshow(Najlepszy)
    %hold on;
end


MaxCorrAll
BestOfAllX
BestOfAllY
BestMap
%Najlepszy = mapa(BestOfAllY:(BestOfAllY+oknoY-1),BestOfAllX:(BestOfAllX+oknoX-1),:,m);

switch BestMap
        case 1
            mapa2D = imread('mapa 2a.png');
        case 2
            mapa2D = imread('mapa 2b.png');
        case 3
            mapa2D = imread('mapa 2c.png');
        case 4
            mapa2D = imread('mapa 2d.png');
        case 5
            mapa2D = imread('mapa 2e.png');
        case 6
            mapa2D = imread('mapa 2f.png');
        case 7
            mapa2D = imread('mapa 2g.png');
        case 8
            mapa2D = imread('mapa 2h.png');
        case 9
            mapa2D = imread('mapa 2i.png');
        case 10
            mapa2D = imread('mapa 2j.png');
        case 12
            mapa2D = imread('mapa 2k.png');
        case 13
            mapa2D = imread('mapa 2l.png');
        case 14
            mapa2D = imread('mapa 2m.png');
        case 15
            mapa2D = imread('mapa 2n.png');
        case 16
            mapa2D = imread('mapa 2o.png');
end

NajlepszyAll = mapa2D(BestOfAllY:(BestOfAllY+oknoY-1),BestOfAllX:(BestOfAllX+oknoX-1),:);
imshow(NajlepszyAll)
hold on;
%hold off;