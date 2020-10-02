package net.watsoncodes.jackson;

import java.io.File;

import com.fasterxml.jackson.databind.ObjectMapper;

public class Driver {

	public static void main(String[] args) {

		try {
			// create object mapper
			ObjectMapper mapper = new ObjectMapper();

			// read JSON file and map to POJO
			Student student = mapper.readValue(new File("data/sample-full.json"), Student.class);

			// print name
			System.out.println("Student: " + student);

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
