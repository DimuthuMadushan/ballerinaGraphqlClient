import ballerina/test;
import ballerina/io;

# Before Suite Function

@test:BeforeSuite
function beforeSuiteFunc () {
    io:println("I'm the before suite function!");
}

# Before test function

function beforeFunc () {
    io:println("I'm the before function!");
}

# Test function
GraphqlConfiguration graphql = {
    url:"http://localhost:33841"
};
Client gql = new(graphql);
@test:Config{
    before:"beforeFunc",
    after:"afterFunc"

}
function testFunction () {
    io:println("I'm in test function!");
    test:assertTrue(true , msg = "Failed!");
    string nested_field ="query get($id:ID,$dir:Boolean!){
                            person(personID: $id) {
                              name
                            gender
                            homeworld @skip(if:$dir){
                              name
                            }
                            starshipConnection {
                              edges {
                                node {
                                  id
                                  manufacturers
                                }
                              }
                            }
                          }
                        }
                        ";
    string argument ="query {
                        allStarships(first: 7) {
                            edges {
                            node {
                                id
                                name
                                model
                                costInCredits
                                pilotConnection {
                                edges {
                                    node {
                                    name 
                                    homeworld {
                                        name
                                    }               
                                    }
                                }
                                }
                            }
                            }
                        }
                        }";
    string introspection = "{
                            __type(name: \"Person\") {
                              name 
                              fields {
                                name 

                                description
                                type { name }
                              }
                            }
                          }";
    
    gql.setQuery(introspection);
    //gql.setOperationName("mutation");
    //gql.bindInt("id", 4);
   // gql.bindBoolean("dir", false);
    var response = gql->execute();
    if (response is json) {
        io:println(response);
        }
}

# After test function

function afterFunc () {
    io:println("I'm the after function!");
}

# After Suite Function

@test:AfterSuite
function afterSuiteFunc () {
    io:println("I'm the after suite function!");
}

