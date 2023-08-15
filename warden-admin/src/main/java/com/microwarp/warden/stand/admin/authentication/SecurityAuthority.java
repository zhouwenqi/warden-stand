package com.microwarp.warden.stand.admin.authentication;

import org.springframework.security.core.GrantedAuthority;

/**
 * security - 权限
 * @author zhouwenqi
 */
public class SecurityAuthority implements GrantedAuthority {
    private static final long serialVersionUID = -1000924841102307823L;
    private String authority;
    private String name;
    private Long id;

    @Override
    public String getAuthority() {
        return authority;
    }

    public void setAuthority(String authority) {
        this.authority = authority;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    @Override
    public boolean equals(Object object){
        if(this == object){
            return true;
        }
        if(null == object || this.getClass() != object.getClass()){
            return false;
        }
        GrantedAuthority grantedAuthority = (GrantedAuthority)object;
        return grantedAuthority.getAuthority().equals(object);
    }
}
