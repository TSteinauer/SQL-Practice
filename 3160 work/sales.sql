   select S.city, I.color, C.cName, F.price
    from Sales F, Store S, Item I, Customer C
    where F.storeID = S.storeID and F.itemID = I.itemID 
    and F.custID = C.custID and S.state = 'CA' 
    and I.category = 'Tshirt' and C.age < 22 and F.price < 25;
    
    select storeID, cName, sum(price)
from Sales s, Customer c
where s.custID=c.custID
group by storeID, cName;

select storeID, i.category, cName, sum(price)
from Sales s, Customer c, Item i
where s.custID=c.custID and s.itemID=i.itemID
group by storeID, i.category, cName;

select s.storeID, i.category, cName, sum(price)
from Sales s, Customer c, Item i, Store t
where s.custID=c.custID and s.itemID=i.itemID
and s.storeID=t.storeID and t.storeId ='store6'
group by storeID, i.category, cName;

select s.storeID, i.category, cName, sum(price)
from Sales s, Customer c, Item i, Store t
where s.custID=c.custID and s.itemID=i.itemID
and s.storeID=t.storeID and t.storeId ='store6' and i.category='Jacket'
group by storeID, i.category, cName;

select i.category, sum(price)
from Sales s, Customer c, Item i, Store t
where s.custID=c.custID and s.itemID=i.itemID and s.storeID=t.storeID
group by i.category;

select state, county, city, sum(price)
from Sales F, Store S
where F.storeID = S.storeID
group by state, county, city;

select state, county, city, sum(price)
from Sales F, Store S
where F.storeID = S.storeID
group by state, county, city with rollup;

select sum(S.price), St.state, C.age
from sales S, customer C, store St
where S.storeID = St.storeID and C.custID = S.custID
group by C.age,St.state;

select count(*), color
from item
group by color;

select sum(s.price) , st.state, c.age
from sales s, customer c, store st
where s.storeID = st.storeID
and s.custID = c.custID
group by st.state, c.age with rollup;

select *
from item
where color = 'blue';

select sum(s.price), c.age, i.color
from sales s, customer c, item i
where s.custID = c.custID and s.itemID = i.itemID
group by c.age,i.color with rollup;

