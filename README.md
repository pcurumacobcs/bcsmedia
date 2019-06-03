# README

About project:

* Ruby version 2.6.3

* Rails version 5.2.3

* PostgresQL

* JWT

# API Documentation

**Recommendation:** store the URL or IP of the web service to only play with the url of the services. 

All these requests must be **HTTP** and return answers in **JSON** format:

## Log In/Sign In:

* **POST** - */auth/register*

    * Header:

        * ***Content-Type:*** application/json
    
    * Body:

        <!-- * ***name:*** string, required
        * ***last_name:*** string, required
        * ***username:*** string, required
        * ***email:*** string, required
        * ***password:*** string, required
        * ***password_confirm:*** string, required -->
        ```JSON
        {
            "name": string | required,
            "last_name": string | required,
            "username": string | required,
            "email": string | required,
            "password": string | required,
            "password_confirm": string | required,
        }
        ```

    * Response:

        * Object created.

* **POST** - */auth/login*
    
    * Body:

        <!-- * ***email:*** string, required
        * ***password:*** string, required  -->
        ```JSON
        {
            "email": string | required,
            "password" string | required
        }
        ```

    * Response:

        <!-- * ***token:*** TOKEN
        * ***exp:*** datetime
        * ***username:*** string -->
        ```JSON
        {
            "token": string,
            "exp": datetime,
            "username": string
        }
        ```

---

## Users:

**Prefix:** */api/v1*

* **POST** - */users*
    
    * Header:

        <!-- * ***Authorization:*** TOKEN
        * ***Content-Type:*** application/json -->
        ```JSON
        {
            "Authorization": "Token",
            "Content-Type": "application/json"
        }
        ```

    * Response:
        ```JSON
        {
            "data": [],
            "status": 1
        }
        ```

---

## Locations: