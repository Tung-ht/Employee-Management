package base.model;

import lombok.Data;

import javax.persistence.*;

@Entity
@Table(name = "employee")
@Data
public class Employee {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long id;

	@Column(name = "first_name", nullable = false)
	private String firstName;

	@Column(name = "last_name", nullable = false)
	private String lastName;

	private String department;
	private String phone;

	@Column(nullable = false, unique = true)
	private String email;

	@OneToOne
	@JoinColumn(name = "user_name") // is registered email address
	private User user;

	private String password;

	@Column(name = "is_manager", columnDefinition = "boolean default false")
	private boolean isManager;

	public void setPassword(String password){
		this.password = password;
		this.user.setPassword(password);
	}
}
