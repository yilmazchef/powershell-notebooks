_Follow this guide to create a headless CMS in just ten steps._

Say you want to start a blog or showcase your products and services on a website. One option is to build everything from scratch using HTML, CSS, and JavaScript. This would require building databases, an admin login, and interfaces so that you can log in and update the information. As this takes a lot of effort, you should probably use a proven Content Management System (CMS) if you’re not familiar with programming. A CMS provides all the tools required to manage content and apply different layouts to a website out-of-the-box.

There are many different [CMSs available](https://nordicapis.com/api-based-cms-buyers-guide/), such as WordPress, Wix, Contentful, or Squarespace, which can be used to generate websites and web applications. A CMS provides visual editing interfaces, templates, custom code, and other content management capabilities, all from a single environment. WordPress, one of the most powerful options, boasts many plugins to extend behavior and introduce powerful eCommerce abilities.

So, now the next question arises: what is a **headless CMS**?

## What Is a Headless CMS?

So, we have been using CMSs for about 20 years now. However, the world has changed a lot. Today’s mobile era has seen much growth into novel frontiers, such as IoT, bots, digital assistance, and VR. However, traditional CMS wasn’t built for these cutting-edge platforms.

Today, content must be displayed on a variety of devices in different formats. Since traditional CMS was not developed for this purpose, we require a new type of client-agnostic content management system. This is where headless CMS comes in.

A headless CMS focuses solely on the backend process of managing the content. It doesn’t control how the frontend presentation looks. Instead, a headless CMS uses an API to provide content to the end channels. In this way, a headless CMS is detached from the client (the “head”) and is thus headless. Using APIs to separate concerns means your content is deliverable to any platform; it could be an Angular website, mobile application, or even a smartwatch.

### Pros of Headless CMS

- It is more secure when compared with traditional CMS
- It is also smaller in size
- Faster than the conventional CMS
- It allows you to choose any languages for frontend development
- It enables you to publish your content to different platforms

### Cons of Headless CMS

- You have to manage two parts at the same time — the backend and frontend
- You’ll need a completely different infrastructure to maintain the frontend
- It can be more expensive to maintain than a traditional CMS

### Some Popular Headless CMS

- Directus
- Prismic
- Kentico Kontent
- Bloomreach
- Magnolia

Now that we understand what a headless CMs is, let’s learn how to create one. In this walkthrough, we’ll create a headless CMS using Flask and MySQL.

## Prerequisites

- Python
- MySQL
- Flask
- Code Editor like VS Code
- MySQL
- SQLalchemy

## Step – 1: The Setup

Open your terminal and create a new folder using the command `mkdir`. We’re using `cms` as the folder name:

```
mkdir cms
```

Now open the folder:

```
cd cms
virtualenv .
pipenv install flask flask-sqlalchemy flask-cors
```

Now we must create different files and folders inside the root folder. For the sake of this walkthrough, create this structure of five folders and one file:

- Blog
- Login
- Tag
- blog\_tags
- User
- \_\_init\_\_.py

Now create some Python files as well. The final folder structure has to be like this:

- Blog  
    – blog\_model.py  
    – blog\_routes.py
- Login  
    – login\_route.py
- Tag  
    – tag\_model.py
- blog\_tags  
    – blog\_tag\_table.py
- User  
    – user\_model.py

Once you’ve created the project structure, now install `Flask` and `virtualenv`. We have already covered how to set up the Flask in a previous article. You can check it out [here](https://nordicapis.com/how-to-create-an-api-using-the-flask-framework/) and then continue with the next steps.

Let’s install `flask-sqlalchemy`. On your terminal, paste the below command:

```
python3 -m pip install flask-sqlalchemy
```

What exactly is `flask-sqlalchemy`? Well, it is a Flask extension that adds support for `sqlalchemy` and simplifies many MySQL tasks. It uses Object Relational Mapping (ORM), making it easier for you to run queries without writing down the raw SQL statements.

### Initializing

Once all the dependencies are installed, it’s time to write some code. So, open `cms/__init__.py` in your code editor and paste the below code:

```
from flask import Flask
from flask_sqlalchemy import SQLAlchemy
from flask_cors import CORS

db = SQLAlchemy()

def create_app():
    app = Flask(__name__)
    app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///flaskdatabase.db'
    app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
    CORS(app)

    db.init_app(app)

    return app
```

### Explanation

Here we have created a function called `create_app()`, which basically initializes our application and database at the same time, which we can use anywhere in the code.

## Step – 2: Database Setup

In this step, we’ll be creating tables for our headless CMS. These tables will store all the data that we’ll publish through our CMS. We’ll start with the blog table which will have columns: `id`, `title`, `text`, `date_of_publish`, `image`, `tags`. If you want, you can add some more columns if required, but for now, for the sake of simplicity, we’re just creating the basic columns which are there in most CMSs.

Now open `Blog/blog_model.py` and paste the below code:

```
from cms import db
from datetime import datetime
from cms.blog_tags.blog_tag_table import tag_blog

tags=db.relationship('Tag',secondary=tag_blog,backref=db.backref('blogs_associated',lazy="dynamic"))

class Blog(db.Model):
    id = db.Column(db.Integer,primary_key=True)
    title=db.Column(db.String(50),nullable=False)
    text=db.Column(db.Text,nullable=False)
    image= db.Column(db.String,nullable=False)
    date_of_publish = db.Column(db.DateTime, default=datetime.utcnow)

    @property
    def serialize(self):
        return {
            'id': self.id,
            'title': self.title,
            text: self.text,
            image: self.image,
            date_of_publish: self.date_of_publish,
        }
```

### Explanation

Here we are importing different modules like `db` for database connections, and `datetime` for timestamps. We have created a model `Blog` and have defined all the fields in it. There’s a function called `serialize(self)`, which is used to return all the data in JSON form.

You might have noticed that we haven’t defined tags here, right? This is because `tags` is a foreign key that will come from a completely different table called `tags`. Basically, one post can have many tags, and one tag can be associated with multiple blog posts.

Now open `cms/Tag/tag_model.py` and paste the below code:

```
from cms import db

class Tag(db.Model):
    id=db.Column(db.Integer,primary_key=True)
    name=db.Column(db.String(20))
    @property
    def serialize(self):
        return {
        'id': self.id,
        'name': self.name     
        }
```

### Explanation

We have defined the model with `id` and `name` columns since tags don’t require more than these columns.

Once the model is done, it’s time to create a table also, so open the file `cms/blog_tags/blog_tag_table.py`, and paste the below code:

```
from cms import db

tag_blog = db.Table('tag_blog',
    db.Column('tag_id',db.Integer,db.ForeignKey('tag.id'), primary_key=True),
    db.Column('blog_id', db.Integer,db.ForeignKey('blog.id'),primary_key=True)
)
```

### Explanation

This table holds the relationship between the blog table and tags table where `tag_id` is mapped with `blog_id`.

## Step –3: Adding Blueprints

Now we have to edit the file `Blog/blog_routes.py` and add the below lines of code:

```
blogs= Blueprint('blogs',__name__)
```

Open cms/`__init__.py` and add the below code:

```
from cms.Blog.blog_routes import blogs
app.register_blueprint(blogs)
```

### Explanation

We’re adding blueprints here. It helps us to break the application into small components that can be reused anywhere. Here we have defined `blogs` as the blueprint.

## Step –4: Creating a Route for Publishing a Blog Post

Now open your `blog_routes.py` and add the below code:

```
from flask import Blueprint,request,jsonify,make_response
from flask_jwt_extended import jwt_required
from cms import db
from cms.Blog.blog_model import Blog
from cms.Tag.tag_model import Tag

blogs= Blueprint('blogs',__name__)
@blogs.route('/add_post',methods=["POST"])
def create_blog():
    data = request.get_json()

    new_blog=Blog(title=data["title"],content=data["content"],image=data["image"])

    for tag in data["tags"]:
        current_tag=Tag.query.filter_by(name=tag).first()
        if(current_tag):
            current_tag.blogs_associated.append(new_blog)
        else:
            new_tag=Tag(name=tag)
            new_tag.blogs_associated.append(new_blog)
            db.session.add(new_tag)
            

    db.session.add(new_blog)
    db.session.commit()

    blog_id = getattr(new_blog, "id")
    return jsonify({"id": blog_id})
```

### Explanation

We have created a route `/blog_post`, which invokes the function that will create `create_blog()`. This function is basically used to create a blog post and accepts title, text, image, and tags. We’re running a loop where it can accept multiple tags, and if a tag doesn’t exist, then it’ll create a new tag and associate it with the blog post.

## Step –5: Creating Route to Fetch the Blog Posts

We will create two different routes to fetch the blog posts. One route will fetch all the blog posts while the other one will be used to fetch blog posts on the basis of `id`. This can be used to search the blog posts when a user opens the full blog post. Now open `blog_routes.py` and paste the below code:

```
@blogs.route('/blogs',methods=["GET"])
def get_all_blogs():
    blogs= Blog.query.all()
    serialized_data = []
    for blog in blogs:
        serialized_data.append(blog.serialize)

    return jsonify({"all_blogs": serialized_data})
```

### Explanation

We have defined a route `/blogs`, which runs a `SELECT` query using the ORM and returns a JSON containing all the blog posts and their data under the `all_blogs` key.

Now to fetch the blog post with specific `id` paste the below code:

```
@blogs.route('/blog/<int:id>',methods=["GET"])
def get_single_blog(id):
    blog = Blog.query.filter_by(id=id).first()
    serialized_blog = blog.serialize
    serialized_blog["tags"] = []

    for tag in blog.tags:
        serialized_blog["tags"].append(tag.serialize)

    return jsonify({"single_blog": serialized_blog})
```

### Explanation

We have defined another route `/blog`, which accepts an integer value and returns all the blog data in a JSON under the `single_blog` key.

## Step –6: Creating a Route to Delete a Blog Post

So far we have covered how to create a blog. Now here’s how to delete a blog post. In the `blog_routes.py`, paste the below code:

```
@blogs.route('/delete_post/<int:id>', methods=["DELETE"])
def delete_post(id):
    blog = Blog.query.filter_by(id=id).first()
    db.session.delete(blog)
    db.session.commit()

    return jsonify("Blog was deleted"),200
```

### Explanation

Here we have defined a route `/delete_post`, which accepts the `id` of the blog post and runs the delete query for the associated blog `id`.

## Step –7: Creating a Route to Update a Blog Post

To update a blog post we’ll use the `PUT` method here which will take a blog `id` as input parameter. So in `blog_routes.py` add the below code:

```
@blogs.route('/update_post/<int:id>', methods=["PUT"])
def update_post(id):
    data = request.get_json()
    blog=Blog.query.filter_by(id=id).first_or_404()

    blog.title = data["title"]
    blog.text=data["text"]
    blog.image=data["image"]

    updated_blog = blog.serialize

    db.session.commit()
    return jsonify({"blog_id": blog.id})
```

### Explanation

We have added one more route that is `/update_post`, which uses the `PUT` method and runs an `UPDATE` query on the passed blog `id`.

## Step –8: Adding Admin User and Login Route

Now we have defined all the paths that can perform CRUD operations on the blog post. But we also have to prevent unauthorized access, right? This will ensure that no unauthorized person can update or add a blog post.

So we’ll first create a user model which will used to store the user info. So, open the file `cms/User/user_model.py`, and paste the below code:

```
from cms import db

class User(db.Model):
    id=db.Column(db.Integer,primary_key=True)
    email=db.Column(db.String(120),nullable=False)
    password=db.Column(db.String(120),nullable=False)
```

Here we’ll have only one admin user, so we don’t need to create a route for that. So in your `__init__.py` file paste the below code:

```
@click.command(name='add_admin')   
    @with_appcontext
    def add_admin():
        admin=User(email="ADMIN EMAIL",password="YOUR PASSWORD STRING")
        admin.password = generate_password_hash(admin.password,'sha256',salt_length=12)
        db.session.add(admin)
        db.session.commit()

    app.cli.add_command(add_admin)
```

And on the top, add the below code:

```
import click
from flask.cli import with_appcontext
from werkzeug.security import generate_password_hash
```

### Explanation

Here we are storing email and password for the admin user. Now we can not store it as plain text, so we’re using `SHA256` hashing.

Once the above part is done, we have to create a route for admin login. So to do that, we have to open the `Login/login_route.py` file and paste the below code:

```
from flask import Blueprint,request,jsonify
from cms.User.user_model import User
from flask_jwt_extended import create_access_token
from werkzeug.security import check_password_hash 

login=Blueprint('login', __name__)

@login.route('/login', methods=["POST"])
def log_in():
    request_data = request.get_json()

    user=User.query.filter_by(email=request_data["email"]).first()
    if user:
        if check_password_hash(user.password,request_data["password"]):
            jwt_token=create_access_token(identity=user.email)
            return jsonify({"token":jwt_token})
    else:
        return "Invalid email or password",400
```

### Explanation

Here we have defined a route `/login`, which will take email and password. Once both of them are correct, it’ll return a JWT token you can use to make the next requests.

## Step –9: Implementing JWT

Now we have added an admin user, and the login part is also done. But to make it more secure, we’ll implement JWT on `add_post` and `update_post` to prevent unauthorized access. On your terminal, paste the below code:

```
pipenv install flask-jwt-extended
```

This will install JWT, which you can use to implement JWT.

Now, open `__init__.py` and paste the below code:

```
app.config['JWT_SECRET_KEY']=ADD YOUR SECRET STRING HERE
jwt=JWTManager(app)
```

Now open file `Blog_routes.py` and update the below routes:

```
@blogs.route('/delete_post/<int:id>', methods=["DELETE"])
@jwt_required
def delete_post(id):
    blog = Blog.query.filter_by(id=id).first()
    db.session.delete(blog)
    db.session.commit()

    return jsonify("Blog was deleted"),200
```

Similarly, add the same `@jwt_required` below the line `@blogs.route('/add_post',methods=["POST"])`

## Step –10: Finalizing the Setup

In the end, your `cms/__init__.py` should look something like this:

```
from flask import Flask
from flask_sqlalchemy import SQLAlchemy
from flask_cors import CORS
import click
from flask.cli import with_appcontext
from flask_jwt_extended import JWTManager
from werkzeug.security import generate_password_hash

db = SQLAlchemy()

def create_app():
    app = Flask(__name__)
    app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///flaskdatabase.db'
    app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
    CORS(app)
    db.init_app(app)
    app.config['JWT_SECRET_KEY']='YOUR_SECRET_KEY'
    jwt=JWTManager(app)

    from cms.Blog.blog_routes import blogs
    app.register_blueprint(blogs)

    from cms.User.user_model import User

    from cms.Login.login_route import login
    app.register_blueprint(login)

    from cms.Tag.tag_model import Tag

    
    @click.command(name='create_admin')   
    @with_appcontext
    def create_admin():
        admin=User(email="ANY_EMAIL",password="ANY_PASSWORD")
        admin.password = generate_password_hash(admin.password,'sha256',salt_length=12)
        db.session.add(admin)
        db.session.commit()

    app.cli.add_command(create_admin)

    

    return app
```

Once you’re done with everything, you simply need to run the below command to make the database working. So paste it on your terminal:

```
python
from cms import db,create_app
db.create_all(app=create_app())
```

This will create a file `flaskdatabase.db`, which contains all the tables. Now to run the API server, use the command:

```
set FLASK_APP=cms/__init__.py
set FLASK_DEBUG=1
set FLASK_ENV=development
flask create_admin
flask run
```

And Bingo!!! You’re ready to make the API calls to create blog posts. You can clone ready-made code from [this repository](https://github.com/vyomsrivastava/cms-backend).

## Final Words

In this article, we have covered a lot of ground, like how to make SQL connections, how to run SQL queries using SQLalchemy, implementation of JWT, and more, all to generate a headless CMS. You can say that this is a kind of all-in-one article, which can help you to start picking up some advanced concepts in Python-Flask.
