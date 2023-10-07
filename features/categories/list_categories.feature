@categories @list
Feature: list categories
    As a user, I want to be able to list categories 

    Scenario: I fetch categories
        Given the system knows about the following categories:
        | Id | name       | weight | parent_id |
        | 1  | c1         | 0      | null      |
        | 2  | c2         | 1      | 1         |
        | 3  | Eleganti   | 0      | null      |
        | 4  | Casual     | 0      | null      |
        | 5  | Alte       | 1      | 4         |
        | 6  | Basse      | 1      | 4         |
        When I POST graphql with this body: 
        """
        {"query": "query {categories {name categories {name categories {name}}}}"}
        """
        Then I should receive a response with this data:
        """
        {
    "data": {
        "categories": [
            {
                "name": "c1",
                "categories": [
                    {
                        "name": "c2",
                        "categories": []
                    }
                ]
            },
            {
                "name": "Eleganti",
                "categories": []
            },
            {
                "name": "Casual",
                "categories": [
                    {
                        "name": "Basse",
                        "categories": []
                    },
                    {
                        "name": "Alte",
                        "categories": []
                    }
                ]
            }
        ]
    }
} 
        """