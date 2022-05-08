FROM registry.redhat.io/rhel8/python-36
RUN pipenv install
CMD ["pipenv", "run", "python3", "app.py"]