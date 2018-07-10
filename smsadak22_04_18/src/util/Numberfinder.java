package util;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Numberfinder {

	public Numberfinder() {
		// TODO Auto-generated constructor stub
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		
		
		
		
		 String str="PAN-AHGPH6499H";
		 String numberOnly= str.replaceAll("[^0-9]", "");
		
		 System.out.println(numberOnly.substring(0,2));
		
		 String k=numberOnly.substring(0,2).toString();
		 
		  int l=Integer.parseInt(k);
		
		if(l==19)
		{
			System.out.println("this is gst pin");
		}
		else if(l!=19)
		{
			System.out.println("this ispan no");
		}
		
		
		

	}

}
