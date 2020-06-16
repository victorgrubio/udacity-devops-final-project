from flask import Flask
app = Flask(__name__)

VERSION = "v1"
@app.route('/')
def hello():
    return "This is the final project of Victor Garcia Rubio for Cloud Devops Nanodegree by Udacity!"

@app.route('/version')
def version():
    return f"We are using version {VERSION}"

if __name__ == '__main__':
    app.run()