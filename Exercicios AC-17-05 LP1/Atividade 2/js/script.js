function Ordenador(){
    let n1=parseint(document.getElementById("input1").value);
    let n2=parseint(document.getElementById("input2").value);
    let n3=parseint(document.getElementById("input3").value);
    if(n1>n2 && n2>n3 && n3>n1){
        alert(`${n2},${n1},${n3}`)
    }
    else if(n1>n2 && n2>n3 && n1>n3){
        alert(`${n2},${n3},${n1}`)
    }
    else if(n2>n1 && n1>n3 && n2>n3){
        alert(`${n2},${n3},${n1}`)
    }
    else if(n1>n2 && n2>n3 && n1>n3){
        alert(`${n3},${n2},${n1}`)
    }
    else if(n2>n1 && n3>n2 && n3>n1){
        alert(`${n1},${n2},${n3}`)
    }
    else if(n2>n1 && n2>n3 && n3>n1){
        alert(`${n1},${n3},${n2}`)
    }
}