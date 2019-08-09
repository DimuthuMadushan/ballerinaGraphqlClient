#Represent graphql endpoint configuretion
# +url - The name of the endpoint
# +clientConfig - configurations of graphql client
public type GraphqlConfiguration record{
    string url;
    http:ClientEndpointConfig clientConfig = {};
};

#Represent json payload
json payload={};
map<json> tempPayload = <map<json>> payload;

#Represent variables and value pair in payload
json variables ={};
map<json> tempVariables = <map<json>> variables;