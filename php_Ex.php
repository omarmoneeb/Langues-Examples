<?php

function isDivisible($n, $divisor) {
    if ($divisor == 1) {
        return false;
    } elseif ($n % $divisor == 0) {
        return true;
    } else {
        return isDivisible($n, $divisor - 1);
    }
}

function isPrime($n) {
    if ($n < 2) {
        return false;
    } elseif ($n == 2) {
        return true;
    } elseif ($n % 2 == 0) {
        return false;
    } else {
        // Start checking from the largest integer not greater than the square root of $n
        $limit = floor(sqrt($n));
        for ($i = 3; $i <= $limit; $i += 2) {
            if ($n % $i == 0) {
                return false;
            }
        }
        return true;
    }
}

function isPerfectSquare($n) {
    if ($n <= 0) {
        return false;
    }
    $root = floor(sqrt($n));
    return $n == $root * $root;
}

function findFirstPrime($list) {
    foreach ($list as $index => $value) {
        if (isPrime($value)) {
            return $index;
        }
    }
    return -1;
}

function findLastSquare($list) {
    $lastIndex = count($list) - 1;
    for ($i = $lastIndex; $i >= 0; $i--) {
        if (isPerfectSquare($list[$i])) {
            return $i;
        }
    }
    return -1;
}

echo "Enter the size of the array: ";
$size = trim(fgets(STDIN));

if ($size <= 0) {
    echo "Invalid size!\n";
    exit(1);
}

$L = [];
echo "Enter $size numbers for the array: \n";
for ($i = 0; $i < $size; $i++) {
    $L[] = trim(fgets(STDIN));
}

$firstPrimeIndex = findFirstPrime($L);
$lastSquareIndex = findLastSquare($L);

if ($firstPrimeIndex != -1 && $lastSquareIndex != -1 && $firstPrimeIndex < $lastSquareIndex) {
    echo "Sublist S contains: ";
    echo $L[$firstPrimeIndex] . " ";
    for ($i = $firstPrimeIndex + 1; $i < $lastSquareIndex; $i++) {
        echo pow($L[$i], 3) . " ";
    }
    echo $L[$lastSquareIndex] . "\n"; // Print the last perfect square
} else {
    echo "No valid sublist can be formed.\n";
}

?>
