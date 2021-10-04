package base.utils;

import java.util.Comparator;

import base.model.Employee;

public class IdComparator implements Comparator<Employee>{

	// small to large
	@Override
	public int compare(Employee o1, Employee o2) {
		if(o1.getId() > o2.getId()) return 1;
		else if(o1.getId() < o2.getId()) return -1;
		return 0;
	}
}
