select * 
into cuentax
from cuenta;

ALTER TABLE cuentax 
add constraint cuenta_fk foreign key (chr_cliecodigo) 
REFERENCES cliente(chr_cliecodigo);
go