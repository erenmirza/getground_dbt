{% macro gg_ref(model_name, enable_mock=true) -%}
  {#
    This is a custom macro that override the default 'ref' macro usage. Its 
    been developed to address the following needs:
      - Facilitate data testing with static datasets : https://discourse.getdbt.com/t/testing-with-fixed-data-set/564/5
  #}
  {% set log_compile = False %}
  {% if execute %}
    {% set log_compile = True %}
  {% endif %}

  {{ log("", info=log_compile) }}
  {{ log('checking gg_ref for model: ' ~ this.identifier ~ ', depends on: ' ~ model_name, info=log_compile) }}    
  
  {% if target.name is not defined %}
    {{ return(builtins.ref(model_name)) }}
  {% endif %}

  -- if we are running unit tests  
  {% if ( target.name == 'dev' and enable_mock ) %}  
    {% set target_model_name = this.identifier %}
    {% set target_schema = this.schema %}
    {% set source_test_data_model_suffix = '__MOCK' %}
    {% set unit_test_model_name = model_name ~ '__' ~ target_model_name ~ source_test_data_model_suffix  %}
    {{ log("  >> using unit test mock: " ~ unit_test_model_name,info=log_compile) }}
    {{ return(builtins.ref(unit_test_model_name)) }}
  {% endif %}

  -- otherwise return the default ref
  {{ log("  >> using default ref: " ~ model_name,info=log_compile) }}
  {{ return(builtins.ref(model_name)) }}

{%- endmacro -%}
