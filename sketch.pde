void setup() {
  size(displayWidth, displayHeight);
  loadPixels();
  int maxIterations = 100;
  float size = 1;
  for (int x = 0; x < width; x++) {
    for (int y = 0; y < height; y++) {
      int index = x + width * y;
      float a = map(y, 0, width, -size, size) - 1.5;
      float b = map(x, 0, width, -size, size);
      float ca = a;
      float cb = b;
      float rc = 255;
      float gc = 255;
      float bc = 255;
      float ac = 255;
      for (int i = 0; i < maxIterations; i++) {
        float aa = a * a - b * b;
        float bb = 2 * a * b;
        a = aa + ca;
        b = bb + cb;
        if (abs(a + b) > maxIterations) {
          ac = map(i, 0, maxIterations, 0, 255);
          break;
        } else {
          ac = 0;
        }
      }
      pixels[index] = color(rc, gc, bc, ac);
    }
  }
  updatePixels();
}