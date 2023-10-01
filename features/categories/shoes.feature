@categories @list
Feature: filter shoes
    As a user, I want to be able to filter shoes results by name, material, color ans size

    Scenario: I fetch categories
        Given the system knows about the following shoes:
        | Id | name | material |
        | 1  | Francesine   | Pelle     |
        | 2  | Sniker Basse | Gomma     |
        | 3  | Sniker Alte  | Sintetico |
        | 4  | Oxford       | Similpelle|
        And the system knows about the following shoes_colors_sizes relationships:
        | Id | shoe_id | color_id | size_id |
        | 1  | 1       | 1        | 8       | # color: NERO size: 43 
        | 2  | 1       | 2        | 8       | # color: EBANO size: 43
        | 3  | 1       | 1        | 7       | # color: NERO size: 42
        | 4  | 1       | 2        | 7       | # color: EBANO size: 42
        | 5  | 2       | 1        | 6       | # color: NERO size: 41
        | 6  | 2       | 2        | 6       | # color: EBANO size: 41
        | 7  | 2       | 3        | 9       | # color: BLU size: 44
        | 8  | 2       | 4        | 5       | # color: BIANCO size: 40
        | 9  | 3       | 1        | 1       | # color: NERO size: 36
        | 10 | 3       | 6        | 2       | # color: VERDE size: 37
        | 11 | 3       | 7        | 3       | # color: GIALLO size: 38
        | 12 | 3       | 5        | 4       | # color: ROSSO size: 40
        | 13 | 4       | 1        | 6       | # color: NERO size: 41
        | 14 | 4       | 1        | 8       | # color: NERO size: 43
        | 14 | 4       | 2        | 10      | # color: EBANO size: 45
        | 15 | 4       | 2        | 9       | # color: EBANO size: 44
        And the system knows about the following categories:
        | Id | name       | weight | parent_id |
        | 3  | Eleganti   | 0      | null      |
        | 4  | Casual     | 0      | null      |
        | 5  | Alte       | 1      | 4         |
        | 6  | Basse      | 1      | 4         |
        And the system knows about the following shoes_categories:
        | Id | shoe_id | category_id |
        | 1  | 1       | 3           |
        | 2  | 2       | 4           |
        | 3  | 2       | 6           |
        | 4  | 3       | 4           |
        | 5  | 3       | 5           |
        | 6  | 4       | 3           |
        When I POST graphql with this body: 
        """
        {"query": "query {shoes (name: \"Sniker Basse\", material: \"Gomma\", color: \"BIANCO\", size: 40)  {id, name, material, color, size, categories {name categories {name}}}}"}
        """
        Then I should receive a response with this data:
        """
        {
            "data": {
                "shoes": [
                    {
                        "id": "2",
                        "name": "Sniker Basse",
                        "material": "Gomma",
                        "color": "BIANCO",
                        "size": "40",
                        "categories": [
                            {
                                "name": "Casual",
                                "categories": [
                                    "name": "Basse"
                                ]
                            }
                        ]
                    }
                ]
            }
        } 
        """