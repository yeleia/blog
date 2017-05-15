/**
 * Created by dell on 2017/5/5.
 */
function check() {
    var form=document.getElementById('changePassword');
    var content=document.getElementsByClassName("modal-body")[0];
    var ps1=content.querySelectorAll('input')[0];
    var ps2=content.querySelectorAll('input')[1];
    if(ps1.value!==ps2.value){
        alert('两次密码输入不相同');
    }
    else {
        form.submit();
    }
}
