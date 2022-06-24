package com.example.helloapp.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(path = "/api/v1/hello")
public class HelloController {

    @GetMapping
     public ResponseEntity<String> greetings()
     {
        return new ResponseEntity<String>("welcome to hello world", HttpStatus.OK);
     }
}
