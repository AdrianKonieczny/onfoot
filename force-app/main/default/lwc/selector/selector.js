import { LightningElement } from 'lwc';

export default class Selector extends LightningElement {
    selectedProduct;

    handleProductSelected(evt) {
        this.selectedProduct = evt.detail.product;
    }
}
