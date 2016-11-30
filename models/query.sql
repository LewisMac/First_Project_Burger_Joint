SELECT d.*, j.* FROM x_for_y_deals d
INNER JOIN joining j
ON d.id = j.deal_id;