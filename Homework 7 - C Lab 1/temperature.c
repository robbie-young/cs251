#include <stdio.h>

int main() {
  printf("Enter the temperature in Fahrenheit:\n");
  float f;

  scanf("%f", &f);

  if (f < -459.67) {
    printf("Invalid temperature");
    return 0;
  }

  float c = (f - 32) * 5/9;
  printf("Here is the temperature in Celcius: %f\n", c);

  return 0;
}