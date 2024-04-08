#include <iostream>
#include <cmath>

bool divisable(int n, int divisor){
	if(divisor == 1)
		return false;
	else if((n % divisor) == 0)
		return true;
	else
	{
		return divisable(n, divisor-1);
	}
}
bool is_prime(int n)
{
	if(n<2){
		return false;
	} else if(n==2){
		return true;
	} else if((n%2) ==0){
		return false;
	} else
	{
		return !divisable(n, sqrt(n));
	}
}

bool is_perfectSqrt(int n)
{	if(n<=0) return false;
	int a = sqrt(n);
	return n == a*a;
}
int findFirstPrime(int lis[], int size)
{
	for(int i = 0; i< size; ++i){
		if(is_prime(lis[i])) return i;
	}
	return -1;
}

int findLastSquare(int lis[],int size){
	for(int i = size-1; i>=0; --i){
		if(is_perfectSqrt(lis[i])) return i;
	}
	return -1;
}

int main()
{
	int size;
	std::cout <<"Enter the size of the array: " << std::endl;
	std::cin >> size;
	if(size<=0) {
		std::cout<< "Invalid size!!" <<std::endl;
		return 1;
	}
	int* L = new int[size];
	std::cout<< "Enter " << size << " numbers for the array: " << std::endl;
	for(int i = 0; i<size; ++i){
		std::cin >> L[i];
	}
	int first_prime_ind = findFirstPrime(L,size);
	int LastSquare_ind = findLastSquare(L,size);
	if (first_prime_ind != -1 && LastSquare_ind != -1 && first_prime_ind  < LastSquare_ind)
	{
		std::cout << "Sublist S contains: ";
		std::cout << L[first_prime_ind] << " ";
		for (int i = first_prime_ind + 1; i < LastSquare_ind; ++i) {
			std::cout << static_cast<int>(std::pow(L[i], 3)) << " ";
		}
		std::cout << L[LastSquare_ind] << std::endl; // Print the last perfect square
    } else {
	    std::cout << "No valid sublist can be formed." << std::endl;
    }
	delete[] L;
	return 0;
}
