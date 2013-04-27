Feature: View all surveys
  In order to see what surveys are currently in the system
  As a collection front door manager
  I want to see a list of all surveys with columns for the tombstone information

  <<Acceptance Criteria:>>

  * If the page is in english, I want to see the english name and acronym

  * If the page is in french, I want to see the french name and acronym

  * I always want to see the type of survey (Social, Business, Agriculture, Other) and contact person

  Background: Facts about divisions

    Given the following divisions exist
      | English Name        | French Name                | English Acronym | French Acronym |
      | Demography Division | Division de la démographie | DEM             | DEM            |

  Scenario: List all surveys

    Given the following surveys
      | English Name                 | French Name                          | English Acronym | French Acronym | Type of Survey | Client Division | Participation | Program Elements |
      | Survey of Household Spending | Enquête sur les dépenses des ménages | SHS             | EDM            | Social         | DEM             | voluntary     | 1431             |
      | Survey of Financial Security | L'Enquête sur la sécurité financière | SFS             | ESF            | Social         | DEM             | voluntary     | 1432             |
    When I look at all surveys in the system
    Then I see the following surveys
      | English Name                 | French Name                          | English Acronym | French Acronym | Type of Survey | Client Division | Participation | Program Elements |
      | Survey of Household Spending | Enquête sur les dépenses des ménages | SHS             | EDM            | Social         | DEM             | voluntary     | 1431             |
      | Survey of Financial Security | L'Enquête sur la sécurité financière | SFS             | ESF            | Social         | DEM             | voluntary     | 1432             |
		