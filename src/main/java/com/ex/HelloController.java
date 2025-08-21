package com.ex;

import org.springframework.web.bind.annotation.*;

import java.util.Map;

@RestController
public class HelloController {

    @GetMapping("/hello")
    public String hello() {
        return "Hello from Docker + Kubernetes!";
    }

    @GetMapping("/hello2")
    public String hello(@RequestParam String name) {
        System.out.println("good boy");
        return "Hello boy, " + name + "!";
    }

    @PostMapping("/user")
    public String createUser(@RequestBody Map<String, Object> user) {
        return "User created: " + user.get("username") + ", age: " + user.get("age");
    }
}