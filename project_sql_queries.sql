DROP TABLE IF EXISTS Final_Master;

CREATE TABLE Final_Master (
    enrollment_id          VARCHAR(255),  
    learner_id             VARCHAR(255),  
    assigned_cohort        VARCHAR(255),  
    apply_date             DATE,  
    status                 INTEGER,  
    country                VARCHAR(255),  
    degree                VARCHAR(255),  
    institution           VARCHAR(255),  
    major                 VARCHAR(255),  
    email                 VARCHAR(255),  
    gender                VARCHAR(50),  
    usercreatedate        TIMESTAMP,  
    userlastmodifieddate  TIMESTAMP,  
    birthdate             DATE,  
    city                  VARCHAR(255),  
    zip                   VARCHAR(50),  
    state                 VARCHAR(255),  
    opportunity_id        VARCHAR(255),  
    opportunity_name      VARCHAR(255),  
    category              VARCHAR(255),  
    opportunity_code      VARCHAR(255),  
    tracking_questions    TEXT,  
    cohort_id             VARCHAR(255),  
    cohort_code           VARCHAR(255),  
    start_date            TEXT, 
    end_date              TEXT,  
    size                 INTEGER,  
    ad_account_name       VARCHAR(255),  
    campaign_name         VARCHAR(255),  
    delivery_status       VARCHAR(255),  
    delivery_level        VARCHAR(255),  
    reach                INTEGER,  
    outbound_clicks      INTEGER,  
    landing_page_views   INTEGER,  
    result_type          VARCHAR(255),  
    results             INTEGER,  
    cost_per_result      NUMERIC(10,2),  
    amount_spent        NUMERIC(10,2),  
    cpc                 NUMERIC(10,2),  
    reporting_start      DATE,  
    reporting_ends       DATE  
);
--start date
UPDATE public.final_master 
SET start_date = start_date::NUMERIC,
    end_date = end_date::NUMERIC;

UPDATE public.final_master 
SET start_date = TO_TIMESTAMP(start_date::NUMERIC / 1000),
    end_date = TO_TIMESTAMP(end_date::NUMERIC / 1000);



SELECT start_date, end_date 
FROM public.final_master 
WHERE start_date !~ '^[0-9]+(\.[0-9]+)?$';

UPDATE public.final_master 
SET start_date = TO_TIMESTAMP(start_date::NUMERIC / 1000)
WHERE start_date ~ '^[0-9]+(\.[0-9]+)?$';

UPDATE public.final_master 
SET end_date = TO_TIMESTAMP(end_date::NUMERIC / 1000)
WHERE end_date ~ '^[0-9]+(\.[0-9]+)?$';

ALTER TABLE public.final_master 
ALTER COLUMN start_date TYPE TIMESTAMP USING start_date::TIMESTAMP;
ALTER TABLE public.final_master 
ALTER COLUMN end_date TYPE TIMESTAMP USING end_date::TIMESTAMP;










--birthdate
ALTER TABLE public.final_master ALTER COLUMN birthdate TYPE TEXT;
UPDATE public.final_master 
SET birthdate = NULL 
WHERE birthdate = 'unknown';

UPDATE public.final_master 
SET birthdate = birthdate::DATE 
WHERE birthdate IS NOT NULL;                                                                                                                           ALTER TABLE public.final_master 

ALTER TABLE public.final_master 
ALTER COLUMN birthdate TYPE DATE USING birthdate::DATE;


SELECT column_name, data_type 
FROM information_schema.columns 
WHERE table_name = 'final_master';

select * from final_master;