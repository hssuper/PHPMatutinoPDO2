delimiter ##
drop produre if exists iCadastroFornecedor ##
create procedure iCadastroFornecedor
( $nomeFornecedor varchar(255), $logradouro varchar(255), 
            $complemento varchar(255), $bairro varchar(255), $cidade varchar(255), $uf varchar(2), $cep varchar(255),
            $representante varchar(255), $email varchar(255), $telFixo varchar(15), $telCel vachar(15) out msg text)
			begin
			declare idx int (11) default -1;
			declare idf int (11) default 0;
			select idfornecedor into idf from fornecedor where cep = cepP;
			if(idf > 0)then
			set msg = "Usuário já cadastrado anteriormente.";
			else 
			select idfornecedor into idx from endereco where 
			logradouro = logradouroP and complemento = complementoP and 
			cep = cepP;
			if(idx = -1) then 
			insert into endereco values (null, logradouroP, complementoP,
			bairroP,cidadeP,ufP,cepP);
			select idendereco into idx from endereco where 
			logradouro = logradouroP and complemento = complementoP and 
		    cep = cepP;
			end if;
			insert into fornecedor values (null, $nomeFornecedor, $logradouro, 
            $complemento, $bairro, $cidade, $uf, $cep,
            $representante, $email, $telFixo, $telCel);
			set msg = "Dados cadastrados com sucesso";
			
			select * from fornecedor inner join endereco on 
	   fkendereco = idendereco;
end if;
select msg;
end ##
delimiter ;