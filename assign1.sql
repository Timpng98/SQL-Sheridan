select c.carmake, sum(i.partscost + i.laborcost) as totalcost, avg((i.partscost + i.laborcost) * (i.taxrate /100 +1)) as avgservcost, count(c.carserial) as amountofvisits
from si.car c
join si.servinv i on i.carserial = c.carserial
join si.saleinv s on s.custname = i.custname
where c.carmake = 'JAGUAR' or c.carmake = 'ACURA' or c.carmake = 'MERCEDES'
and saledate BETWEEN '2015-09-01' and '2018-12-31'
group by c.carmake
;


select custname, count(*) as carsbought,
case when count(*) = 1 then 'First time buyer'
when count(*) = 2 then 'Two time buyer'
when count(*) > 2 then 'Frequent buyer'
end
from si.car
where carmake = 'MERCEDES'
group by custname 
;


select c.custname, c.carmake, c.carmodel
from si.car c
intersect
select p.custname, p.carmake, p.carmodel
from si.prospect p
;

select c.carmake, sum(s.laborcost) as sum_of_laborcost
from si.car c
join si.servinv s on s.carserial = c.carserial
group by c.carmake
;

select carserial, carmake, carlistprice, count(*) over (partition by carmake) as car_make
from si.car
where carmake = 'JAGUAR'
;




--declaration section  
DECLARE 
  x NUMBER;  
  n NUMBER;  
  i NUMBER;  
    
  --function for finding sum  
  FUNCTION Findmax(n IN NUMBER)  
    RETURN NUMBER  
  IS 
    sums NUMBER := 0;  
  BEGIN 
    
    --for loop for n times iteration  
    FOR i IN 1..n  
    LOOP  
      sums := sums + i*(i+1)/2;  
    END LOOP;  
    RETURN sums;  
  END;  
  BEGIN 
    
    --driver code  
    n := 5;  
    x := findmax(n);  
    dbms_output.Put_line('Sum: ' 
    || x);  
  END;  
    
  --end of Program 