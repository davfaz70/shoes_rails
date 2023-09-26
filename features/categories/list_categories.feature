@categories @list
Feature: list categories
    As a user, I want to be able to list categories 

    Scenario: I fetch categories
        Given the system knows about the following categories:
        | Id | name | weight | parent_id |
        | 1  | c1   | 0      | null      |
        | 2  | c2   | 1      | 1         |
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
                    }
                ]
            }
        } 
        """