import os
from flask import Flask, render_template, request
import requests
app = Flask(__name__)

@app.route('/', methods=['GET', 'POST'])
def main():

    if request.method == 'GET':
        return render_template('index.html')
    
    if request.form['search']:
        
        url = 'https://api.le-systeme-solaire.net/rest.php/bodies/' + request.form['search']
        get_solar = requests.get(url)
        print(get_solar.content)
        get_solar_json = get_solar.json()
        return render_template('index.html', data = get_solar_json)
    
    else:
        return render_template('index.html')


# @app.route('/how are you')
# def hello():
#     return 'I am good, how about you?'

if __name__ == '__main__':
    app.run(debug=True, port=4000)
