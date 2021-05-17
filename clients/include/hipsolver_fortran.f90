! ************************************************************************
!  Copyright 2020 Advanced Micro Devices, Inc.
! ************************************************************************

module hipsolver_interface
    use iso_c_binding
    use hipsolver

    contains

    !------------!
    !   LAPACK   !
    !------------!

    ! ******************** ORMQR/UNMQR ********************
    function hipsolverSormqr_bufferSizeFortran(handle, side, trans, m, n, k, A, lda, tau, C, ldc, lwork) &
            result(res) &
            bind(c, name = 'hipsolverSormqr_bufferSizeFortran')
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
        integer(c_int) :: res
        res = hipsolverSormqr_bufferSize(handle, side, trans, m, n, k, A, lda, tau, C, ldc, lwork)
    end function hipsolverSormqr_bufferSizeFortran
    
    function hipsolverDormqr_bufferSizeFortran(handle, side, trans, m, n, k, A, lda, tau, C, ldc, lwork) &
            result(res) &
            bind(c, name = 'hipsolverDormqr_bufferSizeFortran')
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
        integer(c_int) :: res
        res = hipsolverDormqr_bufferSize(handle, side, trans, m, n, k, A, lda, tau, C, ldc, lwork)
    end function hipsolverDormqr_bufferSizeFortran
    
    function hipsolverCunmqr_bufferSizeFortran(handle, side, trans, m, n, k, A, lda, tau, C, ldc, lwork) &
            result(res) &
            bind(c, name = 'hipsolverCunmqr_bufferSizeFortran')
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
        integer(c_int) :: res
        res = hipsolverCunmqr_bufferSize(handle, side, trans, m, n, k, A, lda, tau, C, ldc, lwork)
    end function hipsolverCunmqr_bufferSizeFortran
    
    function hipsolverZunmqr_bufferSizeFortran(handle, side, trans, m, n, k, A, lda, tau, C, ldc, lwork) &
            result(res) &
            bind(c, name = 'hipsolverZunmqr_bufferSizeFortran')
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
        integer(c_int) :: res
        res = hipsolverZunmqr_bufferSize(handle, side, trans, m, n, k, A, lda, tau, C, ldc, lwork)
    end function hipsolverZunmqr_bufferSizeFortran
    
    function hipsolverSormqrFortran(handle, side, trans, m, n, k, A, lda, tau, C, ldc, work, lwork, info) &
            result(res) &
            bind(c, name = 'hipsolverSormqrFortran')
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
        integer(c_int) :: res
        res = hipsolverSormqr(handle, side, trans, m, n, k, A, lda, tau, C, ldc, work, lwork, info)
    end function hipsolverSormqrFortran
    
    function hipsolverDormqrFortran(handle, side, trans, m, n, k, A, lda, tau, C, ldc, work, lwork, info) &
            result(res) &
            bind(c, name = 'hipsolverDormqrFortran')
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
        integer(c_int) :: res
        res = hipsolverDormqr(handle, side, trans, m, n, k, A, lda, tau, C, ldc, work, lwork, info)
    end function hipsolverDormqrFortran
    
    function hipsolverCunmqrFortran(handle, side, trans, m, n, k, A, lda, tau, C, ldc, work, lwork, info) &
            result(res) &
            bind(c, name = 'hipsolverCunmqrFortran')
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
        integer(c_int) :: res
        res = hipsolverCunmqr(handle, side, trans, m, n, k, A, lda, tau, C, ldc, work, lwork, info)
    end function hipsolverCunmqrFortran
    
    function hipsolverZunmqrFortran(handle, side, trans, m, n, k, A, lda, tau, C, ldc, work, lwork, info) &
            result(res) &
            bind(c, name = 'hipsolverZunmqrFortran')
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
        integer(c_int) :: res
        res = hipsolverZunmqr(handle, side, trans, m, n, k, A, lda, tau, C, ldc, work, lwork, info)
    end function hipsolverZunmqrFortran

    ! ******************** GEQRF ********************
    function hipsolverSgeqrf_bufferSizeFortran(handle, m, n, A, lda, lwork) &
            result(res) &
            bind(c, name = 'hipsolverSgeqrf_bufferSizeFortran')
        use iso_c_binding
        use hipsolver_enums
        implicit none
        type(c_ptr), value :: handle
        integer(c_int), value :: m
        integer(c_int), value :: n
        type(c_ptr), value :: A
        integer(c_int), value :: lda
        type(c_ptr), value :: lwork
        integer(c_int) :: res
        res = hipsolverSgeqrf_bufferSize(handle, m, n, A, lda, lwork)
    end function hipsolverSgeqrf_bufferSizeFortran
    
    function hipsolverDgeqrf_bufferSizeFortran(handle, m, n, A, lda, lwork) &
            result(res) &
            bind(c, name = 'hipsolverDgeqrf_bufferSizeFortran')
        use iso_c_binding
        use hipsolver_enums
        implicit none
        type(c_ptr), value :: handle
        integer(c_int), value :: m
        integer(c_int), value :: n
        type(c_ptr), value :: A
        integer(c_int), value :: lda
        type(c_ptr), value :: lwork
        integer(c_int) :: res
        res = hipsolverDgeqrf_bufferSize(handle, m, n, A, lda, lwork)
    end function hipsolverDgeqrf_bufferSizeFortran
    
    function hipsolverCgeqrf_bufferSizeFortran(handle, m, n, A, lda, lwork) &
            result(res) &
            bind(c, name = 'hipsolverCgeqrf_bufferSizeFortran')
        use iso_c_binding
        use hipsolver_enums
        implicit none
        type(c_ptr), value :: handle
        integer(c_int), value :: m
        integer(c_int), value :: n
        type(c_ptr), value :: A
        integer(c_int), value :: lda
        type(c_ptr), value :: lwork
        integer(c_int) :: res
        res = hipsolverCgeqrf_bufferSize(handle, m, n, A, lda, lwork)
    end function hipsolverCgeqrf_bufferSizeFortran
    
    function hipsolverZgeqrf_bufferSizeFortran(handle, m, n, A, lda, lwork) &
            result(res) &
            bind(c, name = 'hipsolverZgeqrf_bufferSizeFortran')
        use iso_c_binding
        use hipsolver_enums
        implicit none
        type(c_ptr), value :: handle
        integer(c_int), value :: m
        integer(c_int), value :: n
        type(c_ptr), value :: A
        integer(c_int), value :: lda
        type(c_ptr), value :: lwork
        integer(c_int) :: res
        res = hipsolverZgeqrf_bufferSize(handle, m, n, A, lda, lwork)
    end function hipsolverZgeqrf_bufferSizeFortran

    function hipsolverSgeqrfFortran(handle, m, n, A, lda, tau, work, lwork, info) &
            result(res) &
            bind(c, name = 'hipsolverSgeqrfFortran')
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
        integer(c_int) :: res
        res = hipsolverSgeqrf(handle, m, n, A, lda, tau, work, lwork, info)
    end function hipsolverSgeqrfFortran

    function hipsolverDgeqrfFortran(handle, m, n, A, lda, tau, work, lwork, info) &
            result(res) &
            bind(c, name = 'hipsolverDgeqrfFortran')
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
        integer(c_int) :: res
        res = hipsolverDgeqrf(handle, m, n, A, lda, tau, work, lwork, info)
    end function hipsolverDgeqrfFortran

    function hipsolverCgeqrfFortran(handle, m, n, A, lda, tau, work, lwork, info) &
            result(res) &
            bind(c, name = 'hipsolverCgeqrfFortran')
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
        integer(c_int) :: res
        res = hipsolverCgeqrf(handle, m, n, A, lda, tau, work, lwork, info)
    end function hipsolverCgeqrfFortran

    function hipsolverZgeqrfFortran(handle, m, n, A, lda, tau, work, lwork, info) &
            result(res) &
            bind(c, name = 'hipsolverZgeqrfFortran')
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
        integer(c_int) :: res
        res = hipsolverZgeqrf(handle, m, n, A, lda, tau, work, lwork, info)
    end function hipsolverZgeqrfFortran

    ! ******************** GETRF ********************
    function hipsolverSgetrf_bufferSizeFortran(handle, m, n, A, lda, lwork) &
            result(res) &
            bind(c, name = 'hipsolverSgetrf_bufferSizeFortran')
        use iso_c_binding
        use hipsolver_enums
        implicit none
        type(c_ptr), value :: handle
        integer(c_int), value :: m
        integer(c_int), value :: n
        type(c_ptr), value :: A
        integer(c_int), value :: lda
        type(c_ptr), value :: lwork
        integer(c_int) :: res
        res = hipsolverSgetrf_bufferSize(handle, m, n, A, lda, lwork)
    end function hipsolverSgetrf_bufferSizeFortran
    
    function hipsolverDgetrf_bufferSizeFortran(handle, m, n, A, lda, lwork) &
            result(res) &
            bind(c, name = 'hipsolverDgetrf_bufferSizeFortran')
        use iso_c_binding
        use hipsolver_enums
        implicit none
        type(c_ptr), value :: handle
        integer(c_int), value :: m
        integer(c_int), value :: n
        type(c_ptr), value :: A
        integer(c_int), value :: lda
        type(c_ptr), value :: lwork
        integer(c_int) :: res
        res = hipsolverDgetrf_bufferSize(handle, m, n, A, lda, lwork)
    end function hipsolverDgetrf_bufferSizeFortran
    
    function hipsolverCgetrf_bufferSizeFortran(handle, m, n, A, lda, lwork) &
            result(res) &
            bind(c, name = 'hipsolverCgetrf_bufferSizeFortran')
        use iso_c_binding
        use hipsolver_enums
        implicit none
        type(c_ptr), value :: handle
        integer(c_int), value :: m
        integer(c_int), value :: n
        type(c_ptr), value :: A
        integer(c_int), value :: lda
        type(c_ptr), value :: lwork
        integer(c_int) :: res
        res = hipsolverCgetrf_bufferSize(handle, m, n, A, lda, lwork)
    end function hipsolverCgetrf_bufferSizeFortran
    
    function hipsolverZgetrf_bufferSizeFortran(handle, m, n, A, lda, lwork) &
            result(res) &
            bind(c, name = 'hipsolverZgetrf_bufferSizeFortran')
        use iso_c_binding
        use hipsolver_enums
        implicit none
        type(c_ptr), value :: handle
        integer(c_int), value :: m
        integer(c_int), value :: n
        type(c_ptr), value :: A
        integer(c_int), value :: lda
        type(c_ptr), value :: lwork
        integer(c_int) :: res
        res = hipsolverZgetrf_bufferSize(handle, m, n, A, lda, lwork)
    end function hipsolverZgetrf_bufferSizeFortran

    function hipsolverSgetrfFortran(handle, m, n, A, lda, work, ipiv, info) &
            result(res) &
            bind(c, name = 'hipsolverSgetrfFortran')
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
        integer(c_int) :: res
        res = hipsolverSgetrf(handle, m, n, A, lda, work, ipiv, info)
    end function hipsolverSgetrfFortran
    
    function hipsolverDgetrfFortran(handle, m, n, A, lda, work, ipiv, info) &
            result(res) &
            bind(c, name = 'hipsolverDgetrfFortran')
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
        integer(c_int) :: res
        res = hipsolverDgetrf(handle, m, n, A, lda, work, ipiv, info)
    end function hipsolverDgetrfFortran
    
    function hipsolverCgetrfFortran(handle, m, n, A, lda, work, ipiv, info) &
            result(res) &
            bind(c, name = 'hipsolverCgetrfFortran')
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
        integer(c_int) :: res
        res = hipsolverCgetrf(handle, m, n, A, lda, work, ipiv, info)
    end function hipsolverCgetrfFortran

    function hipsolverZgetrfFortran(handle, m, n, A, lda, work, ipiv, info) &
            result(res) &
            bind(c, name = 'hipsolverZgetrfFortran')
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
        integer(c_int) :: res
        res = hipsolverZgetrf(handle, m, n, A, lda, work, ipiv, info)
    end function hipsolverZgetrfFortran
    
    ! ******************** GETRS ********************
    function hipsolverSgetrsFortran(handle, trans, n, nrhs, A, lda, ipiv, B, ldb, info) &
            result(res) &
            bind(c, name = 'hipsolverSgetrsFortran')
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
        integer(c_int) :: res
        res = hipsolverSgetrs(handle, trans, n, nrhs, A, lda, ipiv, B, ldb, info)
    end function hipsolverSgetrsFortran
    
    function hipsolverDgetrsFortran(handle, trans, n, nrhs, A, lda, ipiv, B, ldb, info) &
            result(res) &
            bind(c, name = 'hipsolverDgetrsFortran')
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
        integer(c_int) :: res
        res = hipsolverDgetrs(handle, trans, n, nrhs, A, lda, ipiv, B, ldb, info)
    end function hipsolverDgetrsFortran
    
    function hipsolverCgetrsFortran(handle, trans, n, nrhs, A, lda, ipiv, B, ldb, info) &
            result(res) &
            bind(c, name = 'hipsolverCgetrsFortran')
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
        integer(c_int) :: res
        res = hipsolverCgetrs(handle, trans, n, nrhs, A, lda, ipiv, B, ldb, info)
    end function hipsolverCgetrsFortran
    
    function hipsolverZgetrsFortran(handle, trans, n, nrhs, A, lda, ipiv, B, ldb, info) &
            result(res) &
            bind(c, name = 'hipsolverZgetrsFortran')
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
        integer(c_int) :: res
        res = hipsolverZgetrs(handle, trans, n, nrhs, A, lda, ipiv, B, ldb, info)
    end function hipsolverZgetrsFortran

    ! ******************** POTRF ********************
    function hipsolverSpotrf_bufferSizeFortran(handle, uplo, n, A, lda, lwork) &
            result(res) &
            bind(c, name = 'hipsolverSpotrf_bufferSizeFortran')
        use iso_c_binding
        use hipsolver_enums
        implicit none
        type(c_ptr), value :: handle
        integer(kind(HIPSOLVER_FILL_MODE_LOWER)), value :: uplo
        integer(c_int), value :: n
        type(c_ptr), value :: A
        integer(c_int), value :: lda
        type(c_ptr), value :: lwork
        integer(c_int) :: res
        res = hipsolverSpotrf_bufferSize(handle, uplo, n, A, lda, lwork)
    end function hipsolverSpotrf_bufferSizeFortran
    
    function hipsolverDpotrf_bufferSizeFortran(handle, uplo, n, A, lda, lwork) &
            result(res) &
            bind(c, name = 'hipsolverDpotrf_bufferSizeFortran')
        use iso_c_binding
        use hipsolver_enums
        implicit none
        type(c_ptr), value :: handle
        integer(kind(HIPSOLVER_FILL_MODE_LOWER)), value :: uplo
        integer(c_int), value :: n
        type(c_ptr), value :: A
        integer(c_int), value :: lda
        type(c_ptr), value :: lwork
        integer(c_int) :: res
        res = hipsolverDpotrf_bufferSize(handle, uplo, n, A, lda, lwork)
    end function hipsolverDpotrf_bufferSizeFortran
    
    function hipsolverCpotrf_bufferSizeFortran(handle, uplo, n, A, lda, lwork) &
            result(res) &
            bind(c, name = 'hipsolverCpotrf_bufferSizeFortran')
        use iso_c_binding
        use hipsolver_enums
        implicit none
        type(c_ptr), value :: handle
        integer(kind(HIPSOLVER_FILL_MODE_LOWER)), value :: uplo
        integer(c_int), value :: n
        type(c_ptr), value :: A
        integer(c_int), value :: lda
        type(c_ptr), value :: lwork
        integer(c_int) :: res
        res = hipsolverCpotrf_bufferSize(handle, uplo, n, A, lda, lwork)
    end function hipsolverCpotrf_bufferSizeFortran
    
    function hipsolverZpotrf_bufferSizeFortran(handle, uplo, n, A, lda, lwork) &
            result(res) &
            bind(c, name = 'hipsolverZpotrf_bufferSizeFortran')
        use iso_c_binding
        use hipsolver_enums
        implicit none
        type(c_ptr), value :: handle
        integer(kind(HIPSOLVER_FILL_MODE_LOWER)), value :: uplo
        integer(c_int), value :: n
        type(c_ptr), value :: A
        integer(c_int), value :: lda
        type(c_ptr), value :: lwork
        integer(c_int) :: res
        res = hipsolverZpotrf_bufferSize(handle, uplo, n, A, lda, lwork)
    end function hipsolverZpotrf_bufferSizeFortran

    function hipsolverSpotrfFortran(handle, uplo, n, A, lda, work, lwork, info) &
            result(res) &
            bind(c, name = 'hipsolverSpotrfFortran')
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
        integer(c_int) :: res
        res = hipsolverSpotrf(handle, uplo, n, A, lda, work, lwork, info)
    end function hipsolverSpotrfFortran

    function hipsolverDpotrfFortran(handle, uplo, n, A, lda, work, lwork, info) &
            result(res) &
            bind(c, name = 'hipsolverDpotrfFortran')
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
        integer(c_int) :: res
        res = hipsolverDpotrf(handle, uplo, n, A, lda, work, lwork, info)
    end function hipsolverDpotrfFortran

    function hipsolverCpotrfFortran(handle, uplo, n, A, lda, work, lwork, info) &
            result(res) &
            bind(c, name = 'hipsolverCpotrfFortran')
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
        integer(c_int) :: res
        res = hipsolverCpotrf(handle, uplo, n, A, lda, work, lwork, info)
    end function hipsolverCpotrfFortran

    function hipsolverZpotrfFortran(handle, uplo, n, A, lda, work, lwork, info) &
            result(res) &
            bind(c, name = 'hipsolverZpotrfFortran')
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
        integer(c_int) :: res
        res = hipsolverZpotrf(handle, uplo, n, A, lda, work, lwork, info)
    end function hipsolverZpotrfFortran
    
    ! ******************** POTRF_BATCHED ********************
    function hipsolverSpotrfBatchedFortran(handle, uplo, n, A, lda, info, batch_count) &
            result(res) &
            bind(c, name = 'hipsolverSpotrfBatchedFortran')
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
        integer(c_int) :: res
        res = hipsolverSpotrfBatched(handle, uplo, n, A, lda, info, batch_count)
    end function hipsolverSpotrfBatchedFortran
    
    function hipsolverDpotrfBatchedFortran(handle, uplo, n, A, lda, info, batch_count) &
            result(res) &
            bind(c, name = 'hipsolverDpotrfBatchedFortran')
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
        integer(c_int) :: res
        res = hipsolverDpotrfBatched(handle, uplo, n, A, lda, info, batch_count)
    end function hipsolverDpotrfBatchedFortran
    
    function hipsolverCpotrfBatchedFortran(handle, uplo, n, A, lda, info, batch_count) &
            result(res) &
            bind(c, name = 'hipsolverCpotrfBatchedFortran')
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
        integer(c_int) :: res
        res = hipsolverCpotrfBatched(handle, uplo, n, A, lda, info, batch_count)
    end function hipsolverCpotrfBatchedFortran
    
    function hipsolverZpotrfBatchedFortran(handle, uplo, n, A, lda, info, batch_count) &
            result(res) &
            bind(c, name = 'hipsolverZpotrfBatchedFortran')
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
        integer(c_int) :: res
        res = hipsolverZpotrfBatched(handle, uplo, n, A, lda, info, batch_count)
    end function hipsolverZpotrfBatchedFortran
    
end module hipsolver_interface