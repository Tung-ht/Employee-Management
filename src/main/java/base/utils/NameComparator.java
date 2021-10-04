package base.utils;

import java.util.Comparator;

import base.model.Employee;

public class NameComparator implements Comparator<Employee>{

	@Override
	public int compare(Employee o1, Employee o2) {
		return (o1.getFirstName()+o1.getLastName()).compareToIgnoreCase((o2.getFirstName()+o2.getLastName()));
	}

}
