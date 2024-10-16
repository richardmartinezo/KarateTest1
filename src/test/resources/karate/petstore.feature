Feature: PetStore API Testing

  Scenario: Add a new pet to the store
    Given url 'https://petstore.swagger.io/v2/pet'
    And request { "id": 1001, "name": "Hela", "status": "available" }
    When method POST
    Then status 200
    And match response.id == 1001
    And match response.name == "Hela"
    * print 'Conclusion: A new pet (Hela) has been successfully added to the store'


  Scenario: Get a pet by ID
    Given url 'https://petstore.swagger.io/v2/pet/1001'
    When method GET
    Then status 200
    And match response contains { "id": 1001, "name": "Hela" }
    * print 'Conclusion: Pet with ID 1001 (Hela) has been successfully retrieved'

  Scenario: Update the pet information
    Given url 'https://petstore.swagger.io/v2/pet'
    And request { "id": 1001, "name": "HelaUpdated", "status": "sold" }
    When method PUT
    Then status 200
    And match response.name == "HelaUpdated"
    And match response.status == "sold"
    * print 'Conclusion: Pet information has been successfully updated to HelaUpdated with status sold'

  Scenario: Get a pet by STATUS
    Given url 'https://petstore.swagger.io/v2/pet/findByStatus?status=sold'
    When method GET
    Then status 200
    And match each response[*].status == "sold"
    And match response.name == "HelaUpdated"
    * print 'Conclusion: All pets with status sold have been successfully retrieved, including HelaUpdated'

  Scenario: Delete the pet by ID
    Given url 'https://petstore.swagger.io/v2/pet/1001'
    When method DELETE
    Then status 200
    And match response.message == "1001"
    * print 'Conclusion: Pet with ID 1001 has been successfully deleted from the store'