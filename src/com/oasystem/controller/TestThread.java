package com.oasystem.controller;


public class TestThread {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		NewThread nthread = new NewThread();
		Thread thread = new Thread(new TestImplements());
		
		try {
			
			thread.start();
			nthread.sleep(500);
			nthread.start();
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
	}

}
