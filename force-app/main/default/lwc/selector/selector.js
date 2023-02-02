import { LightningElement } from 'lwc';
import Available_Products from '@salesforce/label/c.Available_Products';
import Select_a_shoe from '@salesforce/label/c.Select_a_shoe';

export default class Selector extends LightningElement {
    selectedProduct;
    availableProducts = Available_Products;
    selectShoe = Select_a_shoe;
    

    handleProductSelected(evt) {
        this.selectedProduct = evt.detail.product;
    }
}
