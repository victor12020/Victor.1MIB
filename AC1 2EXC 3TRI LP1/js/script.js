function dado(){
    let d1= Math.floor(Math.random() * 5+1);
    let d2= Math.floor(Math.random() * 5+1);
    let numLimiteInf = 1
    d1 += numLimiteInf;
    d2 += numLimiteInf;
    document.getElementById("d1").innerHTML=`Valor P1=${d1}`
    document.getElementById("d2").innerHTML=`Valor P2=${d2}`
    if(d1>d2){
        document.getElementById("resultado").innerHTML=`O player 1 venceu!`
    }
    else if(d1==d2){
        document.getElementById("resultado").innerHTML=`Vocês empataram!`
    } 
    else{
        document.getElementById("resultado").innerHTML=`O player 2 venceu!`
    }
}