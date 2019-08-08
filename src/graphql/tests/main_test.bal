import ballerina/test;
import ballerina/io;


GraphqlConfiguration graphql = {
    url:"http://localhost:33841"
};
Client gql = new(graphql);
@test:Config{}
function testQuery() {
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
    
    gql.setQuery(nested_field);
    //gql.setOperationName("mutation");
    gql.bindInt("id", 4);
    gql.bindBoolean("dir", false);
    var response = gql->execute();
    if (response is json) {
        io:println(response);
    }
}
