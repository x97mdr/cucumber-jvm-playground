Feature: Bilingual Survey Names
  In order to conform to government of canada guidelines on official languages, as well as ensure the accessibility of the system to users with screen readers
  As a collection front door manager
  I want the name and acronym of the survey to be specified in both english and french

  <<Acceptance Criteria:>>

  * Names and Acronyms in both English and French are required to be entered

  * Names should have a maximum length of 256 characters

  * Acronyms should have a maximum length of 10 characters

  Scenario Outline: Single name and/or acronym missing

    Given there are no existing surveys
    When I register a new survey with the following information
      | English Name   | French Name   | English Acronym   | French Acronym   |
      | <english name> | <french name> | <english acronym> | <french acronym> |
    Then the survey is not created
    And an error message is displayed saying: "<message>"

  Examples: Bilingual error messages
    | english name | french name                      | english acronym | french acronym | message                           |
    | Rabbit Care  |                                  | RC              | EBEL           | Please enter the French name.     |
    |              | Enquête des bien-être des lapins | RC              | EBEL           | Please enter the English name.    |
    | Rabbit Care  | Enquête des bien-étre des lapins |                 | EBEL           | Please enter the English acronym. |
    | Rabbit Care  | Enquête des bien-étre des lapins | RC              |                | Please enter the French acronym.  |

  Scenario Outline: Multiple names and/or acronyms missing

    Given there are no existing surveys
    When I register a new survey with the following information
      | English Name   | French Name   | English Acronym   | French Acronym   |
      | <english name> | <french name> | <english acronym> | <french acronym> |
    Then the survey is not created
    And an error message is displayed saying: "<message1>"
    And an error message is displayed saying: "<message2>"

  Examples: Bilingual error messages
    | english name | french name                      | english acronym | french acronym | message1                       | message2                          |
    |              | Enquête des bien-être des lapins |                 | EBEL           | Please enter the English name. | Please enter the English acronym. |
    | Rabbit Care  |                                  | RC              |                | Please enter the French name.  | Please enter the French acronym.  |
    |              | Enquête des bien-être des lapins | RC              |                | Please enter the English name. | Please enter the French acronym.  |
    | Rabbit Care  |                                  |                 | EBEL           | Please enter the French name.  | Please enter the English acronym. |

  Scenario Outline: Names have a maximum length of 256 characters

    Given there are no existing surveys
    When I register a new survey with this value in <field>
    """
		The survey of widgits, things, stuff, weird stuff, other things, those things, this, that, the other thing, cars, trucks, automobiles, buses, transfers, trains, airplanes, spaceships, rockets, missiles, happiness, sadness, melancholy, life, death, love and hate
		"""
    Then the value in <field> becomes
    """
		The survey of widgits, things, stuff, weird stuff, other things, those things, this, that, the other thing, cars, trucks, automobiles, buses, transfers, trains, airplanes, spaceships, rockets, missiles, happiness, sadness, melancholy, life, death, love and
		"""

  Examples: Fields that are too long
    | field        |
    | english name |
    | french name  |

  Scenario Outline: Acronyms have a maximum length of 10 characters

    Given there are no existing surveys
    When I register a new survey with this value in <field>
    """
		ATOOLONGACRONYM
		"""
    Then the value in <field> becomes
    """
		ATOOLONGAC
		"""

  Examples: Fields that are too long
    | field           |
    | english acronym |
    | french acronym  |

  Scenario Outline: Name or acronym already in use

    Given the following surveys
      | English Name | French Name                       | English Acronym | French Acronym |
      | Rocket Care  | Enquête des bien-être des rockets | RockC           | EBER           |
    When I register a new survey with the following information
      | English Name   | French Name   | English Acronym   | French Acronym   |
      | <english name> | <french name> | <english acronym> | <french acronym> |
    Then the survey is not created
    And an error message is displayed saying: "<message>"

  Examples: Names already in use
    | english name | french name                       | english acronym | french acronym | message                                                                                                        |
    | Rocket Care  | Enquête des bien-être des lapins  | RC              | EBEL           | The English name entered is already in use by the Rocket Care - please choose another.                         |
    | Rabbit Care  | Enquête des bien-être des rockets | RC              | EBEL           | The French name entered is already in use by the Enquête des bien-être des rockets - please choose another.    |
    | Rabbit Care  | Enquête des bien-être des lapins  | RockC           | EBEL           | The English acronym entered is already in use by the Rocket Care - please choose another.                      |
    | Rabbit Care  | Enquête des bien-être des lapins  | RC              | EBER           | The French acronym entered is already in use by the Enquête des bien-être des rockets - please choose another. |
