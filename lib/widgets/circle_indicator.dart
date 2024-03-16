import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class CircleIndicator extends StatelessWidget {
  const CircleIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 200,
        height: 500,
        child: Center(
          child: SfRadialGauge(
            axes: <RadialAxis>[
              // Create primary radial axis
              RadialAxis(
                showLabels: false,
                showTicks: false,
                showFirstLabel: false,
                startAngle: 180,
                endAngle: 0,
                radiusFactor: 0.7,
                canScaleToFit: true,
                axisLineStyle: AxisLineStyle(
                  thickness: 0.1,
                  color: Colors.white, // Set color to white
                  thicknessUnit: GaugeSizeUnit.factor,
                  cornerStyle: CornerStyle.startCurve,
                ),
                pointers: <GaugePointer>[
                  // White portion
                  RangePointer(
                    value: 0,
                    width: 0.1,
                    sizeUnit: GaugeSizeUnit.factor,
                    cornerStyle: CornerStyle.bothCurve,
                  ),
                  // Green portion
                  RangePointer(
                    value: 45,
                    width: 0.1,
                    sizeUnit: GaugeSizeUnit.factor,
                    cornerStyle: CornerStyle.bothCurve,
                    color: Colors.green, // Set color to green
                  ),
                ],
              ),
              // Create secondary radial axis for segmented line
            ],
          ),
        ),
      ),
    );
  }
}
