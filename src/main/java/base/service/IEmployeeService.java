package base.service;

import java.util.List;

import org.springframework.data.domain.Page;

import base.model.Employee;

public interface IEmployeeService {
	List<Employee> getAll();
	
	/* 
	 * add and update both use repo.save(e) 
	 * if object e is not in the database, add e. Otherwise, save the new attribute of e to the database
	 * We can pass a new id to e with no error, but cannot change the @id field in the database
	 */
	Employee addEmployee(Employee e);
	
	// throw an exception if not found
	void deleteById(long id);
	
	// throw an exception if not found
	Employee getById(long id);
	
	// return null if failed
	Employee updateById(Long id, Employee e);
	
	List<Employee> searchByName(String str);
	
	Page<Employee> findPaginated(int pageNo, int pageSize);
}
