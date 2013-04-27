@txn @active
Feature: Entering New Survey Information
  In order to enter the information that I receive from a client about a new survey they want undertaken into the system
  As a collection front door manager
  I want to enter certain tombstone information that applies to the entire survey

  <<Acceptance Criteria:>>

  * I should be able to navigate to the new survey screen from the main menu

  * I should have the option to enter tombstone information about the survey (name, acronym, type, client division, program element code, mandatory/voluntary)

  Background: Facts about divisions

    Given the following divisions exist
      | English Name        | French Name                | English Acronym | French Acronym |
      | Demography Division | Division de la démographie | DEM             | DEM            |

  Scenario: A new survey

    Given there are no existing surveys
    When I register a new survey with the following information
      | English Name          | French Name              | English Acronym | French Acronym | Type of Survey | Client Division | Participation | Program Elements |
      | General Social Survey | Enquête sociale générale | GSS             | ESG            | Social         | DEM             | voluntary     | 1430             |
    Then the surveys are created
    And a confirmation message is displayed saying: "The General Social Survey has been successfully added."

  Scenario: Restrictions on types of surveys

    Given there are no existing surveys
    When I select a type of survey to enter
    Then I should be presented the following options for survey type
      | Survey Type  |
      | Business     |
      | Social       |
      | Agricultural |
      | Other        |
