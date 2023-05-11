create or replace FUNCTION fullname_from_cc(cc_profe IN VARCHAR2) RETURN VARCHAR2 IS
    fullname VARCHAR2(50);
BEGIN
    SELECT nombre INTO fullname
    FROM PROFESORES
    WHERE cedula = cc_profe;

    RETURN fullname;
END;

create or replace FUNCTION courses_quant_teacher(cc_profe IN VARCHAR2) RETURN NUMBER IS
    courses_quant NUMBER;
BEGIN
    SELECT count(*) INTO courses_quant
    FROM CURSOS
    WHERE profesor = cc_profe;

    RETURN courses_quant;
END;

CREATE OR REPLACE FUNCTION courses_quant_estudent(cod_student IN VARCHAR2) RETURN NUMBER IS
    courses_quant NUMBER;
BEGIN
    SELECT count(*) INTO courses_quant
    FROM MATRICULAS
    WHERE estudiante = cod_student;
    
    RETURN courses_quant;
END;


CREATE OR REPLACE FUNCTION invoice_balance(invoice_num IN VARCHAR2) RETURN NUMBER IS
    invoiced_value NUMBER;
    paid_value NUMBER;
    balance NUMBER;
BEGIN
    SELECT valor_total INTO invoiced_value
    FROM FACTURAS
    WHERE numero = invoice_num;
    
    paid_value := 0;
    SELECT valor INTO paid_value
    FROM PAGOS
    WHERE factura = invoice_num;
    
    balance := invoiced_value - paid_value;
    RETURN balance;
END;