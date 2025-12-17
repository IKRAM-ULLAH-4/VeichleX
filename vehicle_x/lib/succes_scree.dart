import 'package:flutter/material.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:share_plus/share_plus.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class PaymentSuccess extends StatelessWidget {
  const PaymentSuccess({super.key});

  // Dummy data; in real app, pass this via route arguments
  final String sessionId = "cs_test_123456789";
  final double amount = 50.0; // USD
  final String date = "2025-12-17";

  Future<void> _generatePdfAndShare() async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        build: (pw.Context context) => pw.Center(
          child: pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Text(
                "Elite Motors",
                style: pw.TextStyle(
                  fontSize: 24,
                  fontWeight: pw.FontWeight.bold,
                ),
              ),
              pw.SizedBox(height: 20),
              pw.Text("Payment Receipt", style: pw.TextStyle(fontSize: 20)),
              pw.Divider(),
              pw.Text("Session ID: $sessionId"),
              pw.Text("Amount Paid: \$${amount.toStringAsFixed(2)}"),
              pw.Text("Date: $date"),
              pw.SizedBox(height: 20),
              pw.Text("Thank you for booking with Elite Motors!"),
            ],
          ),
        ),
      ),
    );

    // Save PDF to temporary directory
    final output = await getTemporaryDirectory();
    final file = File("${output.path}/payment_receipt.pdf");
    await file.writeAsBytes(await pdf.save());

    // Share the PDF
    await Share.shareXFiles([
      XFile(file.path),
    ], text: "Your Elite Motors Payment Receipt");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Payment Success")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(Icons.check_circle, color: Colors.green, size: 100),
            const SizedBox(height: 20),
            const Text(
              "Payment Successful!",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Text("Session ID: $sessionId"),
            Text("Amount Paid: \$${amount.toStringAsFixed(2)}"),
            Text("Date: $date"),
            const SizedBox(height: 40),
            ElevatedButton.icon(
              icon: const Icon(Icons.download),
              label: const Text("Download / Share Receipt"),
              onPressed: _generatePdfAndShare,
            ),
          ],
        ),
      ),
    );
  }
}
