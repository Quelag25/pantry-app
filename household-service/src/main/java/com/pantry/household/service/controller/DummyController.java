package com.pantry.household/service.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class DummyController {
    @GetMapping("/health")
    public String healthCheck() {
        return "household-service is up and running!";
    }
}
