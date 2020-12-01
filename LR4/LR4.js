let arr = [];
function add(name, price) {
    let bool = true;
    for (let i = 0; i < arr.length; i++) {
        if (arr[i] === name) bool = false;
    }
    if (bool) {
        arr.push(name);
        let table = document.getElementById('cart').getElementsByTagName('TBODY')[0];
        let row = document.createElement("TR");
        table.appendChild(row);

        let nameTD = document.createElement("TD");
        let priceTD = document.createElement("TD");
        let amountTD = document.createElement("TD");
        row.appendChild(nameTD);
        row.appendChild(priceTD);
        row.appendChild(amountTD);

        nameTD.innerHTML = name;
        priceTD.innerHTML = price;
        amountTD.innerText = '1';
    }
    else {
        let count = 0;
        let buf = 0;
        let item = '';
        for (let i = 0; i < arr.length; i++) {
            if (arr[i] === name) count++; }
        arr.push(name);
        let tableBf = document.getElementById('cart');
        for (let i = 1; i < tableBf.rows.length; i++) {
        let text = tableBf.rows[i].children[0].textContent;
        if (text === name) item = i; }
        let sum = tableBf.rows[item].children[2].textContent;
        buf = parseInt(sum) + 1;
        sum = String(buf);
        tableBf.rows[item].children[2].textContent = sum;

        let price = tableBf.rows[item].children[1].textContent;
        buf = parseInt(price);
        let buf2 = (buf / (sum - 1)) * sum;
        sum = String(buf2);
        tableBf.rows[item].children[1].textContent = sum;

    }
}

function addToShoppingCart() {
    let name = document.getElementById('name').value;
    let price = document.getElementById('price').value;
    let table = document.getElementById('catalogTable').getElementsByTagName('TBODY')[0];

    if (name === '') alert('Нет названия')
    else if (price === '') alert('Нет цены');
    if (!isNaN(price)) {
        let row = document.createElement("TR");
        table.appendChild(row);

        let nameTD = document.createElement("TD");
        let priceTD = document.createElement("TD");
        let addTD = document.createElement("TD");
        row.appendChild(nameTD);
        row.appendChild(priceTD);
        row.appendChild(addTD);

        nameTD.innerHTML = name;
        priceTD.innerHTML = price;
        addTD.innerHTML = '+';
        row.children[2].onclick = function () {
            add(name, price);
        }

    } else alert('Цена должна быть числом!');
}

function addToShoppingCart() {
    let name = document.getElementById('name').value;
    let price = document.getElementById('price').value;
    let table = document.getElementById('catalogTable').getElementsByTagName('TBODY')[0];

    if (name === '') alert('Нет названия')
    else if (price === '') alert('Нет цены');
    if (!isNaN(price)) {
        let row = document.createElement("TR");
        table.appendChild(row);

        let nameTD = document.createElement("TD");
        let priceTD = document.createElement("TD");
        let addTD = document.createElement("TD");
        row.appendChild(nameTD);
        row.appendChild(priceTD);
        row.appendChild(addTD);
        priceTD.setAttribute("class", "price");
        addTD.setAttribute("class", "plus");

        nameTD.innerHTML = name;
        priceTD.innerHTML = price;
        addTD.innerHTML = '+';
        row.children[2].onclick = function () {
            add(name, price);
        }

    } else alert('Цена должна быть числом!');
}

function count() {
    let sum = 0;
    let table = document.getElementById('cart');
    for (let i = 1; i < table.rows.length; i++) {
        sum += parseFloat(table.rows[i].cells[1].innerHTML);
    }
    document.getElementById('sum').innerHTML = 'Общая стоимость: ' + sum;
    document.getElementById('sum').style.visibility = 'visible';
}