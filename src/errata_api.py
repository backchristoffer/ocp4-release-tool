import requests
import os

class errata():

    def __init__(self, url, token):
        self.url = url
        self.token = token
    
    def request(self):
        return requests.get(self.url, headers={'Authorization': 'access_token %s'.format(self.token)})