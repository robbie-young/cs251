#include <stdio.h>
#include <stdlib.h>
#include "vector.h"
#include <assert.h>

/* You'll add your code in this file. For part 1, *do not* change
   anything about the struct definition or typedef in this file.
   (For part 2, you'll delete these.)  */

typedef struct Vector Vector;

void init(Vector *vector, int memorySize) {
  vector->memorySize = memorySize;
  vector->size = 0;
  vector->array = malloc(sizeof(int) * memorySize);
}

void cleanup(Vector *vector) {
  free(vector->array);
}

void print(Vector *vector) {
  for (int i = 0 ; i < vector->size ; i++) {
    printf("%i\n", vector->array[i]);
  }
}

int insert(Vector *vector, int location, int value) {

  if (location < 0 || location > vector->size) {
    return 0;
  }

  if (vector->size >= vector->memorySize) {
    int newArray[vector->size];
    for (int i = 0 ; i < vector->size ; i++) {
      newArray[i] = vector->array[i];
    }

    free(vector->array);
    vector->array = malloc(2 * sizeof(int) * vector->memorySize);
    vector->memorySize = 2 * vector->memorySize;

    for (int i = 0 ; i < vector->size ; i++) {
      vector->array[i] = newArray[i];
    }
  }

  for (int i = vector->size ; i > location ; i--) {
    vector->array[i] = vector->array[i - 1];
  }
  vector->size++;

  vector->array[location] = value;
  return 1;
 }

int get(Vector *vector, int location, int *value) {
  if (location < vector->size && location >= 0) {
    *value = vector->array[location];
    return 1;
  }
  return 0;
}

void testMethod(Vector *vector) {
  for (int i = 0 ; i < 10 ; i++) {
    vector->array[i] = i;
  }
  vector->size = 10;
}

int delete(Vector *vector, int location) {
  if (location < 0 || location >= vector->size + 1) {
    return 0;
  }

  for (int i = location ; i <= vector->size ; i++) {
    vector->array[i] = vector->array[i + 1];
  }

  vector->size--;
  return 1;
}