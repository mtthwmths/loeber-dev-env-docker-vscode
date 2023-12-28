FROM python:alpine

RUN addgroup --gid 1001 --system app && \
    adduser -H -D -u 1001 -S app -G app

RUN mkdir /code && \
    chown -R app:app /code && \
    mkdir /py-venv && \
    chown -R app:app /py-venv
USER app

ENV VIRTUAL_ENV=/py-venv
RUN python3 -m venv $VIRTUAL_ENV
ENV PATH="$VIRTUAL_ENV/bin:$PATH"

WORKDIR /code

COPY ./requirements.txt ./
RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt && \
    rm /code/requirements.txt

# uvicorn is the part that handles web requests for fast api
# short for "unicorn serving ASGI"
CMD ["uvicorn", "src.main:app", "--host", "0.0.0.0", "--port", "80", "--reload"]
