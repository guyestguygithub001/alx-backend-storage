-- Establishes the idx_name_first_score index on the 'names' table to optimize searches based on the first letter of the 'name' column and the 'score' value.
CREATE INDEX idx_name_first_score ON names(name(1), score);
