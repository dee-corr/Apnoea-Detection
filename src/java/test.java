public class test
{
	public static void main(String[] args)
	{
		bus myBus = new bus();
		bike myBike = new bike();

		myBus.draw();
		myBike.draw();
		System.out.println("My bus is worth: "  +myBus.getValue());
		System.out.println("My bike is worth: " +myBike.getValue());
	}

}
