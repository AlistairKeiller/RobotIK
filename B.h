#include <math.h>
void diffeqf(double* du, const double* RHS1, const double* RHS2, const double* RHS3, const double* RHS4, const double* RHS5, const double* RHS6, const double RHS7) {
  du[0] = 0;
  du[1] = 0;
  du[2] = 0;
  du[3] = 0;
  du[4] = 1 / (pow(sin(RHS1[1]) * RHS4[0] + sin(RHS1[1] + RHS1[2]) * RHS4[1], 2) * RHS6[2] + pow(sin(RHS1[1]) * RHS4[0] + sin(RHS1[1] + RHS1[2]) * RHS4[1] + sin(RHS1[1] + RHS1[2] + RHS1[3]) * RHS4[2], 2) * RHS6[3] + 1/3 * (pow(sin(RHS1[1]) * RHS4[0] + sin(RHS1[1] + RHS1[2]) * RHS4[1], 2) + (sin(RHS1[1]) * RHS4[0] + sin(RHS1[1] + RHS1[2]) * RHS4[1]) * (sin(RHS1[1]) * RHS4[0] + sin(RHS1[1] + RHS1[2]) * RHS4[1] + sin(RHS1[1] + RHS1[2] + RHS1[3]) * RHS4[2]) + pow(sin(RHS1[1]) * RHS4[0] + sin(RHS1[1] + RHS1[2]) * RHS4[1] + sin(RHS1[1] + RHS1[2] + RHS1[3]) * RHS4[2], 2)) * RHS5[2] + 1/3 * (pow(sin(RHS1[1]) * RHS4[0] + sin(RHS1[1] + RHS1[2]) * RHS4[1], 2) + pow(sin(RHS1[1]), 2) * pow(RHS4[0], 2) + (sin(RHS1[1]) * RHS4[0] + sin(RHS1[1] + RHS1[2]) * RHS4[1]) * sin(RHS1[1]) * RHS4[0]) * RHS5[1] + pow(sin(RHS1[1]), 2) * pow(RHS4[0], 2) * RHS6[1] + 1/3 * pow(sin(RHS1[1]), 2) * pow(RHS4[0], 2) * RHS5[0]);
  du[5] = 0;
  du[6] = 0;
  du[7] = 0;
  du[8] = 0;
  du[9] = 0;
  du[10] = 0;
  du[11] = 0;
  du[12] = 0;
  du[13] = 1 / ((pow(cos(RHS1[1]), 2) * pow(RHS4[0], 2) + pow(sin(RHS1[1]), 2) * pow(RHS4[0], 2)) * RHS6[1] + (pow(cos(RHS1[1]) * RHS4[0] + cos(RHS1[1] + RHS1[2]) * RHS4[1], 2) + pow(sin(RHS1[1]) * RHS4[0] + sin(RHS1[1] + RHS1[2]) * RHS4[1], 2)) * RHS6[2] + (pow(cos(RHS1[1]) * RHS4[0] + cos(RHS1[1] + RHS1[2]) * RHS4[1] + cos(RHS1[1] + RHS1[2] + RHS1[3]) * RHS4[2], 2) + pow(sin(RHS1[1]) * RHS4[0] + sin(RHS1[1] + RHS1[2]) * RHS4[1] + sin(RHS1[1] + RHS1[2] + RHS1[3]) * RHS4[2], 2)) * RHS6[3] + 1/3 * (pow(cos(RHS1[1]), 2) * pow(RHS4[0], 2) + pow(sin(RHS1[1]), 2) * pow(RHS4[0], 2)) * RHS5[0] + 1/3 * (pow(cos(RHS1[1]) * RHS4[0] + cos(RHS1[1] + RHS1[2]) * RHS4[1], 2) + pow(sin(RHS1[1]) * RHS4[0] + sin(RHS1[1] + RHS1[2]) * RHS4[1], 2) + pow(cos(RHS1[1]), 2) * pow(RHS4[0], 2) + pow(sin(RHS1[1]), 2) * pow(RHS4[0], 2) + (cos(RHS1[1]) * RHS4[0] + cos(RHS1[1] + RHS1[2]) * RHS4[1]) * cos(RHS1[1]) * RHS4[0] + (sin(RHS1[1]) * RHS4[0] + sin(RHS1[1] + RHS1[2]) * RHS4[1]) * sin(RHS1[1]) * RHS4[0]) * RHS5[1] + 1/3 * (pow(cos(RHS1[1]) * RHS4[0] + cos(RHS1[1] + RHS1[2]) * RHS4[1], 2) + (cos(RHS1[1]) * RHS4[0] + cos(RHS1[1] + RHS1[2]) * RHS4[1]) * (cos(RHS1[1]) * RHS4[0] + cos(RHS1[1] + RHS1[2]) * RHS4[1] + cos(RHS1[1] + RHS1[2] + RHS1[3]) * RHS4[2]) + pow(sin(RHS1[1]) * RHS4[0] + sin(RHS1[1] + RHS1[2]) * RHS4[1], 2) + (sin(RHS1[1]) * RHS4[0] + sin(RHS1[1] + RHS1[2]) * RHS4[1]) * (sin(RHS1[1]) * RHS4[0] + sin(RHS1[1] + RHS1[2]) * RHS4[1] + sin(RHS1[1] + RHS1[2] + RHS1[3]) * RHS4[2]) + pow(cos(RHS1[1]) * RHS4[0] + cos(RHS1[1] + RHS1[2]) * RHS4[1] + cos(RHS1[1] + RHS1[2] + RHS1[3]) * RHS4[2], 2) + pow(sin(RHS1[1]) * RHS4[0] + sin(RHS1[1] + RHS1[2]) * RHS4[1] + sin(RHS1[1] + RHS1[2] + RHS1[3]) * RHS4[2], 2)) * RHS5[2]);
  du[14] = 0;
  du[15] = 0;
  du[16] = 0;
  du[17] = 0;
  du[18] = 0;
  du[19] = 0;
  du[20] = 0;
  du[21] = 0;
  du[22] = 1 / ((pow(cos(RHS1[1] + RHS1[2]) * RHS4[1] + cos(RHS1[1] + RHS1[2] + RHS1[3]) * RHS4[2], 2) + pow(sin(RHS1[1] + RHS1[2]) * RHS4[1] + sin(RHS1[1] + RHS1[2] + RHS1[3]) * RHS4[2], 2)) * RHS6[3] + (pow(cos(RHS1[1] + RHS1[2]), 2) * pow(RHS4[1], 2) + pow(sin(RHS1[1] + RHS1[2]), 2) * pow(RHS4[1], 2)) * RHS6[2] + 1/3 * (pow(cos(RHS1[1] + RHS1[2]), 2) * pow(RHS4[1], 2) + pow(sin(RHS1[1] + RHS1[2]), 2) * pow(RHS4[1], 2)) * RHS5[1] + 1/3 * (pow(cos(RHS1[1] + RHS1[2]) * RHS4[1] + cos(RHS1[1] + RHS1[2] + RHS1[3]) * RHS4[2], 2) + pow(sin(RHS1[1] + RHS1[2]) * RHS4[1] + sin(RHS1[1] + RHS1[2] + RHS1[3]) * RHS4[2], 2) + pow(cos(RHS1[1] + RHS1[2]), 2) * pow(RHS4[1], 2) + pow(sin(RHS1[1] + RHS1[2]), 2) * pow(RHS4[1], 2) + (cos(RHS1[1] + RHS1[2]) * RHS4[1] + cos(RHS1[1] + RHS1[2] + RHS1[3]) * RHS4[2]) * cos(RHS1[1] + RHS1[2]) * RHS4[1] + (sin(RHS1[1] + RHS1[2]) * RHS4[1] + sin(RHS1[1] + RHS1[2] + RHS1[3]) * RHS4[2]) * sin(RHS1[1] + RHS1[2]) * RHS4[1]) * RHS5[2]);
  du[23] = 0;
  du[24] = 0;
  du[25] = 0;
  du[26] = 0;
  du[27] = 0;
  du[28] = 0;
  du[29] = 0;
  du[30] = 0;
  du[31] = 1 / ((pow(cos(RHS1[1] + RHS1[2] + RHS1[3]), 2) * pow(RHS4[2], 2) + pow(sin(RHS1[1] + RHS1[2] + RHS1[3]), 2) * pow(RHS4[2], 2)) * RHS6[3] + 1/3 * (pow(cos(RHS1[1] + RHS1[2] + RHS1[3]), 2) * pow(RHS4[2], 2) + pow(sin(RHS1[1] + RHS1[2] + RHS1[3]), 2) * pow(RHS4[2], 2)) * RHS5[2]);
}
