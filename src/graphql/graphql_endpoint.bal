
import ballerina/io;
import ballerina/http;

public type Client client object{
    public http:Client basicClient;

    public function __init(GraphqlConfiguration graphqlConfig){
        self.basicClient = new(graphqlConfig.url);
    }

    public function setQuery(string query){
        setQuery(query);
    } 
    public function setOperationName(string name){
    setOperation(name);

}
    public function bindInt(string variable, int value){
    setInt(variable, value);

}
    public function bindFloat(string variable, float value){
    setFloat(variable, value);
}
    public function bindBoolean(string variable, boolean value){
    setBoolean(variable, value);
}
    public function bindString(string variable, string value){
    setString(variable, value);
}
    public remote function execute()  returns @tainted json|error{
    return sendPayload(self.basicClient);

}

};


