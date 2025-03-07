# Get the Python version of the base image from a build argument
ARG PYTHON_VERSION
FROM winamd64/python:$PYTHON_VERSION-windowsservercore

ARG WHEEL_NAME
ARG CIBW_TEST_REQUIRES

# Copy and install the Windows wheel
COPY $WHEEL_NAME $WHEEL_NAME
RUN pip install $env:WHEEL_NAME

# Install the testing dependencies
RUN pip install $env:CIBW_TEST_REQUIRES.split(" ")

# Copy the tests folder
COPY tests/ C:/ManimPango/tests
WORKDIR C:/ManimPango
