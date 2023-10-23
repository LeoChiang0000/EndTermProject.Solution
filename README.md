# RWD響應式購物網站(搭配CRUD功能)
## 專案說明:
利用ASP.NET MVC 框架來開發購物網站，其網站內含會員系統、商品清單、篩選、購物車、訂單等相關功能，以及網站後台操作，方便內部人員可以更新商品。
<br />
![image](https://github.com/LeoChiang0000/EndTermProject.Solution/blob/master/pictures/Index.png)

## 前台功能

購物車:
<br />
*透過+/-按鈕可以直接更新產品數量，價格也會連動更新。此方法是使用Ajax技術去呼叫CartItem Controller 來更新資料庫。
<br />
*當數量歸零的時候，會直接刪除商品。
<br />
<br />
![image](https://github.com/LeoChiang0000/EndTermProject.Solution/blob/master/pictures/Cart.png)
<br />

結帳頁:
<br />
*城市及鄉鎮是使用Web Api將資料呈現在畫面，並用JS寫的Change事件來呈現對應的鄉鎮。
<br /><br />
![image](https://github.com/LeoChiang0000/EndTermProject.Solution/blob/master/pictures/Checkout.png)
<br />

訂單:
<br />
*會員點選"我的訂單"後，可以查看訂單明細。
![image](https://github.com/LeoChiang0000/EndTermProject.Solution/blob/master/pictures/Order.png)
<br />

## 後台:
<br />
訂單:
<br />
*員工可以透過顧客姓名、電話、電子郵件、日期等做篩選。
<br />
*點擊顯示明細可以看到此筆顧客訂單的明細。
<br />
*員工也可以根據貨物狀態去做調整。
<br />
![image](https://github.com/LeoChiang0000/EndTermProject.Solution/blob/master/pictures/Backend01.png)
<br />
![image](https://github.com/LeoChiang0000/EndTermProject.Solution/blob/master/pictures/Backend02.png)


