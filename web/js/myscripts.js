var total = 0;

function myFunction1(radio1) {
    document.getElementById("result1").innerHTML = radio1;
}
function myFunction2(radio2) {
    document.getElementById("result2").innerHTML = radio2;
}
function myFunction3() {
    var totals = 0;
    var topping = (parseInt(document.getElementById("result1").innerHTML));
    var bottom = (parseInt(document.getElementById("result2").innerHTML));
    var quantity = (parseInt(document.getElementById("numbCakes").value));
    if (topping === null) {
        topping = 0;
    }
    if (bottom === null) {
        bottom = 0;
    }
    if (quantity <= 1 || quantity === null) {
        quantity = 1;
    }
    totals = (topping + bottom) * quantity;
    document.getElementById("price").innerHTML = totals;
    document.getElementById("price").value = totals;
}

function myFunction5(balance1) {
    
    var cupCake = parseFloat(document.getElementById("price").value);
    var everything = parseFloat(document.getElementById("totalPrice").value);
    var sum = everything + cupCake;
    if (sum > balance1) {
        document.getElementById("adder").disabled = true;
        document.getElementById("adder").value = "Not Enough Moneys!";        
        
    } else {
        document.getElementById("adder").disabled = false;
        document.getElementById("adder").value = "add to cart";   
    }
}
function myFunction4() {
    var cart = document.getElementById("zeCart");
    var orders = cart.getElementsByTagName("li");
    for (var i = 0; i < orders.length; i++) {
        total += orders[i].value;
    }
    document.getElementById("totalPrice").innerHTML = "Total Price:<br>" + total;
    document.getElementById("totalPrice").value = total;
}




