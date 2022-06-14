#include <stdio.h>

int main() {
  int count;
  printf("How many nubmers would you like to store? ");
  scanf("%i", &count);

  int start;
  printf("What number do you want to start at? ");
  scanf("%i", &start);

  int array[count];
  for (int i = 0 ; i < count ; i++) {
    array[i] = start + i;
  }

  int sum = 0;
  for (int i = 0 ; i < count ; i++) {
    if (i % 2 == 1) sum = sum + array[i];
  }

  printf("Total at odd indices: %i\n", sum);
}