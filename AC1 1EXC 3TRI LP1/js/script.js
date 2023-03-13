var num= Math.floor(Math.random() * 10+1);
function random(){
    let np=parseInt(document.getElementById("np").value);
    if(np>10 || np==0){
        alert(`O numero é de 1 a 10.`)
    }else if(np==num){
        alert(`Você acertou o numero!`) 
        document.getElementById("res").innerHTML=`Você acertou o numero!`
    }else{
        if(np>num){
            document.getElementById("res").innerHTML=`O numero é menor.`
        }
        if(np<num){
            document.getElementById("res").innerHTML=`O numero é maior.`
        }
    }
}
