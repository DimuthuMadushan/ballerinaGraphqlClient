
#Represent graphql endpoint configuretion
# +url - The name of the endpoint
public type GraphqlConfiguration record{
    string url;
};

#Represent json payload
json payload={
    "query":"",
    "operationName":"",
    "variables":null
};
map<json> tempPayload = <map<json>> payload;

#Represent variables and value pair in payload
json variables ={};
map<json> tempVariables = <map<json>> variables;