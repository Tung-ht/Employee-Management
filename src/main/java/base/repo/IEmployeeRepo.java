package base.repo;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import base.model.Employee;

@Repository
public interface IEmployeeRepo extends JpaRepository<Employee, Long> {
	@Query(value = "select * from employee where lower(concat(first_name, last_name)) like concat('%',?1,'%') ", nativeQuery = true)
	List<Employee> searchByName(String str);
}
