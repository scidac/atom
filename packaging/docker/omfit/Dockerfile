# Use an miniconda runtime as a parent image
FROM continuumio/miniconda

# Set the working directory to /app
WORKDIR /omfit

# Copy the OMFIT-source directory contents into the container at /omfit
ADD ./OMFIT-source /omfit

ENV PATH=/opt/conda/bin:${PATH}
ENV USER=root
ENV SHELL=/bin/bash

# Install any needed packages specified in requirements.txt
RUN apt-get update && apt-get install -y xterm
RUN apt-get update && apt-get install -y ssmtp
RUN conda install -y -c smithsp -c conda-forge omfit python pytz
RUN conda upgrade -y -c smithsp -c conda-forge readline 
RUN cd /omfit/install/ && ./install-conda.sh -p /opt/conda
RUN rm -rf /omfit

# So e-mail can be sent
EXPOSE 25

# Run bash when the container launches
CMD ["bash"]
