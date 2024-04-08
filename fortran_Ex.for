	program PrimeSquareList
        implicit none
        integer :: n, i
        integer, allocatable :: arr(:)
        integer :: firstPrimeIdx, lastSquareIdx

        ! Ask for array size and allocate
        print *, "Enter the size of the array: "
        read *, n
        allocate(arr(n))

        ! Input array elements
        print *, "Enter ", n, " numbers for the array: "
        do i = 1, n
        read *, arr(i)
        end do

        ! Find first prime and last perfect square
        firstPrimeIdx = findFirstPrime(arr, n)
        lastSquareIdx = findLastSquare(arr, n)

        ! Output results

        ! After finding the indices, modify the output part as follows:

        if (firstPrimeIdx /= 0 .and. lastSquareIdx /= 0) then
        print *, arr(firstPrimeIdx)
        if (lastSquareIdx - firstPrimeIdx > 1) then
        do i = firstPrimeIdx + 1, lastSquareIdx - 1
            print *, arr(i)**3
        end do
        else
        end if
        print *,arr(lastSquareIdx)
        else
         print *, "No valid sublist can be formed."
        end if



        contains

        function isPrime(n) result(isPrimeRes)
        integer, intent(in) :: n
        logical :: isPrimeRes
        integer :: i
        isPrimeRes = .true.
        if (n < 2) then
            isPrimeRes = .false.
            return
        end if
        do i = 2, n / 2
            if (mod(n, i) == 0) then
                isPrimeRes = .false.
                exit
            end if
        end do
        end function isPrime

        function isPerfectSquare(n) result(isPerfectSquareRes)
        integer, intent(in) :: n
        logical :: isPerfectSquareRes
        integer :: sqrtN
        sqrtN = nint(sqrt(real(n)))
        isPerfectSquareRes = (sqrtN*sqrtN == n)
        end function isPerfectSquare

        function findFirstPrime(arr, size) result(idx)
        integer, intent(in) :: arr(:)
        integer, intent(in) :: size
        integer :: idx, i
        idx = 0
        do i = 1, size
            if (isPrime(arr(i))) then
                idx = i
                exit
            end if
        end do
        end function findFirstPrime

        function findLastSquare(arr, size) result(idx)
        integer, intent(in) :: arr(:)
        integer, intent(in) :: size
        integer :: idx, i
        idx = 0
        do i = size, 1, -1
            if (isPerfectSquare(arr(i))) then
                idx = i
                exit
            end if
        end do
        end function findLastSquare

        end program PrimeSquareList
