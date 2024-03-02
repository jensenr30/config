# Schematic Review Checklist

## TEST POINTS
- [ ] request test points on all:
  - [ ] micro pins of interest.
  - [ ] power supplies.
  - [ ] control / data lines
  - [ ] analog lines in the instrumentation signal chain.

## Microcontroller
- [ ] ADC Inputs have sufficient capacitance to provide stable analog voltage during the sampling period.
I.e. the external ADC cap should be several orders of magnitude larger than the internal sampling cap.
- [ ] check each pin and ensure it is connected in a way that makes sense.
- [ ] Ensure each power supply pin is connected to an appropriate power supply by referring to the
  datasheet for min/max values.

## External Op Amps
- [ ] Must have sufficient headroom
  - [ ] Margin of safety to the negative rail.
  - [ ] Margin of safety to the positive rail.

## CAN
- [ ] Ensure there is an optional termination resistor
