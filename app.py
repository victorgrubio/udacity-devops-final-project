"""
Main Flask APP
"""
from flask import Flask
app = Flask(__name__)

VERSION = "1.0.2"
@app.route('/')
def hello():
    """
    GET method for root endpoint
    """
    return """ This is the final project of Victor Garcia Rubio
            "for Cloud Devops Nanodegree by Udacity! """

@app.route('/version')
def version():
    """
    GET method that retrieves the version
    """
    return "We are using version

if __name__ == '__main__':
    app.run(host='0.0.0.0', port='5000')
