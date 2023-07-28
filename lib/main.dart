import 'dart:math' show pi, cos, sin;
import 'dart:ui' as ui;

import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      home: HomePage(),
    ),
  );
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ShapeItem? currentShape;
  List<ShapeItem> allShape = [];
  Offset? startDragOffset;
  bool _dragging = false;
  ShapeType selectedShapeType = ShapeType.free;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).padding.top + 20,
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey.shade200,
                  ),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade300.withOpacity(0.5),
                      offset: const Offset(
                        0.5,
                        0,
                      ),
                      spreadRadius: 3,
                      blurRadius: 3,
                    )
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          selectedShapeType = ShapeType.none;
                        });
                      },
                      child: CustomPaint(
                        painter: ShapePainter(
                          sides: 0,
                          painterStrokeWidth: 1,
                          painterColor: Colors.grey.shade600,
                        ),
                        child: const SizedBox(
                          height: 30,
                          width: 30,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                        vertical: 10,
                      ),
                      height: 1,
                      width: 60,
                      color: Colors.grey.shade300,
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          selectedShapeType = ShapeType.rectangle;
                        });
                      },
                      child: CustomPaint(
                        painter: ShapePainter(
                          sides: 2,
                          shapeType: ShapeType.rectangle,
                          painterStrokeWidth: 1,
                          painterColor: Colors.grey.shade600,
                        ),
                        child: const SizedBox(
                          height: 30,
                          width: 30,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                        vertical: 10,
                      ),
                      height: 1,
                      width: 60,
                      color: Colors.grey.shade300,
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          selectedShapeType = ShapeType.rRectangle;
                        });
                      },
                      child: CustomPaint(
                        painter: ShapePainter(
                          sides: 2,
                          shapeType: ShapeType.rRectangle,
                          painterStrokeWidth: 1,
                          painterColor: Colors.grey.shade600,
                          borderRadius: const Radius.circular(5),
                        ),
                        child: const SizedBox(
                          height: 30,
                          width: 30,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                        vertical: 10,
                      ),
                      height: 1,
                      width: 60,
                      color: Colors.grey.shade300,
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          selectedShapeType = ShapeType.circle;
                        });
                      },
                      child: CustomPaint(
                        painter: ShapePainter(
                          sides: 360,
                          shapeType: ShapeType.circle,
                          painterStrokeWidth: 1,
                          painterColor: Colors.grey.shade600,
                          borderRadius: const Radius.circular(5),
                        ),
                        child: const SizedBox(
                          height: 30,
                          width: 30,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).padding.top + 20,
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey.shade200,
                  ),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade300.withOpacity(0.5),
                      offset: const Offset(
                        0.5,
                        0,
                      ),
                      spreadRadius: 3,
                      blurRadius: 3,
                    )
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          selectedShapeType = ShapeType.line;
                        });
                      },
                      child: CustomPaint(
                        painter: ShapePainter(
                          sides: 2,
                          shapeType: ShapeType.line,
                          painterStrokeWidth: 1,
                          painterColor: Colors.grey.shade600,
                        ),
                        child: const SizedBox(
                          height: 30,
                          width: 30,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                        vertical: 10,
                      ),
                      height: 1,
                      width: 60,
                      color: Colors.grey.shade300,
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          selectedShapeType = ShapeType.line;
                        });
                      },
                      child: CustomPaint(
                        painter: ShapePainter(
                          sides: 2,
                          shapeType: ShapeType.line,
                          painterStrokeWidth: 1,
                          painterColor: Colors.grey.shade600,
                        ),
                        child: const SizedBox(
                          height: 30,
                          width: 30,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                        vertical: 10,
                      ),
                      height: 1,
                      width: 60,
                      color: Colors.grey.shade300,
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          selectedShapeType = ShapeType.line;
                        });
                      },
                      child: CustomPaint(
                        painter: ShapePainter(
                          sides: 2,
                          shapeType: ShapeType.line,
                          painterStrokeWidth: 1,
                          painterColor: Colors.grey.shade600,
                        ),
                        child: const SizedBox(
                          height: 30,
                          width: 30,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            width: 10,
          ),
          Stack(
            children: [
              RepaintBoundary(
                child: CustomPaint(
                  painter: CanvasPainter(shapes: allShape),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height -
                        MediaQuery.of(context).padding.top -
                        50,
                    width: MediaQuery.of(context).size.width - 100,
                  ),
                ),
              ),
              Listener(
                onPointerDown: (detail) {
                  final canvas = context.findRenderObject() as RenderBox;
                  final startOffSet = canvas.globalToLocal(detail.position);
                  if (selectedShapeType != ShapeType.none) {
                    currentShape = ShapeItem(
                      [startOffSet],
                      Size.zero,
                      null,
                      startOffSet,
                      selectedShapeType,
                    );
                  }

                  _dragging = false;
                  setState(() {});
                },
                onPointerMove: (detail) {
                  if (selectedShapeType != ShapeType.none) {
                    final canvas = context.findRenderObject() as RenderBox;
                    final offSet = canvas.globalToLocal(detail.position);
                    currentShape?.points = [...currentShape!.points, offSet];
                    setState(() {});
                  }
                },
                onPointerUp: (detail) {
                  if (selectedShapeType != ShapeType.none) {
                    allShape = [...allShape, currentShape!];
                    setState(() {});
                  }

                  selectedShapeType = ShapeType.none;
                },
                child: RepaintBoundary(
                  child: GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onPanStart: (details) {
                      final box = context.findRenderObject() as RenderBox;
                      handlePanStart(
                        box.globalToLocal(details.globalPosition),
                      );
                    },
                    onPanEnd: (details) {
                      _dragging = false;
                    },
                    onPanUpdate: (details) {
                      if (_dragging) {
                        currentShape!.startOffset = Offset(
                          currentShape!.startOffset.dx + details.delta.dx,
                          currentShape!.startOffset.dy + details.delta.dy,
                        );

                        setState(() {});
                      }
                    },
                    child: CustomPaint(
                      painter: CanvasPainter(
                        shapes: currentShape != null ? [currentShape!] : [],
                      ),
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height -
                            MediaQuery.of(context).padding.top -
                            50,
                        width: MediaQuery.of(context).size.width - 100,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void handlePanStart(Offset position) {
    for (int i = allShape.length - 1; i >= 0; i--) {
      // if (_insideRect(
      //   position.dx,
      //   position.dy,
      //   allShape[i].startOffset.dx,
      //   allShape[i].startOffset.dy,
      //   allShape[i].points.last.dx - allShape[i].points.first.dx,
      //   allShape[i].points.last.dy - allShape[i].points.first.dy,
      // ))

      if (Rect.fromLTWH(
              allShape[i].startOffset.dx,
              allShape[i].startOffset.dy,
              allShape[i].points.last.dx - allShape[i].points.first.dx,
              allShape[i].points.last.dy - allShape[i].points.first.dy)
          .contains(position)) {
        currentShape = allShape[i];
        startDragOffset = position;
        _dragging = true;
        break;
      }
    }
  }
}

class ShapePainter extends CustomPainter {
  final int sides;
  final Color painterColor;
  final StrokeCap painterStrokeCap;
  final PaintingStyle paintingStyle;
  final double painterStrokeWidth;
  final ShapeType shapeType;
  final Radius borderRadius;

  ShapePainter({
    required this.sides,
    this.shapeType = ShapeType.circle,
    this.painterColor = Colors.black,
    this.painterStrokeCap = StrokeCap.round,
    this.paintingStyle = PaintingStyle.stroke,
    this.painterStrokeWidth = 3,
    this.borderRadius = Radius.zero,
  });

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = painterColor
      ..strokeCap = painterStrokeCap
      ..style = paintingStyle
      ..strokeWidth = painterStrokeWidth;

    final path = Path();

    final center = Offset(size.width / 2, size.height / 2);

    final radius = size.width / 2;

    if (shapeType == ShapeType.circle) {
      final angles =
          List.generate(sides, (index) => (((2 * pi) / sides) * index));

      path.moveTo(center.dx + radius * cos(0), center.dy + radius * sin(0));

      for (var element in angles) {
        path.lineTo(center.dx + radius * cos(element),
            center.dy + radius * sin(element));
      }
    } else if (shapeType == ShapeType.rectangle) {
      path.addRect(
        Rect.fromCircle(center: center, radius: radius),
      );
    } else if (shapeType == ShapeType.rRectangle) {
      path.addRRect(
        RRect.fromRectAndCorners(
          Rect.fromCircle(center: center, radius: radius),
          topLeft: borderRadius,
          bottomLeft: borderRadius,
          bottomRight: borderRadius,
          topRight: borderRadius,
        ),
      );
    } else if (shapeType == ShapeType.line) {
      canvas.drawLine(
        Offset(size.width / 2, 1),
        Offset(
          size.width / 2,
          size.height,
        ),
        paint,
      );
      return;
    } else if (shapeType == ShapeType.dottedLine) {
      canvas.drawPoints(
        ui.PointMode.lines,
        [],
        paint,
      );
      return;
    }

    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) =>
      oldDelegate is ShapePainter && oldDelegate.sides != sides;
}

class CanvasPainter extends CustomPainter {
  List<ShapeItem> shapes;
  final Color painterColor;
  final StrokeCap painterStrokeCap;
  final PaintingStyle paintingStyle;
  final double painterStrokeWidth;
  final ShapeType shapeType;
  final Radius borderRadius;

  CanvasPainter({
    required this.shapes,
    this.shapeType = ShapeType.none,
    this.painterColor = Colors.black,
    this.painterStrokeCap = StrokeCap.round,
    this.paintingStyle = PaintingStyle.fill,
    this.painterStrokeWidth = 3,
    this.borderRadius = Radius.zero,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = painterColor
      ..strokeCap = painterStrokeCap
      ..style = paintingStyle
      ..strokeWidth = painterStrokeWidth;

    for (var shape in shapes) {
      if (shape.points.isEmpty) return;

      final path = Path();

      path.moveTo(shape.startOffset.dx, shape.startOffset.dy);

      if (shape.shapeType == ShapeType.circle) {
        canvas.drawOval(
            Rect.fromLTWH(
              shape.startOffset.dx,
              shape.startOffset.dy,
              shape.points.last.dx - shape.points.first.dx,
              shape.points.last.dy - shape.points.first.dy,
            ),
            paint);
      } else if (shape.shapeType == ShapeType.rectangle) {
        canvas.drawRect(
            Rect.fromLTWH(
              shape.startOffset.dx,
              shape.startOffset.dy,
              shape.points.last.dx - shape.points.first.dx,
              shape.points.last.dy - shape.points.first.dy,
            ),
            paint);
      } else if (shape.shapeType == ShapeType.rRectangle) {
        canvas.drawRRect(
            RRect.fromRectAndRadius(
              Rect.fromLTWH(
                shape.startOffset.dx,
                shape.startOffset.dy,
                shape.points.last.dx - shape.points.first.dx,
                shape.points.last.dy - shape.points.first.dy,
              ),
              const Radius.circular(10),
            ),
            paint);
      } else if (shape.shapeType == ShapeType.line) {
        canvas.drawLine(shape.points.first, shape.points.last, paint);
      } else if (shape.shapeType == ShapeType.none) {
        return;
      } else {
        for (int i = 1; i < shape.points.length - 1; ++i) {
          path.lineTo(
            shape.points[i].dx,
            shape.points[i].dy,
          );
          canvas.drawPath(
            path,
            paint,
          );
        }
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

enum ShapeType {
  rectangle,
  rRectangle,
  circle,
  triangle,
  line,
  dottedLine,
  free,
  none,
}

class ShapeItem {
  List<Offset> points;
  Size size;
  ShapeItem? child;
  ShapeType shapeType;
  Offset startOffset;

  ShapeItem(this.points, this.size, this.child, this.startOffset,
      [this.shapeType = ShapeType.none]);
}

class Shape {
  Rect rect;
  Paint paint;

  Shape({required this.rect, required this.paint});
}
