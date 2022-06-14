#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int main() {

  printf("Enter a random seed: ");
  unsigned int seed;
  scanf("%u", &seed);
  srandom(seed);  
  int rand = random()%100 + 1;
  int guess = -1;
  int count = 0;

  while (guess != rand) {
    printf("Guess a number: ");
    scanf("%i", &guess);
    
    if (guess > 100 || guess < 1) {
      printf("Please guess a number between 1 and 100. ");
      count--;
    }
    else if (guess > rand) printf("Too high! ");
    else if (guess < rand) printf("Too low! ");
    count ++;
  }

  printf("Correct! Total guesses = %i", count);
}