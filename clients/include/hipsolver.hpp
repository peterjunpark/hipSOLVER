/* ************************************************************************
 * Copyright 2020-2021 Advanced Micro Devices, Inc.
 * ************************************************************************ */

#pragma once

#include "hipsolver.h"
#include "hipsolver_fortran.hpp"

// Most functions within this file exist to provide a consistent interface for our templated tests.
// Function overloading is used to select between the float, double, rocblas_float_complex
// and rocblas_double_complex variants, and to distinguish the batched case (T**) from the normal
// and strided_batched cases (T*).
//
// The normal and strided_batched cases are distinguished from each other by passing a boolean
// parameter, STRIDED. Variants such as the blocked and unblocked versions of algorithms, may be
// provided in similar ways.

typedef enum
{
    C_NORMAL,
    C_NORMAL_ALT,
    FORTRAN_NORMAL,
    FORTRAN_NORMAL_ALT,
    C_STRIDED,
    C_STRIDED_ALT,
    FORTRAN_STRIDED,
    FORTRAN_STRIDED_ALT
} testMarshal_t;

inline testMarshal_t bool2marshal(bool FORTRAN, bool ALT)
{
    if(!FORTRAN)
        if(!ALT)
            return C_NORMAL;
        else
            return C_NORMAL_ALT;
    else if(!ALT)
        return FORTRAN_NORMAL;
    else
        return FORTRAN_NORMAL_ALT;
}

/******************** ORMQR/UNMQR ********************/
// normal and strided_batched
inline hipsolverStatus_t hipsolver_ormqr_unmqr_bufferSize(bool                 FORTRAN,
                                                          hipsolverHandle_t    handle,
                                                          hipsolverSideMode_t  side,
                                                          hipsolverOperation_t trans,
                                                          int                  m,
                                                          int                  n,
                                                          int                  k,
                                                          float*               A,
                                                          int                  lda,
                                                          float*               tau,
                                                          float*               C,
                                                          int                  ldc,
                                                          int*                 lwork)
{
    if(!FORTRAN)
        return hipsolverSormqr_bufferSize(handle, side, trans, m, n, k, A, lda, tau, C, ldc, lwork);
    else
        return hipsolverSormqr_bufferSizeFortran(
            handle, side, trans, m, n, k, A, lda, tau, C, ldc, lwork);
}

inline hipsolverStatus_t hipsolver_ormqr_unmqr_bufferSize(bool                 FORTRAN,
                                                          hipsolverHandle_t    handle,
                                                          hipsolverSideMode_t  side,
                                                          hipsolverOperation_t trans,
                                                          int                  m,
                                                          int                  n,
                                                          int                  k,
                                                          double*              A,
                                                          int                  lda,
                                                          double*              tau,
                                                          double*              C,
                                                          int                  ldc,
                                                          int*                 lwork)
{
    if(!FORTRAN)
        return hipsolverDormqr_bufferSize(handle, side, trans, m, n, k, A, lda, tau, C, ldc, lwork);
    else
        return hipsolverDormqr_bufferSizeFortran(
            handle, side, trans, m, n, k, A, lda, tau, C, ldc, lwork);
}

inline hipsolverStatus_t hipsolver_ormqr_unmqr_bufferSize(bool                 FORTRAN,
                                                          hipsolverHandle_t    handle,
                                                          hipsolverSideMode_t  side,
                                                          hipsolverOperation_t trans,
                                                          int                  m,
                                                          int                  n,
                                                          int                  k,
                                                          hipsolverComplex*    A,
                                                          int                  lda,
                                                          hipsolverComplex*    tau,
                                                          hipsolverComplex*    C,
                                                          int                  ldc,
                                                          int*                 lwork)
{
    if(!FORTRAN)
        return hipsolverCunmqr_bufferSize(handle, side, trans, m, n, k, A, lda, tau, C, ldc, lwork);
    else
        return hipsolverCunmqr_bufferSizeFortran(
            handle, side, trans, m, n, k, A, lda, tau, C, ldc, lwork);
}

inline hipsolverStatus_t hipsolver_ormqr_unmqr_bufferSize(bool                    FORTRAN,
                                                          hipsolverHandle_t       handle,
                                                          hipsolverSideMode_t     side,
                                                          hipsolverOperation_t    trans,
                                                          int                     m,
                                                          int                     n,
                                                          int                     k,
                                                          hipsolverDoubleComplex* A,
                                                          int                     lda,
                                                          hipsolverDoubleComplex* tau,
                                                          hipsolverDoubleComplex* C,
                                                          int                     ldc,
                                                          int*                    lwork)
{
    if(!FORTRAN)
        return hipsolverZunmqr_bufferSize(handle, side, trans, m, n, k, A, lda, tau, C, ldc, lwork);
    else
        return hipsolverZunmqr_bufferSizeFortran(
            handle, side, trans, m, n, k, A, lda, tau, C, ldc, lwork);
}

inline hipsolverStatus_t hipsolver_ormqr_unmqr(bool                 FORTRAN,
                                               hipsolverHandle_t    handle,
                                               hipsolverSideMode_t  side,
                                               hipsolverOperation_t trans,
                                               int                  m,
                                               int                  n,
                                               int                  k,
                                               float*               A,
                                               int                  lda,
                                               float*               tau,
                                               float*               C,
                                               int                  ldc,
                                               float*               work,
                                               int                  lwork,
                                               int*                 info)
{
    if(!FORTRAN)
        return hipsolverSormqr(
            handle, side, trans, m, n, k, A, lda, tau, C, ldc, work, lwork, info);
    else
        return hipsolverSormqrFortran(
            handle, side, trans, m, n, k, A, lda, tau, C, ldc, work, lwork, info);
}

inline hipsolverStatus_t hipsolver_ormqr_unmqr(bool                 FORTRAN,
                                               hipsolverHandle_t    handle,
                                               hipsolverSideMode_t  side,
                                               hipsolverOperation_t trans,
                                               int                  m,
                                               int                  n,
                                               int                  k,
                                               double*              A,
                                               int                  lda,
                                               double*              tau,
                                               double*              C,
                                               int                  ldc,
                                               double*              work,
                                               int                  lwork,
                                               int*                 info)
{
    if(!FORTRAN)
        return hipsolverDormqr(
            handle, side, trans, m, n, k, A, lda, tau, C, ldc, work, lwork, info);
    else
        return hipsolverDormqrFortran(
            handle, side, trans, m, n, k, A, lda, tau, C, ldc, work, lwork, info);
}

inline hipsolverStatus_t hipsolver_ormqr_unmqr(bool                 FORTRAN,
                                               hipsolverHandle_t    handle,
                                               hipsolverSideMode_t  side,
                                               hipsolverOperation_t trans,
                                               int                  m,
                                               int                  n,
                                               int                  k,
                                               hipsolverComplex*    A,
                                               int                  lda,
                                               hipsolverComplex*    tau,
                                               hipsolverComplex*    C,
                                               int                  ldc,
                                               hipsolverComplex*    work,
                                               int                  lwork,
                                               int*                 info)
{
    if(!FORTRAN)
        return hipsolverCunmqr(
            handle, side, trans, m, n, k, A, lda, tau, C, ldc, work, lwork, info);
    else
        return hipsolverCunmqrFortran(
            handle, side, trans, m, n, k, A, lda, tau, C, ldc, work, lwork, info);
}

inline hipsolverStatus_t hipsolver_ormqr_unmqr(bool                    FORTRAN,
                                               hipsolverHandle_t       handle,
                                               hipsolverSideMode_t     side,
                                               hipsolverOperation_t    trans,
                                               int                     m,
                                               int                     n,
                                               int                     k,
                                               hipsolverDoubleComplex* A,
                                               int                     lda,
                                               hipsolverDoubleComplex* tau,
                                               hipsolverDoubleComplex* C,
                                               int                     ldc,
                                               hipsolverDoubleComplex* work,
                                               int                     lwork,
                                               int*                    info)
{
    if(!FORTRAN)
        return hipsolverZunmqr(
            handle, side, trans, m, n, k, A, lda, tau, C, ldc, work, lwork, info);
    else
        return hipsolverZunmqrFortran(
            handle, side, trans, m, n, k, A, lda, tau, C, ldc, work, lwork, info);
}
/********************************************************/

/******************** GEQRF ********************/
// normal and strided_batched
inline hipsolverStatus_t hipsolver_geqrf_bufferSize(
    bool FORTRAN, hipsolverHandle_t handle, int m, int n, float* A, int lda, int* lwork)
{
    if(!FORTRAN)
        return hipsolverSgeqrf_bufferSize(handle, m, n, A, lda, lwork);
    else
        return hipsolverSgeqrf_bufferSizeFortran(handle, m, n, A, lda, lwork);
}

inline hipsolverStatus_t hipsolver_geqrf_bufferSize(
    bool FORTRAN, hipsolverHandle_t handle, int m, int n, double* A, int lda, int* lwork)
{
    if(!FORTRAN)
        return hipsolverDgeqrf_bufferSize(handle, m, n, A, lda, lwork);
    else
        return hipsolverDgeqrf_bufferSizeFortran(handle, m, n, A, lda, lwork);
}

inline hipsolverStatus_t hipsolver_geqrf_bufferSize(
    bool FORTRAN, hipsolverHandle_t handle, int m, int n, hipsolverComplex* A, int lda, int* lwork)
{
    if(!FORTRAN)
        return hipsolverCgeqrf_bufferSize(handle, m, n, A, lda, lwork);
    else
        return hipsolverCgeqrf_bufferSizeFortran(handle, m, n, A, lda, lwork);
}

inline hipsolverStatus_t hipsolver_geqrf_bufferSize(bool                    FORTRAN,
                                                    hipsolverHandle_t       handle,
                                                    int                     m,
                                                    int                     n,
                                                    hipsolverDoubleComplex* A,
                                                    int                     lda,
                                                    int*                    lwork)
{
    if(!FORTRAN)
        return hipsolverZgeqrf_bufferSize(handle, m, n, A, lda, lwork);
    else
        return hipsolverZgeqrf_bufferSizeFortran(handle, m, n, A, lda, lwork);
}

inline hipsolverStatus_t hipsolver_geqrf(bool              FORTRAN,
                                         hipsolverHandle_t handle,
                                         int               m,
                                         int               n,
                                         float*            A,
                                         int               lda,
                                         int               stA,
                                         float*            tau,
                                         int               stT,
                                         float*            work,
                                         int               lwork,
                                         int*              info,
                                         int               bc)
{
    if(!FORTRAN)
        return hipsolverSgeqrf(handle, m, n, A, lda, tau, work, lwork, info);
    else
        return hipsolverSgeqrfFortran(handle, m, n, A, lda, tau, work, lwork, info);
}

inline hipsolverStatus_t hipsolver_geqrf(bool              FORTRAN,
                                         hipsolverHandle_t handle,
                                         int               m,
                                         int               n,
                                         double*           A,
                                         int               lda,
                                         int               stA,
                                         double*           tau,
                                         int               stT,
                                         double*           work,
                                         int               lwork,
                                         int*              info,
                                         int               bc)
{
    if(!FORTRAN)
        return hipsolverDgeqrf(handle, m, n, A, lda, tau, work, lwork, info);
    else
        return hipsolverDgeqrfFortran(handle, m, n, A, lda, tau, work, lwork, info);
}

inline hipsolverStatus_t hipsolver_geqrf(bool              FORTRAN,
                                         hipsolverHandle_t handle,
                                         int               m,
                                         int               n,
                                         hipsolverComplex* A,
                                         int               lda,
                                         int               stA,
                                         hipsolverComplex* tau,
                                         int               stT,
                                         hipsolverComplex* work,
                                         int               lwork,
                                         int*              info,
                                         int               bc)
{
    if(!FORTRAN)
        return hipsolverCgeqrf(handle, m, n, A, lda, tau, work, lwork, info);
    else
        return hipsolverCgeqrfFortran(handle, m, n, A, lda, tau, work, lwork, info);
}

inline hipsolverStatus_t hipsolver_geqrf(bool                    FORTRAN,
                                         hipsolverHandle_t       handle,
                                         int                     m,
                                         int                     n,
                                         hipsolverDoubleComplex* A,
                                         int                     lda,
                                         int                     stA,
                                         hipsolverDoubleComplex* tau,
                                         int                     stT,
                                         hipsolverDoubleComplex* work,
                                         int                     lwork,
                                         int*                    info,
                                         int                     bc)
{
    if(!FORTRAN)
        return hipsolverZgeqrf(handle, m, n, A, lda, tau, work, lwork, info);
    else
        return hipsolverZgeqrfFortran(handle, m, n, A, lda, tau, work, lwork, info);
}
/********************************************************/

/******************** GETRF ********************/
// normal and strided_batched
inline hipsolverStatus_t hipsolver_getrf_bufferSize(
    bool FORTRAN, hipsolverHandle_t handle, int m, int n, float* A, int lda, int* lwork)
{
    if(!FORTRAN)
        return hipsolverSgetrf_bufferSize(handle, m, n, A, lda, lwork);
    else
        return hipsolverSgetrf_bufferSizeFortran(handle, m, n, A, lda, lwork);
}

inline hipsolverStatus_t hipsolver_getrf_bufferSize(
    bool FORTRAN, hipsolverHandle_t handle, int m, int n, double* A, int lda, int* lwork)
{
    if(!FORTRAN)
        return hipsolverDgetrf_bufferSize(handle, m, n, A, lda, lwork);
    else
        return hipsolverDgetrf_bufferSizeFortran(handle, m, n, A, lda, lwork);
}

inline hipsolverStatus_t hipsolver_getrf_bufferSize(
    bool FORTRAN, hipsolverHandle_t handle, int m, int n, hipsolverComplex* A, int lda, int* lwork)
{
    if(!FORTRAN)
        return hipsolverCgetrf_bufferSize(handle, m, n, A, lda, lwork);
    else
        return hipsolverCgetrf_bufferSizeFortran(handle, m, n, A, lda, lwork);
}

inline hipsolverStatus_t hipsolver_getrf_bufferSize(bool                    FORTRAN,
                                                    hipsolverHandle_t       handle,
                                                    int                     m,
                                                    int                     n,
                                                    hipsolverDoubleComplex* A,
                                                    int                     lda,
                                                    int*                    lwork)
{
    if(!FORTRAN)
        return hipsolverZgetrf_bufferSize(handle, m, n, A, lda, lwork);
    else
        return hipsolverZgetrf_bufferSizeFortran(handle, m, n, A, lda, lwork);
}

inline hipsolverStatus_t hipsolver_getrf(bool              FORTRAN,
                                         bool              NPVT,
                                         hipsolverHandle_t handle,
                                         int               m,
                                         int               n,
                                         float*            A,
                                         int               lda,
                                         int               stA,
                                         float*            work,
                                         int*              ipiv,
                                         int               stP,
                                         int*              info,
                                         int               bc)
{
    switch(bool2marshal(FORTRAN, NPVT))
    {
    case C_NORMAL:
        return hipsolverSgetrf(handle, m, n, A, lda, work, ipiv, info);
    case C_NORMAL_ALT:
        return hipsolverSgetrf(handle, m, n, A, lda, work, nullptr, info);
    case FORTRAN_NORMAL:
        return hipsolverSgetrfFortran(handle, m, n, A, lda, work, ipiv, info);
    case FORTRAN_NORMAL_ALT:
        return hipsolverSgetrfFortran(handle, m, n, A, lda, work, nullptr, info);
    default:
        return HIPSOLVER_STATUS_NOT_SUPPORTED;
    }
}

inline hipsolverStatus_t hipsolver_getrf(bool              FORTRAN,
                                         bool              NPVT,
                                         hipsolverHandle_t handle,
                                         int               m,
                                         int               n,
                                         double*           A,
                                         int               lda,
                                         int               stA,
                                         double*           work,
                                         int*              ipiv,
                                         int               stP,
                                         int*              info,
                                         int               bc)
{
    switch(bool2marshal(FORTRAN, NPVT))
    {
    case C_NORMAL:
        return hipsolverDgetrf(handle, m, n, A, lda, work, ipiv, info);
    case C_NORMAL_ALT:
        return hipsolverDgetrf(handle, m, n, A, lda, work, nullptr, info);
    case FORTRAN_NORMAL:
        return hipsolverDgetrfFortran(handle, m, n, A, lda, work, ipiv, info);
    case FORTRAN_NORMAL_ALT:
        return hipsolverDgetrfFortran(handle, m, n, A, lda, work, nullptr, info);
    default:
        return HIPSOLVER_STATUS_NOT_SUPPORTED;
    }
}

inline hipsolverStatus_t hipsolver_getrf(bool              FORTRAN,
                                         bool              NPVT,
                                         hipsolverHandle_t handle,
                                         int               m,
                                         int               n,
                                         hipsolverComplex* A,
                                         int               lda,
                                         int               stA,
                                         hipsolverComplex* work,
                                         int*              ipiv,
                                         int               stP,
                                         int*              info,
                                         int               bc)
{
    switch(bool2marshal(FORTRAN, NPVT))
    {
    case C_NORMAL:
        return hipsolverCgetrf(handle, m, n, A, lda, work, ipiv, info);
    case C_NORMAL_ALT:
        return hipsolverCgetrf(handle, m, n, A, lda, work, nullptr, info);
    case FORTRAN_NORMAL:
        return hipsolverCgetrfFortran(handle, m, n, A, lda, work, ipiv, info);
    case FORTRAN_NORMAL_ALT:
        return hipsolverCgetrfFortran(handle, m, n, A, lda, work, nullptr, info);
    default:
        return HIPSOLVER_STATUS_NOT_SUPPORTED;
    }
}

inline hipsolverStatus_t hipsolver_getrf(bool                    FORTRAN,
                                         bool                    NPVT,
                                         hipsolverHandle_t       handle,
                                         int                     m,
                                         int                     n,
                                         hipsolverDoubleComplex* A,
                                         int                     lda,
                                         int                     stA,
                                         hipsolverDoubleComplex* work,
                                         int*                    ipiv,
                                         int                     stP,
                                         int*                    info,
                                         int                     bc)
{
    switch(bool2marshal(FORTRAN, NPVT))
    {
    case C_NORMAL:
        return hipsolverZgetrf(handle, m, n, A, lda, work, ipiv, info);
    case C_NORMAL_ALT:
        return hipsolverZgetrf(handle, m, n, A, lda, work, nullptr, info);
    case FORTRAN_NORMAL:
        return hipsolverZgetrfFortran(handle, m, n, A, lda, work, ipiv, info);
    case FORTRAN_NORMAL_ALT:
        return hipsolverZgetrfFortran(handle, m, n, A, lda, work, nullptr, info);
    default:
        return HIPSOLVER_STATUS_NOT_SUPPORTED;
    }
}
/********************************************************/

/******************** GETRS ********************/
// normal and strided_batched
inline hipsolverStatus_t hipsolver_getrs(bool                 FORTRAN,
                                         hipsolverHandle_t    handle,
                                         hipsolverOperation_t trans,
                                         int                  n,
                                         int                  nrhs,
                                         float*               A,
                                         int                  lda,
                                         int                  stA,
                                         int*                 ipiv,
                                         int                  stP,
                                         float*               B,
                                         int                  ldb,
                                         int                  stB,
                                         int*                 info,
                                         int                  bc)
{
    if(!FORTRAN)
        return hipsolverSgetrs(handle, trans, n, nrhs, A, lda, ipiv, B, ldb, info);
    else
        return hipsolverSgetrsFortran(handle, trans, n, nrhs, A, lda, ipiv, B, ldb, info);
}

inline hipsolverStatus_t hipsolver_getrs(bool                 FORTRAN,
                                         hipsolverHandle_t    handle,
                                         hipsolverOperation_t trans,
                                         int                  n,
                                         int                  nrhs,
                                         double*              A,
                                         int                  lda,
                                         int                  stA,
                                         int*                 ipiv,
                                         int                  stP,
                                         double*              B,
                                         int                  ldb,
                                         int                  stB,
                                         int*                 info,
                                         int                  bc)
{
    if(!FORTRAN)
        return hipsolverDgetrs(handle, trans, n, nrhs, A, lda, ipiv, B, ldb, info);
    else
        return hipsolverDgetrsFortran(handle, trans, n, nrhs, A, lda, ipiv, B, ldb, info);
}

inline hipsolverStatus_t hipsolver_getrs(bool                 FORTRAN,
                                         hipsolverHandle_t    handle,
                                         hipsolverOperation_t trans,
                                         int                  n,
                                         int                  nrhs,
                                         hipsolverComplex*    A,
                                         int                  lda,
                                         int                  stA,
                                         int*                 ipiv,
                                         int                  stP,
                                         hipsolverComplex*    B,
                                         int                  ldb,
                                         int                  stB,
                                         int*                 info,
                                         int                  bc)
{
    if(!FORTRAN)
        return hipsolverCgetrs(handle, trans, n, nrhs, A, lda, ipiv, B, ldb, info);
    else
        return hipsolverCgetrsFortran(handle, trans, n, nrhs, A, lda, ipiv, B, ldb, info);
}

inline hipsolverStatus_t hipsolver_getrs(bool                    FORTRAN,
                                         hipsolverHandle_t       handle,
                                         hipsolverOperation_t    trans,
                                         int                     n,
                                         int                     nrhs,
                                         hipsolverDoubleComplex* A,
                                         int                     lda,
                                         int                     stA,
                                         int*                    ipiv,
                                         int                     stP,
                                         hipsolverDoubleComplex* B,
                                         int                     ldb,
                                         int                     stB,
                                         int*                    info,
                                         int                     bc)
{
    if(!FORTRAN)
        return hipsolverZgetrs(handle, trans, n, nrhs, A, lda, ipiv, B, ldb, info);
    else
        return hipsolverZgetrsFortran(handle, trans, n, nrhs, A, lda, ipiv, B, ldb, info);
}
/********************************************************/

/******************** POTRF ********************/
// normal and strided_batched
inline hipsolverStatus_t hipsolver_potrf_bufferSize(bool                FORTRAN,
                                                    hipsolverHandle_t   handle,
                                                    hipsolverFillMode_t uplo,
                                                    int                 n,
                                                    float*              A,
                                                    int                 lda,
                                                    int*                lwork)
{
    if(!FORTRAN)
        return hipsolverSpotrf_bufferSize(handle, uplo, n, A, lda, lwork);
    else
        return hipsolverSpotrf_bufferSizeFortran(handle, uplo, n, A, lda, lwork);
}

inline hipsolverStatus_t hipsolver_potrf_bufferSize(bool                FORTRAN,
                                                    hipsolverHandle_t   handle,
                                                    hipsolverFillMode_t uplo,
                                                    int                 n,
                                                    double*             A,
                                                    int                 lda,
                                                    int*                lwork)
{
    if(!FORTRAN)
        return hipsolverDpotrf_bufferSize(handle, uplo, n, A, lda, lwork);
    else
        return hipsolverDpotrf_bufferSizeFortran(handle, uplo, n, A, lda, lwork);
}

inline hipsolverStatus_t hipsolver_potrf_bufferSize(bool                FORTRAN,
                                                    hipsolverHandle_t   handle,
                                                    hipsolverFillMode_t uplo,
                                                    int                 n,
                                                    hipsolverComplex*   A,
                                                    int                 lda,
                                                    int*                lwork)
{
    if(!FORTRAN)
        return hipsolverCpotrf_bufferSize(handle, uplo, n, A, lda, lwork);
    else
        return hipsolverCpotrf_bufferSizeFortran(handle, uplo, n, A, lda, lwork);
}

inline hipsolverStatus_t hipsolver_potrf_bufferSize(bool                    FORTRAN,
                                                    hipsolverHandle_t       handle,
                                                    hipsolverFillMode_t     uplo,
                                                    int                     n,
                                                    hipsolverDoubleComplex* A,
                                                    int                     lda,
                                                    int*                    lwork)
{
    if(!FORTRAN)
        return hipsolverZpotrf_bufferSize(handle, uplo, n, A, lda, lwork);
    else
        return hipsolverZpotrf_bufferSizeFortran(handle, uplo, n, A, lda, lwork);
}

inline hipsolverStatus_t hipsolver_potrf(bool                FORTRAN,
                                         hipsolverHandle_t   handle,
                                         hipsolverFillMode_t uplo,
                                         int                 n,
                                         float*              A,
                                         int                 lda,
                                         int                 stA,
                                         float*              work,
                                         int                 lwork,
                                         int*                info,
                                         int                 bc)
{
    if(!FORTRAN)
        return hipsolverSpotrf(handle, uplo, n, A, lda, work, lwork, info);
    else
        return hipsolverSpotrfFortran(handle, uplo, n, A, lda, work, lwork, info);
}

inline hipsolverStatus_t hipsolver_potrf(bool                FORTRAN,
                                         hipsolverHandle_t   handle,
                                         hipsolverFillMode_t uplo,
                                         int                 n,
                                         double*             A,
                                         int                 lda,
                                         int                 stA,
                                         double*             work,
                                         int                 lwork,
                                         int*                info,
                                         int                 bc)
{
    if(!FORTRAN)
        return hipsolverDpotrf(handle, uplo, n, A, lda, work, lwork, info);
    else
        return hipsolverDpotrfFortran(handle, uplo, n, A, lda, work, lwork, info);
}

inline hipsolverStatus_t hipsolver_potrf(bool                FORTRAN,
                                         hipsolverHandle_t   handle,
                                         hipsolverFillMode_t uplo,
                                         int                 n,
                                         hipsolverComplex*   A,
                                         int                 lda,
                                         int                 stA,
                                         hipsolverComplex*   work,
                                         int                 lwork,
                                         int*                info,
                                         int                 bc)
{
    if(!FORTRAN)
        return hipsolverCpotrf(handle, uplo, n, A, lda, work, lwork, info);
    else
        return hipsolverCpotrfFortran(handle, uplo, n, A, lda, work, lwork, info);
}

inline hipsolverStatus_t hipsolver_potrf(bool                    FORTRAN,
                                         hipsolverHandle_t       handle,
                                         hipsolverFillMode_t     uplo,
                                         int                     n,
                                         hipsolverDoubleComplex* A,
                                         int                     lda,
                                         int                     stA,
                                         hipsolverDoubleComplex* work,
                                         int                     lwork,
                                         int*                    info,
                                         int                     bc)
{
    if(!FORTRAN)
        return hipsolverZpotrf(handle, uplo, n, A, lda, work, lwork, info);
    else
        return hipsolverZpotrfFortran(handle, uplo, n, A, lda, work, lwork, info);
}

// batched
inline hipsolverStatus_t hipsolver_potrf(bool                FORTRAN,
                                         hipsolverHandle_t   handle,
                                         hipsolverFillMode_t uplo,
                                         int                 n,
                                         float*              A[],
                                         int                 lda,
                                         int                 stA,
                                         float*              work,
                                         int                 lwork,
                                         int*                info,
                                         int                 bc)
{
    if(!FORTRAN)
        return hipsolverSpotrfBatched(handle, uplo, n, A, lda, info, bc);
    else
        return hipsolverSpotrfBatchedFortran(handle, uplo, n, A, lda, info, bc);
}

inline hipsolverStatus_t hipsolver_potrf(bool                FORTRAN,
                                         hipsolverHandle_t   handle,
                                         hipsolverFillMode_t uplo,
                                         int                 n,
                                         double*             A[],
                                         int                 lda,
                                         int                 stA,
                                         double*             work,
                                         int                 lwork,
                                         int*                info,
                                         int                 bc)
{
    if(!FORTRAN)
        return hipsolverDpotrfBatched(handle, uplo, n, A, lda, info, bc);
    else
        return hipsolverDpotrfBatchedFortran(handle, uplo, n, A, lda, info, bc);
}

inline hipsolverStatus_t hipsolver_potrf(bool                FORTRAN,
                                         hipsolverHandle_t   handle,
                                         hipsolverFillMode_t uplo,
                                         int                 n,
                                         hipsolverComplex*   A[],
                                         int                 lda,
                                         int                 stA,
                                         hipsolverComplex*   work,
                                         int                 lwork,
                                         int*                info,
                                         int                 bc)
{
    if(!FORTRAN)
        return hipsolverCpotrfBatched(handle, uplo, n, A, lda, info, bc);
    else
        return hipsolverCpotrfBatchedFortran(handle, uplo, n, A, lda, info, bc);
}

inline hipsolverStatus_t hipsolver_potrf(bool                    FORTRAN,
                                         hipsolverHandle_t       handle,
                                         hipsolverFillMode_t     uplo,
                                         int                     n,
                                         hipsolverDoubleComplex* A[],
                                         int                     lda,
                                         int                     stA,
                                         hipsolverDoubleComplex* work,
                                         int                     lwork,
                                         int*                    info,
                                         int                     bc)
{
    if(!FORTRAN)
        return hipsolverZpotrfBatched(handle, uplo, n, A, lda, info, bc);
    else
        return hipsolverZpotrfBatchedFortran(handle, uplo, n, A, lda, info, bc);
}
/********************************************************/