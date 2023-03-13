function triangulo(){
    let x=parseInt(document.getElementById("input1").value);
    let y=parseInt(document.getElementById("input2").value);
    let z=parseInt(document.getElementById("input3").value);
    if(x==y && y==z){
        alert(`Triângulo equilátero`)
    }
    else if(x!=y && y!=z && z!=x && (x+y)>z){
        alert(`Triângulo escaleno`)
    }
    else if((x+y)>z && x==y || y==z || z==x){
        alert(`Triângulo isósceles`)
    }
    else{
        alert(`Isso não é um triangulo`)
    }
}
