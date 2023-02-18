@IsTest
public with sharing class ProductControllerTest {
    
    @TestSetup
    static void makeData(){
        List<Product2> products = TestFactory.createSObjectList(new Product2(), 5, TestFactoryDefaults.Product2Defaults.class.toString(), true);
    }

    @IsTest
    private static void shouldGetProducts(){       
        List<Product2> products = ProductSelector.getProducts();
        List<Product2> secondProducts = ProductController.getProducts();

        System.assertEquals(products.size(), secondProducts.size(), 'size of both lists should be equal');   
        System.assertEquals(products.get(0).Id, secondProducts.get(0).Id, 'Ids should be the equal');
    }
}