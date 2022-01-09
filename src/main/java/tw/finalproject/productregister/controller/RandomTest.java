package tw.finalproject.productregister.controller;

import java.util.Random;

public class RandomTest {

	
	public static Integer Random() {
		Random random = new Random();
		Integer r = random.nextInt(900000000) + 100000000;
		return r;
	}
	
	public static void main(String[] args) {
		System.out.println(Random());
	}
}
