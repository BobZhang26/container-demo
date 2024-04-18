# use python version 3.9
FROM python:3.9

# the working directory inside the container
WORKDIR /code

# copy the requirements file to the working directory inside the container
# this allows us to take advantage of cached Docker layers
# the container environment will be updated only if the requirements file changes
# this step is done before copying the rest of the application code
# to avoid reinstalling all dependencies when the application code changes
COPY ./requirements.txt /code/requirements.txt

# install the dependencies listed in the requirements file
# the --no-cache-dir option is used to avoid caching the package index
# this reduces the image size and avoids potential issues with stale package metadata
# the --upgrade option is used to ensure that the latest versions of the dependencies are installed
# this step is done before copying the rest of the application code
RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt

# 
COPY ./app /code/app

# 
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "80"]