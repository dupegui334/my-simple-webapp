import os
from flask import Flask, render_template
import requests
app = Flask(__name__)

@app.route('/')
def main():
    url = 'https://api.le-systeme-solaire.net/rest.php/bodies?data=id%2CisPlanet&rowData=false'
    get_solar = requests.get(url)
    print(get_solar.content)
    return render_template('index.html')

# @app.route('/how are you')
# def hello():
#     return 'I am good, how about you?'

if __name__ == '__main__':
    app.run(debug=True, port=4000)
