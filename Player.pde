class Player{
    float positionX;
    float positionY;
    float sizeX;
    float sizeY;
    float halfSizeX;
    float halfSizeY;
    float radius;
    float accelerationX;
    float accelerationY;
    float velocityX;
    float velocityY;
    float friction;
    float maximumSpeed;

    Player(float positionX, float positionY){
        this.positionX = positionX;
        this.positionY = positionY;
        sizeX = 30;
        sizeY = 30;
        halfSizeX = this.sizeX / 2;
        halfSizeY = this.sizeY / 2;
        radius = halfSizeX;
        accelerationX = 0;
        accelerationY = 0;
        velocityX = 0;
        velocityY = 0;
        friction = 0.96;
        maximumSpeed = 5;
    }

    void movement(){
        if(keyUpArrow){
            accelerationY = -0.2;
        }
        if(keyDownArrow){
            accelerationY = 0.2;
        }
        if(!keyUpArrow && !keyDownArrow){
            accelerationY = 0;
        }
        if(keyUpArrow && keyDownArrow){
            accelerationY = 0;
        }

        if(keyLeftArrow){
           accelerationX = -0.2;
        }
        if(keyRightArrow){
            accelerationX = 0.2;
        }
        if(!keyLeftArrow && !keyRightArrow){
            accelerationX = 0;
        }
        if(keyLeftArrow && keyRightArrow){
            accelerationX = 0;
        }

        velocityX += accelerationX;
        velocityY += accelerationY;

        velocityX *= friction;
        velocityY *= friction;

        positionX += velocityX;
        positionY += velocityY;

    }

    void limitSpeed(){
        if(velocityX > maximumSpeed){
            velocityX = maximumSpeed;
        }
        if(velocityX < -maximumSpeed){
            velocityX = -maximumSpeed;
        }
        if(velocityY > maximumSpeed){
            velocityY = maximumSpeed;
        }
        if(velocityY < -maximumSpeed){
            velocityY = -maximumSpeed;
        }
    }

    void checkBoundaries(){
        if(positionX + halfSizeX < 0){
            positionX = gameWindowWidth + halfSizeX;
        }
        if(positionX - halfSizeX > gameWindowWidth){
            positionX = 0 - halfSizeX;
        }
        if(positionY + halfSizeY < 0){
            positionY = gameWindowHeight + halfSizeY;
        }
        if(positionY - halfSizeY > gameWindowHeight){
            positionY = 0 - halfSizeY;
        }
    }

    void sizeMechanic(){
        sizeX -= 0.1;
        sizeY -= 0.1;

        if(sizeX <= 5 || sizeY <= 5){
            sizeX = 5; 
            sizeY = 5;
            gameState = "gameover";
        }

        if(sizeX >= 60 || sizeY >= 60){
            sizeX = 60;
            sizeY = 60;
        }
    }

    void draw(){
        movement();
        limitSpeed();
        checkBoundaries();
        sizeMechanic();

        fill(random(0,255),random(0,255),random(0,255));
        ellipse(positionX, positionY, sizeX , sizeY);

    }

}