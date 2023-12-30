from flask import Flask, render_template, request
import requests

app = Flask(__name__)

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/send_request', methods=['POST'])
def send_request():
    if request.method == 'POST':
        url = request.form['url']
        try:
            response = requests.get(url)
        except requests.RequestException as e:
            response = None

        return render_template('result.html', url=url, response=response)

if __name__ == '__main__':
    app.run(debug=True)
