# Use an miniconda runtime as a parent image
FROM continuumio/miniconda

# Set the working directory to /app
WORKDIR /omfit

# Copy the OMFIT-source directory contents into the container at /omfit
ADD ../OMFIT-source /omfit

ENV PATH=/opt/conda/bin:${PATH}
ENV USER=root

# Install any needed packages specified in requirements.txt
RUN cd /omfit/install/ && ./install-conda.sh -p /opt/conda
RUN conda install tk=8.5.18

# Run bash when the container launches
CMD ["bash"]
