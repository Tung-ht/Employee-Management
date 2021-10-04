package base.service;

import java.util.List;
import java.util.Optional;

import base.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import base.model.Employee;
import base.repo.*;

@Service
public class EmployeeService implements IEmployeeService {
	@Autowired
	private IEmployeeRepo iEmployeeRepo;

	@Autowired
	private IUserRepo iUSerRepo;

	@Override
	public List<Employee> getAll() {
		return iEmployeeRepo.findAll();
	}

	@Override
	public Employee addEmployee(Employee e) {
		User user = new User(e.getEmail(), e.getPassword());
		iUSerRepo.save(user);
		e.setUser(user);
		iEmployeeRepo.save(e);
		return e;
	}

	@Override
	public void deleteById(long id) {
		Optional<Employee> optional = iEmployeeRepo.findById(id);
		if (optional.isPresent()) {
			iEmployeeRepo.deleteById(id);
		} else {
			throw new RuntimeException("Not found anything by id = " + id);
		}
	}

	@Override
	public Employee getById(long id) {
		Optional<Employee> optional = iEmployeeRepo.findById(id);
		Employee e = null;
		if (optional.isPresent()) {
			e = optional.get();
			return e;
		} else {
			throw new RuntimeException("Not found anything by id = " + id);
		}
	}

	@Override
	public Employee updateById(Long id, Employee e) {
		try {
			Employee entity = getById(id);
			entity.setFirstName(e.getFirstName());
			entity.setLastName(e.getLastName());
			entity.setPhone(e.getPhone());
			entity.setDepartment(e.getDepartment());
			entity.setEmail(e.getEmail());
			entity.setPassword(e.getPassword()); // set luon cho user.password
			User user = entity.getUser();
			iUSerRepo.save(user);	// chi doi dc mat khau, ko doi dc user_name( = email luc dau)
			iEmployeeRepo.save(entity);
			return entity;
		} catch (Exception exc) {
			System.out.println("Not found employee with id = " + id);
			return null;
		}
	}

	@Override
	public List<Employee> searchByName(String str) {
		return iEmployeeRepo.searchByName(str);
	}
	
	@Override
	public Page<Employee> findPaginated(int pageNo, int pageSize){
		Pageable pageable = PageRequest.of(pageNo-1, pageSize, Sort.by("id").ascending());
		return iEmployeeRepo.findAll(pageable);
	}
}
