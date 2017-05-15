/**
 * Created by yelei on 17-4-29.
 */
var selectAll=document.getElementById('selectAll');
console.log(selectAll);
selectAll.onchange=function (){
    var selects=document.getElementsByClassName('select');
    if(selectAll.checked===true){
        for(var i=0;i<selects.length;i++){

            selects[i].checked=true;
        }
    }
    if(selectAll.checked==false){
        for(var j=0;j<selects.length;j++){
            selects[j].checked=false;
        }
    }
}
