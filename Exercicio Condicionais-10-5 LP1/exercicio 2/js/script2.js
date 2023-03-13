function verificarCredito(){
    let saldo=parseFloat(document.getElementById("inputSaldo").value);
    let credito;
    if(saldo>200 && saldo<=400){
        credito=saldo*0.2;
    }
    else if(saldo>400 && saldo<=600){
        credito=saldo*0.3;
    }
    else{
        credito=saldo*0.4;
    }
    alert(`Seu crédito é de R$${credito.toFixed(2)}`)
}