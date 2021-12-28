
#this is going to import from init file inside flaskapp
from flaskapp1 import app

if __name__ == '__main__':
    app.run(debug=True, port=1278)