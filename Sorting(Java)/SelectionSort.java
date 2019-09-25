package selectionsort;

/**
 *
 * @author Casey Dixon
 */
public class SelectionSort {

    public static void main(String[] args) {
        int[] array = new int[]{42, 16, 84, 12, 77, 26, 53};
        array = selectionSort(array, array.length);
        for (int a = 0; a < array.length; a++) {
            System.out.print(array[a] + " ");
        }
        System.out.println();
    }

    public static int[] selectionSort(int[] array, int length) {
        int min = 0, i;
        if (length == 1) {
            array[min] = array[length - 1];
            return array;
        }
        for(int a=0;a<array.length;a++)
        {    
            if (array[min] > array[length - 1]) 
            {
            int temp = array[min];
            array[min] = array[length - 1];
            array[length - 1] = temp;
            min++;
            }
        }
        for (int j = 0; j < array.length; j++) {
            System.out.print(array[j] + " ");
        }
        System.out.println();

        selectionSort(array, length - 1);

        System.out.println(length + " " + min);
        /*int temp = array[length - 1];
        array[length - 1] = array[min];
        array[length - 1] = temp;*/

        return array;
    }

}
