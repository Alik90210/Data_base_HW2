--(1 балл) Вывести все уникальные бренды, у которых стандартная стоимость выше 1500 долларов.
select distinct brand
from transactions 
where standard_cost > 1500

--(1 балл) Вывести все подтвержденные транзакции за период '2017-04-01' по '2017-04-09' включительно.
select transaction_id
from transactions 
where transaction_date::date between to_date('01042017','DDMMYYYY') and to_date('09042017','DDMMYYYY') 
and order_status = 'Approved'

--(1 балл) Вывести все профессии у клиентов из сферы IT или Financial Services, которые начинаются с фразы 'Senior'.
SELECT distinct job_title FROM customer_2
WHERE job_title LIKE 'Senior%' and (job_industry_category = 'IT' or job_industry_category = 'Financial Services')

--(1 балл) Вывести все бренды, которые закупают клиенты, работающие в сфере Financial Services
select distinct brand FROM transactions
WHERE customer_id IN (SELECT customer_id FROM customer_2
		  			 WHERE job_industry_category = 'Financial Services')

--(1 балл) Вывести 10 клиентов, которые оформили онлайн-заказ продукции из брендов 'Giant Bicycles', 'Norco Bicycles', 'Trek Bicycles'.
select customer_id 
from transactions
where online_order = 'True' and (brand = 'Giant Bicycles' or brand =  'Norco Bicycles' or brand =  'Trek Bicycles')
limit 10

--(1 балл) Вывести всех клиентов, у которых нет транзакций.
select customer_id
from customer_2
where customer_id not in (select customer_id from transactions)

--(2 балла) Вывести всех клиентов из IT, у которых транзакции с максимальной стандартной стоимостью.
select customer_id from customer_2
where job_industry_category = 'IT' and customer_id in (select customer_id 
														from transactions 
														where standard_cost = (SELECT MAX(standard_cost) FROM transactions)
														)
														
--(2 балла) Вывести всех клиентов из сферы IT и Health, у которых есть подтвержденные транзакции за период '2017-07-07' по '2017-07-17'.														
select distinct customer_id
from transactions 
where transaction_date::date between to_date('07072017','DDMMYYYY') and to_date('17072017','DDMMYYYY') 
and order_status = 'Approved'
and customer_id in (select customer_id from customer_2
					where job_industry_category = 'Health' or job_industry_category = 'IT')


