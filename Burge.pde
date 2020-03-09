int gameWindowWidth;
int gameWindowHeight;

Player player;
ArrayList<Coin> coins;
Button buttonPlay;
Button buttonExit;
Button buttonTryAgain;

boolean keyUpArrow;
boolean keyDownArrow;
boolean keyLeftArrow;
boolean keyRightArrow;
boolean mouseClick;

int score;
int coinAmount;

String gameState;

void settings(){
    gameWindowWidth = displayWidth / 2;
    gameWindowHeight = displayHeight / 2;
    size(gameWindowWidth, gameWindowHeight, P2D);
    //noSmooth();
}

void setup(){
    noStroke();

    keyUpArrow = false;
    keyDownArrow = false;
    keyLeftArrow = false;
    keyRightArrow = false;
    mouseClick = false;

    gameState = "menu";

    score = 0;
    coinAmount = 10;

    player = new Player(gameWindowWidth / 2, gameWindowHeight / 2);
    coins = new ArrayList<Coin>();
    buttonPlay = new Button(gameWindowWidth / 2 , gameWindowHeight / 2, 180, 40, "Oyna");
    buttonExit = new Button(gameWindowWidth / 2 , gameWindowHeight / 2 + 60, 180, 40, "Çıkış");
    buttonTryAgain = new Button(gameWindowWidth / 2 , gameWindowHeight / 2, 180, 40, "Tekrar Dene!");

    for(int i = 0; i < coinAmount; i++){
        coins.add(new Coin(random(0,gameWindowWidth), random(0, gameWindowHeight)));
    }
}

void draw(){
    

    switch(gameState){
        case "menu":
            background(0);
            fill(255);
            textSize(32);
            textAlign(CENTER,CENTER);
            text("Burge",gameWindowWidth / 2, gameWindowHeight / 4);
            buttonPlay.draw();
            if(buttonPlay.click()){
                gameState = "game";
                resetGame();
            }
            
            buttonExit.draw();
            if(buttonExit.click()){
                exit();
            }
        break;

        case "game":
            background(0);
            for(int i = 0; i < coinAmount; i++){
                coins.get(i).draw();
            }

            for(int i = 0; i < coinAmount; i++){
                if(circleCircleCollision(player.positionX, player.positionY, player.radius, coins.get(i).positionX, coins.get(i).positionY, coins.get(i).radius)){
                    coins.get(i).positionX = random(0, gameWindowWidth);
                    coins.get(i).positionY = random(0, gameWindowHeight);

                    player.sizeX += 6;
                    player.sizeY += 6;
                    
                    score += 1;
                }
            }

            player.draw();

            fill(255);
            textAlign(LEFT,TOP);
            textSize(18);
            text("Skor: " + score,12,8);
        break;

        case "gameover":
            background(0);
            fill(255);
            textSize(32);
            textAlign(CENTER,CENTER);
            text("Kaybettin! Seni beceriksiz.",gameWindowWidth / 2, gameWindowHeight / 4);
            buttonTryAgain.draw();
            if(buttonTryAgain.click()){
                gameState = "menu";
                resetGame();
            }
        break;
    }
    mouseClick = false;
}

void keyPressed(){
    if(keyCode == UP){
        keyUpArrow = true;
    }
    if(keyCode == DOWN){
        keyDownArrow = true;
    }
    if(keyCode == LEFT){
        keyLeftArrow = true;
    }
    if(keyCode == RIGHT){
        keyRightArrow = true;
    }
}

void keyReleased(){
    if(keyCode == UP){
        keyUpArrow = false;
    }
    if(keyCode == DOWN){
        keyDownArrow = false;
    }
    if(keyCode == LEFT){
        keyLeftArrow = false;
    }
    if(keyCode == RIGHT){
        keyRightArrow = false;
    }
}

void mouseClicked(){
    mouseClick = true;
}

boolean circleCircleCollision(float x1, float y1, float r1, float x2, float y2, float r2){
    float dx = x2-x1;
    float dy = y2-y1;
    float dr = sqrt( sq(dx) + sq(dy) );

    if(dr <= r1 + r2){
        return true;
    }else{
        return false;
    }
}

void resetGame(){
    player.positionX = gameWindowWidth / 2;
    player.positionY = gameWindowHeight / 2;
    player.sizeX = 30;
    player.sizeY = 30;
    score = 0;
    player.accelerationX = 0;
    player.accelerationY = 0;
    player.velocityX = 0;
    player.velocityY = 0;
}
