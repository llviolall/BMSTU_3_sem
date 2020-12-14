//const Rails = require("@rails/ujs");

function show_result(data){
  var result = document.getElementById("result"); 
  result.innerHTML=''; 
  for(let i=0; i<data.length; i++){
    tr = document.createElement('tr');
    tr.append(document.createElement('td'));
    tr.append(document.createElement('td')); document.inne
    tr.children[0].innerText=data[i].dec;
    tr.children[1].innerText=data[i].bin;
    result.append(tr);
  }
} 
document.addEventListener('DOMContentLoaded',()=> {
  document.querySelector('#input_frm')?.addEventListener('ajax:success', (event)=> { 
    [data,status,xhr] = event.detail;
    show_result(data);
  })
})
