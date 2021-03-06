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
            "username": "string | required | can be 'email' or 'username'",
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
            "user": "array",
            "status": 1
        }
        ```

---

## Users:

**Prefix:** */api/v1*

**GET** - */users*
    
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

**GET** - */locations_ads*
    
* Response:
    ```JSON
    {
        "data": [
            {
                "id": "integer",
                "name": "string",
                "address": "string",
                "position": {
                    "lat": "float",
                    "lng": "float",
                },
                "selected": "boolean | default: false",
            }
        ],
        "status": 1
    }
    ```

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

---

## Locations Installation Dates:

**Prefix:** */api/v1*

In all request **Header:**
    ```JSON
    {
        "Authorization": "Token",
        "Content-Type": "application/json"
    }
    ```

**GET** - */locations/installation*

* Body:
    ```JSON
    {
        "id": "integer | optional | location_id",
    }
    ```
    
    Note: If you pass the parameter *id*, you will receive the installation dates of that location. Otherwise, you will receive all the installation dates of all the locations.

* Response:
    ```JSON
    {
        "data": [],
        "status": 1
    }
    ```

**POST** - */locations/installation*

* Body:
    ```JSON
    {
        "location_id": "integer | required | location_id",
        "date_time": "datetime (yyyy-mm-dd h:i) | required",
        "comments": "string | optional"
    }
    ```

* Response:

    * Object created.

**PUT** - */locations/installation*

* Body:
    ```JSON
    {
        "id": "location_installation_dates_id",
        "location_id": "integer | required | location_id",
        "date_time": "datetime (yyyy-mm-dd h:i) | required",
        "comments": "string | optional"
    }
    ```

* Response:

    * Object updated.

**DELETE** - */locations/installation*

* Body:
    ```JSON
    {
        "id": "location_installation_dates_id"
    }
    ```

* Response: ``` { "message": "resource successfully deleted", "status": 1 } ```

---

## Locations Attention Schedule:

**Prefix:** */api/v1*

In all request **Header:**
    ```JSON
    {
        "Authorization": "Token",
        "Content-Type": "application/json"
    }
    ```

**GET** - */locations/attention_schedule*

* Body:
    ```JSON
    {
        "id": "integer | optional | location_id",
    }
    ```
    
    Note: If you pass the parameter *id*, you will receive the attention schedules of that location. Otherwise, you will receive all the attention schedules of all the locations.

* Response:
    ```JSON
    {
        "data": [],
        "status": 1
    }
    ```

**POST** - */locations/attention_schedule*

* Body:
    ```JSON
    {
        "location_id": "integer | required | location_id",
        "day": "integer | required",
        "start_hour": "time | required",
        "end_hour": "time | required",
    }
    ```

* Response:

    * Object created.

**PUT** - */locations/attention_schedule*

* Body:
    ```JSON
    {
        "id": "location_attention_schedule_id",
        "location_id": "integer | required | location_id",
        "day": "integer | required",
        "start_hour": "time | required",
        "end_hour": "time | required",
    }
    ```

* Response:

    * Object updated.

**DELETE** - */locations/attention_schedule*

* Body:
    ```JSON
    {
        "id": "location_attention_schedule_id"
    }
    ```

* Response: ``` { "message": "resource successfully deleted", "status": 1 } ```

---

## Locations Phone Numbers:

**Prefix:** */api/v1*

In all request **Header:**
    ```JSON
    {
        "Authorization": "Token",
        "Content-Type": "application/json"
    }
    ```

**GET** - */locations/phones*

* Body:
    ```JSON
    {
        "id": "integer | optional | location_id",
    }
    ```
    
    Note: if you pass the parameter *id*, you will receive the telephone numbers of that location. Otherwise, you will receive all the telephone numbers of all the locations.

* Response:
    ```JSON
    {
        "data": [],
        "status": 1
    }
    ```

**POST** - */locations/phones*

* Body:
    ```JSON
    {
        "location_id": "integer | required | location_id",
        "phone_number": "string | required"
    }
    ```

* Response:

    * Object created.

**PUT** - */locations/phones*

* Body:
    ```JSON
    {
        "id": "location_phones_id",
        "location_id": "integer | required | location_id",
        "phone_number": "string | required"
    }
    ```

* Response:

    * Object updated.

**DELETE** - */locations/phones*

* Body:
    ```JSON
    {
        "id": "location_phones_id"
    }
    ```

* Response: ``` { "message": "resource successfully deleted", "status": 1 } ```

---

## Locations Images:

**Prefix:** */api/v1*

In all request **Header:**
    ```JSON
    {
        "Authorization": "Token",
        "Content-Type": "application/json"
    }
    ```

**GET** - */locations/images*

* Body:
    ```JSON
    {
        "id": "integer | optional | location_id",
    }
    ```
    
    Note: If you pass the parameter *id*, you will receive the images of that location. Otherwise, you will receive all the images of all the locations.

* Response:
    ```JSON
    {
        "data": [],
        "status": 1
    }
    ```

**POST** - */locations/images*

* Body:
    ```JSON
    {
        "location_id": "integer | required | location_id",
        "url_image": "string | required"
    }
    ```

* Response:

    * Object created.

**PUT** - */locations/images*

* Body:
    ```JSON
    {
        "id": "location_images_id",
        "location_id": "integer | required | location_id",
        "url_image": "string | required"
    }
    ```

* Response:

    * Object updated.

**DELETE** - */locations/images*

* Body:
    ```JSON
    {
        "id": "location_images_id"
    }
    ```

* Response: ``` { "message": "resource successfully deleted", "status": 1 } ```

---

## Screen Brands:

**Prefix:** */api/v1*

In all request **Header:**
    ```JSON
    {
        "Authorization": "Token",
        "Content-Type": "application/json"
    }
    ```

**GET** - */screens/brands*

* Response:
    ```JSON
    {
        "data": [],
        "status": 1
    }
    ```

**POST** - */screens/brands*

* Body:
    ```JSON
    {
        "name": "string | required | unique"
    }
    ```

* Response:

    * Object created.

**PUT** - */screens/brands*

* Body:
    ```JSON
    {
        "id": "screen_brands_id",
        "name": "string | required | unique"
    }
    ```

* Response:

    * Object updated.

**DELETE** - */screens/brands*

* Body:
    ```JSON
    {
        "id": "screen_brands_id"
    }
    ```

* Response: ``` { "message": "resource successfully deleted", "status": 1 } ```

---

## Screen Types:

**Prefix:** */api/v1*

In all request **Header:**
    ```JSON
    {
        "Authorization": "Token",
        "Content-Type": "application/json"
    }
    ```

**GET** - */screens/types*

* Response:
    ```JSON
    {
        "data": [],
        "status": 1
    }
    ```

**POST** - */screens/types*

* Body:
    ```JSON
    {
        "name": "string | required | unique"
    }
    ```

* Response:

    * Object created.

**PUT** - */screens/types*

* Body:
    ```JSON
    {
        "id": "screen_types_id",
        "name": "string | required | unique"
    }
    ```

* Response:

    * Object updated.

**DELETE** - */screens/types*

* Body:
    ```JSON
    {
        "id": "screen_types_id"
    }
    ```

* Response: ``` { "message": "resource successfully deleted", "status": 1 } ```

---

## Screens:

**Prefix:** */api/v1*

In all request **Header:**
    ```JSON
    {
        "Authorization": "Token",
        "Content-Type": "application/json"
    }
    ```

**GET** - */screens*


* Body:
    ```JSON
    {
        "location_id": "integer | optional | location_id",
    }
    ```
    
    Note: if you pass the parameter *location_id*, you will receive the screens of that location. Otherwise, you will receive all the screens of all the locations.

* Response:
    ```JSON
    {
        "data": [],
        "status": 1
    }
    ```

**POST** - */screens*

* Body:
    ```JSON
    {
        "screen_type_id": "integer | required | screen_type_id",
        "screen_brand_id": "integer | required | screen_brand_id",
        "location_id": "integer | required | location_id",
        "code": "string | required",
        "model": "string | optional",
        "sku": "string | optional",
        "orientation": "string | optional",
        "size_inches": "string | required",
        "description": "string | optional",
    }
    ```

* Response:

    * Object created.

**PUT** - */screens*

* Body:
    ```JSON
    {
        "id": "screen_id",
        "screen_type_id": "integer | required | screen_type_id",
        "screen_brand_id": "integer | required | screen_brand_id",
        "location_id": "integer | required | location_id",
        "code": "string | required",
        "model": "string | optional",
        "sku": "string | optional",
        "orientation": "string | optional",
        "size_inches": "string | required",
        "description": "string | optional",
    }
    ```

* Response:

    * Object updated.

**DELETE** - */screens*

* Body:
    ```JSON
    {
        "id": "screen_id"
    }
    ```

* Response: ``` { "message": "resource successfully deleted", "status": 1 } ```

---

## Screen Installations:

**Prefix:** */api/v1*

In all request **Header:**
    ```JSON
    {
        "Authorization": "Token",
        "Content-Type": "application/json"
    }
    ```

**GET** - */screens/installations*


* Body:
    ```JSON
    {
        "screen_id": "integer | optional | screen_id",
    }
    ```
    
    Note: if you pass the parameter *screen_id*, you will receive the screen installations of that screen. Otherwise, you will receive all the screen installations of all the screens.

* Response:
    ```JSON
    {
        "data": [],
        "status": 1
    }
    ```

**POST** - */screens/installations*

* Body:
    ```JSON
    {
        "screen_id": "integer | required | screen_id",
        "name": "string | required",
        "date": "datetime (yyyy-mm-dd hh:ii) | required",
        "description": "string | optional"
    }
    ```

* Response:

    * Object created.

**PUT** - */screens/installations*

* Body:
    ```JSON
    {
        "id": "screen_installations_id",
        "screen_id": "integer | required | screen_id",
        "name": "string | required",
        "date": "datetime (yyyy-mm-dd hh:ii) | required",
        "description": "string | optional"
    }
    ```

* Response:

    * Object updated.

**DELETE** - */screens/installations*

* Body:
    ```JSON
    {
        "id": "screen_installations_id"
    }
    ```

* Response: ``` { "message": "resource successfully deleted", "status": 1 } ```

---

## Screen Place Installations:

**Prefix:** */api/v1*

In all request **Header:**
    ```JSON
    {
        "Authorization": "Token",
        "Content-Type": "application/json"
    }
    ```

**GET** - */screens/place/installations*


* Body:
    ```JSON
    {
        "screen_id": "integer | optional | screen_id",
    }
    ```
    
    Note: if you pass the parameter *screen_id*, you will receive the screen places installations of that screen. Otherwise, you will receive all the screen places installations of all the screens.

* Response:
    ```JSON
    {
        "data": [],
        "status": 1
    }
    ```

**POST** - */screens/place/installations*

* Body:
    ```JSON
    {
        "screen_id": "integer | required | screen_id",
        "type": "integer | required",
        "nids": "string | required",
        "antireflective": "boolean | required"
    }
    ```

* Response:

    * Object created.

**PUT** - */screens/place/installations*

* Body:
    ```JSON
    {
        "id": "place_installation_id",
        "screen_id": "integer | required | screen_id",
        "type": "integer | required",
        "nids": "string | required",
        "antireflective": "boolean | required"
    }
    ```

* Response:

    * Object updated.

**DELETE** - */screens/place/installations*

* Body:
    ```JSON
    {
        "id": "place_installation_id"
    }
    ```

* Response: ``` { "message": "resource successfully deleted", "status": 1 } ```

---

## Customers:

**Prefix:** */api/v1*

In all request **Header:**
    ```JSON
    {
        "Authorization": "Token",
        "Content-Type": "application/json"
    }
    ```

**GET** - */customers*

* Response:
    ```JSON
    {
        "data": [],
        "status": 1
    }
    ```

**POST** - */customers*

* Body:
    ```JSON
    {
        "name": "string | required",
        "tradename": "string | required",
        "address": "string | required",
        "phone_number": "string | required",
        "nit": "string",
        "customer_type": "integer | required"
    }
    ```

* Response:

    * Object created.

**PUT** - */customers*

* Body:
    ```JSON
    {
        "id": "customer_id",
        "name": "string | required",
        "tradename": "string | required",
        "address": "string | required",
        "phone_number": "string | required",
        "nit": "string",
        "customer_type": "integer | required"
    }
    ```

* Response:

    * Object updated.

**DELETE** - */customers*

* Body:
    ```JSON
    {
        "id": "customer_id"
    }
    ```

* Response: ``` { "message": "resource successfully deleted", "status": 1 } ```

---

## User Customers:

**Prefix:** */api/v1*

In all request **Header:**
    ```JSON
    {
        "Authorization": "Token",
        "Content-Type": "application/json"
    }
    ```

**POST** - */users/customers*

* Body:
    ```JSON
    {
        "user_id": "integer | required | user_id",
        "customer_id": "integer | required | customer_id",
    }
    ```

* Response:

    * Object created.

**DELETE** - */users/customers*

* Body:
    ```JSON
    {
        "user_id": "integer | required | user_id",
        "customer_id": "integer | required | customer_id",
    }
    ```

* Response: ``` { "message": "resource successfully deleted", "status": 1 } ```

---

## Contacts:

**Prefix:** */api/v1*

In all request **Header:**
    ```JSON
    {
        "Authorization": "Token",
        "Content-Type": "application/json"
    }
    ```

**GET** - */customers*

* Response:
    ```JSON
    {
        "data": [],
        "status": 1
    }
    ```

**POST** - */customers*

* Body:
    ```JSON
    {
        "name": "string | required",
        "phone_number": "string | optional",
        "cell_phone_number": "string | optional",
    }
    ```

* Response:

    * Object created.

**PUT** - */customers*

* Body:
    ```JSON
    {
        "id": "contact_id",
        "name": "string | required",
        "phone_number": "string | optional",
        "cell_phone_number": "string | optional",
    }
    ```

* Response:

    * Object updated.

**DELETE** - */customers*

* Body:
    ```JSON
    {
        "id": "contact_id"
    }
    ```

* Response: ``` { "message": "resource successfully deleted", "status": 1 } ```

---

## Customer Contacts:

**Prefix:** */api/v1*

In all request **Header:**
    ```JSON
    {
        "Authorization": "Token",
        "Content-Type": "application/json"
    }
    ```

**POST** - */customers/contacts*

* Body:
    ```JSON
    {
        "customer_id": "integer | required | customer_id",
        "contact_id": "integer | required | contact_id",
    }
    ```

* Response:

    * Object created.

**DELETE** - */customers/contacts*

* Body:
    ```JSON
    {
        "customer_id": "integer | required | customer_id",
        "contact_id": "integer | required | contact_id",
    }
    ```

* Response: ``` { "message": "resource successfully deleted", "status": 1 } ```

---

## Company Industries:

**Prefix:** */api/v1*

In all request **Header:**
    ```JSON
    {
        "Authorization": "Token",
        "Content-Type": "application/json"
    }
    ```

**GET** - */companies/industries*

* Response:
    ```JSON
    {
        "data": [],
        "status": 1
    }
    ```

**POST** - */companies/industries*

* Body:
    ```JSON
    {
        "name": "string | required"
    }
    ```

* Response:

    * Object created.

**PUT** - */companies/industries*

* Body:
    ```JSON
    {
        "id": "company_industry_id",
        "name": "string | required"
    }
    ```

* Response:

    * Object updated.

**DELETE** - */companies/industries*

* Body:
    ```JSON
    {
        "id": "company_industry_id"
    }
    ```

* Response: ``` { "message": "resource successfully deleted", "status": 1 } ```

---

## Company:

**Prefix:** */api/v1*

In all request **Header:**
    ```JSON
    {
        "Authorization": "Token",
        "Content-Type": "application/json"
    }
    ```

**GET** - */companies*

* Response:
    ```JSON
    {
        "data": [],
        "status": 1
    }
    ```

**POST** - */companies*

* Body:
    ```JSON
    {
        "company_industry_id": "integer | company_industry_id",
        "name": "string | required",
        "address": "string | required",
        "phone_number": "string | required",
        "web_site": "string | optional",
    }
    ```

* Response:

    * Object created.

**PUT** - */companies*

* Body:
    ```JSON
    {
        "id": "company_id",
        "company_industry_id": "integer | company_industry_id",
        "name": "string | required",
        "address": "string | required",
        "phone_number": "string | required",
        "web_site": "string | optional",
    }
    ```

* Response:

    * Object updated.

**DELETE** - */companies*

* Body:
    ```JSON
    {
        "id": "company_id"
    }
    ```

* Response: ``` { "message": "resource successfully deleted", "status": 1 } ```

---

## Customer Company:

**Prefix:** */api/v1*

In all request **Header:**
    ```JSON
    {
        "Authorization": "Token",
        "Content-Type": "application/json"
    }
    ```

**POST** - */customers/companies*

* Body:
    ```JSON
    {
        "customer_id": "integer | required | customer_id",
        "company_id": "integer | required | company_id",
    }
    ```

* Response:

    * Object created.

**DELETE** - */customers/companies*

* Body:
    ```JSON
    {
        "customer_id": "integer | required | customer_id",
        "company_id": "integer | required | company_id",
    }
    ```

* Response: ``` { "message": "resource successfully deleted", "status": 1 } ```

---

## Advertising:

**Prefix:** */api/v1*

In all request **Header:**
    ```JSON
    {
        "Authorization": "Token",
        "Content-Type": "application/json"
    }
    ```

**GET** - */advertisements*

* Response:
    ```JSON
    {
        "data": [],
        "status": 1
    }
    ```

**POST** - */advertising*

* Body:
    ```JSON
    {
        "customer_id": "integer | optional | customer_id",
        "contact_id": "integer | optional | contact_id",
        "company_id": "integer | optional | company_id",
        "user_id": "integer | required | user_id",
    }
    ```

* Response:

    * Object created.

**PUT** - */advertising*

* Body:
    ```JSON
    {
        "id": "advertising_id",
        "customer_id": "integer | optional | customer_id",
        "contact_id": "integer | optional | contact_id",
        "company_id": "integer | optional | company_id",
        "user_id": "integer | required | user_id",
        "status": "integer | optional",
    }
    ```

* Response:

    * Object updated.

**DELETE** - */advertising*

* Body:
    ```JSON
    {
        "id": "advertising_id"
    }
    ```

* Response: ``` { "message": "resource successfully deleted", "status": 1 } ```

---

## Advertising Locations:

**Prefix:** */api/v1*

In all request **Header:**
    ```JSON
    {
        "Authorization": "Token",
        "Content-Type": "application/json"
    }
    ```

**GET** - */advertising_locations*

* Body:
    ```JSON
    {
        "advertising_id": "integer | optional | advertising_id"
    }
    ```

* Response:
    ```JSON
    {
        "data": [],
        "status": 1
    }
    ```

**POST** - */advertising_location*

* Body:
    ```JSON
    {
        "advertising_id": "integer | required | advertising_id",
        "locations": "array | required | locations_array"
    }
    ```

* Response:

    * Object created.

**PUT** - */advertising_location*

* Body:
    ```JSON
    {
        "id": "advertising_locations_id",
        "advertisements_id": "integer | required | advertisements_id",
        "locations_id": "integer | required | locations_id",
        "status": "integer | optional",
    }
    ```

* Response:

    * Object updated.

**DELETE** - */advertising_location*

* Body:
    ```JSON
    {
        "id": "advertising_locations_id"
    }
    ```

* Response: ``` { "message": "resource successfully deleted", "status": 1 } ```

---

## Advertising Location Screens:

**Prefix:** */api/v1*

In all request **Header:**
    ```JSON
    {
        "Authorization": "Token",
        "Content-Type": "application/json"
    }
    ```

**GET** - */advertising_location_screens*

* Body:
    ```JSON
    {
        "advertising_id": "integer | optional | advertising_id",
        "advertising_locations_id": "integer | optional | advertising_locations_id"
    }
    ```

* Response:
    ```JSON
    {
        "data": [],
        "status": 1
    }
    ```

**POST** - */advertising_location_screens*

* Body:
    ```JSON
    {
        "advertising_id": "integer | required | advertising_id",
        "locations": "array | required | locations_array"
    }
    ```

* Response:

    * Object created.

* Response: ``` { "message": "success", "status": 1 } ```