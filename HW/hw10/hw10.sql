CREATE TABLE parents AS
  SELECT "ace" AS parent, "bella" AS child UNION
  SELECT "ace"          , "charlie"        UNION
  SELECT "daisy"        , "hank"           UNION
  SELECT "finn"         , "ace"            UNION
  SELECT "finn"         , "daisy"          UNION
  SELECT "finn"         , "ginger"         UNION
  SELECT "ellie"        , "finn";

CREATE TABLE dogs AS
  SELECT "ace" AS name, "long" AS fur, 26 AS height UNION
  SELECT "bella"      , "short"      , 52           UNION
  SELECT "charlie"    , "long"       , 47           UNION
  SELECT "daisy"      , "long"       , 46           UNION
  SELECT "ellie"      , "short"      , 35           UNION
  SELECT "finn"       , "curly"      , 32           UNION
  SELECT "ginger"     , "short"      , 28           UNION
  SELECT "hank"       , "curly"      , 31;

CREATE TABLE sizes AS
  SELECT "toy" AS size, 24 AS min, 28 AS max UNION
  SELECT "mini"       , 28       , 35        UNION
  SELECT "medium"     , 35       , 45        UNION
  SELECT "standard"   , 45       , 60;


-- All dogs with parents ordered by decreasing height of their parent
CREATE TABLE by_parent_height AS
  SELECT T1.child AS chil FROM parents AS T1,dogs AS T2
  WHERE T1.parent = T2.name
  ORDER BY T2.height DESC;


-- The size of each dog
CREATE TABLE size_of_dogs AS
  SELECT d.name,s.size FROM dogs AS d,sizes AS s
  WHERE d.height > s.min AND d.height <= s.max;


-- [Optional] Filling out this helper table is recommended
CREATE TABLE siblings AS
  SELECT p1.name AS sibling1,p2.name AS sibling2,p1.size AS size
  FROM size_of_dogs AS p1, size_of_dogs AS p2,parents AS q1,parents AS q2
  WHERE p1.size=p2.size AND p1.name < p2.name AND q1.child = p1.name AND q2.child = p2.name AND q1.parent = q2.parent;

-- Sentences about siblings that are the same size
CREATE TABLE sentences AS
  SELECT 'The two siblings, ' || sibling1 || ' and ' || sibling2 || ', have the same size: ' || size AS sentence 
  FROM siblings
  ORDER By sibling1;


-- Height range for each fur type where all of the heights differ by no more than 30% from the average height
CREATE TABLE low_variance AS
  WITH FurStatus AS (
  SELECT  
    fur,
    MIN(height) AS min_height,
    MAX(height) AS max_height,
    AVG(height) AS avg_height 
    FROM dogs
    GROUP BY fur
    )
  SELECT fur, max_height-min_height AS height_range
  FROM FurStatus
  WHERE min_height >= 0.7 * avg_height AND max_height <= 1.3 * avg_height
    ;

