package com.example;

import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;

class CalculatorTest {

    private final Calculator calc = new Calculator();

    @Test
    void testAdd() {
        assertEquals(8, calc.add(5, 3));
        assertEquals(0, calc.add(-2, 2));
        assertEquals(-7, calc.add(-4, -3));
    }

    @Test
    void testSubtract() {
        assertEquals(6, calc.subtract(10, 4));
        assertEquals(-6, calc.subtract(4, 10));
        assertEquals(0, calc.subtract(5, 5));
    }

    @Test
    void testMultiply() {
        assertEquals(42, calc.multiply(6, 7));
        assertEquals(0, calc.multiply(10, 0));
        assertEquals(-15, calc.multiply(5, -3));
    }

    @Test
    void testDivide() {
        assertEquals(4.0, calc.divide(20, 5), 0.0001);
        assertEquals(-2.5, calc.divide(5, -2), 0.0001);
    }

    @Test
    void testDivideByZero() {
        assertThrows(IllegalArgumentException.class, () -> calc.divide(10, 0));
    }
}