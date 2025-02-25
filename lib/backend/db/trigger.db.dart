class TriggerDB {
  static const triggers = [
    // Auto Update drift_entity_order_row when there is an insert at drift_entity_order_row_item
    '''DROP TRIGGER IF EXISTS update_order_totals_after_insert;''',
    '''
    CREATE TRIGGER update_order_totals_after_insert
    AFTER INSERT ON drift_entity_order_row_item
    FOR EACH ROW
    BEGIN
        UPDATE drift_entity_order_row
        SET total_quantity = total_quantity + NEW.quantity,
            total_price = total_price + (
                NEW.quantity * (
                    SELECT price 
                    FROM drift_entity_product_revision 
                    WHERE id = NEW.product_revision
                )
            )
        WHERE id = NEW.order_row;
    END;
    ''',
    // Auto Update drift_entity_order_row when there is an update at drift_entity_order_row_item
    '''DROP TRIGGER IF EXISTS update_order_totals_after_update;''',
    '''
    CREATE TRIGGER update_order_totals_after_update
    AFTER UPDATE ON drift_entity_order_row_item
    FOR EACH ROW
    BEGIN
        UPDATE drift_entity_order_row
        SET total_quantity = total_quantity - OLD.quantity + NEW.quantity,
            total_price = total_price - (
                OLD.quantity * (
                    SELECT price 
                    FROM drift_entity_product_revision 
                    WHERE id = OLD.product_revision
                )
            ) + (
                NEW.quantity * (
                    SELECT price 
                    FROM drift_entity_product_revision 
                    WHERE id = NEW.product_revision
                )
            )
        WHERE id = NEW.order_row;
    END;
    ''',
    // Auto Update drift_entity_order_row when there is a deletion at drift_entity_order_row_item
    '''DROP TRIGGER IF EXISTS update_order_totals_after_delete;''',
    '''
    CREATE TRIGGER update_order_totals_after_delete
    AFTER DELETE ON drift_entity_order_row_item
    FOR EACH ROW
    BEGIN
        UPDATE drift_entity_order_row
        SET total_quantity = total_quantity - OLD.quantity,
            total_price = total_price - (
                OLD.quantity * (
                    SELECT price 
                    FROM drift_entity_product_revision 
                    WHERE id = OLD.product_revision
                )
            )
        WHERE id = OLD.order_row;
    END;
    ''',
  ];
}
