#include <stdio.h>
#include <stdlib.h>
 
#include "health.h"

int main(int argc, char *argv[]) {
	int result = -1;

	if (argc != 3) {
		fprintf(stderr, "input height and weight\n");
		result = -2;
	} else {
		double height = atof(argv[1]);
		double weight = atof(argv[2]);
		double bmi = get_bmi(height, weight);
		double proper_weight = get_proper_weight(height, weight);
		printf("height:%f[cm], weight:%f[kg] -> bmi:%f[%%](%f[kg])\n", height, weight, bmi, proper_weight);
		result = 0;
	}

	return result;
}
