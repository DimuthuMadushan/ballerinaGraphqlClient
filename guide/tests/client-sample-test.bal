#import graphql client
import graphql;

#configure graphql client endpoint
GraphqlConfiguratiuon graphql = {
    url:"http://localhost:8080"
};

#initialize graphql client endpoint
Client graphql_client = new(graphql);

# query
# use statndard graphql query language 
string query_with_nested_field ="query get($id:ID,$dir:Boolean!){
                            person(personID: $id) {
                              name
                              gender
                            homeworld @skip(if:$dir){
                              name
                            }
                          }
                        }
                        ";

#configure query
graphql_client.setQuery(query_with_nested_field);

#bind query variables
graphql_client.bindInt("id", 4);
graphql_client.bindBoolean("dir", false);

#send query and get response
var response = graphql_client->execute();




#special types of queries

# asign variable without using functions
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

                        
#when using string input inside the query, use following method.
string introspection = "{
                            __type(name: \"Person\") {
                              name 
                              fields {
                                name 

                                description
                                type { 
                                    name
                                     }
                              }
                            }
                          }";