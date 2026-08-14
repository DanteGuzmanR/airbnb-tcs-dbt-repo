
{% macro superhost_label(column_name) %}
    CASE WHEN {{ column_name }} = 't' THEN 'Superhost'
         WHEN {{ column_name }} = 'f' THEN 'Regular host'
         ELSE 'Unknown' END
{% endmacro %}