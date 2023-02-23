import { LightningElement } from 'lwc';
import availableProductsLabel from '@salesforce/label/c.Available_Products';
import selectShoeLabel from '@salesforce/label/c.Select_a_shoe';

export default class Selector extends LightningElement {
    selectedProduct;
    
    labels = {
        availableProducts: availableProductsLabel,
        selectShoe: selectShoeLabel
    }
    
    handleProductSelected(evt) {
        this.selectedProduct = evt.detail.product;
    }
}
