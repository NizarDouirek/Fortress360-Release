-- 1. Création des bases de données
CREATE DATABASE utmstack;
CREATE DATABASE userauditor;
CREATE DATABASE agentmanager;

-- 2. Connexion à la base utmstack pour le rebranding
\c utmstack

-- 3. Vos commandes de rebranding
UPDATE utm_configuration_parameter SET 
    conf_param_short = REPLACE(REPLACE(conf_param_short, 'Utmstack', 'Fortress360'), 'UTMStack', 'Fortress360'), 
    conf_param_description = REPLACE(REPLACE(conf_param_description, 'Utmstack', 'Fortress360'), 'UTMStack', 'Fortress360');

UPDATE utm_configuration_parameter SET 
    conf_param_large = REPLACE(conf_param_large, 'Utmstack', 'Fortress360') 
    WHERE conf_param_large ILIKE '%Utmstack%';

UPDATE utm_configuration_section SET 
    section = REPLACE(section, 'UTMStack', 'Fortress360'), 
    description = REPLACE(description, 'UTMStack', 'Fortress360');

UPDATE utm_module SET pretty_name = 'Fortress360' WHERE pretty_name ILIKE 'Utmstack';

UPDATE utm_index_pattern SET pattern = 'v11-log-fortress360-*' WHERE id = 69;
