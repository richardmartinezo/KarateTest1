package com.example.karate;

import com.intuit.karate.junit5.Karate;

public class PetStoreAPIJsonTestRunner {
    @Karate.Test
    Karate testPetStoreJsonAPI() {

        return Karate.run("classpath:karate/petstore-updated.feature").relativeTo(getClass());
    }
}
