package binary.search;

import java.util.Scanner;

/**
 *
 * @author Casey Dixon
 */
public class BinarySearch {

    public static void main(String[] args) {
        int[] arr = new int[15];
        arr[0] = 13;
        arr[1] = 18;
        arr[2] = 29;
        arr[3] = 36;
        arr[4] = 42;
        arr[5] = 47;
        arr[6] = 56;
        arr[7] = 57;
        arr[8] = 63;
        arr[9] = 68;
        arr[10] = 80;
        arr[11] = 81;
        arr[12] = 82;
        arr[13] = 88;
        arr[14] = 88;
        Scanner in = new Scanner(System.in);
        int key = 0;
        while (key != -1) {

            System.out.print("What is the key?(Interger,-1 to quit):");
            key = in.nextInt();
            int Match = binarySearch(arr, key);
            if (Match != -1) {
                System.out.println(key + " was found at position " + Match + ".");
            }
        }
        System.out.println("Have a great day!");
    }

    public static int binarySearch(int[] arr, int key) {
        int bottom = 0;
        int top = arr.length - 1;
        while (bottom <= top) {
            if (key == -1) {
                return -1;
            }
            int midpoint = (top + bottom) / 2;
            for (int i = 0; i <= top; i++) {
                if (i < bottom) {
                    System.out.print("   ");
                } else {
                    if (bottom == top) {
                        System.out.print("->");
                    }
                    System.out.print(arr[i] + " ");
                    if (i == midpoint - 1) {
                        System.out.print("->");
                    }
                    if (i == top) {
                        System.out.println();
                    }
                }
            }
            if (key < arr[midpoint]) {
                top = midpoint - 1;

            } else if (key == arr[midpoint]) {
                return midpoint;
            } else {
                bottom = midpoint + 1;
            }
        }
        System.out.println(key + " was not found in the array");
        return -1;
    }
}
