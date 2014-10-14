package CSVtest;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.util.Scanner;
import java.io.IOException;
import org.supercsv.cellprocessor.ParseInt;
import org.supercsv.cellprocessor.constraint.NotNull;
import org.supercsv.cellprocessor.ift.CellProcessor;
import org.supercsv.io.CsvBeanReader;
import org.supercsv.io.ICsvBeanReader;
import org.supercsv.prefs.CsvPreference;

public class CSVRead 
{
	public static void main(String[] args) throws IOException 
	{
		final String fileName = "C:/Users/Dee/Desktop/FYPWorkspace/JSONTest/src/CSVtest/SampleSPO2(1).csv";
		
		File file = new File(fileName);
		
		//create temporary file for contents of above file without space characters
		File temp = new File("tempfile.csv");
		
		//string to hold the characterss of a line
		String data;
		
        try 
        {
        	//to scan SPO2 file
        	Scanner inputStream = new Scanner(file);
		
        	//for writing contents to temp file
			BufferedWriter bw = new BufferedWriter(new FileWriter(temp));
			
			//while next line in file is not empty
			while(inputStream.hasNextLine())
			{
				//put the contents of the next line into string
				data = inputStream.nextLine();
				System.out.println(data);
				
				//replace all space characters with nothing
				data = data.replaceAll("\\s", "");
				System.out.println(data + " spaces removed");
				//write to temporary file
				bw.write(data);
				//begin a new line for writing
				bw.newLine();
			}
			//close bufferwriter
			bw.close();
			//close scanner
			inputStream.close();
			
			System.out.println("Done");
		}
		
		catch(FileNotFoundException e)
		{
			e.printStackTrace();
		}
       
        //call method to read comma separated contents of temp file
		readCSVFile("tempfile.csv");
	}
	
	static void readCSVFile(String fileName) 
	{
	    ICsvBeanReader beanReader = null;
	    
	    //cellprocessor for parsing values into the required datatypes
	    CellProcessor[] processors = new CellProcessor[] 
	    {
	            new NotNull(), // Date
	            new NotNull(), // Time
	            new ParseInt(),// SPO2
	            new ParseInt() // Pulse
	    };
	 
	    try 
	    {
	    	//instantiate BeanReader for reading data into class object SPO2Data
	        beanReader = new CsvBeanReader(new FileReader(fileName), CsvPreference.STANDARD_PREFERENCE);
	        
	        //put values of header (date,time,spo2,pulse) into string
	        String[] header = beanReader.getHeader(true);
	        
	        //instantiate JavaBean for holding SPO2Data
	        SPO2Data o2Data = new SPO2Data();
	        
	        String d, t;
	        int s, p;
	        
	        //while there is still data from the temp file to be read into o2Data
	        while ((o2Data = beanReader.read(SPO2Data.class, header, processors)) != null) 
	        {
	        	d = o2Data.getDate();
	        	t = o2Data.getTime();
	        	s = o2Data.getSPO2();
	        	p = o2Data.getPulse();

	            System.out.println(d + " " + t + " " + s + " " + p);
	        }
	        
	    } 
	    
	    catch (FileNotFoundException ex) 
	    {
	        System.err.println("Could not find the CSV file: " + ex);
	    }
	    catch (IOException ex) 
	    {
	        System.err.println("Error reading the CSV file: " + ex);
	    } 
	    
	    finally 
	    {
	        if (beanReader != null) 
	        {
	            try
	            {
	                beanReader.close();
	            } 
	            
	            catch (IOException ex) 
	            {
	                System.err.println("Error closing the reader: " + ex);
	            }
	        }
	    }
	}
}