Feature: PetStore API Testing

  Scenario: Add a new pet to the store
    Given url 'https://petstore.swagger.io/v2/pet'
    And request { "id": 1001, "name": "Hela", "status": "available" }
    When method POST
    Then status 200
    And match response.id == 1001
    And match response.name == "Hela"


  Scenario: Get a pet by ID
    Given url 'https://petstore.swagger.io/v2/pet/1001'
    When method GET
    Then status 200
    And match response contains { "id": 1001, "name": "Hela" }

  Scenario: Update the pet information
    Given url 'https://petstore.swagger.io/v2/pet'
    And request { "id": 1001, "name": "HelaUpdated", "status": "sold" }
    When method PUT
    Then status 200
    And match response.name == "HelaUpdated"
    And match response.status == "sold"

  Scenario: Get a pet by STATUS
    Given url 'https://petstore.swagger.io/v2/pet/findByStatus?status=sold'
    When method GET
    Then status 200
    And match each response[*].status == "sold"
    And match response.name == "HelaUpdated"

  Scenario: Delete the pet by ID
    Given url 'https://petstore.swagger.io/v2/pet/1001'
    When method DELETE
    Then status 200
    And match response.message == "1001"