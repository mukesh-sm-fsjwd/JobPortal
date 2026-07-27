package com.main.config;

import com.main.model.Users;
import com.main.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.boot.CommandLineRunner;
import org.springframework.context.annotation.Bean;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;

@Component
@RequiredArgsConstructor
public class DataLoader {

    private final PasswordEncoder passwordEncoder;

    @Bean
    public CommandLineRunner commandLineRunner(UserRepository userRepository, PasswordEncoder passwordEncoder){
        return args -> {
            if(userRepository.findByUsername("admin").isEmpty()){
                Users user = new Users();
                user.setId(1);
                user.setUsername("admin");
                user.setPassword(passwordEncoder.encode("admin123"));
                userRepository.save(user);
            }
        };
    }
}
