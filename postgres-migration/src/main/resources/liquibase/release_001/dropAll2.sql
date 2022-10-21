DO $$
    declare
        cmd varchar;
    begin

        select typname into cmd from pg_catalog.pg_type where typname = 'cmd_type';

        if (cmd is null ) then
            execute 'create type cmd_type as( cmd varchar    )';
        end if;
exception
        when NO_DATA_FOUND then
        execute 'create type cmd_type as( cmd varchar    )';
end;
$$;
/
DO $$
    declare
        r cmd_type%rowtype;
        cmd varchar;
    begin
        for r in
            select 'drop type tuple'||gs cmd from generate_series(1, 3) as gs
            loop
                begin
                    execute r.cmd;
                exception when others then
                    null;
                end;
            end loop;
    end;
$$;
/

DO $$
declare
    r cmd_type%rowtype;
    cmd varchar;
begin
  for r in
    with list as
      ((select 100 as prior, 'table' as tp, tablename as name,
        'drop table ' ||  tablename ||' CASCADE' cmd
        from pg_catalog.pg_tables where
        schemaname = 'db_configuration_manager' and
        tablename not in ('databasechangelog', 'databasechangeloglock')
        )
          union
        (select 10 as prior, 'view' as tp,  viewname as name,
         'drop view '  || viewname cmd
        from pg_catalog.pg_views where schemaname = 'db_configuration_manager')
          union
       (select 5, 'routine', routine_name,
               'drop '||routine_type||' '||routine_name  from information_schema.routines
        where specific_schema = 'db_configuration_manager'
       )
       union
       (
        select 110, 'type', n.nspname,
                'drop type '||t.typname||' cascade;' from pg_type t
          LEFT JOIN pg_catalog.pg_namespace n ON n.oid = t.typnamespace
        where  n.nspname = 'db_configuration_manager' and substr(t.typname,1,1)!='_'
            and t.typname not in ('databasechangelog', 'databasechangeloglock', 'cmd_type')
        order by t.typname
       )
      )

      select tp.cmd  cmd from list tp
      order by prior

  loop
    execute r.cmd;
  end loop;
end;
$$;
/

