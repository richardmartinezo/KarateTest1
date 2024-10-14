package com.example.karate;

import com.intuit.karate.junit5.Karate;

class PetStoreAPITestRunner {

    @Karate.Test
    Karate testPetStoreAPI() {
        return Karate.run("classpath:karate/petstore.feature").relativeTo(getClass());
    }
}