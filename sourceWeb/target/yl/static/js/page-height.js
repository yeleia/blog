/**
 * Created by dell on 2017/4/27.
 */
console.log(document.body);
window.onload=function resize() {
    document.body.style.height=(window.innerHeight
        || document.documentElement.clientHeight
        || document.body.clientHeight)+'px';
}