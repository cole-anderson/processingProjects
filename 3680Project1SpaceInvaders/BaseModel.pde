class BaseModel {
  int x, y;
  String sprite[];
  color baseColor = color(255, 255, 255);
  color nextColor = baseColor;

  void draw() {
    updateObj();
    drawSprite(x, y);
  }

  void drawSprite(int xpos, int ypos) {
  }

  void updateObj() {
  }
}
