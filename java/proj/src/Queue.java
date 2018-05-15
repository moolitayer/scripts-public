public class Queue {

    int xCap;
    int yCap;
    int zCap;
    int tick; // seconds since start
    int nextCar; // the index of last car serviced
    int xDemand, yDemand, zDemand; // left to service in each station
    int attempts;
    public int solution(int[] A, int X, int Y, int Z) {
        attempts = 0;
        if (A.length == 0) {
            return 0;
        }
        // Copy input arguments to not change tem
        xCap = X;
        yCap = Y;
        zCap = Z;
        tick = 0;
        nextCar = 0;
        xDemand = yDemand = zDemand = 0;
        while (true) {
            if (attempts > 3) {
                return -1;
            }
            while(service(A)) {
                attempts = 0;
                if (nextCar == A.length) { // Done servicing
                    return tick;
                }
            }
            minTick();
            attempts++;

        }
    }

    private void minTick() {
        // find the smallest demands and service them
        int[] nums = {xDemand, yDemand, zDemand};

        int minValue = getMinValue(nums);
        tick += minValue;
        // Subtract Caps
        if (xCap > 0 && xDemand > 0) {
            xCap -= minValue;
        }
        if (yCap > 0 && yDemand > 0) {
            yCap -= minValue;
        }
        if (zCap > 0 && zDemand > 0) {
            zCap -= minValue;
        }

        if (xDemand > 0) {
            xDemand -= minValue;
        }
        if (yDemand > 0) {
            yDemand -= minValue;
        }
        if (zDemand > 0){
            zDemand -= minValue;
        }

    }

    private boolean service(int[] A) {
        // Attempt to service the next car
        int nextDemand = A[nextCar];
        if (xDemand == 0 && nextDemand <= xCap) { // Service next in x
            xDemand = nextDemand;
            nextCar++;
            return true;
        }
        if (yDemand == 0 && nextDemand <= yCap) { // Service next in y
            yDemand = nextDemand;
            nextCar++;
            return true;
        } else if (zDemand == 0 && nextDemand <= zCap) { // Service next in z
            zDemand = nextDemand;
            nextCar++;
            return true;
        } else {
            return false;
        }

    }

    public static int getMinValue(int[] nums) {
        int ret = Integer.MAX_VALUE;
        for (int n: nums) {
            if (n > 0 && n < ret) {
                ret = n;
            }
        }
        return ret;
    }

    public static void main(String[] args) {
        Queue solver = new Queue();
        int[] cars = {2, 8, 4, 3, 2};
        int solution;
        solution = solver.solution(cars, 7, 11, 3);
        System.out.printf("Solution: %d, %b\n", solution, solution == 8);
        solution = solver.solution(cars, 4, 0, 3);
        System.out.printf("Solution: %d, %b\n", solution, solution == -1);
        cars = new int[0];
        solution = solver.solution(cars, 7, 11, 3);
        System.out.printf("Solution: %d, %b\n", solution, solution == 0);
        int[] carz = {0, 0, 0};
        solution = solver.solution(carz, 0, 0, 0);
        System.out.printf("Solution: %d, %b\n", solution, solution == 0);

    }


}
