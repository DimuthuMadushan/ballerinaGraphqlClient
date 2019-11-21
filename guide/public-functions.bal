
#Represent graphql endpoint configuretion
# +url - The name of the endpoint
# +clientConfig - configurations of graphql client
public type GraphqlConfiguration record{
    string url;
};


# Object for Graphql endpoint
# + basicClient - HTTP client endpoint for basic api
public type Client client object{
    public http:Client basicClient;
    
    #initialize Graphql endpoint
    public function __init(GraphqlConfiguration graphqlConfig){
        self.basicClient = new(graphqlConfig.url);
    }

    #Set the query in json payload
    # +query - query which is sent to the graphql server
    public function setQuery(string query){
        setQuery(query);
    }

    #Set the operation name in json payload
    # +name - Operation name
    public function setOperationName(string name){
        setOperation(name);

    }

    #Bind the int value to the given variable 
    # +variable - variable name
    # +value - Int value 
    public function bindInt(string variable, int value){
        setInt(variable, value);

    }

    #Bind the Float value to the given variable 
    # +variable - varialble name
    # +value - float value 
    public function bindFloat(string variable, float value){
        setFloat(variable, value);
    }

    #Bind the Boolean value to the given variable 
    # +variable - variable name
    # +value - float value
    public function bindBoolean(string variable, boolean value){
        setBoolean(variable, value);
    }

    #Bind the String value to the given variable 
    # +variable - variable name
    # +value - string value
    public function bindString(string variable, string value){
        setString(variable, value);
    }

    #Send the json payload to the given endpoint
    # +return - If success, returns json response object,else returns error
    public remote function execute()  returns @tainted json|error{
        return sendPayload(self.basicClient);

    }

};




