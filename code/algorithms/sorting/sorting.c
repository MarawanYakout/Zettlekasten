/*
** Athor : Marawan Yakout
** Date : 9th May 2026
** Sorting algorithms
** Example input:
** [9,8,7,6,5,4,3,2,1]
** Out:
** [1,2,3,4,5,6,7,8,9]
*/
#include <stdio.h>

/*
** n = count of elements in array
** we need n because C only allocates a contiguous block of memory.
** There is no built-in property like arr.length or arr.size().
** n can be calulated by calulating the size of the array devidec by the number
* of bytes in array
** arr = array with elements that need sorting
*/

void insertionSort(int arr[], int n) {

    int i, j, key; // Declated once for efficency (optional)

    for (i = 1; i < n; ++i) {
        key = arr[i]; // key is the  current element
        j = i - 1; // notice that this gets created every new loop (IMPORTANT)
        // number before key that we need comparing with

        while (j >= 0 && arr[j] > key) {
            arr[j + 1] = arr[j];
            --j; // goes back one step that its at i.e in first itter arr[0]
                 // becomes [-1]
        }
        arr[j + 1] = key; // we add to the arr[-1 + 1] so that we can add the
                          // val in arr[0];
    }
}

void printArr(int arr[], int n) {
    int i;
    for (i = 0; i < n; ++i) {
        printf("%d|", arr[i]);
    }
}

int main(void) {
    int arr[] = {9, 8, 7, 6, 5, 4, 3, 2, 1};
    int n = sizeof(arr) / sizeof(arr[0]);

    printf("Array to be sorted: ");
    printArr(arr, n);

    printf("\n");
    printf("Insert Sorted: ");
    insertionSort(arr, n);
    printArr(arr, n);

    return 0;
}
