-- Número TOTAL de acidentes

SELECT DISTINCT COUNT(*)

FROM dbo.f_acidente

-- Número TOTAL de acidentes

SELECT COUNT(*)

FROM dbo.f_acidente


-- TOP 10 causas de acidente em ordem decrescente
select top 10 d_causaacidente, count(*)
from dbo.d_causaacidente
group by d_causaacidente order by count(*) desc



--Quantidade de acidentes no mês de janeiro de 2020
select count(*) as qtd_dias
from dbo.d_dataacidente
where d_dataacidente BETWEEN '2020/01/01' and '2020/31/01'


select d_classificacaoacidente, count(*)
from dbo.d_classificacaoacidente
group by d_classificacaoacidente order by count(*) desc



select top 10 d_localizacao.d_uf, count(*)
from d_localizacao
group by d_localizacao.d_uf order by count(*) desc



select d_condicaometereologica, count(*)
from d_condicaometereologica
group by d_condicaometereologica order by count(*) desc