package com.example.karate;

import com.intuit.karate.junit5.Karate;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;

import java.io.FileWriter;
import java.io.IOException;

public class PetStoreAPIJsonTestRunner {
    @Karate.Test
    Karate testPetStoreJsonAPI() {

        return Karate.run("classpath:karate/petstore-updated.feature")
                .relativeTo(getClass());
    }


}
