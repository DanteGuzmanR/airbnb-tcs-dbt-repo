{% macro nights_category(column_name) %}
    CASE WHEN {{ column_name }} < 3 THEN 'Short stay'
         WHEN {{ column_name }} < 7 THEN 'Weekly'
         ELSE 'Long stay' END
{% endmacro %}
