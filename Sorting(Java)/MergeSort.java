package newpackage;

/**
 *
 * @author Casey Dixon
 */
public class MergeSort {

    public static void main(String[] args) {
        int[] unsortedArray = new int[10];
        unsortedArray[0] = 75;
        unsortedArray[1] = 56;
        unsortedArray[2] = 85;
        unsortedArray[3] = 90;
        unsortedArray[4] = 49;
        unsortedArray[5] = 26;
        unsortedArray[6] = 12;
        unsortedArray[7] = 48;
        unsortedArray[8] = 40;
        unsortedArray[9] = 47;
        sort(unsortedArray, unsortedArray.length);
    }

    public static void sort(int[] unsortedArray, int length) {
        int mid = (length - 1) / 2;
        int sizeFront = mid + 1;
        int[] frontHalf = new int[sizeFront];
        int sizeBack = length - sizeFront;
        int[] backHalf = new int[sizeBack];
        System.out.print("split:    ");
        printArray(unsortedArray);
        if (length > 1) {
            System.arraycopy(unsortedArray, 0, frontHalf, 0, sizeFront);
            System.out.print("          ");
            printArray(frontHalf);
            for (int j = 0; j < sizeBack; j++) {
                backHalf[j] = unsortedArray[mid + 1 + j];
            }
            System.out.print("          ");
            printWhiteSpace(length / 2 + 1);
            printArray(backHalf);
            sort(frontHalf, frontHalf.length);
            sort(backHalf, backHalf.length);
            merge(unsortedArray, frontHalf, backHalf);
        }
    }

    public static void merge(int[] unsortedArray, int[] frontHalf, int[] backHalf) {
        int i = 0, j = 0, k = 0;
        int sizeFront = frontHalf.length;
        int sizeBack = backHalf.length;
        System.out.print("merge:    ");
        printArray(frontHalf);
        System.out.print("          ");
        printWhiteSpace(sizeFront);
        printArray(backHalf);
        while (i < sizeFront && j < sizeBack) {
            if (frontHalf[i] <= backHalf[j]) {
                unsortedArray[k] = frontHalf[i];
                i++;
                k++;
            } else {
                unsortedArray[k] = backHalf[j];
                j++;
                k++;
            }
        }
        while (i < sizeFront) {
            unsortedArray[k] = frontHalf[i];
            i++;
            k++;
        }
        while (j < sizeBack) {
            unsortedArray[k] = backHalf[j];
            j++;
            k++;
        }
        System.out.print("          ");
        printArray(unsortedArray);
    }

    public static void printArray(int[] array) {

        for (int i = 0; i < array.length; i++) {
            System.out.print(array[i] + " ");
        }
        System.out.println();
    }

    public static void printWhiteSpace(int size) {
        for (int i = 0; i < size * 3; i++) {
            System.out.print(" ");
        }
    }
}
