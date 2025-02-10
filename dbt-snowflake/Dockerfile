ARG PYTHON_VERSION=3.12
FROM public.ecr.aws/pushrbx/amazonlinux2-python:$PYTHON_VERSION as pybin
FROM amazonlinux:2

COPY --from=pybin /usr/local/lib/python$PYTHON_VERSION /usr/lib/python$PYTHON_VERSION
COPY --from=pybin /usr/local/bin/python$PYTHON_VERSION /usr/local/bin/python$PYTHON_VERSION

ARG DBT_SNOWFLAKE_VERSION=1.8.3
ARG DBT_CORE_VERSION=1.8.4
ARG ELEMENTARY_DATA_VERSION=0.13.0

RUN ln -sf /usr/local/bin/python$PYTHON_VERSION /usr/bin/python3 && \
    ln -sf /usr/local/bin/pip$PYTHON_VERSION /usr/bin/pip3 && \
    pip3 install --upgrade pip && \
    pip3 install dbt-snowflake==$DBT_SNOWFLAKE_VERSION dbt-core==$DBT_CORE_VERSION elementary-data[snowflake]~=$ELEMENTARY_DATA_VERSION && \
    pip3 install -U montecarlodata
