//帮助理解static在java中的用法

public class UseStatic {


	private static int s;

	public UseStatic() {

		System.out.println("Create new Class");

	}

	static {

		System.out.println("static block initialized");

	}

	public int getStatic() {

		return s;

	}

	public void setStatic(int i) {

		s = i;

	}

	public static void main(String[] args) {

		// TODO Auto-generated method stub

		UseStatic classA = new UseStatic();

		UseStatic classB = new UseStatic();

		System.out.println("classA.s=" + classA.getStatic() + ";classB.s="
				+ classB.getStatic());

		classA.setStatic(10);

		System.out.println("classA.s=" + classA.getStatic() + ";classB.s="
				+ classB.getStatic());

		classB.setStatic(classB.getStatic() + 10);

		System.out.println("classA.s=" + classA.getStatic() + ";classB.s="
				+ classB.getStatic());

	}
}