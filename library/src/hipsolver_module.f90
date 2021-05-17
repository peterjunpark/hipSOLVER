! ************************************************************************
!  Copyright 2020 Advanced Micro Devices, Inc.
! ************************************************************************

module hipsolver_enums
    use iso_c_binding

    !---------------------!
    !   hipSOLVER types   !
    !---------------------!

    enum, bind(c)
        enumerator :: HIPSOLVER_OP_N = 111
        enumerator :: HIPSOLVER_OP_T = 112
        enumerator :: HIPSOLVER_OP_C = 113
    end enum

    enum, bind(c)
        enumerator :: HIPSOLVER_FILL_MODE_UPPER = 121
        enumerator :: HIPSOLVER_FILL_MODE_LOWER = 122
    end enum

    enum, bind(c)
        enumerator :: HIPSOLVER_SIDE_LEFT  = 141
        enumerator :: HIPSOLVER_SIDE_RIGHT = 142
    end enum

    enum, bind(c)
        enumerator :: HIPSOLVER_STATUS_SUCCESS           = 0
        enumerator :: HIPSOLVER_STATUS_NOT_INITIALIZED   = 1
        enumerator :: HIPSOLVER_STATUS_ALLOC_FAILED      = 2
        enumerator :: HIPSOLVER_STATUS_INVALID_VALUE     = 3
        enumerator :: HIPSOLVER_STATUS_MAPPING_ERROR     = 4
        enumerator :: HIPSOLVER_STATUS_EXECUTION_FAILED  = 5
        enumerator :: HIPSOLVER_STATUS_INTERNAL_ERROR    = 6
        enumerator :: HIPSOLVER_STATUS_NOT_SUPPORTED     = 7
        enumerator :: HIPSOLVER_STATUS_ARCH_MISMATCH     = 8
        enumerator :: HIPSOLVER_STATUS_HANDLE_IS_NULLPTR = 9
        enumerator :: HIPSOLVER_STATUS_INVALID_ENUM      = 10
        enumerator :: HIPSOLVER_STATUS_UNKNOWN           = 11
    end enum

end module hipsolver_enums

module hipsolver
    use iso_c_binding

    !---------!
    !   Aux   !
    !---------!
    
    interface
        function hipsolverCreate(handle) &
                result(c_int) &
                bind(c, name = 'hipsolverCreate')
            use iso_c_binding
            implicit none
            type(c_ptr), value :: handle
        end function hipsolverCreate
    end interface

    interface
        function hipsolverDestroy(handle) &
                result(c_int) &
                bind(c, name = 'hipsolverDestroy')
            use iso_c_binding
            implicit none
            type(c_ptr), value :: handle
        end function hipsolverDestroy
    end interface

    interface
        function hipsolverSetStream(handle, streamId) &
                result(c_int) &
                bind(c, name = 'hipsolverSetStream')
            use iso_c_binding
            implicit none
            type(c_ptr), value :: handle
            type(c_ptr), value :: streamId
        end function hipsolverSetStream
    end interface

    interface
        function hipsolverGetStream(handle, streamId) &
                result(c_int) &
                bind(c, name = 'hipsolverGetStream')
            use iso_c_binding
            implicit none
            type(c_ptr), value :: handle
            type(c_ptr), value :: streamId
        end function hipsolverGetStream
    end interface

    !------------!
    !   LAPACK   !
    !------------!
    
    ! ******************** ORMQR/UNMQR ********************
    interface
        function hipsolverSormqr_bufferSize(handle, side, trans, m, n, k, A, lda, tau, C, ldc, lwork) &
                result(c_int) &
                bind(c, name = 'hipsolverSormqr_bufferSize')
            use iso_c_binding
            use hipsolver_enums
            implicit none
            type(c_ptr), value :: handle
            integer(kind(HIPSOLVER_SIDE_LEFT)), value :: side
            integer(kind(HIPSOLVER_OP_N)), value :: trans
            integer(c_int), value :: m
            integer(c_int), value :: n
            integer(c_int), value :: k
            type(c_ptr), value :: A
            integer(c_int), value :: lda
            type(c_ptr), value :: tau
            type(c_ptr), value :: C
            integer(c_int), value :: ldc
            type(c_ptr), value :: lwork
        end function hipsolverSormqr_bufferSize
    end interface
    
    interface
        function hipsolverDormqr_bufferSize(handle, side, trans, m, n, k, A, lda, tau, C, ldc, lwork) &
                result(c_int) &
                bind(c, name = 'hipsolverDormqr_bufferSize')
            use iso_c_binding
            use hipsolver_enums
            implicit none
            type(c_ptr), value :: handle
            integer(kind(HIPSOLVER_SIDE_LEFT)), value :: side
            integer(kind(HIPSOLVER_OP_N)), value :: trans
            integer(c_int), value :: m
            integer(c_int), value :: n
            integer(c_int), value :: k
            type(c_ptr), value :: A
            integer(c_int), value :: lda
            type(c_ptr), value :: tau
            type(c_ptr), value :: C
            integer(c_int), value :: ldc
            type(c_ptr), value :: lwork
        end function hipsolverDormqr_bufferSize
    end interface
    
    interface
        function hipsolverCunmqr_bufferSize(handle, side, trans, m, n, k, A, lda, tau, C, ldc, lwork) &
                result(c_int) &
                bind(c, name = 'hipsolverCunmqr_bufferSize')
            use iso_c_binding
            use hipsolver_enums
            implicit none
            type(c_ptr), value :: handle
            integer(kind(HIPSOLVER_SIDE_LEFT)), value :: side
            integer(kind(HIPSOLVER_OP_N)), value :: trans
            integer(c_int), value :: m
            integer(c_int), value :: n
            integer(c_int), value :: k
            type(c_ptr), value :: A
            integer(c_int), value :: lda
            type(c_ptr), value :: tau
            type(c_ptr), value :: C
            integer(c_int), value :: ldc
            type(c_ptr), value :: lwork
        end function hipsolverCunmqr_bufferSize
    end interface
    
    interface
        function hipsolverZunmqr_bufferSize(handle, side, trans, m, n, k, A, lda, tau, C, ldc, lwork) &
                result(c_int) &
                bind(c, name = 'hipsolverZunmqr_bufferSize')
            use iso_c_binding
            use hipsolver_enums
            implicit none
            type(c_ptr), value :: handle
            integer(kind(HIPSOLVER_SIDE_LEFT)), value :: side
            integer(kind(HIPSOLVER_OP_N)), value :: trans
            integer(c_int), value :: m
            integer(c_int), value :: n
            integer(c_int), value :: k
            type(c_ptr), value :: A
            integer(c_int), value :: lda
            type(c_ptr), value :: tau
            type(c_ptr), value :: C
            integer(c_int), value :: ldc
            type(c_ptr), value :: lwork
        end function hipsolverZunmqr_bufferSize
    end interface
    
    interface
        function hipsolverSormqr(handle, side, trans, m, n, k, A, lda, tau, C, ldc, work, lwork, info) &
                result(c_int) &
                bind(c, name = 'hipsolverSormqr')
            use iso_c_binding
            use hipsolver_enums
            implicit none
            type(c_ptr), value :: handle
            integer(kind(HIPSOLVER_SIDE_LEFT)), value :: side
            integer(kind(HIPSOLVER_OP_N)), value :: trans
            integer(c_int), value :: m
            integer(c_int), value :: n
            integer(c_int), value :: k
            type(c_ptr), value :: A
            integer(c_int), value :: lda
            type(c_ptr), value :: tau
            type(c_ptr), value :: C
            integer(c_int), value :: ldc
            type(c_ptr), value :: work
            integer(c_int), value :: lwork
            type(c_ptr), value :: info
        end function hipsolverSormqr
    end interface
    
    interface
        function hipsolverDormqr(handle, side, trans, m, n, k, A, lda, tau, C, ldc, work, lwork, info) &
                result(c_int) &
                bind(c, name = 'hipsolverDormqr')
            use iso_c_binding
            use hipsolver_enums
            implicit none
            type(c_ptr), value :: handle
            integer(kind(HIPSOLVER_SIDE_LEFT)), value :: side
            integer(kind(HIPSOLVER_OP_N)), value :: trans
            integer(c_int), value :: m
            integer(c_int), value :: n
            integer(c_int), value :: k
            type(c_ptr), value :: A
            integer(c_int), value :: lda
            type(c_ptr), value :: tau
            type(c_ptr), value :: C
            integer(c_int), value :: ldc
            type(c_ptr), value :: work
            integer(c_int), value :: lwork
            type(c_ptr), value :: info
        end function hipsolverDormqr
    end interface
    
    interface
        function hipsolverCunmqr(handle, side, trans, m, n, k, A, lda, tau, C, ldc, work, lwork, info) &
                result(c_int) &
                bind(c, name = 'hipsolverCunmqr')
            use iso_c_binding
            use hipsolver_enums
            implicit none
            type(c_ptr), value :: handle
            integer(kind(HIPSOLVER_SIDE_LEFT)), value :: side
            integer(kind(HIPSOLVER_OP_N)), value :: trans
            integer(c_int), value :: m
            integer(c_int), value :: n
            integer(c_int), value :: k
            type(c_ptr), value :: A
            integer(c_int), value :: lda
            type(c_ptr), value :: tau
            type(c_ptr), value :: C
            integer(c_int), value :: ldc
            type(c_ptr), value :: work
            integer(c_int), value :: lwork
            type(c_ptr), value :: info
        end function hipsolverCunmqr
    end interface
    
    interface
        function hipsolverZunmqr(handle, side, trans, m, n, k, A, lda, tau, C, ldc, work, lwork, info) &
                result(c_int) &
                bind(c, name = 'hipsolverZunmqr')
            use iso_c_binding
            use hipsolver_enums
            implicit none
            type(c_ptr), value :: handle
            integer(kind(HIPSOLVER_SIDE_LEFT)), value :: side
            integer(kind(HIPSOLVER_OP_N)), value :: trans
            integer(c_int), value :: m
            integer(c_int), value :: n
            integer(c_int), value :: k
            type(c_ptr), value :: A
            integer(c_int), value :: lda
            type(c_ptr), value :: tau
            type(c_ptr), value :: C
            integer(c_int), value :: ldc
            type(c_ptr), value :: work
            integer(c_int), value :: lwork
            type(c_ptr), value :: info
        end function hipsolverZunmqr
    end interface
    
    ! ******************** GEQRF ********************
    interface
        function hipsolverSgeqrf_bufferSize(handle, m, n, A, lda, lwork) &
                result(c_int) &
                bind(c, name = 'hipsolverSgeqrf_bufferSize')
            use iso_c_binding
            use hipsolver_enums
            implicit none
            type(c_ptr), value :: handle
            integer(c_int), value :: m
            integer(c_int), value :: n
            type(c_ptr), value :: A
            integer(c_int), value :: lda
            type(c_ptr), value :: lwork
        end function hipsolverSgeqrf_bufferSize
    end interface

    interface
        function hipsolverDgeqrf_bufferSize(handle, m, n, A, lda, lwork) &
                result(c_int) &
                bind(c, name = 'hipsolverDgeqrf_bufferSize')
            use iso_c_binding
            use hipsolver_enums
            implicit none
            type(c_ptr), value :: handle
            integer(c_int), value :: m
            integer(c_int), value :: n
            type(c_ptr), value :: A
            integer(c_int), value :: lda
            type(c_ptr), value :: lwork
        end function hipsolverDgeqrf_bufferSize
    end interface

    interface
        function hipsolverCgeqrf_bufferSize(handle, m, n, A, lda, lwork) &
                result(c_int) &
                bind(c, name = 'hipsolverCgeqrf_bufferSize')
            use iso_c_binding
            use hipsolver_enums
            implicit none
            type(c_ptr), value :: handle
            integer(c_int), value :: m
            integer(c_int), value :: n
            type(c_ptr), value :: A
            integer(c_int), value :: lda
            type(c_ptr), value :: lwork
        end function hipsolverCgeqrf_bufferSize
    end interface

    interface
        function hipsolverZgeqrf_bufferSize(handle, m, n, A, lda, lwork) &
                result(c_int) &
                bind(c, name = 'hipsolverZgeqrf_bufferSize')
            use iso_c_binding
            use hipsolver_enums
            implicit none
            type(c_ptr), value :: handle
            integer(c_int), value :: m
            integer(c_int), value :: n
            type(c_ptr), value :: A
            integer(c_int), value :: lda
            type(c_ptr), value :: lwork
        end function hipsolverZgeqrf_bufferSize
    end interface

    interface
        function hipsolverSgeqrf(handle, m, n, A, lda, tau, work, lwork, info) &
                result(c_int) &
                bind(c, name = 'hipsolverSgeqrf')
            use iso_c_binding
            use hipsolver_enums
            implicit none
            type(c_ptr), value :: handle
            integer(c_int), value :: m
            integer(c_int), value :: n
            type(c_ptr), value :: A
            integer(c_int), value :: lda
            type(c_ptr), value :: tau
            type(c_ptr), value :: work
            integer(c_int), value :: lwork
            type(c_ptr), value :: info
        end function hipsolverSgeqrf
    end interface

    interface
        function hipsolverDgeqrf(handle, m, n, A, lda, tau, work, lwork, info) &
                result(c_int) &
                bind(c, name = 'hipsolverDgeqrf')
            use iso_c_binding
            use hipsolver_enums
            implicit none
            type(c_ptr), value :: handle
            integer(c_int), value :: m
            integer(c_int), value :: n
            type(c_ptr), value :: A
            integer(c_int), value :: lda
            type(c_ptr), value :: tau
            type(c_ptr), value :: work
            integer(c_int), value :: lwork
            type(c_ptr), value :: info
        end function hipsolverDgeqrf
    end interface

    interface
        function hipsolverCgeqrf(handle, m, n, A, lda, tau, work, lwork, info) &
                result(c_int) &
                bind(c, name = 'hipsolverCgeqrf')
            use iso_c_binding
            use hipsolver_enums
            implicit none
            type(c_ptr), value :: handle
            integer(c_int), value :: m
            integer(c_int), value :: n
            type(c_ptr), value :: A
            integer(c_int), value :: lda
            type(c_ptr), value :: tau
            type(c_ptr), value :: work
            integer(c_int), value :: lwork
            type(c_ptr), value :: info
        end function hipsolverCgeqrf
    end interface

    interface
        function hipsolverZgeqrf(handle, m, n, A, lda, tau, work, lwork, info) &
                result(c_int) &
                bind(c, name = 'hipsolverZgeqrf')
            use iso_c_binding
            use hipsolver_enums
            implicit none
            type(c_ptr), value :: handle
            integer(c_int), value :: m
            integer(c_int), value :: n
            type(c_ptr), value :: A
            integer(c_int), value :: lda
            type(c_ptr), value :: tau
            type(c_ptr), value :: work
            integer(c_int), value :: lwork
            type(c_ptr), value :: info
        end function hipsolverZgeqrf
    end interface

    ! ******************** GETRF ********************
    interface
        function hipsolverSgetrf_bufferSize(handle, m, n, A, lda, lwork) &
                result(c_int) &
                bind(c, name = 'hipsolverSgetrf_bufferSize')
            use iso_c_binding
            use hipsolver_enums
            implicit none
            type(c_ptr), value :: handle
            integer(c_int), value :: m
            integer(c_int), value :: n
            type(c_ptr), value :: A
            integer(c_int), value :: lda
            type(c_ptr), value :: lwork
        end function hipsolverSgetrf_bufferSize
    end interface
    
    interface
        function hipsolverDgetrf_bufferSize(handle, m, n, A, lda, lwork) &
                result(c_int) &
                bind(c, name = 'hipsolverDgetrf_bufferSize')
            use iso_c_binding
            use hipsolver_enums
            implicit none
            type(c_ptr), value :: handle
            integer(c_int), value :: m
            integer(c_int), value :: n
            type(c_ptr), value :: A
            integer(c_int), value :: lda
            type(c_ptr), value :: lwork
        end function hipsolverDgetrf_bufferSize
    end interface
    
    interface
        function hipsolverCgetrf_bufferSize(handle, m, n, A, lda, lwork) &
                result(c_int) &
                bind(c, name = 'hipsolverCgetrf_bufferSize')
            use iso_c_binding
            use hipsolver_enums
            implicit none
            type(c_ptr), value :: handle
            integer(c_int), value :: m
            integer(c_int), value :: n
            type(c_ptr), value :: A
            integer(c_int), value :: lda
            type(c_ptr), value :: lwork
        end function hipsolverCgetrf_bufferSize
    end interface
    
    interface
        function hipsolverZgetrf_bufferSize(handle, m, n, A, lda, lwork) &
                result(c_int) &
                bind(c, name = 'hipsolverZgetrf_bufferSize')
            use iso_c_binding
            use hipsolver_enums
            implicit none
            type(c_ptr), value :: handle
            integer(c_int), value :: m
            integer(c_int), value :: n
            type(c_ptr), value :: A
            integer(c_int), value :: lda
            type(c_ptr), value :: lwork
        end function hipsolverZgetrf_bufferSize
    end interface

    interface
        function hipsolverSgetrf(handle, m, n, A, lda, work, ipiv, info) &
                result(c_int) &
                bind(c, name = 'hipsolverSgetrf')
            use iso_c_binding
            use hipsolver_enums
            implicit none
            type(c_ptr), value :: handle
            integer(c_int), value :: m
            integer(c_int), value :: n
            type(c_ptr), value :: A
            integer(c_int), value :: lda
            type(c_ptr), value :: work
            type(c_ptr), value :: ipiv
            type(c_ptr), value :: info
        end function hipsolverSgetrf
    end interface
    
    interface
        function hipsolverDgetrf(handle, m, n, A, lda, work, ipiv, info) &
                result(c_int) &
                bind(c, name = 'hipsolverDgetrf')
            use iso_c_binding
            use hipsolver_enums
            implicit none
            type(c_ptr), value :: handle
            integer(c_int), value :: m
            integer(c_int), value :: n
            type(c_ptr), value :: A
            integer(c_int), value :: lda
            type(c_ptr), value :: work
            type(c_ptr), value :: ipiv
            type(c_ptr), value :: info
        end function hipsolverDgetrf
    end interface
    
    interface
        function hipsolverCgetrf(handle, m, n, A, lda, work, ipiv, info) &
                result(c_int) &
                bind(c, name = 'hipsolverCgetrf')
            use iso_c_binding
            use hipsolver_enums
            implicit none
            type(c_ptr), value :: handle
            integer(c_int), value :: m
            integer(c_int), value :: n
            type(c_ptr), value :: A
            integer(c_int), value :: lda
            type(c_ptr), value :: work
            type(c_ptr), value :: ipiv
            type(c_ptr), value :: info
        end function hipsolverCgetrf
    end interface
    
    interface
        function hipsolverZgetrf(handle, m, n, A, lda, work, ipiv, info) &
                result(c_int) &
                bind(c, name = 'hipsolverZgetrf')
            use iso_c_binding
            use hipsolver_enums
            implicit none
            type(c_ptr), value :: handle
            integer(c_int), value :: m
            integer(c_int), value :: n
            type(c_ptr), value :: A
            integer(c_int), value :: lda
            type(c_ptr), value :: work
            type(c_ptr), value :: ipiv
            type(c_ptr), value :: info
        end function hipsolverZgetrf
    end interface

    ! ******************** GETRS ********************
    interface
        function hipsolverSgetrs(handle, trans, n, nrhs, A, lda, ipiv, B, ldb, info) &
                result(c_int) &
                bind(c, name = 'hipsolverSgetrs')
            use iso_c_binding
            use hipsolver_enums
            implicit none
            type(c_ptr), value :: handle
            integer(kind(HIPSOLVER_OP_N)), value :: trans
            integer(c_int), value :: n
            integer(c_int), value :: nrhs
            type(c_ptr), value :: A
            integer(c_int), value :: lda
            type(c_ptr), value :: ipiv
            type(c_ptr), value :: B
            integer(c_int), value :: ldb
            type(c_ptr), value :: info
        end function hipsolverSgetrs
    end interface
    
    interface
        function hipsolverDgetrs(handle, trans, n, nrhs, A, lda, ipiv, B, ldb, info) &
                result(c_int) &
                bind(c, name = 'hipsolverDgetrs')
            use iso_c_binding
            use hipsolver_enums
            implicit none
            type(c_ptr), value :: handle
            integer(kind(HIPSOLVER_OP_N)), value :: trans
            integer(c_int), value :: n
            integer(c_int), value :: nrhs
            type(c_ptr), value :: A
            integer(c_int), value :: lda
            type(c_ptr), value :: ipiv
            type(c_ptr), value :: B
            integer(c_int), value :: ldb
            type(c_ptr), value :: info
        end function hipsolverDgetrs
    end interface
    
    interface
        function hipsolverCgetrs(handle, trans, n, nrhs, A, lda, ipiv, B, ldb, info) &
                result(c_int) &
                bind(c, name = 'hipsolverCgetrs')
            use iso_c_binding
            use hipsolver_enums
            implicit none
            type(c_ptr), value :: handle
            integer(kind(HIPSOLVER_OP_N)), value :: trans
            integer(c_int), value :: n
            integer(c_int), value :: nrhs
            type(c_ptr), value :: A
            integer(c_int), value :: lda
            type(c_ptr), value :: ipiv
            type(c_ptr), value :: B
            integer(c_int), value :: ldb
            type(c_ptr), value :: info
        end function hipsolverCgetrs
    end interface
    
    interface
        function hipsolverZgetrs(handle, trans, n, nrhs, A, lda, ipiv, B, ldb, info) &
                result(c_int) &
                bind(c, name = 'hipsolverZgetrs')
            use iso_c_binding
            use hipsolver_enums
            implicit none
            type(c_ptr), value :: handle
            integer(kind(HIPSOLVER_OP_N)), value :: trans
            integer(c_int), value :: n
            integer(c_int), value :: nrhs
            type(c_ptr), value :: A
            integer(c_int), value :: lda
            type(c_ptr), value :: ipiv
            type(c_ptr), value :: B
            integer(c_int), value :: ldb
            type(c_ptr), value :: info
        end function hipsolverZgetrs
    end interface

    ! ******************** POTRF ********************
    interface
        function hipsolverSpotrf_bufferSize(handle, uplo, n, A, lda, lwork) &
                result(c_int) &
                bind(c, name = 'hipsolverSpotrf_bufferSize')
            use iso_c_binding
            use hipsolver_enums
            implicit none
            type(c_ptr), value :: handle
            integer(kind(HIPSOLVER_FILL_MODE_LOWER)), value :: uplo
            integer(c_int), value :: n
            type(c_ptr), value :: A
            integer(c_int), value :: lda
            type(c_ptr), value :: lwork
        end function hipsolverSpotrf_bufferSize
    end interface
    
    interface
        function hipsolverDpotrf_bufferSize(handle, uplo, n, A, lda, lwork) &
                result(c_int) &
                bind(c, name = 'hipsolverDpotrf_bufferSize')
            use iso_c_binding
            use hipsolver_enums
            implicit none
            type(c_ptr), value :: handle
            integer(kind(HIPSOLVER_FILL_MODE_LOWER)), value :: uplo
            integer(c_int), value :: n
            type(c_ptr), value :: A
            integer(c_int), value :: lda
            type(c_ptr), value :: lwork
        end function hipsolverDpotrf_bufferSize
    end interface
    
    interface
        function hipsolverCpotrf_bufferSize(handle, uplo, n, A, lda, lwork) &
                result(c_int) &
                bind(c, name = 'hipsolverCpotrf_bufferSize')
            use iso_c_binding
            use hipsolver_enums
            implicit none
            type(c_ptr), value :: handle
            integer(kind(HIPSOLVER_FILL_MODE_LOWER)), value :: uplo
            integer(c_int), value :: n
            type(c_ptr), value :: A
            integer(c_int), value :: lda
            type(c_ptr), value :: lwork
        end function hipsolverCpotrf_bufferSize
    end interface
    
    interface
        function hipsolverZpotrf_bufferSize(handle, uplo, n, A, lda, lwork) &
                result(c_int) &
                bind(c, name = 'hipsolverZpotrf_bufferSize')
            use iso_c_binding
            use hipsolver_enums
            implicit none
            type(c_ptr), value :: handle
            integer(kind(HIPSOLVER_FILL_MODE_LOWER)), value :: uplo
            integer(c_int), value :: n
            type(c_ptr), value :: A
            integer(c_int), value :: lda
            type(c_ptr), value :: lwork
        end function hipsolverZpotrf_bufferSize
    end interface

    interface
        function hipsolverSpotrf(handle, uplo, n, A, lda, work, lwork, info) &
                result(c_int) &
                bind(c, name = 'hipsolverSpotrf')
            use iso_c_binding
            use hipsolver_enums
            implicit none
            type(c_ptr), value :: handle
            integer(kind(HIPSOLVER_FILL_MODE_LOWER)), value :: uplo
            integer(c_int), value :: n
            type(c_ptr), value :: A
            integer(c_int), value :: lda
            type(c_ptr), value :: work
            integer(c_int), value :: lwork
            type(c_ptr), value :: info
        end function hipsolverSpotrf
    end interface

    interface
        function hipsolverDpotrf(handle, uplo, n, A, lda, work, lwork, info) &
                result(c_int) &
                bind(c, name = 'hipsolverDpotrf')
            use iso_c_binding
            use hipsolver_enums
            implicit none
            type(c_ptr), value :: handle
            integer(kind(HIPSOLVER_FILL_MODE_LOWER)), value :: uplo
            integer(c_int), value :: n
            type(c_ptr), value :: A
            integer(c_int), value :: lda
            type(c_ptr), value :: work
            integer(c_int), value :: lwork
            type(c_ptr), value :: info
        end function hipsolverDpotrf
    end interface

    interface
        function hipsolverCpotrf(handle, uplo, n, A, lda, work, lwork, info) &
                result(c_int) &
                bind(c, name = 'hipsolverCpotrf')
            use iso_c_binding
            use hipsolver_enums
            implicit none
            type(c_ptr), value :: handle
            integer(kind(HIPSOLVER_FILL_MODE_LOWER)), value :: uplo
            integer(c_int), value :: n
            type(c_ptr), value :: A
            integer(c_int), value :: lda
            type(c_ptr), value :: work
            integer(c_int), value :: lwork
            type(c_ptr), value :: info
        end function hipsolverCpotrf
    end interface

    interface
        function hipsolverZpotrf(handle, uplo, n, A, lda, work, lwork, info) &
                result(c_int) &
                bind(c, name = 'hipsolverZpotrf')
            use iso_c_binding
            use hipsolver_enums
            implicit none
            type(c_ptr), value :: handle
            integer(kind(HIPSOLVER_FILL_MODE_LOWER)), value :: uplo
            integer(c_int), value :: n
            type(c_ptr), value :: A
            integer(c_int), value :: lda
            type(c_ptr), value :: work
            integer(c_int), value :: lwork
            type(c_ptr), value :: info
        end function hipsolverZpotrf
    end interface
    
    ! ******************** POTRF_BATCHED ********************
    interface
        function hipsolverSpotrfBatched(handle, uplo, n, A, lda, info, batch_count) &
                result(c_int) &
                bind(c, name = 'hipsolverSpotrfBatched')
            use iso_c_binding
            use hipsolver_enums
            implicit none
            type(c_ptr), value :: handle
            integer(kind(HIPSOLVER_FILL_MODE_LOWER)), value :: uplo
            integer(c_int), value :: n
            type(c_ptr), value :: A
            integer(c_int), value :: lda
            type(c_ptr), value :: info
            integer(c_int), value :: batch_count
        end function hipsolverSpotrfBatched
    end interface
    
    interface
        function hipsolverDpotrfBatched(handle, uplo, n, A, lda, info, batch_count) &
                result(c_int) &
                bind(c, name = 'hipsolverDpotrfBatched')
            use iso_c_binding
            use hipsolver_enums
            implicit none
            type(c_ptr), value :: handle
            integer(kind(HIPSOLVER_FILL_MODE_LOWER)), value :: uplo
            integer(c_int), value :: n
            type(c_ptr), value :: A
            integer(c_int), value :: lda
            type(c_ptr), value :: info
            integer(c_int), value :: batch_count
        end function hipsolverDpotrfBatched
    end interface
    
    interface
        function hipsolverCpotrfBatched(handle, uplo, n, A, lda, info, batch_count) &
                result(c_int) &
                bind(c, name = 'hipsolverCpotrfBatched')
            use iso_c_binding
            use hipsolver_enums
            implicit none
            type(c_ptr), value :: handle
            integer(kind(HIPSOLVER_FILL_MODE_LOWER)), value :: uplo
            integer(c_int), value :: n
            type(c_ptr), value :: A
            integer(c_int), value :: lda
            type(c_ptr), value :: info
            integer(c_int), value :: batch_count
        end function hipsolverCpotrfBatched
    end interface
    
    interface
        function hipsolverZpotrfBatched(handle, uplo, n, A, lda, info, batch_count) &
                result(c_int) &
                bind(c, name = 'hipsolverZpotrfBatched')
            use iso_c_binding
            use hipsolver_enums
            implicit none
            type(c_ptr), value :: handle
            integer(kind(HIPSOLVER_FILL_MODE_LOWER)), value :: uplo
            integer(c_int), value :: n
            type(c_ptr), value :: A
            integer(c_int), value :: lda
            type(c_ptr), value :: info
            integer(c_int), value :: batch_count
        end function hipsolverZpotrfBatched
    end interface
    
end module hipsolver