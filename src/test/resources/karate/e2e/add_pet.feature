Feature: Transfer from Current accounts to own (transferDestinationType: T003) Fund

  Background:
    * url api.baseUrl
    * path api.pathAddPet
    * def idGen = callonce read('classpath:utils/id_utils.js')
    * def headersGlobal = read("classpath:contracts-schemas/headers/globalHeaders.json")
    * def requestBody = read("classpath:contracts-schemas/requests/schemaRequest.json")
    * def responseBody = read("classpath:contracts-schemas/responses/schemaResponse.json")

    * def filepath = read("classpath:dataDriven/dataSchemaRequests.json")
    #* def requestBody = read("classpath:jsonbase/request/request_body_own_transfer_deposit_to_fund.json")

  @AddPet
  Scenario Outline: Add Pet
    * set requestBody.id = idGen.int(100, 20000)
    * set requestBody.category.id = filepath.scenarios[<case scenarios>].examples[<case examples>].idCategory
    * set requestBody.category.name = filepath.scenarios[<case scenarios>].examples[<case examples>].nameCategory
    * set requestBody.name = filepath.scenarios[<case scenarios>].examples[<case examples>].namePet
    * set requestBody.photoUrls[0] = filepath.scenarios[<case scenarios>].examples[<case examples>].photoUrls
    * set requestBody.tags[0].id = filepath.scenarios[<case scenarios>].examples[<case examples>].idTag
    * set requestBody.tags[0].name = filepath.scenarios[<case scenarios>].examples[<case examples>].nameTag
    * set requestBody.status = filepath.scenarios[<case scenarios>].examples[<case examples>].status
    Given headers headersGlobal
    * print headersGlobal
    When request requestBody
    * print requestBody
    And method POST
    Then status 200
    And match response contains responseBody
    Examples:
      | case scenarios | case examples |
      | 0              | 0             |


  @RemoveRequiredFields
  Scenario Outline: Error when removing required field "<field>"
    * def requestBody = read("classpath:contracts-schemas/requests/bodyRequest.json")
    * print requestBody
    * def removeField = call read('../../utils/removeRequiredField.js')
    * def modifiedBody = JSON.parse(JSON.stringify(requestBody))
    * def modifiedBody = removeField(modifiedBody, '<field>')
    * print modifiedBody

    Given headers headersGlobal
    When request modifiedBody
    And method POST
    Then status 200

    Examples:
      | field         |
      | id            |
      | category_id   |
      | category_name |
      | name          |
      | photoUrls     |
      | tags_id       |
      | tags_name     |
      | status        |
