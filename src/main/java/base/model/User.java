package base.model;

import lombok.AllArgsConstructor;
import lombok.Data;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "_user")
@Data
@AllArgsConstructor
public class User {
    @Id
    @Column(name = "user_name")
    private String username; // is registered email address

    private String password;
    public User(){};
}
