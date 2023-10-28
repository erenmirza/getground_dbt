
{%- macro unix_to_timestamp(column_name, unit, alias_name) -%}
{%- if unit == 'ns' -%}
    epoch_ms(({{ column_name }}::double / 1000000)::bigint) as {{alias_name}}
{%- else -%}
        {{ column_name }} as {{ alias_name }}
{%- endif -%}
{%- endmacro -%}
