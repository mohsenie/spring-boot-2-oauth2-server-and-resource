This is an oAuth2 authorization server based on spring boot 2. To run the server import the project into your IDE and create an application run profile and apply your specific configuration.

To run with MySql:

1- modify application.yml and set the correct db endpoint and credentials
2- run the application 'ServerApplication' as the main class
3- at this point all required tables are created with time default data
4- use curl and send below paylod to get a token

    curl -X POST http://localhost:8081/oauth/token \
        --header "Authorization:Basic Y2xpZW50X3VzZXJuYW1lOnBhc3MxMjM=" \
        -d "grant_type=password" \
        -d "username=mohsen" \
        -d "password=mypass123"
        
note that `YXBwY2xpZW50OmFwcGNsaWVudEAxMjM=` is the Base 64 converted version of 'client_username:pass123'.