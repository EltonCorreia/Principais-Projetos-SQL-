use Exercicio2Subquerie
--1
select cdimovel, NmEndereco from Imovel
		where CdBairro = (select CdBairro from Imovel 
					where CdImovel = 2) and CdImovel != 2





--2
select cdimovel, nmendereco, vlpreco from Imovel
	where VlPreco > (select avg(vlpreco) from Imovel)

--3
select nmcomprador from Comprador
	where CdComprador in (select CdComprador from oferta 
			where vloferta >70000)

--4
select cdimovel, cdcomprador, vloferta from Oferta
	where VlOferta > (select AVG(vloferta) from Oferta)

--5
select cdimovel, nmendereco, vlpreco from Imovel i
	where vlpreco  > (select AVG(vlpreco) from Imovel
			where cdbairro = i.cdbairro)

--6
select cdimovel, cdvendedor, vlpreco from Imovel i
	where VlPreco = (select MIN(vlpreco) from Imovel
		where CdVendedor = i.CdVendedor)

--7
select cdimovel, nmendereco, vlpreco from Imovel i
	where VlPreco = (select MIN(vlpreco) from Imovel
		where CdVendedor != i.CdVendedor)

--8
select cdimovel, cdcomprador, vloferta from Oferta
	where VlOferta < (select MAX(vloferta) from Oferta
		where CdComprador = 2) and CdComprador !=2

