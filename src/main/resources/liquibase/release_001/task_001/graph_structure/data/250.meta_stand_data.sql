insert into META_STAND(ID, DESCRIPTION, IS_LOCAL)
SELECT 'NOTEBOOK', 'NOTEBOOK', 1 from dual union
SELECT 'NOTEBOOK_DSO', 'NOTEBOOK_DSO', 1 from dual union
SELECT 'DSO', 'DSO', 0 from dual union
SELECT 'IFT', 'IFT', 0 from dual union
SELECT 'NT', 'NT', 0 from dual union
SELECT 'REAL', 'REAL', 0 from dual union
SELECT 'P0', 'P0', 0 from dual
/
