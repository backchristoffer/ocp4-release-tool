from urllib import response
from flask import request
from app import app

def test_app_main_get():
    response = app.test_client().get('/')
    assert response.status_code == 200