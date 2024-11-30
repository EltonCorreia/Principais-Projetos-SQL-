--Quest�o 1-- Apresentar todos os clientes solteiros;
Select * from cliente 
	where cod_cli not in (Select cod_cli from conjuge) 
--Quest�o 2--Apresentar todos os clientes casados;
Select * from cliente
	where cod_cli in (Select cod_cli from conjuge)
--Quest�o 3--Apresentar todas as categorias que est�o sem CD;
Select * from categoria
	where cod_cat  not in (Select cod_cat from titulo)
--Quest�o 4--Apresentar todas as gravadoras que nunca 
gravaram CD;
Select * from gravadora
	where cod_grav not in (Select cod_grav from titulo)
--Quest�o 5--Apresentar apenas os funcion�rios que tem 
--dependentes e que nunca atenderam a algum pedido
Select * from funcionario
	where cod_func in 
		(Select cod_func from dependente
			where cod_func not in 
				(Select cod_func from pedido))
--Quest�o 6--Mostrar todos os funcion�rios que atenderam a
 pedidos de clientes casados
Select * from funcionario
	where cod_func in
		(Select cod_func from pedido
			where cod_cli in 
				(Select cod_cli from conjuge))
--Quest�o 7--Apresentar os dados dos clientes que 
--possuem a maior renda;
Select * from funcionario
	where renda_cli =
		(Select MAX(renda_cli) from funcionario)
--Quest�o 8-- Apresentar os dados do CD mais caro.
Select * from titulo
	where valor_cd =
		(Select MAX(valor_cd) from titulo)
--Quest�o 9-- Aplicar um aumento salarial 
--de 20% para todos os funcion�rios que n�o t�m dependentes;
Update funcionario
	set salario_func = salario_func * 1.2
		where cod_func not in (Select cod_func from dependente)
--Quest�o 10-- Aplicar um aumento salarial; de 10% para 
--todos os funcion�rios que t�m dependentes;
Update funcionario
	set salario_func = salario_func * 1.1
		where cod_func  in (Select cod_func from dependente)
--Quest�o 11- Aumentar em 100.00 a renda de todos os 
--clientes solteiros;
Update cliente
	set renda_cli = renda_cli +100.00
		where cod_cid not in (Select cod_cli from conjuge)
--Quest�o 12-- Aumentar em 100.00 a renda de todos os clientes solteiros 
--do sexo feminino;
Update cliente
	set renda_cli = renda_cli +100.00
		where cod_cli not in(select cod_cli from conjuge)
		and sexo_cli='f'
--Quest�o 13-- Aumentar em 200.00 a renda de todos os 
--clientes que j� fizeram pedidos;
Update cliente	
	set renda_cli = renda_cli + 200.00
		where cod_cli in (Select cod_cli from pedido )
--Quest�o 14-- Aumentar em 500.00 a renda de todos os clientes 
--solteiros que j� fizeram pedidos;
Update cliente
	set renda_cli = renda_cli +500.00
		where cod_cli not in (Select cod_cli from conjuge 
			where cod_cli in (Select cod_cli from pedido)) 
--Quest�o 15-- Aplicar um desconto de 10% em todos os 
--pedidos onde foi vendido o t�tulo de c�digo igual a 1;
Update pedido
	set valor_ped= valor_ped-(valor_ped*0.1) 
		where num_ped in (Select num_ped from titulo_pedido
			where cod_tit = 1)
--Quest�o 16-- Aumentar em 500.00 o sal�rio de todos 
--os funcion�rios que j� atenderam a pedidos feitos pelo cliente 1;
Update funcionario
	set salario_func = salario_func +500.00
		where cod_func in (Select cod_func from pedido
			where cod_cli =1)
--Quest�o 17-- Aplicar um desconto de 10% para todos os CDs
 --(t�tulos) que nunca foram vendidos;
Update titulo
	set valor_cd = valor_cd-(valor_cd*0.1)
		where cod_tit not in (Select cod_tit 
		from titulo_pedido)
--Quest�o 18-- Aplicar um aumento salarial de 20% para 
--todos os funcion�rios que n�o t�m dependentes.
Update funcionario
	set salario_func = salario_func*1.2
		where cod_func not in (Select cod_func from dependente)