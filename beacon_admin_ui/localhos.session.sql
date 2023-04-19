--@block
CREATE TABLE userss(
    id INT,
    name VARCHAR(255),
    country VARCHAR(255)
);
--@block
INSERT INTO userss
VALUES (1, "hfg", "dfg"),
    (45, "hfg", "dfg"),
    (3, "hfg", "dfg"),
    (4, "h2342g", "123srfg");
--@block
SELECT *
from userss;