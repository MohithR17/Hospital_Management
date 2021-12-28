from flask import render_template, url_for, flash, redirect, request
from flaskapp1 import app, db, bcrypt
from flaskapp1.forms import investments,RegistrationForm,LoginForm, items, getdoctor, getroom
from flaskapp1.models import User
from flaskapp1.DBMSbackend import registerPatient, getPatientByEmail, getallDocs, getallDocsspe, findDocsWithNoAppointment, bookAppointment, AvailableRoomOfType, insertinpatient, updateroomavl
from flask_login import login_user, current_user, logout_user, login_required
import numpy as np
import pickle


model = pickle.load(open('flaskapp1/model.pkl', 'rb'))
# num_rows_deleted = db.session.query(User).delete()
# print(f"\n\n\n\n\n\nDeleted{num_rows_deleted}\n\n\n\n\n")
# num_rows_deleted = db.session.query(User).delete()
# db.session.commit()


# Templating engine flask uses is jinja-2, it allows us to write code within template

#  fname  | mname |   lname   |         specialization         | gender  |        email


@app.route("/bookroom",methods=['GET', 'POST'])
@login_required
def bookroom():
    form = getroom()
    if form.validate_on_submit():
        res = AvailableRoomOfType(form.roomtype.data)
        if res == None:
            flash(f"Sorry there are no available rooms of {form.roomtype.data}")
        else:
            insertinpatient(current_user.id, res['roomno'], form.admdate.data, form.disdate.data)
            updateroomavl(res['roomno'])
            flash(f"You are alloted Room Number {res['roomno']} with cost of {res['cost']} per day")
        return redirect(url_for('account'))
    return render_template('bookroom.html', form=form)


@app.route("/chooseDoctor",methods=['GET', 'POST'])
@login_required
def chooseDoctor():
    doctors=[]
    form = getdoctor()
    docid=None
    valid = False
    # print("\n\n\n",current_user.getid, "\n\n\n")
    if form.validate_on_submit():
        # user = User.query.filter_by(email=form.email.data).first()
        print(form.date.data, form.specialisation.data, form.time.data)
        # login_user(user, remember=form.remember.data)
        doctors = findDocsWithNoAppointment(specialisation = form.specialisation.data, date=form.date.data, time = form.time.data)
        # doctors = getallDocsspe(specialisation=form.specialisation.data)
        # print(doctors,"\n\n\n")
        # gdate = form.date.data.strftime('%Y %m %d')
        # gtime = form.time.data.strftime('%H:%M')
        valid  = True
        

        return render_template('chooseDoctor.html', form=form, doctors=doctors, docid=docid)
    
    # if request.method == 'POST':
    #     print("\n\nrequestttttt",request.form.get('json_data'), "\n\n")
    if request.form.get('json_datatime')!=None:
        time = request.form.get('json_datatime')
        print(f"\n\n\n\n{time}\n\n\n\n")
    if request.form.get('json_datadate')!=None:
        date = request.form.get('json_datadate')
        print(f"\n\n\n\n{date}\n\n\n\n")
    if request.form.get('json_data')!=None:
            docid = request.form.get('json_data')
            bookAppointment(docid, pid=current_user.id, appointmenttime = time, appointmentdate=date)
            
            flash("Appointment Booked")
            return redirect(url_for('account'))
            # return render_template('chooseDoctor.html', form=form, doctors=doctors, docid=docid)
            if docid!=None:
                    print("\n\n", request.args.get("docid"), "\n\n")
    return render_template('chooseDoctor.html', form=form, doctors=doctors, docid=docid)

@app.route("/dynamic_items",methods=['GET', 'POST'])
def dynamic_items():
    # form = items()
    if request.method == 'POST':
        print(request.form.get("projectFilepath"))
        return redirect(url_for('home'))
    return render_template('dynamic_items.html', Pokemons= {0 : "Mohith", 1 : "Monish"})

@app.route("/",methods=['GET', 'POST'])
@app.route("/home",methods=['GET', 'POST'])
def home():
    form = investments()
    # form = RegistrationForm()
    if form.validate_on_submit():
        rd = form.rd.data
        print(rd)
        # print(f"hello\n\n{current_user}\n\n")
        admin = form.admin.data
        marketing = form.marketing.data
        city = Citytoint[form.city.data]
        result = [rd, admin, marketing, city]
        print(result)
        int_features = [float(x) for x in result]

        final_features = [np.array(int_features)]
        prediction = model.predict(final_features)

        # output = "hellllo"
        output = round(prediction[0], 2)
        # print(output)
        return render_template('home.html', prediction_text=f'Predicted profit is $ {output}',form=form)
        # return rd + "<br/> "
    return render_template('home.html', form = form,prediction_text="" )



@app.route("/about")
def about():
    return render_template('about.html',title = 'About')


@app.route("/register", methods=['GET', 'POST'])
def register():
    # if current_user.is_authenticated:
    #     return redirect(url_for('home'))
    form = RegistrationForm()
    # print(form.username.data)
    if form.validate_on_submit():
        hashed_password = bcrypt.generate_password_hash(form.password.data).decode('utf-8')
        print("\n\nhashed_password\n\n" , hashed_password)
        
        
        # # print(form.dob.data)
        id = registerPatient(fname=form.fname.data, mname=form.mname.data, lname=form.lname.data, email=form.email.data,
        Dateofbirth = form.dob.data.strftime('%Y %m %d'), password=hashed_password)
        print(id)
        user = User(id = id,username=form.fname.data+" "+form.mname.data+" "+form.lname.data, email=form.email.data,
                    dob = form.dob.data.strftime('%Y-%m-%d'), password=hashed_password)
        db.session.add(user)
        db.session.commit()
        print(user)
        # print(form.dob.data.strftime('%Y %m %d'))
        # print(form.dob.data)

        # print(form.dob.data.strftime('%Y-%m-%d'))
        flash(f'Account created for {form.fname.data} {form.lname.data}!', 'success')
        return redirect(url_for('login'))
    return render_template('register.html', title='Register', form=form)


@app.route("/login", methods=['GET', 'POST'])
def login():
    # if current_user.is_authenticated:
    #     return redirect(url_for('home'))
    form = LoginForm()
    if form.validate_on_submit():
        print("\n\nemail\n\n",form.email.data)
        # print(f"\n\n{current_user}\n\n")
        user = getPatientByEmail(form.email.data)
        user1 = User.query.filter_by(email=form.email.data).first()
        print(f"\n\nlogin {user1}login\n\n")
        if user and user!=None and bcrypt.check_password_hash(user["password"], form.password.data):
            # remember is bool value if checked True else False
            if user1!=None:
                login_user(user1, remember=form.remember.data)
            #print(f"\n\n\n current user.id {current_user.id}\n\n\n")
            next_page = request.args.get('next')
            return redirect(next_page) if next_page else redirect(url_for('chooseDoctor'))
        else:
            flash('Login Unsuccessful. Please check email and password', 'danger')
    return render_template('login.html', title='Login', form=form)


@app.route("/logout")
def logout():
    logout_user()
    return redirect(url_for('about'))



@app.route("/account")
@login_required
def account():
    return render_template('account.html', title='Account')


# {% block scripts %}
#   <script>
#     $(document).ready(function () {
#       $('#data').DataTable({
#         ajax: '/api/data',
#         serverSide: true,
#         columns: [
#           {data: 'fname'},
#           {data: 'mname'},
#           {data: 'lname', orderable: false},
#           {data: 'specialization', orderable: false},
#           {data: 'gender'},
#           {data: 'email'}
#         ],
#       });
#     });
#   </script>
# {% endblock %}