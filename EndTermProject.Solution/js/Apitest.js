document.addEventListener("DOMContentLoaded", function () {
    // console.log('123')
    initForm();
});

function initForm() {
    let url = '/api/OrderApi';
    fetch(url, {
        method: 'GET',
        headers: {
            'Content-Type': 'application/json'
        }
    }).then(function (response) {
        // console.log("456")
        return response.json();
    }).then(data => {
        /*console.log(data)*/
        var html = `
                                            <img src="/Images/item.ProductImage" alt="圖片異常" style="width: 180px" />
                                            <div style="display: inline-block; margin: 10px">
                                                <div><strong>item.Brand</strong></div>
                                                item.ProductName<br />x item.Qty
                                            </div>
                                            <div style="text-align: end">
                                                商品小計： <span style="font-weight: bold">item.SubTotal</span>
                                            </div>
                                            <hr />`
                                            var htmlCopy = html;
                                            for(var item of data){
                                                htmlCopy = html;
                                                htmlCopy = htmlCopy.replace('<div><strong>item.Brand</strong></div>', `<div><strong>${item.Paytype}</strong></div>`)
                                                

                                                for (var oi of item.OrderItems) {
                                                    htmlCopy = htmlCopy.replace('item.ProductName', `${oi.ProductName}`)

                                                }

                                                $("#first").append(htmlCopy);
                                            }
    })
}


