package com.mohsen.oauth2.server;

import java.security.Principal;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@EnableGlobalMethodSecurity(prePostEnabled = true)
public class ResourceController {

	@GetMapping("user_resource")
	@PreAuthorize("hasAuthority('AUTHORIZED_RESOURCE_USER')")
	public String my_resource1_user(Principal principal) {
		return "Hi " + principal.getName() + ". welcome";
	}

	@GetMapping("admin_resource")
	@PreAuthorize("hasAuthority('AUTHORIZED_RESOURCE_ADMIN')")
	public String my_resource1_admin(Principal principal) {
		return "Hi " + principal.getName() + ". welcome";
	}
}
