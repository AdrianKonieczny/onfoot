import { LightningElement, api } from 'lwc';


export default class Tile extends LightningElement {
    @api product;

    tileClick() {
        const event = new CustomEvent('tileclick', {
            bubbles: true,
            composed: true,
            detail:{
                product: this.product
                
            }        
        }          
        );      
        this.dispatchEvent(event);
    }
}
