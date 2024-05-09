-- Establishes idx_name_first index on the 'names' table to optimize searches based on the first letter of the 'name' column.
CREATE INDEX idx_name_first ON names(name(1));
