import java.util.Random;

int size = 3;
int[] array = new int[size];
int index = 1;
int n = array.length;
int swapTemp;
boolean paused = true;

void setup() {
  size(1280, 720);
  frameRate(69420);
  surface.setResizable(true);
  
  textAlign(CENTER, BOTTOM);
  textSize(60);

  for (int arrayI = 1; arrayI <= array.length; arrayI++) {
    array[arrayI-1] = arrayI;
  }

  shuffleArray(array);
}

void draw() {
  println(frameRate);
  background(0);

  if (!paused) {
    if (index < n) {
      if (array[index-1] > array[index]) {
        swapTemp = array[index-1];
        array[index-1] = array[index];
        array[index] = swapTemp;
      }
    } else {
      index = 0;
      n--;
    }
    index++;
  }

  // draw
  for (int i = 0; i < array.length; i++) {
    if (i >= n) {
      fill(0, 255, 0);
      stroke(0, 255, 0);
    } else {
      fill(255);
      stroke(255);
    }
    rect(i * (float(width)/array.length), height - (array[i]*(float(height)/array.length)), float(width)/array.length, array[i]*(float(height)/array.length));
  }
  fill(127);
  text("array size: " + size, width/2, height);
}

void keyPressed() {
  if (key == ' ') {
    paused = !paused;
  } else if (key == 'r') {
    shuffleArray(array);
    n = array.length;
    index = 1;
    paused = true;
  } else if (key == '=' || key == '+') {
    size++;
    array = new int[size];
    for (int arrayI = 1; arrayI <= array.length; arrayI++) {
      array[arrayI-1] = arrayI;
    }
    shuffleArray(array);
    n = array.length;
    index = 1;
    paused = true;
  } else if (key == '-') {
    if (size > 2) {
      size--;
      array = new int[size];
      for (int arrayI = 1; arrayI <= array.length; arrayI++) {
        array[arrayI-1] = arrayI;
      }
      shuffleArray(array);
      n = array.length;
      index = 1;
      paused = true;
    }
  }
}

void shuffleArray(int[] array) {

  // with code from WikiPedia; Fisher–Yates shuffle 
  //@ <a href="http://en.wikipedia.org/wiki/Fisher" target="_blank" rel="nofollow">http://en.wikipedia.org/wiki/Fisher</a>–Yates_shuffle

  Random rng = new Random();

  // i is the number of items remaining to be shuffled.
  for (int i = array.length; i > 1; i--) {

    // Pick a random element to swap with the i-th element.
    int j = rng.nextInt(i);  // 0 <= j <= i-1 (0-based array)

    // Swap array elements.
    int tmp = array[j];
    array[j] = array[i-1];
    array[i-1] = tmp;
  }
}
