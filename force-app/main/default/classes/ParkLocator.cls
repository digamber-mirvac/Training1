public class ParkLocator {
    public static List<String> country (String country){
        
        ParkService.ParksImplPort parkService = new ParkService.ParksImplPort();
        List<String> parkNames = parkService.byCountry(country);
        system.debug('parkNames:-->' + parkNames);
        return parkNames;
    }
}