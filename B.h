#include <math.h>
void B(double* du, const double RHS1, const double RHS2, const double RHS3, const double RHS4, const double RHS5, const double RHS6, const double RHS7, const double RHS8) {
  du[0] = 0;
  du[1] = 0;
  du[2] = 0;
  du[3] = 0;
  du[4] = 1 / (0.16666666666666666 * (pow(0.8636 * sin(RHS2 + RHS3) + 0.8636 * sin(RHS2), 2) + (0.8636 * sin(RHS2 + RHS3) + 0.8636 * sin(RHS2)) * (0.8636 * sin(RHS2 + RHS3) + 0.8636 * sin(RHS2 + RHS3 + RHS4) + 0.8636 * sin(RHS2)) + pow(0.8636 * sin(RHS2 + RHS3) + 0.8636 * sin(RHS2 + RHS3 + RHS4) + 0.8636 * sin(RHS2), 2)) + 0.16666666666666666 * (pow(0.8636 * sin(RHS2 + RHS3) + 0.8636 * sin(RHS2), 2) + 0.7458049600000001 * pow(sin(RHS2), 2) + 0.8636 * (0.8636 * sin(RHS2 + RHS3) + 0.8636 * sin(RHS2)) * sin(RHS2)) + 0.5 * pow(0.8636 * sin(RHS2 + RHS3) + 0.8636 * sin(RHS2), 2) + 0.5 * pow(0.8636 * sin(RHS2 + RHS3) + 0.8636 * sin(RHS2 + RHS3 + RHS4) + 0.8636 * sin(RHS2), 2) + 0.4972033066666667 * pow(sin(RHS2), 2));
  du[5] = 0;
  du[6] = 0;
  du[7] = 0;
  du[8] = 0;
  du[9] = 0;
  du[10] = 0;
  du[11] = 0;
  du[12] = 0;
  du[13] = 1 / (0.16666666666666666 * (pow(0.8636 * cos(RHS2 + RHS3) + 0.8636 * cos(RHS2), 2) + pow(0.8636 * sin(RHS2 + RHS3) + 0.8636 * sin(RHS2), 2) + 0.7458049600000001 * pow(cos(RHS2), 2) + 0.7458049600000001 * pow(sin(RHS2), 2) + 0.8636 * (0.8636 * cos(RHS2 + RHS3) + 0.8636 * cos(RHS2)) * cos(RHS2) + 0.8636 * (0.8636 * sin(RHS2 + RHS3) + 0.8636 * sin(RHS2)) * sin(RHS2)) + 0.5 * (pow(0.8636 * cos(RHS2 + RHS3) + 0.8636 * cos(RHS2), 2) + pow(0.8636 * sin(RHS2 + RHS3) + 0.8636 * sin(RHS2), 2)) + 0.5 * (pow(0.8636 * cos(RHS2 + RHS3) + 0.8636 * cos(RHS2 + RHS3 + RHS4) + 0.8636 * cos(RHS2), 2) + pow(0.8636 * sin(RHS2 + RHS3) + 0.8636 * sin(RHS2 + RHS3 + RHS4) + 0.8636 * sin(RHS2), 2)) + 0.6666666666666666 * (0.7458049600000001 * pow(cos(RHS2), 2) + 0.7458049600000001 * pow(sin(RHS2), 2)) + 0.16666666666666666 * (pow(0.8636 * cos(RHS2 + RHS3) + 0.8636 * cos(RHS2), 2) + (0.8636 * cos(RHS2 + RHS3) + 0.8636 * cos(RHS2)) * (0.8636 * cos(RHS2 + RHS3) + 0.8636 * cos(RHS2 + RHS3 + RHS4) + 0.8636 * cos(RHS2)) + pow(0.8636 * sin(RHS2 + RHS3) + 0.8636 * sin(RHS2), 2) + (0.8636 * sin(RHS2 + RHS3) + 0.8636 * sin(RHS2)) * (0.8636 * sin(RHS2 + RHS3) + 0.8636 * sin(RHS2 + RHS3 + RHS4) + 0.8636 * sin(RHS2)) + pow(0.8636 * cos(RHS2 + RHS3) + 0.8636 * cos(RHS2 + RHS3 + RHS4) + 0.8636 * cos(RHS2), 2) + pow(0.8636 * sin(RHS2 + RHS3) + 0.8636 * sin(RHS2 + RHS3 + RHS4) + 0.8636 * sin(RHS2), 2)));
  du[14] = 0;
  du[15] = 0;
  du[16] = 0;
  du[17] = 0;
  du[18] = 0;
  du[19] = 0;
  du[20] = 0;
  du[21] = 0;
  du[22] = 1 / (0.16666666666666666 * (pow(0.8636 * cos(RHS2 + RHS3) + 0.8636 * cos(RHS2 + RHS3 + RHS4), 2) + pow(0.8636 * sin(RHS2 + RHS3) + 0.8636 * sin(RHS2 + RHS3 + RHS4), 2) + 0.7458049600000001 * pow(cos(RHS2 + RHS3), 2) + 0.7458049600000001 * pow(sin(RHS2 + RHS3), 2) + 0.8636 * (0.8636 * cos(RHS2 + RHS3) + 0.8636 * cos(RHS2 + RHS3 + RHS4)) * cos(RHS2 + RHS3) + 0.8636 * (0.8636 * sin(RHS2 + RHS3) + 0.8636 * sin(RHS2 + RHS3 + RHS4)) * sin(RHS2 + RHS3)) + 0.5 * (pow(0.8636 * cos(RHS2 + RHS3) + 0.8636 * cos(RHS2 + RHS3 + RHS4), 2) + pow(0.8636 * sin(RHS2 + RHS3) + 0.8636 * sin(RHS2 + RHS3 + RHS4), 2)) + 0.6666666666666666 * (0.7458049600000001 * pow(cos(RHS2 + RHS3), 2) + 0.7458049600000001 * pow(sin(RHS2 + RHS3), 2)));
  du[23] = 0;
  du[24] = 0;
  du[25] = 0;
  du[26] = 0;
  du[27] = 0;
  du[28] = 0;
  du[29] = 0;
  du[30] = 0;
  du[31] = 1 / (0.6666666666666666 * (0.7458049600000001 * pow(cos(RHS2 + RHS3 + RHS4), 2) + 0.7458049600000001 * pow(sin(RHS2 + RHS3 + RHS4), 2)));
}
