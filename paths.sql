-- 1. Создание таблицы Employment_paths
CREATE TABLE Employment_paths (
    Depot_number integer NOT NULL,
    Path_number integer NOT NULL,
    date_and_time_start timestamp with time zone NOT NULL, -- Уточните точность на скриншоте обрезана (tin...)
    date_and_time_end timestamp with time zone NOT NULL,
    Tram_number integer NOT NULL,
    Additional_information character varying,
    
    -- Создание составного первичного ключа
    PRIMARY KEY (Depot_number, Path_number)
);

-- 2. Создание таблицы Trams
CREATE TABLE Trams (
    Depot_number integer NOT NULL,
    Path_number integer NOT NULL,
    purpose text NOT NULL,
    Path_length real,
    Path_is_clear boolean NOT NULL,
    Path_is_electrified boolean NOT NULL, -- На скриншоте обрезано как "Path_is_electrifi..."
    
    -- Создание такого же составного первичного ключа
    PRIMARY KEY (Depot_number, Path_number),
    
    -- (Рекомендуется) Добавление внешнего ключа, 
    -- так как Trams ссылается на пути из Employment_paths
    CONSTRAINT fk_employment_path
        FOREIGN KEY (Depot_number, Path_number) 
        REFERENCES Employment_paths (Depot_number, Path_number)
        ON DELETE CASCADE
);