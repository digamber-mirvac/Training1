@isTest
private class AnimalLocatorTest {
    @isTest static  void testGetCallout() {
        // Set mock callout class 
        Test.setMock(HttpCalloutMock.class, new AnimalLocatorMock()); 
        // This causes a fake response to be sent
        // from the class that implements HttpCalloutMock. 
        String animalName = AnimalLocator.getAnimalNameById(1);
        // Verify that the response received contains fake values
        
        System.assertEquals('chicken', animalName);       
    }   
}