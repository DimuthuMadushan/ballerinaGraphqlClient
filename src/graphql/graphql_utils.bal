
import ballerina/io;


function setQuery(string input) {
    tempPayload["query"] = input;
}

function setOperation(string input){
    tempPayload["operationName"] = input;
}

function setInt(string name,int value){
    tempVariables[name] = value;
    tempPayload["variables"] = variables;

}

function setFloat(string name, float value){
    tempVariables[name] = value;
    tempPayload["variables"] = variables;
}

function setString(string name, string value){
    tempVariables[name] = value;
    tempPayload["variables"] = variables;
}

function setBoolean(string name, boolean isTrue){
    tempVariables[name] = isTrue;
    tempPayload["variables"] = variables;
}

function getPayload() returns @untainted json{
        return payload;
    
}



function sendPayload(http:Client basicClient) returns @tainted json{
    io:println(getPayload());
    http:Request req = new;
    req.setJsonPayload(getPayload());
    http:Client GQLClient = basicClient;
    var resp = GQLClient-> post("/POST",req);
    return handleResponse(resp);

}

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