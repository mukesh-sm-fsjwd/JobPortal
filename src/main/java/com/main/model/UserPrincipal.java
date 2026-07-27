package com.main.model;

import lombok.RequiredArgsConstructor;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import java.util.Collection;
import java.util.List;

@RequiredArgsConstructor
public class UserPrincipal implements UserDetails {

    private final Users users;

    public Collection<? extends GrantedAuthority> getAuthorities() {
        return List.of(new SimpleGrantedAuthority("USER"));
    }

    public String getPassword() {
        return users.getPassword();
    }

    public String getUsername() {
        return users.getUsername();
    }

    public boolean isAccountNonExpired() {
        return UserDetails.super.isAccountNonExpired();
    }

    public boolean isAccountNonLocked() {
        return UserDetails.super.isAccountNonLocked();
    }

    public boolean isCredentialsNonExpired() {
        return UserDetails.super.isCredentialsNonExpired();
    }

    public boolean isEnabled() {
        return UserDetails.super.isEnabled();
    }
}
