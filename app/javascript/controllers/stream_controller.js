import { Controller } from "@hotwired/stimulus"
import lax from 'lax.js'

export default class extends Controller {

    static targets =["id", "url"]

    //ToDo: combine so there's only one driver when experimentation is over.
    connect() {
        lax.init();
        lax.addDriver('scrollY', function () {
            return window.scrollY;
        })

        lax.addElements('.memory-container',{
            scrollY:{
                scale: [
                    ["elInY","elCenterY", "elOutY"],
                    [0.85, 1, 0.85],   // Animation value map
                    {
                        inertia: 20        // Options
                    }
                ]
            }
        })
    }
    focus(){
        let id = this.idTarget.id;
        id = id.split("_");
        id = id[1];
        if(this.urlTarget.dataset.url && id){
            const url = this.urlTarget.dataset.url+"?viewing="+id+"&"
            fetch(url).then((r)=>{
               if(r.status===200){
                   console.log("yes");
               }
            })
        }

    }
}