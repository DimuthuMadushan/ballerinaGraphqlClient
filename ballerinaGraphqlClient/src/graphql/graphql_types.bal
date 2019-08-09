public type GraphqlConfiguration record{
    string url;
    http:ClientEndpointConfig clientConfig = {};
};


json payload={};

map<json> tempPayload = <map<json>> payload;

json variables ={};

map<json> tempVariables = <map<json>> variables;