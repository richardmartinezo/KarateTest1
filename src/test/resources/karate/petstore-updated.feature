Feature: Updated Petstore API tests

  Background:
    * def petData = read('../testdata/petstore-data.json')
    * print 'Pet Data:', petData


  Scenario: Add a new pet
    Given url 'https://petstore.swagger.io/v2/pet'
    And request { "id": petData.createPet.id, "name": petData.createPet.name, "status": petData.createPet.status }
    When method POST
    Then status 200
    And match response.name == petData.createPet.name
    And match response.status == petData.createPet.status

  Scenario: Update the pet information
    Given url 'https://petstore.swagger.io/v2/pet'
    And request { "id": petData.updatePet.id, "name": petData.updatePet.name, "status": petData.updatePet.status }
    When method PUT
    Then status 200
    And match response.name == petData.updatePet.name
    And match response.status == petData.updatePet.status

  Scenario: Search for pets by status 'sold'
    Given url 'https://petstore.swagger.io/v2/pet/findByStatus?status=' + petData.searchByStatus.status
    When method GET
    Then status 200
    And match each response[*].status == petData.searchByStatus.status