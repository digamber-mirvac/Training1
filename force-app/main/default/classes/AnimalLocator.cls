public class AnimalLocator {
    public static String getAnimalNameById (Integer animalId){
        String animalName = '';
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals/' + animalId);
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        // If the request is successful, parse the JSON response.
        if (response.getStatusCode() == 200) {
            JSONParser parser = JSON.createParser(response.getBody());
            
            while (parser.nextToken() != null) {
				if ((parser.getCurrentToken() == JSONToken.FIELD_NAME) && (parser.getText() == 'name')) {
                    // Get the value.
                    parser.nextToken();
                    System.debug('Animal Name:-->' + parser.getText());
					animalName = parser.getText();
                }
            }
            
        }
        return animalName;
    }

}