begin
  for r in (
    with d as (
      (
      select 'table '||atc.OWNER||'.'||atc.TABLE_NAME||' has no coments' nm from ALL_ALL_TABLES aat
        join ALL_TAB_COMMENTS atc on (atc.OWNER, atc.TABLE_NAME) = ((aat.OWNER, aat.TABLE_NAME))
      where aat.OWNER='LOCALDEV' and atc.COMMENTS is null and
        aat.TABLE_NAME not in ('DATABASECHANGELOGLOCK', 'DATABASECHANGELOG')
      )
      UNION ALL
      (
      SELECT 'table '||AAT.OWNER||'.'||AAT.TABLE_NAME||'.'||AAT.COLUMN_NAME||' has no coments' FROM ALL_TAB_COLS AAT
        JOIN ALL_COL_COMMENTS ACC ON  (ACC.OWNER, ACC.TABLE_NAME, ACC.COLUMN_NAME) = ((aat.OWNER, aat.TABLE_NAME, AAT.COLUMN_NAME))
      where aat.OWNER='LOCALDEV' and ACC.COMMENTS is null and
        aat.TABLE_NAME not in ('DATABASECHANGELOGLOCK', 'DATABASECHANGELOG'))
      )
    select listAgg(d.nm, chr(10)) within group (order by d.nm) lst
      from d
    where rownum <= 50
    group by 1
    )
  loop
    raise_application_error(-20000,'NO COMENTS: ' || chr(10) || r.lst);
  end loop;
end;
/