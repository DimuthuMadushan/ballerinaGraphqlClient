
import ballerina/io;
import ballerina/http;
#Add query into json object
# +input - string query
function setQuery(string input) {
    tempPayload["query"] = input;
}

#Add operation name into json object
# +input - string operation name
function setOperation(string input){
    tempPayload["operationName"] = input;
}

#Add variable name and int value pair into json object 
# +name - variable name
# +value - Int value
function setInt(string name,int value){
    tempVariables[name] = value;
    tempPayload["variables"] = variables;

}

#Add variable name and float value pair into json object 
# +name - variable name
# +value - Float value
function setFloat(string name, float value){
    tempVariables[name] = value;
    tempPayload["variables"] = variables;
}

#Add variable name and string value pair into json object 
# +name - variable name
# +value - string value
function setString(string name, string value){
    tempVariables[name] = value;
    tempPayload["variables"] = variables;
}

#Add variable name and  boolean value pair into json object 
# +name - variable name
# +isTrue - boolean value
function setBoolean(string name, boolean isTrue){
    tempVariables[name] = isTrue;
    tempPayload["variables"] = variables;
}

#Get complete payload
# +return - json payload
function getPayload() returns @untainted json{
        return payload;
    
}


#Send payload to the given endpoint
# +basicClient - graphql endpoint
# +return - json response
function sendPayload(http:Client basicClient) returns @tainted json{
    io:println(getPayload());
    http:Request req = new;
    req.setJsonPayload(getPayload());
    http:Client GQLClient = basicClient;
    var resp = GQLClient-> post("/POST",req);
    return handleResponse(resp);

}

#Check HTTP response and if no errors return json payload,else return error message
# +response - HTTP response 
# +return - json response or error message
function handleResponse(http:Response|error response)returns @tainted json  {
    if (response is http:Response) {
        var msg = response.getJsonPayload();
        if (msg is json) {
            return (msg);
        } else {
            return msg.reason();

        }
    } else {
        return response.reason();
    }
}