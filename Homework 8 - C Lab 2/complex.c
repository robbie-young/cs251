#include <stdio.h>

struct Complex {
  double real;
  double imaginary;
};

void multiply_in_place(struct Complex *c1, struct Complex *c2) {
  int tempReal = (c1->real * c2->real) - (c1->imaginary * c2->imaginary);
  int tempImaginary = (c1->real * c2->imaginary) + (c2->real * c1->imaginary);
  c2->real = c1->real = tempReal;
  c2->imaginary = c1->imaginary = tempImaginary;
}

void print_complex(struct Complex num) {
  printf("%10.2f + %10.2f i\n", num.real, num.imaginary);
}

int main() {
  struct Complex c1;
  struct Complex c2;

  printf("Enter real part of c1: ");
  scanf("%lf", &c1.real);

  printf("Enter imaginary part of c1: ");
  scanf("%lf", &c1.imaginary);

  printf("Enter real part of c2: ");
  scanf("%lf", &c2.real);

  printf("Enter imaginary part of c2: ");
  scanf("%lf", &c2.imaginary);

  printf("Before multiplication:\n");
  printf("c1: ");
  print_complex(c1);
  printf("c2: ");
  print_complex(c2);

  multiply_in_place(&c1, &c2);

  printf("After multiplication:\n");
  printf("c1: ");
  print_complex(c1);
  printf("c2: ");
  print_complex(c2);
}