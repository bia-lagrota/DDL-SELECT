
/*1 [Seleção de Campos e Ordenação] */
select nome, categoria, preco
from produtos
order by preco asc; 

/*2 [Operador LIKE] */
select * 
from produtos 
where nome like 'Suporte%';

/*3 [Operador LIKE] */
select *
from produtos
where nome like '%Gamer%';

/*4 [Operadores Lógicos AND] */
select nome, categoria, estoque, preco
from produtos
where categoria = 'Hardware%' and preco < 500.00;

/*5 [Operadores Lógicos OR] */
select nome, categoria 
from produtos 
where categoria = 'Móveis' or categoria = 'Escritório';

/*6 [Operador IN] */
select nome, categoria 
from produtos 
where categoria in ('Redes', 'Monitores', 'Informática');

/*7 [Filtro de Estoque/ZEROS] */
select nome, categoria 
from produtos 
where estoque = 0;

/*8 [Operador BETWEEN] */
select * 
from produtos 
where preco between 100.00 and 400.00 
order by preco desc;

/*9 [Operadores Lógicos NOT] */
select nome, categoria 
from produtos 
where not categoria = 'Periféricos'; 

/*10 [Função COUNT] */
select count(*) as total_produtos 
from produtos;

/* 11 [Função COUNT com Filtro] */
select count(*) as total_produtos 
from produtos 
where valor_unitario > 1000.00;

/* 12 [Função SUM] */
select sum(estoque) as total_estoque 
from produtos;

/* 13 [Função AVG] */
select avg(valor_unitario) as media_precos 
from produtos;

/* 14 [Funções MAX e MIN] */
select max(valor_unitario) as maior_preco, 
       min(valor_unitario) as menor_preco 
from produtos;

/* 15 [Função MAX com Filtro] */
select max(valor_unitario) as maior_preco_perifericos 
from produtos 
where categoria = 'periféricos';

/* 16 [Group By Simples] */
select categoria, count(*) as total_produtos
from produtos
group by categoria;

/* 17 [Group By com Soma] */
select categoria, sum(estoque) as total_estoque
from produtos
group by categoria;

/* 18 [Group By com Média] */
select categoria, avg(preco) as preco_medio
from produtos
group by categoria;

/* 19 [Having com Count] */
select categoria, count(*) as total_produtos
from produtos
group by categoria
having count(*) > 4;

/* 20 [Having com Média] */
select categoria, avg(preco) as preco_medio
from produtos
group by categoria
having avg(preco) > 300.00;

/* 21 [Desafio 1 - Cálculo de Valor de Inventário] */
select nome, preco, estoque, (preco * estoque) as valor_total_estoque
from produtos
where estoque > 0
order by valor_total_estoque desc;

/* 22 [Desafio 2 - Relatório de Reposição Urgente] */
select *
from produtos
where estoque <= 5 
  and categoria in ('hardware', 'periféricos');

/* 23 [Desafio 3 - Análise de Cadastros por Período] */
select *
from produtos
where data_cadastro between '2023-01-01' and '2023-03-31'
order by data_cadastro desc;

/* 24 [Desafio 4 - Análise Combinada de Categorias Estratégicas] */
select categoria, avg(estoque) as media_estoque
from produtos
where categoria <> 'monitores'
group by categoria
having avg(estoque) < 15;

/* 25 [Desafio 5 - Produtos 'Fora do Padrão' de Preço] */
select *
from produtos
where preco > (select avg(preco) from produtos);
