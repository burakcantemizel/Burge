class Coin{
    float positionX;
    float positionY;
    float sizeX;
    float sizeY;
    float halfSizeX;
    float halfSizeY;
    float radius;
    
    float yellowAmount;
    color coinColor;

    Coin(float positionX, float positionY){
        this.positionX = positionX;
        this.positionY = positionY;
        sizeX = 10;
        sizeY = 10;
        halfSizeX = sizeX / 2;
        halfSizeY = sizeY / 2;
        radius = halfSizeX;
        yellowAmount = random(155,255);
        coinColor = color(yellowAmount, yellowAmount, 0);
    }

    void draw(){
        fill(coinColor);
        ellipse(positionX, positionY, sizeX, sizeY);
    }

}