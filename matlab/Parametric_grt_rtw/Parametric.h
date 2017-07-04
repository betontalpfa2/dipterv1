/*
 * Parametric.h
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

#ifndef RTW_HEADER_Parametric_h_
#define RTW_HEADER_Parametric_h_
#include <string.h>
#include <math.h>
#include <float.h>
#include <stddef.h>
#ifndef Parametric_COMMON_INCLUDES_
# define Parametric_COMMON_INCLUDES_
#include "rtwtypes.h"
#include "rtw_continuous.h"
#include "rtw_solver.h"
#include "rt_logging.h"
#endif                                 /* Parametric_COMMON_INCLUDES_ */

#include "Parametric_types.h"

/* Shared type includes */
#include "multiword_types.h"
#include "rt_nonfinite.h"

/* Macros for accessing real-time model data structure */
#ifndef rtmGetBlkStateChangeFlag
# define rtmGetBlkStateChangeFlag(rtm) ((rtm)->ModelData.blkStateChange)
#endif

#ifndef rtmSetBlkStateChangeFlag
# define rtmSetBlkStateChangeFlag(rtm, val) ((rtm)->ModelData.blkStateChange = (val))
#endif

#ifndef rtmGetContStateDisabled
# define rtmGetContStateDisabled(rtm)  ((rtm)->ModelData.contStateDisabled)
#endif

#ifndef rtmSetContStateDisabled
# define rtmSetContStateDisabled(rtm, val) ((rtm)->ModelData.contStateDisabled = (val))
#endif

#ifndef rtmGetContStates
# define rtmGetContStates(rtm)         ((rtm)->ModelData.contStates)
#endif

#ifndef rtmSetContStates
# define rtmSetContStates(rtm, val)    ((rtm)->ModelData.contStates = (val))
#endif

#ifndef rtmGetDerivCacheNeedsReset
# define rtmGetDerivCacheNeedsReset(rtm) ((rtm)->ModelData.derivCacheNeedsReset)
#endif

#ifndef rtmSetDerivCacheNeedsReset
# define rtmSetDerivCacheNeedsReset(rtm, val) ((rtm)->ModelData.derivCacheNeedsReset = (val))
#endif

#ifndef rtmGetFinalTime
# define rtmGetFinalTime(rtm)          ((rtm)->Timing.tFinal)
#endif

#ifndef rtmGetIntgData
# define rtmGetIntgData(rtm)           ((rtm)->ModelData.intgData)
#endif

#ifndef rtmSetIntgData
# define rtmSetIntgData(rtm, val)      ((rtm)->ModelData.intgData = (val))
#endif

#ifndef rtmGetOdeF
# define rtmGetOdeF(rtm)               ((rtm)->ModelData.odeF)
#endif

#ifndef rtmSetOdeF
# define rtmSetOdeF(rtm, val)          ((rtm)->ModelData.odeF = (val))
#endif

#ifndef rtmGetOdeY
# define rtmGetOdeY(rtm)               ((rtm)->ModelData.odeY)
#endif

#ifndef rtmSetOdeY
# define rtmSetOdeY(rtm, val)          ((rtm)->ModelData.odeY = (val))
#endif

#ifndef rtmGetPeriodicContStateIndices
# define rtmGetPeriodicContStateIndices(rtm) ((rtm)->ModelData.periodicContStateIndices)
#endif

#ifndef rtmSetPeriodicContStateIndices
# define rtmSetPeriodicContStateIndices(rtm, val) ((rtm)->ModelData.periodicContStateIndices = (val))
#endif

#ifndef rtmGetPeriodicContStateRanges
# define rtmGetPeriodicContStateRanges(rtm) ((rtm)->ModelData.periodicContStateRanges)
#endif

#ifndef rtmSetPeriodicContStateRanges
# define rtmSetPeriodicContStateRanges(rtm, val) ((rtm)->ModelData.periodicContStateRanges = (val))
#endif

#ifndef rtmGetRTWLogInfo
# define rtmGetRTWLogInfo(rtm)         ((rtm)->rtwLogInfo)
#endif

#ifndef rtmGetZCCacheNeedsReset
# define rtmGetZCCacheNeedsReset(rtm)  ((rtm)->ModelData.zCCacheNeedsReset)
#endif

#ifndef rtmSetZCCacheNeedsReset
# define rtmSetZCCacheNeedsReset(rtm, val) ((rtm)->ModelData.zCCacheNeedsReset = (val))
#endif

#ifndef rtmGetdX
# define rtmGetdX(rtm)                 ((rtm)->ModelData.derivs)
#endif

#ifndef rtmSetdX
# define rtmSetdX(rtm, val)            ((rtm)->ModelData.derivs = (val))
#endif

#ifndef rtmGetErrorStatus
# define rtmGetErrorStatus(rtm)        ((rtm)->errorStatus)
#endif

#ifndef rtmSetErrorStatus
# define rtmSetErrorStatus(rtm, val)   ((rtm)->errorStatus = (val))
#endif

#ifndef rtmGetStopRequested
# define rtmGetStopRequested(rtm)      ((rtm)->Timing.stopRequestedFlag)
#endif

#ifndef rtmSetStopRequested
# define rtmSetStopRequested(rtm, val) ((rtm)->Timing.stopRequestedFlag = (val))
#endif

#ifndef rtmGetStopRequestedPtr
# define rtmGetStopRequestedPtr(rtm)   (&((rtm)->Timing.stopRequestedFlag))
#endif

#ifndef rtmGetT
# define rtmGetT(rtm)                  (rtmGetTPtr((rtm))[0])
#endif

#ifndef rtmGetTFinal
# define rtmGetTFinal(rtm)             ((rtm)->Timing.tFinal)
#endif

/* Block signals (auto storage) */
typedef struct {
  real_T Sum2;                         /* '<S1>/Sum2' */
  real_T Ua_gen;                       /* '<S1>/Ua_gen' */
  real_T Product;                      /* '<S1>/Product' */
  real_T Sum;                          /* '<S1>/Sum' */
  real_T Ub_gen;                       /* '<S1>/Ub_gen' */
  real_T Product1;                     /* '<S1>/Product1' */
  real_T Sum1;                         /* '<S1>/Sum1' */
  real_T Uc_gen;                       /* '<S1>/Uc_gen' */
  real_T Product2;                     /* '<S1>/Product2' */
} B_Parametric_T;

/* Block states (auto storage) for system '<Root>' */
typedef struct {
  struct {
    void *LoggedData[3];
  } U_s1_PWORK;                        /* '<S1>/U_s1' */

  struct {
    void *LoggedData[3];
  } U_s2_PWORK;                        /* '<S1>/U_s2' */

  struct {
    void *LoggedData[3];
  } U_s4_PWORK;                        /* '<S1>/U_s4' */
} DW_Parametric_T;

/* Continuous states (auto storage) */
typedef struct {
  real_T Integrator_CSTATE;            /* '<S1>/Integrator' */
} X_Parametric_T;

/* Periodic continuous state vector (global) */
typedef int_T PeriodicIndX_Parametric_T[1];
typedef real_T PeriodicRngX_Parametric_T[2];

/* State derivatives (auto storage) */
typedef struct {
  real_T Integrator_CSTATE;            /* '<S1>/Integrator' */
} XDot_Parametric_T;

/* State disabled  */
typedef struct {
  boolean_T Integrator_CSTATE;         /* '<S1>/Integrator' */
} XDis_Parametric_T;

#ifndef ODE3_INTG
#define ODE3_INTG

/* ODE3 Integration Data */
typedef struct {
  real_T *y;                           /* output */
  real_T *f[3];                        /* derivatives */
} ODE3_IntgData;

#endif

/* External inputs (root inport signals with auto storage) */
typedef struct {
  real_T Omega;                        /* '<Root>/Omega' */
  real_T Amp;                          /* '<Root>/Amp' */
} ExtU_Parametric_T;

/* External outputs (root outports fed by signals with auto storage) */
typedef struct {
  real_T Ua;                           /* '<Root>/Ua' */
  real_T Ub;                           /* '<Root>/Ub' */
  real_T Uc;                           /* '<Root>/Uc' */
} ExtY_Parametric_T;

/* Parameters (auto storage) */
struct P_Parametric_T_ {
  real_T Integrator_IC;                /* Expression: 0
                                        * Referenced by: '<S1>/Integrator'
                                        */
  real_T Integrator_WrappedStateUpperVal;/* Expression: pi
                                          * Referenced by: '<S1>/Integrator'
                                          */
  real_T Integrator_WrappedStateLowerVal;/* Expression: -pi
                                          * Referenced by: '<S1>/Integrator'
                                          */
  real_T Constant3_Value;              /* Expression: 0
                                        * Referenced by: '<S1>/Constant3'
                                        */
  real_T Ua_gen_Amp;                   /* Expression: 1
                                        * Referenced by: '<S1>/Ua_gen'
                                        */
  real_T Ua_gen_Bias;                  /* Expression: 0
                                        * Referenced by: '<S1>/Ua_gen'
                                        */
  real_T Ua_gen_Freq;                  /* Expression: 1
                                        * Referenced by: '<S1>/Ua_gen'
                                        */
  real_T Ua_gen_Phase;                 /* Expression: 0
                                        * Referenced by: '<S1>/Ua_gen'
                                        */
  real_T Constant1_Value;              /* Expression: -2*pi/3
                                        * Referenced by: '<S1>/Constant1'
                                        */
  real_T Ub_gen_Amp;                   /* Expression: 1
                                        * Referenced by: '<S1>/Ub_gen'
                                        */
  real_T Ub_gen_Bias;                  /* Expression: 0
                                        * Referenced by: '<S1>/Ub_gen'
                                        */
  real_T Ub_gen_Freq;                  /* Expression: 1
                                        * Referenced by: '<S1>/Ub_gen'
                                        */
  real_T Ub_gen_Phase;                 /* Expression: 0
                                        * Referenced by: '<S1>/Ub_gen'
                                        */
  real_T Constant2_Value;              /* Expression: 2*pi/3
                                        * Referenced by: '<S1>/Constant2'
                                        */
  real_T Uc_gen_Amp;                   /* Expression: 1
                                        * Referenced by: '<S1>/Uc_gen'
                                        */
  real_T Uc_gen_Bias;                  /* Expression: 0
                                        * Referenced by: '<S1>/Uc_gen'
                                        */
  real_T Uc_gen_Freq;                  /* Expression: 1
                                        * Referenced by: '<S1>/Uc_gen'
                                        */
  real_T Uc_gen_Phase;                 /* Expression: 0
                                        * Referenced by: '<S1>/Uc_gen'
                                        */
};

/* Real-time Model Data Structure */
struct tag_RTM_Parametric_T {
  const char_T *errorStatus;
  RTWLogInfo *rtwLogInfo;
  RTWSolverInfo solverInfo;

  /*
   * ModelData:
   * The following substructure contains information regarding
   * the data used in the model.
   */
  struct {
    X_Parametric_T *contStates;
    int_T *periodicContStateIndices;
    real_T *periodicContStateRanges;
    real_T *derivs;
    boolean_T *contStateDisabled;
    boolean_T zCCacheNeedsReset;
    boolean_T derivCacheNeedsReset;
    boolean_T blkStateChange;
    real_T odeY[1];
    real_T odeF[3][1];
    ODE3_IntgData intgData;
  } ModelData;

  /*
   * Sizes:
   * The following substructure contains sizes information
   * for many of the model attributes such as inputs, outputs,
   * dwork, sample times, etc.
   */
  struct {
    int_T numContStates;
    int_T numPeriodicContStates;
    int_T numSampTimes;
  } Sizes;

  /*
   * Timing:
   * The following substructure contains information regarding
   * the timing information for the model.
   */
  struct {
    uint32_T clockTick0;
    uint32_T clockTickH0;
    time_T stepSize0;
    uint32_T clockTick1;
    uint32_T clockTickH1;
    time_T tFinal;
    SimTimeStep simTimeStep;
    boolean_T stopRequestedFlag;
    time_T *t;
    time_T tArray[2];
  } Timing;
};

/* Block parameters (auto storage) */
extern P_Parametric_T Parametric_P;

/* Block signals (auto storage) */
extern B_Parametric_T Parametric_B;

/* Continuous states (auto storage) */
extern X_Parametric_T Parametric_X;

/* Block states (auto storage) */
extern DW_Parametric_T Parametric_DW;

/* External inputs (root inport signals with auto storage) */
extern ExtU_Parametric_T Parametric_U;

/* External outputs (root outports fed by signals with auto storage) */
extern ExtY_Parametric_T Parametric_Y;

/* Model entry point functions */
extern void Parametric_initialize(void);
extern void Parametric_step(void);
extern void Parametric_terminate(void);

/* Real-time Model object */
extern RT_MODEL_Parametric_T *const Parametric_M;

/*-
 * The generated code includes comments that allow you to trace directly
 * back to the appropriate location in the model.  The basic format
 * is <system>/block_name, where system is the system number (uniquely
 * assigned by Simulink) and block_name is the name of the block.
 *
 * Note that this particular code originates from a subsystem build,
 * and has its own system numbers different from the parent model.
 * Refer to the system hierarchy for this subsystem below, and use the
 * MATLAB hilite_system command to trace the generated code back
 * to the parent model.  For example,
 *
 * hilite_system('SCIM_3different_simple_dive/Parametric AC1')    - opens subsystem SCIM_3different_simple_dive/Parametric AC1
 * hilite_system('SCIM_3different_simple_dive/Parametric AC1/Kp') - opens and selects block Kp
 *
 * Here is the system hierarchy for this model
 *
 * '<Root>' : 'SCIM_3different_simple_dive'
 * '<S1>'   : 'SCIM_3different_simple_dive/Parametric AC1'
 */
#endif                                 /* RTW_HEADER_Parametric_h_ */
