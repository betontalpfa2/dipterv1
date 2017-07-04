/*
 * Parametric.c
 *
 * Code generation for model "Parametric".
 *
 * Model version              : 1.30
 * Simulink Coder version : 8.10 (R2016a) 10-Feb-2016
 * C source code generated on : Fri Jun 16 16:00:14 2017
 *
 * Target selection: grt.tlc
 * Note: GRT includes extra infrastructure and instrumentation for prototyping
 * Embedded hardware selection: Intel->x86-64 (Windows64)
 * Code generation objectives: Unspecified
 * Validation result: Not run
 */

#include "Parametric.h"
#include "Parametric_private.h"

/* Block signals (auto storage) */
B_Parametric_T Parametric_B;

/* Continuous states */
X_Parametric_T Parametric_X;

/* Periodic continuous states */
PeriodicIndX_Parametric_T Parametric_PeriodicIndX;
PeriodicRngX_Parametric_T Parametric_PeriodicRngX;

/* Block states (auto storage) */
DW_Parametric_T Parametric_DW;

/* External inputs (root inport signals with auto storage) */
ExtU_Parametric_T Parametric_U;

/* External outputs (root outports fed by signals with auto storage) */
ExtY_Parametric_T Parametric_Y;

/* Real-time model */
RT_MODEL_Parametric_T Parametric_M_;
RT_MODEL_Parametric_T *const Parametric_M = &Parametric_M_;

/* State reduction function */
void local_stateReduction(real_T* x, int_T* p, int_T n, real_T* r)
{
  int_T i, j;
  for (i = 0, j = 0; i < n; ++i, ++j) {
    int_T k = p[i];
    real_T lb = r[j++];
    real_T xk = x[k]-lb;
    real_T rk = r[j]-lb;
    int_T q = (int_T) floor(xk/rk);
    if (q) {
      x[k] = xk-q*rk+lb;
    }
  }
}

/*
 * This function updates continuous states using the ODE3 fixed-step
 * solver algorithm
 */
static void rt_ertODEUpdateContinuousStates(RTWSolverInfo *si )
{
  /* Solver Matrices */
  static const real_T rt_ODE3_A[3] = {
    1.0/2.0, 3.0/4.0, 1.0
  };

  static const real_T rt_ODE3_B[3][3] = {
    { 1.0/2.0, 0.0, 0.0 },

    { 0.0, 3.0/4.0, 0.0 },

    { 2.0/9.0, 1.0/3.0, 4.0/9.0 }
  };

  time_T t = rtsiGetT(si);
  time_T tnew = rtsiGetSolverStopTime(si);
  time_T h = rtsiGetStepSize(si);
  real_T *x = rtsiGetContStates(si);
  ODE3_IntgData *id = (ODE3_IntgData *)rtsiGetSolverData(si);
  real_T *y = id->y;
  real_T *f0 = id->f[0];
  real_T *f1 = id->f[1];
  real_T *f2 = id->f[2];
  real_T hB[3];
  int_T i;
  int_T nXc = 1;
  rtsiSetSimTimeStep(si,MINOR_TIME_STEP);

  /* Save the state values at time t in y, we'll use x as ynew. */
  (void) memcpy(y, x,
                (uint_T)nXc*sizeof(real_T));

  /* Assumes that rtsiSetT and ModelOutputs are up-to-date */
  /* f0 = f(t,y) */
  rtsiSetdX(si, f0);
  Parametric_derivatives();

  /* f(:,2) = feval(odefile, t + hA(1), y + f*hB(:,1), args(:)(*)); */
  hB[0] = h * rt_ODE3_B[0][0];
  for (i = 0; i < nXc; i++) {
    x[i] = y[i] + (f0[i]*hB[0]);
  }

  rtsiSetT(si, t + h*rt_ODE3_A[0]);
  rtsiSetdX(si, f1);
  Parametric_step();
  Parametric_derivatives();

  /* f(:,3) = feval(odefile, t + hA(2), y + f*hB(:,2), args(:)(*)); */
  for (i = 0; i <= 1; i++) {
    hB[i] = h * rt_ODE3_B[1][i];
  }

  for (i = 0; i < nXc; i++) {
    x[i] = y[i] + (f0[i]*hB[0] + f1[i]*hB[1]);
  }

  rtsiSetT(si, t + h*rt_ODE3_A[1]);
  rtsiSetdX(si, f2);
  Parametric_step();
  Parametric_derivatives();

  /* tnew = t + hA(3);
     ynew = y + f*hB(:,3); */
  for (i = 0; i <= 2; i++) {
    hB[i] = h * rt_ODE3_B[2][i];
  }

  for (i = 0; i < nXc; i++) {
    x[i] = y[i] + (f0[i]*hB[0] + f1[i]*hB[1] + f2[i]*hB[2]);
  }

  rtsiSetT(si, tnew);
  local_stateReduction(x, rtsiGetPeriodicContStateIndices(si), 1,
                       rtsiGetPeriodicContStateRanges(si));
  rtsiSetSimTimeStep(si,MAJOR_TIME_STEP);
}

/* Model step function */
void Parametric_step(void)
{
  if (rtmIsMajorTimeStep(Parametric_M)) {
    /* set solver stop time */
    if (!(Parametric_M->Timing.clockTick0+1)) {
      rtsiSetSolverStopTime(&Parametric_M->solverInfo,
                            ((Parametric_M->Timing.clockTickH0 + 1) *
        Parametric_M->Timing.stepSize0 * 4294967296.0));
    } else {
      rtsiSetSolverStopTime(&Parametric_M->solverInfo,
                            ((Parametric_M->Timing.clockTick0 + 1) *
        Parametric_M->Timing.stepSize0 + Parametric_M->Timing.clockTickH0 *
        Parametric_M->Timing.stepSize0 * 4294967296.0));
    }
  }                                    /* end MajorTimeStep */

  /* Update absolute time of base rate at minor time step */
  if (rtmIsMinorTimeStep(Parametric_M)) {
    Parametric_M->Timing.t[0] = rtsiGetT(&Parametric_M->solverInfo);
  }

  /* Sum: '<S1>/Sum2' incorporates:
   *  Constant: '<S1>/Constant3'
   *  Integrator: '<S1>/Integrator'
   */
  Parametric_B.Sum2 = Parametric_X.Integrator_CSTATE +
    Parametric_P.Constant3_Value;

  /* Sin: '<S1>/Ua_gen' */
  Parametric_B.Ua_gen = sin(Parametric_P.Ua_gen_Freq * Parametric_B.Sum2 +
    Parametric_P.Ua_gen_Phase) * Parametric_P.Ua_gen_Amp +
    Parametric_P.Ua_gen_Bias;

  /* Product: '<S1>/Product' incorporates:
   *  Inport: '<Root>/Amp'
   */
  Parametric_B.Product = Parametric_U.Amp * Parametric_B.Ua_gen;

  /* Outport: '<Root>/Ua' */
  Parametric_Y.Ua = Parametric_B.Product;

  /* Sum: '<S1>/Sum' incorporates:
   *  Constant: '<S1>/Constant1'
   *  Integrator: '<S1>/Integrator'
   */
  Parametric_B.Sum = Parametric_X.Integrator_CSTATE +
    Parametric_P.Constant1_Value;

  /* Sin: '<S1>/Ub_gen' */
  Parametric_B.Ub_gen = sin(Parametric_P.Ub_gen_Freq * Parametric_B.Sum +
    Parametric_P.Ub_gen_Phase) * Parametric_P.Ub_gen_Amp +
    Parametric_P.Ub_gen_Bias;

  /* Product: '<S1>/Product1' incorporates:
   *  Inport: '<Root>/Amp'
   */
  Parametric_B.Product1 = Parametric_U.Amp * Parametric_B.Ub_gen;

  /* Outport: '<Root>/Ub' */
  Parametric_Y.Ub = Parametric_B.Product1;

  /* Sum: '<S1>/Sum1' incorporates:
   *  Constant: '<S1>/Constant2'
   *  Integrator: '<S1>/Integrator'
   */
  Parametric_B.Sum1 = Parametric_X.Integrator_CSTATE +
    Parametric_P.Constant2_Value;

  /* Sin: '<S1>/Uc_gen' */
  Parametric_B.Uc_gen = sin(Parametric_P.Uc_gen_Freq * Parametric_B.Sum1 +
    Parametric_P.Uc_gen_Phase) * Parametric_P.Uc_gen_Amp +
    Parametric_P.Uc_gen_Bias;

  /* Product: '<S1>/Product2' incorporates:
   *  Inport: '<Root>/Amp'
   */
  Parametric_B.Product2 = Parametric_U.Amp * Parametric_B.Uc_gen;

  /* Outport: '<Root>/Uc' */
  Parametric_Y.Uc = Parametric_B.Product2;
  if (rtmIsMajorTimeStep(Parametric_M)) {
  }

  if (rtmIsMajorTimeStep(Parametric_M)) {
    /* Matfile logging */
    rt_UpdateTXYLogVars(Parametric_M->rtwLogInfo, (Parametric_M->Timing.t));
  }                                    /* end MajorTimeStep */

  if (rtmIsMajorTimeStep(Parametric_M)) {
    /* signal main to stop simulation */
    {                                  /* Sample time: [0.0s, 0.0s] */
      if ((rtmGetTFinal(Parametric_M)!=-1) &&
          !((rtmGetTFinal(Parametric_M)-(((Parametric_M->Timing.clockTick1+
               Parametric_M->Timing.clockTickH1* 4294967296.0)) * 0.0001)) >
            (((Parametric_M->Timing.clockTick1+Parametric_M->Timing.clockTickH1*
               4294967296.0)) * 0.0001) * (DBL_EPSILON))) {
        rtmSetErrorStatus(Parametric_M, "Simulation finished");
      }
    }

    rt_ertODEUpdateContinuousStates(&Parametric_M->solverInfo);

    /* Update absolute time for base rate */
    /* The "clockTick0" counts the number of times the code of this task has
     * been executed. The absolute time is the multiplication of "clockTick0"
     * and "Timing.stepSize0". Size of "clockTick0" ensures timer will not
     * overflow during the application lifespan selected.
     * Timer of this task consists of two 32 bit unsigned integers.
     * The two integers represent the low bits Timing.clockTick0 and the high bits
     * Timing.clockTickH0. When the low bit overflows to 0, the high bits increment.
     */
    if (!(++Parametric_M->Timing.clockTick0)) {
      ++Parametric_M->Timing.clockTickH0;
    }

    Parametric_M->Timing.t[0] = rtsiGetSolverStopTime(&Parametric_M->solverInfo);

    {
      /* Update absolute timer for sample time: [0.0001s, 0.0s] */
      /* The "clockTick1" counts the number of times the code of this task has
       * been executed. The resolution of this integer timer is 0.0001, which is the step size
       * of the task. Size of "clockTick1" ensures timer will not overflow during the
       * application lifespan selected.
       * Timer of this task consists of two 32 bit unsigned integers.
       * The two integers represent the low bits Timing.clockTick1 and the high bits
       * Timing.clockTickH1. When the low bit overflows to 0, the high bits increment.
       */
      Parametric_M->Timing.clockTick1++;
      if (!Parametric_M->Timing.clockTick1) {
        Parametric_M->Timing.clockTickH1++;
      }
    }
  }                                    /* end MajorTimeStep */
}

/* Derivatives for root system: '<Root>' */
void Parametric_derivatives(void)
{
  XDot_Parametric_T *_rtXdot;
  _rtXdot = ((XDot_Parametric_T *) Parametric_M->ModelData.derivs);

  /* Derivatives for Integrator: '<S1>/Integrator' incorporates:
   *  Derivatives for Inport: '<Root>/Omega'
   */
  _rtXdot->Integrator_CSTATE = Parametric_U.Omega;
}

/* Model initialize function */
void Parametric_initialize(void)
{
  /* Registration code */

  /* initialize non-finites */
  rt_InitInfAndNaN(sizeof(real_T));

  /* initialize real-time model */
  (void) memset((void *)Parametric_M, 0,
                sizeof(RT_MODEL_Parametric_T));

  {
    /* Setup solver object */
    rtsiSetSimTimeStepPtr(&Parametric_M->solverInfo,
                          &Parametric_M->Timing.simTimeStep);
    rtsiSetTPtr(&Parametric_M->solverInfo, &rtmGetTPtr(Parametric_M));
    rtsiSetStepSizePtr(&Parametric_M->solverInfo,
                       &Parametric_M->Timing.stepSize0);
    rtsiSetdXPtr(&Parametric_M->solverInfo, &Parametric_M->ModelData.derivs);
    rtsiSetContStatesPtr(&Parametric_M->solverInfo, (real_T **)
                         &Parametric_M->ModelData.contStates);
    rtsiSetNumContStatesPtr(&Parametric_M->solverInfo,
      &Parametric_M->Sizes.numContStates);
    rtsiSetNumPeriodicContStatesPtr(&Parametric_M->solverInfo,
      &Parametric_M->Sizes.numPeriodicContStates);
    rtsiSetPeriodicContStateIndicesPtr(&Parametric_M->solverInfo,
      &Parametric_M->ModelData.periodicContStateIndices);
    rtsiSetPeriodicContStateRangesPtr(&Parametric_M->solverInfo,
      &Parametric_M->ModelData.periodicContStateRanges);
    rtsiSetErrorStatusPtr(&Parametric_M->solverInfo, (&rtmGetErrorStatus
      (Parametric_M)));
    rtsiSetRTModelPtr(&Parametric_M->solverInfo, Parametric_M);
  }

  rtsiSetSimTimeStep(&Parametric_M->solverInfo, MAJOR_TIME_STEP);
  Parametric_M->ModelData.intgData.y = Parametric_M->ModelData.odeY;
  Parametric_M->ModelData.intgData.f[0] = Parametric_M->ModelData.odeF[0];
  Parametric_M->ModelData.intgData.f[1] = Parametric_M->ModelData.odeF[1];
  Parametric_M->ModelData.intgData.f[2] = Parametric_M->ModelData.odeF[2];
  Parametric_M->ModelData.contStates = ((X_Parametric_T *) &Parametric_X);
  Parametric_M->ModelData.periodicContStateIndices = ((int_T*)
    Parametric_PeriodicIndX);
  Parametric_M->ModelData.periodicContStateRanges = ((real_T*)
    Parametric_PeriodicRngX);
  rtsiSetSolverData(&Parametric_M->solverInfo, (void *)
                    &Parametric_M->ModelData.intgData);
  rtsiSetSolverName(&Parametric_M->solverInfo,"ode3");
  rtmSetTPtr(Parametric_M, &Parametric_M->Timing.tArray[0]);
  rtmSetTFinal(Parametric_M, 3.0);
  Parametric_M->Timing.stepSize0 = 0.0001;

  /* Setup for data logging */
  {
    static RTWLogInfo rt_DataLoggingInfo;
    rt_DataLoggingInfo.loggingInterval = NULL;
    Parametric_M->rtwLogInfo = &rt_DataLoggingInfo;
  }

  /* Setup for data logging */
  {
    rtliSetLogXSignalInfo(Parametric_M->rtwLogInfo, (NULL));
    rtliSetLogXSignalPtrs(Parametric_M->rtwLogInfo, (NULL));
    rtliSetLogT(Parametric_M->rtwLogInfo, "tout");
    rtliSetLogX(Parametric_M->rtwLogInfo, "");
    rtliSetLogXFinal(Parametric_M->rtwLogInfo, "");
    rtliSetLogVarNameModifier(Parametric_M->rtwLogInfo, "rt_");
    rtliSetLogFormat(Parametric_M->rtwLogInfo, 4);
    rtliSetLogMaxRows(Parametric_M->rtwLogInfo, 0);
    rtliSetLogDecimation(Parametric_M->rtwLogInfo, 1);
    rtliSetLogY(Parametric_M->rtwLogInfo, "");
    rtliSetLogYSignalInfo(Parametric_M->rtwLogInfo, (NULL));
    rtliSetLogYSignalPtrs(Parametric_M->rtwLogInfo, (NULL));
  }

  /* block I/O */
  (void) memset(((void *) &Parametric_B), 0,
                sizeof(B_Parametric_T));

  /* states (continuous) */
  {
    (void) memset((void *)&Parametric_X, 0,
                  sizeof(X_Parametric_T));
  }

  /* Periodic continuous states */
  {
    (void) memset((void*) Parametric_PeriodicIndX, 0,
                  1*sizeof(int_T));
    (void) memset((void*) Parametric_PeriodicRngX, 0,
                  2*sizeof(real_T));
  }

  /* states (dwork) */
  (void) memset((void *)&Parametric_DW, 0,
                sizeof(DW_Parametric_T));

  /* external inputs */
  (void) memset((void *)&Parametric_U, 0,
                sizeof(ExtU_Parametric_T));

  /* external outputs */
  (void) memset((void *)&Parametric_Y, 0,
                sizeof(ExtY_Parametric_T));

  /* Matfile logging */
  rt_StartDataLoggingWithStartTime(Parametric_M->rtwLogInfo, 0.0, rtmGetTFinal
    (Parametric_M), Parametric_M->Timing.stepSize0, (&rtmGetErrorStatus
    (Parametric_M)));

  /* InitializeConditions for Integrator: '<S1>/Integrator' */
  Parametric_X.Integrator_CSTATE = Parametric_P.Integrator_IC;

  /* InitializeConditions for root-level periodic continuous states */
  {
    int_T rootPeriodicContStateIndices[1] = { 0 };

    real_T rootPeriodicContStateRanges[2] = { -3.1415926535897931,
      3.1415926535897931 };

    (void) memcpy((void*) Parametric_PeriodicIndX, rootPeriodicContStateIndices,
                  1*sizeof(int_T));
    (void) memcpy((void*) Parametric_PeriodicRngX, rootPeriodicContStateRanges,
                  2*sizeof(real_T));
  }
}

/* Model terminate function */
void Parametric_terminate(void)
{
  /* (no terminate code required) */
}
