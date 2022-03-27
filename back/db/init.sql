drop table if exists courses cascade;
drop table if exists people cascade;
drop table if exists financing_methods cascade;
drop table if exists financing cascade;
drop table if exists installments cascade;

CREATE TABLE courses (
    id SERIAL PRIMARY KEY,
    name character varying(255) NOT NULL UNIQUE,
    price bigint NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);

CREATE TABLE people (
    id SERIAL PRIMARY KEY,
    name character varying(255) NOT NULL,
    email character varying(255) NOT NULL UNIQUE,
    cpf character varying(255) NOT NULL UNIQUE,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);

CREATE TABLE financing_methods (
    id SERIAL PRIMARY KEY,
    name character varying(255),
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);

CREATE TABLE financing (
    id SERIAL PRIMARY KEY,
    total bigint NOT NULL,
    number_of_installments INTEGER NOT NULL,
    entry bigint,
    financing_method_id INTEGER ,
    course_id INTEGER ,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    CONSTRAINT fk_financing_method
       FOREIGN KEY(financing_method_id)
           REFERENCES financing_methods(id),
    CONSTRAINT fk_course
       FOREIGN KEY(course_id)
           REFERENCES courses(id)
);

CREATE TABLE installments (
    id SERIAL PRIMARY KEY,
    value bigint NOT NULL,
    due_data DATE NOT NULL ,
    data_of_issue DATE NOT NULL,
    financing_id INTEGER ,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    CONSTRAINT fk_financing
      FOREIGN KEY(financing_id)
          REFERENCES financing(id)
);

-- INSERT INTO courses (name, price) VALUES
-- ('Algoritmos Avançado', 9900);
--
-- INSERT INTO courses (name, price) VALUES
-- ('Algoritmos Avançado 2', 9900);
--
-- INSERT INTO courses (name, price) VALUES
-- ('Algoritmos Avançado 3', 9900);
--
-- INSERT INTO people (name, email, cpf) VALUES
-- ('Jean Rodrigo Santos', 'rodrigo.santospdt@gmail.com', '06924218156');
--
-- INSERT INTO financing_methods (name) VALUES
-- ('Boleto');
--
-- INSERT INTO financing (total, number_of_installments, entry, financing_method_id, course_id) VALUES
-- (100, 2, 100, 1, 1);
--
-- INSERT INTO installments (value, due_data, data_of_issue, financing_id) VALUES
-- (50, '2022-04-21', '2022-04-30', 1);
--
-- INSERT INTO installments (value, due_data, data_of_issue, financing_id) VALUES
-- (50, '2022-05-21', '2022-05-30', 1);








