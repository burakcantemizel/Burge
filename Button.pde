class Button{
    float positionX;
    float positionY;
    float sizeX;
    float sizeY;
    float halfSizeX;
    float halfSizeY;
    String text;

    Button(float positionX, float positionY, float sizeX, float sizeY, String text){
        this.positionX = positionX;
        this.positionY = positionY;
        this.sizeX = sizeX;
        this.sizeY = sizeY;
        halfSizeX = this.sizeX / 2;
        halfSizeY = this.sizeY / 2;
        this.text = text;
    }

    void draw(){
        pushMatrix();
            //stroke(255);
            //strokeWeight(3);
            fill(255,255,0);
            rect(positionX - halfSizeX, positionY - halfSizeY, sizeX, sizeY, 5);
            if(overlap()){
                fill(0,0,0,128);
                rect(positionX - halfSizeX, positionY - halfSizeY, sizeX, sizeY, 5);
            }
            fill(0);
            textSize(20);
            textAlign(CENTER,CENTER);
            text(text, positionX, positionY);
        popMatrix();

    }

    boolean overlap(){
        if(mouseX > positionX - halfSizeX && mouseX < positionX - halfSizeX + sizeX && mouseY > positionY - halfSizeY && mouseY < positionY - halfSizeY + sizeY){
            return true;
        }else{
            return false;
        }
    }

    boolean click(){
        if(overlap() && mouseClick){
            return true;
        }else{
            return false;
        }
    }

}