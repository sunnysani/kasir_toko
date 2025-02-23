class TriggerDB {
  static const triggers = [
    // Auto Update drift_entity_order_row when there is an insert at drift_entity_order_row_item
    '''
      CREATE TRIGGER update_order_totals_after_insert
      AFTER INSERT ON drift_entity_order_row_item
      BEGIN
        UPDATE drift_entity_order_row
        SET total_quantity = (SELECT SUM(quantity) FROM drift_entity_order_row_item WHERE order_row = NEW.order_row),
            total_price = (SELECT SUM(quantity * (SELECT price FROM drift_entity_product_revision WHERE id = NEW.product_revision))
                          FROM drift_entity_order_row_item WHERE order_row = NEW.order_row)
        WHERE id = NEW.order_row;
      END;
    ''',
    // Auto Update drift_entity_order_row when there is an update at drift_entity_order_row_item
    '''
      CREATE TRIGGER update_order_totals_after_update
      AFTER UPDATE ON drift_entity_order_row_item
      BEGIN
        UPDATE drift_entity_order_row
        SET total_quantity = (SELECT SUM(quantity) FROM drift_entity_order_row_item WHERE order_row = NEW.order_row),
            total_price = (SELECT SUM(quantity * (SELECT price FROM drift_entity_product_revision WHERE id = NEW.product_revision))
                          FROM drift_entity_order_row_item WHERE order_row = NEW.order_row)
        WHERE id = NEW.order_row;
      END;
    ''',
    // Auto Update drift_entity_order_row when there is a deletion at drift_entity_order_row_item
    '''
      CREATE TRIGGER update_order_totals_after_delete
      AFTER DELETE ON drift_entity_order_row_item
      BEGIN
        UPDATE drift_entity_order_row
        SET total_quantity = (SELECT SUM(quantity) FROM drift_entity_order_row_item WHERE order_row = OLD.order_row),
            total_price = (SELECT SUM(quantity * (SELECT price FROM drift_entity_product_revision WHERE id = OLD.product_revision))
                          FROM drift_entity_order_row_item WHERE order_row = OLD.order_row)
        WHERE id = OLD.order_row;
      END;
    ''',
  ];
}
