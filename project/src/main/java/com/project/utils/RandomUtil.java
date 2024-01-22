package com.project.utils;
import java.util.Random;
public class RandomUtil {
    public static int[] randomNumbers(int count) {
        int[] numbers = new int[count];
        Random random = new Random();

        for (int i = 0; i < count; i++) {
            numbers[i] = random.nextInt(100);
        }

        return numbers;
    }
}
