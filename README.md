# Ballerina-GraphQL-Client

The Ballerina GraphQL client allows you to send graphql queries through a graphql endpoint. You can simply send your queries using client's inbuilt functions. It handles basic graphql query request requirements.

# Compatibility

| Ballerina Language Version | 
|:--------------------------:|
|         1.0.0              |

# Getting started
 
1. First you need to import graphq client.
    ```Ballerina 
    import wso2/graphql;   
    ```

2. Configure the GraphQL server endpoint.
   ```
    GraphqlConfiguration graphql = 
        {
            url: " graphql server endpoint url "
        };
    ```

3. Initialize GraphQL client.
   ```
   Client graphql_client = new(graphql);
   ```

These are the steps of initilizing of GraphQL client. In here, record type ***GraphqlConfiguration*** and type ***Client*** are provided by the graphql client library.

# How to send query
After initializing the graphql client, a user can send a query using following steps.

1. Define a query as a ***string*** variable.
   ```
   string query ="query get($id:Int,$dir:Boolean!){
                            person(personID: $id) {
                                name
                                gender
                                homeworld @skip(if:$dir){
                                    name
                                }
                            }
                        }";
    ```
2. Now set the query using ***setQuery(string query)*** function. 
    ```
    graphql_client.setQuery(query);
    ```

3. if the query has variables, it should be bound with appropriate values before send the query.
    ```
    graphql_client.bindInt("id", 4);
    graphql_client.bindBoolean("dir", false);
    ```
    Note:
        if you have string type or float type variables, you can use ***bindString(string name, string value)*** or ***bindFloat(string name, float value)*** functions.

4. You can set the operation type of query using ***setOperation(string OpName)*** function. If your query is **Query** operation type, you can skip this step.

5. Now you can send the query using ***execute()*** remote function. It will return a json response.
   ```
   var response = graphql_client->execute();
   ```
# Complete Example
```
import graphql;

public function main(){
    GraphqlConfiguratiuon graphql = {
        url:"http://localhost:8080"
    };


    Client graphql_client = new(graphql);

    string query = "query get($id:ID,$dir:Boolean!){
                                        person(personID: $id) {
                                            name
                                            gender
                                            homeworld @skip(if:$dir){
                                                name
                                            }
                                        }
                                    }";


    graphql_client.setQuery(query);
    graphql_client.bindInt("id", 4);
    graphql_client.bindBoolean("dir", false);
    var response = graphql_client->execute();

}

