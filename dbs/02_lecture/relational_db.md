---
title: Flight example
---
erDiagram
    country ||--o{ airports : has


    arrival {
        int arrival_id pk
        string name
        string short_name
        }
    departure {
        int departure_id pk
        string name
        string short_name
        }
    
    arrival ||--o{ route_list :contains
    departure ||--o{ route_list :contains
    flight ||--o{ route_list :contains
    airlines ||--o{ route_list :contains
    airports ||--o{ route_list :contains

    route_list {
        int route_list_id pk
        int departure_id fk
        int arrival_id fk
        int flight_id fk
        int airlines_id fk
    }

    country {
        int country_id pk
        string country_name
        string country_short_name
    }

    airports {
        int airports_id pk
        string name
        string short_name
        int country_id FK
    }
    airlines {
        int airlines_id pk
        string name
    }

    flight {
        int flight_id pk
        string flight_name
        int flight_number
    }

    passenger {
        int passenger_id pk
        string first_name
        string last_name
    }

    travel_types {
        int travel_types_id pk
        string name
    }
    ticket_line ||--o{ passenger : contains
    ticket_line ||--o{ route_list : contains
    ticket_line ||--o{ passenger : contains
    ticket_line ||--o{ travel_types : contains


    ticket_line{
        int ticket_line_id pk
        int ticket_id fk
        int passenger_id  fk
        string passenger_departure fk
        string passenger_arrival fk
        datetime departure_date_time
        datetime arrival_date_time
        double price

    }
    ticket ||--o{ ticket_line : contains
    ticket {
        int ticket_id
        int customer_id
        date order_date
    }
    customer || --o{ ticket : has-a
    customer {
        int customer_id
        string customer_first_name
        string customer_last_name
    }
