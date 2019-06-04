# README

About project:

* Ruby version 2.6.3

* Rails version 5.2.3

* PostgresQL

* JWT

# API Documentation

**Recommendation:** store the URL or IP of the web service to only play with the url of the services. iP server **167.99.163.67** (*bcs-media*).

All these requests must be **HTTP** and return answers in **JSON** format. 

## Log In/Sign In:

* **POST** - */auth/register*

    * Header:

        ```JSON
        {
            "Content-Type": "application/json"
        }
        ```
        <!-- * ***Content-Type:*** application/json -->
    
    * Body:

        <!-- * ***name:*** string, required
        * ***last_name:*** string, required
        * ***username:*** string, required
        * ***email:*** string, required
        * ***password:*** string, required
        * ***password_confirm:*** string, required -->
        ```JSON
        {
            "name": "string | required",
            "last_name": "string | required",
            "username": "string | required",
            "email": "string | required",
            "password": "string | required",
            "password_confirm": "string | required",
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
            "email": "string | required",
            "password": "string | required"
        }
        ```

    * Response:

        <!-- * ***token:*** TOKEN
        * ***exp:*** datetime
        * ***username:*** string -->
        ```JSON
        {
            "token": "string",
            "exp": "datetime | yyyy-mm-dd HH-MM",
            "username": "string"
        }
        ```

---

## Users:

**Prefix:** */api/v1*

* **GET** - */users*
    
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

## Business Types:


**Prefix:** */api/v1*

In all request **Header:**
    ```JSON
    {
        "Authorization": "Token",
        "Content-Type": "application/json"
    }
    ```

**GET** - */business_types*
    
* Response:
    ```JSON
    {
        "data": [],
        "status": 1
    }
    ```

**POST** - */business_types*

* Body:
    ```JSON
    {
        "name": "string | required | unique",
        "description": "string"
    }
    ```

* Response:

    * Object created.

**PUT** - */business_types*

* Body:
    ```JSON
    {
        "id": "location_type_id",
        "name": "string | unique"
    }
    ```

* Response:

    * Object updated.

**DELETE** - */business_types*

* Body:
    ```JSON
    {
        "id": "location_type_id"
    }
    ```

* Response: ``` { "message": "resource successfully deleted", "status": 1 } ```

---

## Locations Types:

**Prefix:** */api/v1*

In all request **Header:**
    ```JSON
    {
        "Authorization": "Token",
        "Content-Type": "application/json"
    }
    ```

**GET** - */locations/types*
    
* Response:
    ```JSON
    {
        "data": [],
        "status": 1
    }
    ```

**POST** - */locations/types*

* Body:
    ```JSON
    {
        "name": "string | unique"
    }
    ```

* Response:

    * Object created.

**PUT** - */locations/types*

* Body:
    ```JSON
    {
        "id": "location_type_id",
        "name": "string | unique"
    }
    ```

* Response:

    * Object updated.

**DELETE** - */locations/types*

* Body:
    ```JSON
    {
        "id": "location_type_id"
    }
    ```

* Response: ``` { "message": "resource successfully deleted", "status": 1 } ```

---

## Nearby Places Tags:

**Prefix:** */api/v1*

In all request **Header:**
    ```JSON
    {
        "Authorization": "Token",
        "Content-Type": "application/json"
    }
    ```

**GET** - */nearby_place_tag*
    
* Response:
    ```JSON
    {
        "data": [],
        "status": 1
    }
    ```

**POST** - */nearby_place_tag*

* Body:
    ```JSON
    {
        "name": "string | unique"
    }
    ```

* Response:

    * Object created.

**PUT** - */nearby_place_tag*

* Body:
    ```JSON
    {
        "id": "nearby_place_tag_id",
        "name": "string | unique"
    }
    ```

* Response:

    * Object updated.

**DELETE** - */nearby_place_tag*

* Body:
    ```JSON
    {
        "id": "nearby_place_tag_id"
    }
    ```

* Response: ``` { "message": "resource successfully deleted", "status": 1 } ```

---

## Operators:

**Prefix:** */api/v1*

In all request **Header:**
    ```JSON
    {
        "Authorization": "Token",
        "Content-Type": "application/json"
    }
    ```

**GET** - */operators*
    
* Response:
    ```JSON
    {
        "data": [],
        "status": 1
    }
    ```

**POST** - */operators*

* Body:
    ```JSON
    {
        "first_name": "string | required",
        "last_name": "string | required",
        "email": "string | optional",
        "phone_number": "string | required",
        "position": "string | required",
        "description": "string | optional",
        "type_operator": "integer | required",
    }
    ```
    Note: 

    * type_operator:

        * 1 = Manager
        * 2 = Operator

* Response:

    * Object created.

**PUT** - */operators*

* Body:
    ```JSON
    {
        "id": "operator_id",
        "last_name": "string | required",
        "email": "string | optional",
        "phone_number": "string | required",
        "position": "string | required",
        "description": "string | optional",
        "type_operator": "integer | required",
    }
    ```

* Response:

    * Object updated.

**DELETE** - */operators*

* Body:
    ```JSON
    {
        "id": "operator_id"
    }
    ```

* Response: ``` { "message": "resource successfully deleted", "status": 1 } ```

---

## Locations:

**Prefix:** */api/v1*

In all request **Header:**
    ```JSON
    {
        "Authorization": "Token",
        "Content-Type": "application/json"
    }
    ```

**GET** - */locations*
    
* Response:
    ```JSON
    {
        "data": [],
        "status": 1
    }
    ```

**POST** - */locations*

* Body:
    ```JSON
    {
        "name": "string | required",
        "address": "string | required",
        "location_type_id": "integer | required | location_type_id",
        "business_email": "string | optional",
        "lat": "string | optional",
        "lng": "string | optional",
    }
    ```

* Response:

    * Object created.

**PUT** - */locations*

* Body:
    ```JSON
    {
        "id": "location_id",
        "name": "string | required",
        "address": "string | required",
        "location_type_id": "integer | required | location_type_id",
        "business_email": "string | optional",
        "lat": "string | optional",
        "lng": "string | optional",
    }
    ```

* Response:

    * Object updated.

**DELETE** - */locations*

* Body:
    ```JSON
    {
        "id": "location_id"
    }
    ```

* Response: ``` { "message": "resource successfully deleted", "status": 1 } ```

---

## Locations Business Types:

**Prefix:** */api/v1*

In all request **Header:**
    ```JSON
    {
        "Authorization": "Token",
        "Content-Type": "application/json"
    }
    ```

**POST** - */locations/business_type*

* Body:
    ```JSON
    {
        "location_id": "integer | required | location_id",
        "business_type_id": "integer | required | business_type_id",
    }
    ```

* Response:

    * Object created.

**DELETE** - */locations/business_type*

* Body:
    ```JSON
    {
        "location_id": "integer | required | location_id",
        "business_type_id": "integer | required | business_type_id",
    }
    ```

* Response: ``` { "message": "resource successfully deleted", "status": 1 } ```

---

## Locations Nearby Places Tags:

**Prefix:** */api/v1*

In all request **Header:**
    ```JSON
    {
        "Authorization": "Token",
        "Content-Type": "application/json"
    }
    ```

**POST** - */locations/nearby_place_tag*

* Body:
    ```JSON
    {
        "location_id": "integer | required | location_id",
        "nearby_place_tag_id": "integer | required | nearby_place_tag_id",
    }
    ```

* Response:

    * Object created.

**DELETE** - */locations/nearby_place_tag*

* Body:
    ```JSON
    {
        "location_id": "integer | required | location_id",
        "nearby_place_tag_id": "integer | required | nearby_place_tag_id",
    }
    ```

* Response: ``` { "message": "resource successfully deleted", "status": 1 } ```

---

## Locations Operators:

**Prefix:** */api/v1*

In all request **Header:**
    ```JSON
    {
        "Authorization": "Token",
        "Content-Type": "application/json"
    }
    ```

**POST** - */locations/operators*

* Body:
    ```JSON
    {
        "location_id": "integer | required | location_id",
        "operator_id": "integer | required | operator_id",
    }
    ```

* Response:

    * Object created.

**DELETE** - */locations/operators*

* Body:
    ```JSON
    {
        "location_id": "integer | required | location_id",
        "operator_id": "integer | required | operator_id",
    }
    ```

* Response: ``` { "message": "resource successfully deleted", "status": 1 } ```