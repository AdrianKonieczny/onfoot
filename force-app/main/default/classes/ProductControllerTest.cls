@IsTest
public with sharing class ProductControllerTest {
    
    @IsTest
    private static void shouldGetProducts(){       
        
        List<Product2> testProducts = TestFactory.createSObjectList(new Product2(), 5, TestFactoryDefaults.Product2Defaults.class.toString(), true);
        Test.startTest();
        List<Product2> retrieveProducts = ProductController.getProducts();
        Test.stopTest();

        System.assertEquals(testProducts.size(), retrieveProducts.size(), 'size of both lists should be equal');   
        System.assertEquals(testProducts.get(0).Id, retrieveProducts.get(0).Id, 'Ids should be the equal');
    }

    @IsTest
    private static void shouldNotGetProducts(){
        Test.startTest();
        List<Product2> products = new List<Product2>();       
        products = ProductController.getProducts();
        Test.stopTest();
        
        System.assertEquals(products.size(), 0,'Product Controller should not get any records');
    }
}