import { LightningElement, api, track } from 'lwc';
import getProducts from '@salesforce/apex/ProductController.getProducts';



export default class List  extends LightningElement {
    
    shoes;

    connectedCallback() {
        getProducts()
            .then(result => {
                this.shoes = result;
            })
            .catch(error => {
            });
    }
    
}


