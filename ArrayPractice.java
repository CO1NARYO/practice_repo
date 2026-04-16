public class ArrayPractice {
    
    public static void printArray(int n[]){
        for(int i = 0; i< n.length; i++){
            System.out.print(n[i] + " ");
 
        }
        System.out.println();
    }
    
    public static void main(String[] args) {
    
    int n[] = {33, 2, 70, 4, 52, 42, 8, 35, 9, 211};
    int OddNumbers = 0, EvenNumbers = 0; 
    int ArraySize = n.length;
    
    
    // First traversal to count even and odd elements
    for(int i = 0; i < ArraySize; i++){
        if(n[i] % 2 == 0){
            EvenNumbers++;
        } else { 
            OddNumbers++;
        }
    }
    
    int even[] = new int[EvenNumbers]; 
    int odd[] = new int[OddNumbers];
    int e = 0, o = 0; 
    
    for(int i = 0; i < ArraySize; i++){
        if(n[i] % 2 == 0){ 
            even[e++] = n[i];
        } else { 
            odd[o++] = n[i];
            }
    }
    
    System.out.print("Even numbers: ");
    printArray(even);
    
    System.out.print("Odd numbers: ");
    printArray(odd);
}
}
    
    