 function calcularMedia(){
     let nota1=parseFloat(document.getElementById("inputNota1").value);
     let nota2=parseFloat(document.getElementById("inputNota2").value);
     let nota3=parseFloat(document.getElementById("inputNota3").value);
     let media=(nota1+nota2+nota3)/3;
     if(media<4){
         alert(`Retido com média ${media.toFixed(2)}`);
     }
     else if(media>=4 && media<7){
         alert(`Em prova final. Média ${media.toFixed(2)}`);
     }
     else{
         alert(`Aprovado com média ${media.toFixed(2)}`);
     }
}